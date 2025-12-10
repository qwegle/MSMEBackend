// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/api_requests/api_interceptor.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:convert/convert.dart';

class EncDecInterceptor extends FFApiInterceptor {
  static const String secretKeyHex =
      'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';

  // Convert hex to AES key
  encrypt.Key getAesKey() {
    final keyBytes = hex.decode(secretKeyHex);
    return encrypt.Key(Uint8List.fromList(keyBytes));
  }

  // Encrypt JSON body and return hex string (IV + ciphertext)
  String encryptData(Map<String, dynamic> data) {
    final key = getAesKey();
    final iv = encrypt.IV.fromSecureRandom(16); // random 16-byte IV
    final encrypter = encrypt.Encrypter(encrypt.AES(
      key,
      mode: encrypt.AESMode.cbc,
      padding: 'PKCS7',
    ));

    final jsonString = json.encode(data);

    print('🔐 Original JSON before encryption: $jsonString');
    final encrypted = encrypter.encrypt(jsonString, iv: iv);

    // Combine IV and ciphertext
    final combined = Uint8List.fromList(iv.bytes + encrypted.bytes);
    final hexString = hex.encode(combined);

    print('🔐 Encrypted hex: $hexString');
    return hexString;
  }

  // Decrypt hex-encoded (IV + ciphertext) string and parse JSON
  Map<String, dynamic> decryptData(String encryptedHex) {
    final key = getAesKey();
    final combinedBytes = hex.decode(encryptedHex);

    // Extract IV (first 16 bytes) and ciphertext (rest)
    final iv = encrypt.IV(Uint8List.fromList(combinedBytes.sublist(0, 16)));
    final encryptedBytes = Uint8List.fromList(combinedBytes.sublist(16));
    final encryptedData = encrypt.Encrypted(encryptedBytes);
    final encrypter = encrypt.Encrypter(encrypt.AES(
      key,
      mode: encrypt.AESMode.cbc,
      padding: 'PKCS7',
    ));
    final decrypted = encrypter.decrypt(encryptedData, iv: iv);

    return json.decode(decrypted);
  }

  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    print('📤 options.body raw: ${options.body} (${options.body.runtimeType})');

    Map<String, dynamic> bodyMap;
    if (options.body is String) {
      try {
        bodyMap = json.decode(options.body as String);
      } catch (e) {
        print('❌ Failed to parse JSON string body: $e');
        bodyMap = <String, dynamic>{};
      }
    } else if (options.body is Map<String, dynamic>) {
      bodyMap = Map<String, dynamic>.from(options.body as Map);
    } else {
      bodyMap = <String, dynamic>{};
    }

    print('📤 Parsed body map: $bodyMap');

    final encryptedBodyHex = encryptData(bodyMap);
    print('🟡 ApiCallOptions Debug Info:');
    print('  Headers: ${options.headers}');
    print('  Body: ${options.body}');
    print('  Query Params: ${options.params}');

    return options.copyWith(
      body: json
          .encode({'data': encryptedBodyHex}), // send hex string inside JSON
      headers: {
        ...?options.headers,
        'Content-Type': 'application/json',
      },
    );
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    try {
      final encryptedHex = response.jsonBody['data'];
      final decryptedJson = decryptData(encryptedHex);
      return response.copyWith(jsonBody: decryptedJson);
    } catch (e) {
      print('Decryption error: $e');
      return response;
    }
  }
}
