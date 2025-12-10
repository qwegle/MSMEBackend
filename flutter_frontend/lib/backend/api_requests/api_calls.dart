import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MSME OSFC Group Code

class MsmeOsfcGroup {
  static String getBaseUrl() => 'https://msmeortpsa.odisha.gov.in/apiv1';
  static Map<String, String> headers = {};
  static RegisterCall registerCall = RegisterCall();
  static SupportCall supportCall = SupportCall();
  static GetCaptchaCall getCaptchaCall = GetCaptchaCall();
  static LoginCall loginCall = LoginCall();
  static ForgotpasswordCall forgotpasswordCall = ForgotpasswordCall();
  static ResetpasswordCall resetpasswordCall = ResetpasswordCall();
  static ResendOtpCall resendOtpCall = ResendOtpCall();
  static UpdatepasswordCall updatepasswordCall = UpdatepasswordCall();
  static SubmitOTSFormCall submitOTSFormCall = SubmitOTSFormCall();
  static UpdateOTSFormCall updateOTSFormCall = UpdateOTSFormCall();
  static FilterOTSFormsCall filterOTSFormsCall = FilterOTSFormsCall();
  static GetOTSFormsOfUserCall getOTSFormsOfUserCall = GetOTSFormsOfUserCall();
  static GetOTSFormByIDCall getOTSFormByIDCall = GetOTSFormByIDCall();
  static GetAllOTSFormsCall getAllOTSFormsCall = GetAllOTSFormsCall();
  static GetOTSFormsByBranchCall getOTSFormsByBranchCall =
      GetOTSFormsByBranchCall();
  static TrackApplicationStatusCall trackApplicationStatusCall =
      TrackApplicationStatusCall();
  static UploadAcknowledgementCall uploadAcknowledgementCall =
      UploadAcknowledgementCall();
  static UploadMemorandumCall uploadMemorandumCall = UploadMemorandumCall();
  static UploadSettlementOrderCall uploadSettlementOrderCall =
      UploadSettlementOrderCall();
  static RegisterOFSCSubadminCall registerOFSCSubadminCall =
      RegisterOFSCSubadminCall();
  static CheckJWTProtectedRouteCall checkJWTProtectedRouteCall =
      CheckJWTProtectedRouteCall();
  static LogoutCall logoutCall = LogoutCall();
  static GetAllMemosCall getAllMemosCall = GetAllMemosCall();
  static GetAllAckCall getAllAckCall = GetAllAckCall();
  static GetAllCertificateCall getAllCertificateCall = GetAllCertificateCall();
  static GetOrdersByIdCall getOrdersByIdCall = GetOrdersByIdCall();
  static GetAllOrdersCall getAllOrdersCall = GetAllOrdersCall();
  static CountApplicationsCall countApplicationsCall = CountApplicationsCall();
  static GetCeritificateCountCall getCeritificateCountCall =
      GetCeritificateCountCall();
  static FilterAckFormsCall filterAckFormsCall = FilterAckFormsCall();
  static GetCertificateCountDaysCall getCertificateCountDaysCall =
      GetCertificateCountDaysCall();
  static FilterLoansCall filterLoansCall = FilterLoansCall();
  static FilterCertificatesCall filterCertificatesCall =
      FilterCertificatesCall();
  static MemosFilterCall memosFilterCall = MemosFilterCall();
  static UpdateMemoStatusCall updateMemoStatusCall = UpdateMemoStatusCall();
  static UserStatsCall userStatsCall = UserStatsCall();
  static UploadCertificateCall uploadCertificateCall = UploadCertificateCall();
  static FilterOrdersCall filterOrdersCall = FilterOrdersCall();
  static ReuploadOrderCall reuploadOrderCall = ReuploadOrderCall();
  static ReuploadCertificateCall reuploadCertificateCall =
      ReuploadCertificateCall();
  static ReuploadAckCall reuploadAckCall = ReuploadAckCall();
  static ReuploadMemoCall reuploadMemoCall = ReuploadMemoCall();
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? email = '',
    String? captcha = '',
    String? captchaToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "captcha": "${escapeStringForJson(captcha)}",
  "captchaToken": "${escapeStringForJson(captchaToken)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Register',
        apiUrl: '${baseUrl}/api/auth/register',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class SupportCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Support',
        apiUrl: '${baseUrl}/api/auth/support',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetCaptchaCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Captcha',
        apiUrl: '${baseUrl}/api/auth/get-captcha',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? captcha = '',
    String? captchaToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "captcha": "${escapeStringForJson(captcha)}",
  "captchaToken": "${escapeStringForJson(captchaToken)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Login',
        apiUrl: '${baseUrl}/api/auth/login',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.username''',
      ));
  int? userType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_type''',
      ));
  int? userRole(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_role''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.updatedAt''',
      ));
  String? branch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.branch''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class ForgotpasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'forgotpassword',
        apiUrl: '${baseUrl}/api/auth/forgot-password',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.username''',
      ));
  int? userType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_type''',
      ));
  int? userRole(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_role''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.updatedAt''',
      ));
  String? branch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.branch''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class ResetpasswordCall {
  Future<ApiCallResponse> call({
    String? newPassword = '',
    String? otp = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "password": "${escapeStringForJson(newPassword)}",
  "otp": "${escapeStringForJson(otp)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'resetpassword',
        apiUrl: '${baseUrl}/api/auth/reset-password',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.username''',
      ));
  int? userType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_type''',
      ));
  int? userRole(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_role''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.updatedAt''',
      ));
  String? branch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.branch''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class ResendOtpCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Resend otp',
        apiUrl: '${baseUrl}api/auth/resend-otp',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.username''',
      ));
  int? userType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_type''',
      ));
  int? userRole(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_role''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.updatedAt''',
      ));
  String? branch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.branch''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class UpdatepasswordCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? phone = '',
    String? aadharNumber = '',
    String? currentPassword = '',
    String? newPassword = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "phone": "${escapeStringForJson(phone)}",
  "aadharNumber": "${escapeStringForJson(aadharNumber)}",
  "currentPassword": "${escapeStringForJson(currentPassword)}",
  "newPassword": "${escapeStringForJson(newPassword)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updatepassword',
        apiUrl: '${baseUrl}/api/auth/update-password',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.username''',
      ));
  int? userType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_type''',
      ));
  int? userRole(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.user_role''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.updatedAt''',
      ));
  String? branch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.branch''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class SubmitOTSFormCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? authToken = '',
    String? lastName = '',
    String? number = '',
    String? email = '',
    String? streetAddress = '',
    String? state = '',
    String? city = '',
    String? branch = '',
    String? pinCode = '',
    String? liabilityOfsc = '',
    String? industry = '',
    String? financialHeights = '',
    String? reasonOts = '',
    String? paymentSource = '',
    String? termsPayment = '',
    String? levelOfOperation = '',
    String? reasonNonPayments = '',
    String? detailsOfDues = '',
    String? statusOfNpa = '',
    String? reasonForSettlement = '',
    String? sourcesOfPayment = '',
    String? loanNumber = '',
    String? status = '',
    String? statusMsg = '',
    String? userId = '',
    bool? checkBox1,
    bool? checkBox2,
    bool? checkBox3,
    bool? checkBox4,
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "number": "${escapeStringForJson(number)}",
  "email": "${escapeStringForJson(email)}",
  "street_address": "${escapeStringForJson(streetAddress)}",
  "state": "${escapeStringForJson(state)}",
  "city": "${escapeStringForJson(city)}",
  "branch": "${escapeStringForJson(branch)}",
  "pin_code": "${escapeStringForJson(pinCode)}",
  "liability_ofsc": "${escapeStringForJson(liabilityOfsc)}",
  "industry": "${escapeStringForJson(industry)}",
  "financial_heights": "${escapeStringForJson(financialHeights)}",
  "reason_ots": "${escapeStringForJson(reasonOts)}",
  "payment_source": "${escapeStringForJson(paymentSource)}",
  "terms_payment": "${escapeStringForJson(termsPayment)}",
  "level_of_operation": "${escapeStringForJson(levelOfOperation)}",
  "reason_non_payments": "${escapeStringForJson(reasonNonPayments)}",
  "details_of_dues": "${escapeStringForJson(detailsOfDues)}",
  "status_of_npa": "${escapeStringForJson(statusOfNpa)}",
  "reason_for_settlement": "${escapeStringForJson(reasonForSettlement)}",
  "sources_of_payment": "${escapeStringForJson(sourcesOfPayment)}",
  "loan_number": "${escapeStringForJson(loanNumber)}",
  "status": "${escapeStringForJson(status)}",
  "status_msg": "${escapeStringForJson(statusMsg)}",
  "userId": "${escapeStringForJson(userId)}",
  "check_box1": ${checkBox1},
  "check_box2": ${checkBox2},
  "check_box3": ${checkBox3},
  "check_box4": ${checkBox4}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Submit OTS Form',
        apiUrl: '${baseUrl}/api/ots/submitOTS',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class UpdateOTSFormCall {
  Future<ApiCallResponse> call({
    String? branch = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "branch": "${escapeStringForJson(branch)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update OTS Form',
        apiUrl: '${baseUrl}/pi/ots/updateOTSform/:formId',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class FilterOTSFormsCall {
  Future<ApiCallResponse> call({
    String? otsId = '',
    String? userId = '',
    String? branch = '',
    String? status = '',
    String? authToken = '',
    String? page = '',
    String? limit = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "otsId": "${escapeStringForJson(otsId)}",
  "userId": "${escapeStringForJson(userId)}",
  "branch": "${escapeStringForJson(branch)}",
  "status": "${escapeStringForJson(status)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Filter OTS Forms',
        apiUrl: '${baseUrl}/api/ots/filterOTS',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:]._id''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userId''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].first_name''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].last_name''',
      ));
  String? number(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].number''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  String? streetaddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].street_address''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].state''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].city''',
      ));
  String? branch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].branch''',
      ));
  String? pincode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].pin_code''',
      ));
  String? liabilityofsc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].liability_ofsc''',
      ));
  String? industry(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].industry''',
      ));
  String? reasonots(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].reason_ots''',
      ));
  String? paymentsource(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].payment_source''',
      ));
  String? financialheights(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].financial_heights''',
      ));
  String? termspayment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].terms_payment''',
      ));
  int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].status''',
      ));
  String? statusmsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].status_msg''',
      ));
  String? loannumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].loan_number''',
      ));
  bool? checkbox1(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box1''',
      ));
  bool? checkbox2(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box2''',
      ));
  bool? checkbox3(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box3''',
      ));
  bool? checkbox4(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box4''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].updatedAt''',
      ));
  int? vvv(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].__v''',
      ));
}

class GetOTSFormsOfUserCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get OTS Forms of User',
        apiUrl: '${baseUrl}/api/ots/myforms',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetOTSFormByIDCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get OTS Form by ID',
        apiUrl: '${baseUrl}/api/ots/myforms?Id={formId}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetAllOTSFormsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get All OTS Forms',
        apiUrl: '${baseUrl}/api/ots/all',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'limit': 10,
          'offset': 0,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  List? data(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? user(dynamic response) => getJsonField(
        response,
        r'''$[:].userId''',
        true,
      ) as List?;
  List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$[:].userId._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? useremail(dynamic response) => (getJsonField(
        response,
        r'''$[:].userId.email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fname(dynamic response) => (getJsonField(
        response,
        r'''$[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lname(dynamic response) => (getJsonField(
        response,
        r'''$[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? number(dynamic response) => (getJsonField(
        response,
        r'''$[:].number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? streetaddress(dynamic response) => (getJsonField(
        response,
        r'''$[:].street_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$[:].city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branch(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pincode(dynamic response) => (getJsonField(
        response,
        r'''$[:].pin_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? liabilityOFSC(dynamic response) => (getJsonField(
        response,
        r'''$[:].liability_ofsc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? industry(dynamic response) => (getJsonField(
        response,
        r'''$[:].industry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? loanNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].loan_number''',
      ));
  bool? checkbox1(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box1''',
      ));
  bool? checkbox2(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box2''',
      ));
  bool? checkbox3(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box3''',
      ));
  bool? checkbox4(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].check_box4''',
      ));
  String? statusmsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].status_msg''',
      ));
}

class GetOTSFormsByBranchCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get OTS Forms by Branch',
        apiUrl: '${baseUrl}/api/ots/otsbybranch?branch=Khorda',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class TrackApplicationStatusCall {
  Future<ApiCallResponse> call({
    String? loanNumber = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "loan_number": "${escapeStringForJson(loanNumber)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Track Application Status',
        apiUrl: '${baseUrl}/api/ots/trackStatus',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  List? timeline(dynamic response) => getJsonField(
        response,
        r'''$.timeline''',
        true,
      ) as List?;
  List<String>? timelinetitle(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timelinedesc(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].desc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timelinestatus(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timelinesubmissiondate(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].submission_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timelineeta(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].eta''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UploadAcknowledgementCall {
  Future<ApiCallResponse> call({
    String? otsFormId = '',
    String? depositAmount = '',
    String? authToken = '',
    String? depositDate = '',
    String? depositType = '',
    String? ofscNo = '',
    String? currentDate = '',
    FFUploadedFile? pdfFile,
    String? nameOfRecievingOfficer = '',
    String? dateOfSignature = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Acknowledgement',
      apiUrl: '${baseUrl}/api/ack/submitAck',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': otsFormId,
        'deposit_amount': depositAmount,
        'deposit_date': depositDate,
        'deposit_type': depositType,
        'ofsc_no': ofscNo,
        'rac_date': currentDate,
        'pdf': pdfFile,
        'name_of_recieving_officer': nameOfRecievingOfficer,
        'date_of_signature': dateOfSignature,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadMemorandumCall {
  Future<ApiCallResponse> call({
    int? loanNumber,
    FFUploadedFile? file,
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Memorandum',
      apiUrl: '${baseUrl}/api/memo/uploadMemorandum',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': loanNumber,
        'pdf': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadSettlementOrderCall {
  Future<ApiCallResponse> call({
    int? loanNumber,
    FFUploadedFile? pdf,
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Settlement Order',
      apiUrl: '${baseUrl}/api/order/uploadOrder',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': loanNumber,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterOFSCSubadminCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Register OFSC Subadmin',
      apiUrl: '${baseUrl}/api/auth/register_ofsc_subadmin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckJWTProtectedRouteCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Check JWTProtected Route',
        apiUrl: '${baseUrl}/protected',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'logout',
        apiUrl: '${baseUrl}/api/auth/logout',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.NONE,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetAllMemosCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'get All Memos ',
        apiUrl: '${baseUrl}/api/memo/getAllMemos',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetAllAckCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'get All Ack',
        apiUrl: '${baseUrl}/api/ack/getAllAck',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetAllCertificateCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'get All Certificate ',
        apiUrl: '${baseUrl}/api/certificate/getAllCertificate',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.NONE,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetOrdersByIdCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'get Orders By Id',
        apiUrl: '${baseUrl}/api/order/getOrdersById/:userId',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GetAllOrdersCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'get All Orders',
        apiUrl: '${baseUrl}/api/order/getAllOrders',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class CountApplicationsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? branch = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "branch": "${escapeStringForJson(branch)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'CountApplications',
        apiUrl: '${baseUrl}/api/ots/count_applications',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? pending(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.pending''',
      ));
  int? approved(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.approved''',
      ));
  int? rejected(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.rejected''',
      ));
}

class GetCeritificateCountCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? branch = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "branch": "${escapeStringForJson(branch)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Ceritificate Count',
        apiUrl: '${baseUrl}/api/certificate/getCeritificateCount',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? dataissued(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.issued''',
      ));
}

class FilterAckFormsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? branch = '',
    String? loanNumber = '',
    String? authToken = '',
    String? page = '',
    String? limit = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "branch": "${escapeStringForJson(branch)}",
  "loan_number": "${escapeStringForJson(loanNumber)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Filter Ack Forms',
        apiUrl: '${baseUrl}/api/ack/filterAckForms',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  List<String>? imglinksignstamp(dynamic response) => (getJsonField(
        response,
        r'''$[:].img_link_sign_stamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? firstname(dynamic response) => (getJsonField(
        response,
        r'''$[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lastname(dynamic response) => (getJsonField(
        response,
        r'''$[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? loannumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].loan_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCertificateCountDaysCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getCertificateCountDays',
        apiUrl: '${baseUrl}/api/certificate/getCertificateCount7Days',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? count(dynamic response) => (getJsonField(
        response,
        r'''$[:].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class FilterLoansCall {
  Future<ApiCallResponse> call({
    String? loanType = '',
    String? loanStatus = '',
    String? customerName = '',
    String? minOverdue = '',
    String? maxOverdue = '',
    String? branch = '',
    String? authToken = '',
    String? loanId = '',
    String? page = '',
    String? limit = '',
    String? totalItems = '',
    String? totalPages = '',
    String? nextPage = '',
    String? currentPageCount = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "loan_id": "${escapeStringForJson(loanId)}",
  "loanType": "${escapeStringForJson(loanType)}",
  "loanStatus": "${escapeStringForJson(loanStatus)}",
  "customerName": "${escapeStringForJson(customerName)}",
  "minOverdue": "${escapeStringForJson(minOverdue)}",
  "maxOverdue": "${escapeStringForJson(maxOverdue)}",
  "branch": "${escapeStringForJson(branch)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}",
  "totalitems": "${escapeStringForJson(totalItems)}",
  "totalPages": "${escapeStringForJson(totalPages)}",
  "nextPages": "${escapeStringForJson(nextPage)}",
  "currentPageCount": "${escapeStringForJson(currentPageCount)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'FilterLoans',
        apiUrl: '${baseUrl}/api/loan/filterLoans',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  int? page(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.page''',
      ));
  int? limit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.limit''',
      ));
  int? totalItems(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalItems''',
      ));
  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalPages''',
      ));
  int? nextPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.nextPage''',
      ));
  int? currentPageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.currentPageCount''',
      ));
  List<String>? paginatedDataloanId(dynamic response) => (getJsonField(
        response,
        r'''$.paginatedData[:].loanId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FilterCertificatesCall {
  Future<ApiCallResponse> call({
    String? loanNumber = '',
    String? branch = '',
    String? userId = '',
    String? authToken = '',
    String? page = '',
    String? limit = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "loan_number": "${escapeStringForJson(loanNumber)}",
  "branch": "${escapeStringForJson(branch)}",
  "userId": "${escapeStringForJson(userId)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Filter Certificates',
        apiUrl: '${baseUrl}/api/certificate/filterCertificates',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class MemosFilterCall {
  Future<ApiCallResponse> call({
    String? loanNumber = '',
    String? userId = '',
    String? branch = '',
    String? authToken = '',
    String? status = '',
    String? page = '',
    String? limit = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "loan_number": "${escapeStringForJson(loanNumber)}",
  "userId": "${escapeStringForJson(userId)}",
  "branch": "${escapeStringForJson(branch)}",
  "status": "${escapeStringForJson(status)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Memos Filter',
        apiUrl: '${baseUrl}/api/memo/filterMemos',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  List<String>? userIdusername(dynamic response) => (getJsonField(
        response,
        r'''$[:].userId.username''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userIdemail(dynamic response) => (getJsonField(
        response,
        r'''$[:].userId.email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdfirstname(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdlastname(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdnumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdemail(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdstreetaddress(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.street_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdstate(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdcity(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdbranch(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.branch''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdpincode(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.pin_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdliabilityofsc(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.liability_ofsc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdindustry(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.industry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdfinancialheights(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.financial_heights''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdreasonots(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.reason_ots''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdpaymentsource(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.payment_source''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdtermspayment(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.terms_payment''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? otsFormIdstatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? otsFormIdlevelofoperation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsFormId.level_of_operation''',
      ));
  String? otsFormIdreasonnonpayments(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsFormId.reason_non_payments''',
      ));
  String? otsFormIddetailsofdues(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsFormId.details_of_dues''',
      ));
  String? otsFormIdstatusofnpa(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsFormId.status_of_npa''',
      ));
  String? otsFormIdreasonforsettlement(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsFormId.reason_for_settlement''',
      ));
  String? otsFormIdsourcesofpayment(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsFormId.sources_of_payment''',
      ));
  List<String>? otsFormIdstatusmsg(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.status_msg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdloannumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.loan_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? otsFormIdcheckbox1(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.check_box1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? otsFormIdcheckbox2(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.check_box2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? otsFormIdcheckbox3(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.check_box3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? otsFormIdcheckbox4(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.check_box4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdcreatedAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otsFormIdupdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? otsFormIdvv(dynamic response) => (getJsonField(
        response,
        r'''$[:].otsFormId.__v''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? idMemo(dynamic response) => (getJsonField(
        response,
        r'''$[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UpdateMemoStatusCall {
  Future<ApiCallResponse> call({
    String? memoId = '',
    int? status,
    String? remarks = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "memoId": "${escapeStringForJson(memoId)}",
  "status": ${status},
  "remarks ": "${escapeStringForJson(remarks)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updateMemoStatus',
        apiUrl: '${baseUrl}/api/memo/updateMemoStatus',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class UserStatsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'User Stats',
        apiUrl: '${baseUrl}/api/ots/user_stats',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? datapending(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.pending''',
      ));
  int? dataapproved(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.approved''',
      ));
  int? datarejected(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.rejected''',
      ));
  int? datatotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.total''',
      ));
  int? datacertificatesIssued(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.certificatesIssued''',
      ));
}

class UploadCertificateCall {
  Future<ApiCallResponse> call({
    String? loanNumber = '',
    FFUploadedFile? pdf,
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Certificate',
      apiUrl: '${baseUrl}/api/certificate/uploadCertificate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': loanNumber,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FilterOrdersCall {
  Future<ApiCallResponse> call({
    String? loanNumber = '',
    String? userId = '',
    String? authToken = '',
    String? page = '',
    String? limit = '',
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "loan_number": "${escapeStringForJson(loanNumber)}",
  "userId": "${escapeStringForJson(userId)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Filter Orders',
        apiUrl: '${baseUrl}/api/order/filterOrders',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:]._id''',
      ));
  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$[:].userId''',
      );
  String? userIdid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userId._id''',
      ));
  String? userIdusername(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userId.username''',
      ));
  String? userIdpassword(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userId.password''',
      ));
  String? userIdemail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userId.email''',
      ));
  int? userIdusertype(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userId.user_type''',
      ));
  int? userIduserrole(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userId.user_role''',
      ));
  String? userIdcreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userId.createdAt''',
      ));
  String? userIdupdatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].userId.updatedAt''',
      ));
  int? userIdv(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].userId.__v''',
      ));
  dynamic otsId(dynamic response) => getJsonField(
        response,
        r'''$[:].otsId''',
      );
  String? otsIdid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId._id''',
      ));
  String? otsIdfirstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.first_name''',
      ));
  String? otsIdlastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.last_name''',
      ));
  String? otsIduserId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.userId''',
      ));
  String? otsIdnumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.number''',
      ));
  String? otsIdemail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.email''',
      ));
  String? otsIdstreetaddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.street_address''',
      ));
  String? otsIdstate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.state''',
      ));
  String? otsIdcity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.city''',
      ));
  String? otsIdbranch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.branch''',
      ));
  String? otsIdpincode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.pin_code''',
      ));
  String? otsIdliabilityofsc(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.liability_ofsc''',
      ));
  String? otsIdindustry(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.industry''',
      ));
  String? otsIdfinancialheights(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.financial_heights''',
      ));
  String? otsIdreasonots(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.reason_ots''',
      ));
  String? otsIdpaymentsource(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.payment_source''',
      ));
  String? otsIdtermspayment(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.terms_payment''',
      ));
  int? otsIdstatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].otsId.status''',
      ));
  String? otsIdlevelofoperation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.level_of_operation''',
      ));
  String? otsIdreasonnonpayments(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.reason_non_payments''',
      ));
  String? otsIddetailsofdues(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.details_of_dues''',
      ));
  String? statusofnpa(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.status_of_npa''',
      ));
  String? otsIdreasonforsettlement(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.reason_for_settlement''',
      ));
  String? otsIdsourcesofpayment(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.sources_of_payment''',
      ));
  String? otsIdstatusmsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.status_msg''',
      ));
  String? otsIdloannumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.loan_number''',
      ));
  bool? otsIdcheckbox1(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].otsId.check_box1''',
      ));
  bool? otsIdcheckbox2(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].otsId.check_box2''',
      ));
  bool? otsIdcheckbox3(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].otsId.check_box3''',
      ));
  bool? otsIdcheckbox4(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].otsId.check_box4''',
      ));
  String? otsIdcreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.createdAt''',
      ));
  String? otsIdupdatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].otsId.updatedAt''',
      ));
  int? otsIdv(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].otsId.__v''',
      ));
  dynamic ackId(dynamic response) => getJsonField(
        response,
        r'''$[:].AckId''',
      );
  String? ackIdid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId._id''',
      ));
  String? ackIdotsformid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.ots_form_id''',
      ));
  int? ackIddepositamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].AckId.deposit_amount''',
      ));
  String? ackIddepositdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.deposit_date''',
      ));
  String? ackIddeposittype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.deposit_type''',
      ));
  String? ackIdofscno(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.ofsc_no''',
      ));
  String? ackIdracdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.rac_date''',
      ));
  String? ackIdimglinksignstamp(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.img_link_sign_stamp''',
      ));
  String? ackIdnameofrecievingofficer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.name_of_recieving_officer''',
      ));
  String? ackIddateofsignature(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.date_of_signature''',
      ));
  String? ackIdcreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.createdAt''',
      ));
  String? ackIdupdatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].AckId.updatedAt''',
      ));
  int? ackIdv(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].AckId.__v''',
      ));
  dynamic memoId(dynamic response) => getJsonField(
        response,
        r'''$[:].memoId''',
      );
  String? memoIdid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId._id''',
      ));
  String? memoIduserId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId.userId''',
      ));
  String? memoIdotsFormId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId.otsFormId''',
      ));
  String? memoIdackId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId.ackId''',
      ));
  int? memoIdstatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].memoId.status''',
      ));
  int? memoIdmemoVersion(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].memoId.memoVersion''',
      ));
  String? memoIdpdfData(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId.pdfData''',
      ));
  String? memoIdcreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId.createdAt''',
      ));
  String? memoIdupdatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId.updatedAt''',
      ));
  int? memoIdv(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].memoId.__v''',
      ));
  String? pdfData(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].pdfData''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].createdAt''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].updatedAt''',
      ));
  int? vvv(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].__v''',
      ));
  String? memoIdremarks(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].memoId.remarks''',
      ));
}

class ReuploadOrderCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? loanNumber = '',
    FFUploadedFile? pdf,
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Reupload Order',
      apiUrl: '${baseUrl}/api/order/reuploadOrder',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': loanNumber,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReuploadCertificateCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? loanNumber = '',
    FFUploadedFile? pdf,
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Reupload Certificate',
      apiUrl: '${baseUrl}/api/certificate/reuploadCertificate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': loanNumber,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReuploadAckCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? loanNumber = '',
    FFUploadedFile? pdf,
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Reupload Ack',
      apiUrl: '${baseUrl}/api/ack/reuploadAck',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': loanNumber,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReuploadMemoCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? loanNumber = '',
    FFUploadedFile? pdf,
  }) async {
    final baseUrl = MsmeOsfcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Reupload Memo',
      apiUrl: '${baseUrl}api/memo/reuploadMemo',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'loan_number': loanNumber,
        'pdf': pdf,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End MSME OSFC Group Code

/// Start MSME OSIC Group Code

class MsmeOsicGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://msmeortpsa.odisha.gov.in/apiv1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
  };
  static CreateGovernmentOrderCall createGovernmentOrderCall =
      CreateGovernmentOrderCall();
  static UpdateGovernmentOrderCall updateGovernmentOrderCall =
      UpdateGovernmentOrderCall();
  static FilterGovernmentOrdersCall filterGovernmentOrdersCall =
      FilterGovernmentOrdersCall();
  static CreateFloatTenderCall createFloatTenderCall = CreateFloatTenderCall();
  static UpdateFloatTenderCall updateFloatTenderCall = UpdateFloatTenderCall();
  static FilterFloatTendersCall filterFloatTendersCall =
      FilterFloatTendersCall();
  static CreateTenderResultCall createTenderResultCall =
      CreateTenderResultCall();
  static UpdateTenderResultCall updateTenderResultCall =
      UpdateTenderResultCall();
  static FilterTenderResultsCall filterTenderResultsCall =
      FilterTenderResultsCall();
  static CreateSupplyOrderCall createSupplyOrderCall = CreateSupplyOrderCall();
  static UpdateSupplyOrderCall updateSupplyOrderCall = UpdateSupplyOrderCall();
  static FilterSupplyOrdersCall filterSupplyOrdersCall =
      FilterSupplyOrdersCall();
  static DashboardCountsCall dashboardCountsCall = DashboardCountsCall();
  static CreateSanctionOrderCall createSanctionOrderCall =
      CreateSanctionOrderCall();
  static GgetAllSanctionOrdersCall ggetAllSanctionOrdersCall =
      GgetAllSanctionOrdersCall();
}

class CreateGovernmentOrderCall {
  Future<ApiCallResponse> call({
    String? letterNumber = '',
    String? orderTitle = '',
    String? departmentName = '',
    String? pointOfContact = '',
    String? contactNumber = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "letterNumber": "${escapeStringForJson(letterNumber)}",
  "orderTitle": "${escapeStringForJson(orderTitle)}",
  "departmentName": "${escapeStringForJson(departmentName)}",
  "pointOfContact": "${escapeStringForJson(pointOfContact)}",
  "contactNumber": "${escapeStringForJson(contactNumber)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Create Government Order',
        apiUrl: '${baseUrl}/api/osic/createGovernmentOrder',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class UpdateGovernmentOrderCall {
  Future<ApiCallResponse> call({
    String? letterNumber = '',
    String? orderTitle = '',
    String? departmentName = '',
    String? pointOfContact = '',
    String? contactNumber = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "letterNumber": "${escapeStringForJson(letterNumber)}",
  "orderTitle": "${escapeStringForJson(orderTitle)}",
  "departmentName": "${escapeStringForJson(departmentName)}",
  "pointOfContact": "${escapeStringForJson(pointOfContact)}",
  "contactNumber": "${escapeStringForJson(contactNumber)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Government Order',
        apiUrl: '${baseUrl}/api/osic/updateGovernmentOrder',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class FilterGovernmentOrdersCall {
  Future<ApiCallResponse> call({
    String? letterNumber = '',
    String? orderTitle = '',
    String? departmentName = '',
    String? pointOfContact = '',
    String? contactNumber = '',
    String? page = '',
    String? limit = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "letterNumber": "${escapeStringForJson(letterNumber)}",
  "orderTitle": "${escapeStringForJson(orderTitle)}",
  "departmentName": "${escapeStringForJson(departmentName)}",
  "pointOfContact": "${escapeStringForJson(pointOfContact)}",
  "contactNumber": "${escapeStringForJson(contactNumber)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Filter Government Orders',
        apiUrl: '${baseUrl}/api/osic/filterGovernmentOrders',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? letterNumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].letterNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? orderTitle(dynamic response) => (getJsonField(
        response,
        r'''$[:].orderTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? departmentName(dynamic response) => (getJsonField(
        response,
        r'''$[:].departmentName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pointOfContact(dynamic response) => (getJsonField(
        response,
        r'''$[:].pointOfContact''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? contactNumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].contactNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? vvv(dynamic response) => (getJsonField(
        response,
        r'''$[:].__v''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class CreateFloatTenderCall {
  Future<ApiCallResponse> call({
    String? tenderNumber = '',
    String? projectTitle = '',
    String? tenderDate = '',
    String? prebidDate = '',
    String? bidOpeningDate = '',
    String? lastTenderSubmissionDate = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "tender_number": "${escapeStringForJson(tenderNumber)}",
  "project_title": "${escapeStringForJson(projectTitle)}",
  "tender_date": "${escapeStringForJson(tenderDate)}",
  "prebid_date": "${escapeStringForJson(prebidDate)}",
  "bid_opening_date": "${escapeStringForJson(bidOpeningDate)}",
  "last_tender_submission_date": "${escapeStringForJson(lastTenderSubmissionDate)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'create Float Tender',
        apiUrl: '${baseUrl}/api/osic/createFloatTender',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class UpdateFloatTenderCall {
  Future<ApiCallResponse> call({
    String? tenderNumber = '',
    String? projectTitle = '',
    String? tenderDate = '',
    String? prebidDate = '',
    String? bidOpeningDate = '',
    String? lastTenderSubmissionDate = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "tender_number": "${escapeStringForJson(tenderNumber)}",
  "project_title": "${escapeStringForJson(projectTitle)}",
  "tender_date": "${escapeStringForJson(tenderDate)}",
  "prebid_date": "${escapeStringForJson(prebidDate)}",
  "bid_opening_date": "${escapeStringForJson(bidOpeningDate)}",
  "last_tender_submission_date": "${escapeStringForJson(lastTenderSubmissionDate)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'update Float Tender',
        apiUrl: '${baseUrl}/api/osic/updateFloatTender',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class FilterFloatTendersCall {
  Future<ApiCallResponse> call({
    String? tenderNumber = '',
    String? projectTitle = '',
    String? tenderDate = '',
    String? prebidDate = '',
    String? bidOpeningDate = '',
    String? lastTenderSubmissionDate = '',
    String? page = '',
    String? limit = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "tender_number": "${escapeStringForJson(tenderNumber)}",
  "project_title": "${escapeStringForJson(projectTitle)}",
  "tender_date": "${escapeStringForJson(tenderDate)}",
  "prebid_date": "${escapeStringForJson(prebidDate)}",
  "bid_opening_date": "${escapeStringForJson(bidOpeningDate)}",
  "last_tender_submission_date": "${escapeStringForJson(lastTenderSubmissionDate)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'filter Float Tenders',
        apiUrl: '${baseUrl}/api/osic/filterFloatTenders',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class CreateTenderResultCall {
  Future<ApiCallResponse> call({
    String? tenderNumber = '',
    String? name = '',
    String? bidValue = '',
    String? bidderScore = '',
    dynamic tenderDetailsJson,
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final tenderDetails = _serializeJson(tenderDetailsJson, true);
    final ffApiRequestBody = '''
{
  "tender_number": "${escapeStringForJson(tenderNumber)}",
  "bidder_details": ${tenderDetails}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'create Tender Result',
        apiUrl: '${baseUrl}/api/osic/createTenderResult',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class UpdateTenderResultCall {
  Future<ApiCallResponse> call({
    String? tenderNumber = '',
    String? name = '',
    String? bidValue = '',
    String? bidderScore = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "tender_number": "${escapeStringForJson(tenderNumber)}",
  "name": "${escapeStringForJson(name)}",
  "bid_value": "${escapeStringForJson(bidValue)}",
  "bidder_score": "${escapeStringForJson(bidderScore)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'update Tender Result',
        apiUrl: '${baseUrl}/api/osic/updateTenderResult',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class FilterTenderResultsCall {
  Future<ApiCallResponse> call({
    String? tenderNumber = '',
    String? name = '',
    String? bidValue = '',
    String? bidderScore = '',
    String? page = '',
    String? limit = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "tender_number": "${escapeStringForJson(tenderNumber)}",
  "name": "${escapeStringForJson(name)}",
  "bid_value": "${escapeStringForJson(bidValue)}",
  "bidder_score": "${escapeStringForJson(bidderScore)}",
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'filter Tender Results',
        apiUrl: '${baseUrl}/api/osic/filterTenderResults',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  List? paginatedData(dynamic response) => getJsonField(
        response,
        r'''$.paginatedData''',
        true,
      ) as List?;
  List<String>? paginatedDataid(dynamic response) => (getJsonField(
        response,
        r'''$.paginatedData[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paginatedDatatendernumber(dynamic response) => (getJsonField(
        response,
        r'''$.paginatedData[:].tender_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? paginatedDatabidderdetails(dynamic response) => getJsonField(
        response,
        r'''$.paginatedData[:].bidder_details''',
        true,
      ) as List?;
  List<String>? paginatedDatabidderdetailsname(dynamic response) =>
      (getJsonField(
        response,
        r'''$.paginatedData[:].bidder_details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paginatedDatabidderdetailsbidvalue(dynamic response) =>
      (getJsonField(
        response,
        r'''$.paginatedData[:].bidder_details[:].bid_value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paginatedDatabidderdetailsbidderscore(dynamic response) =>
      (getJsonField(
        response,
        r'''$.paginatedData[:].bidder_details[:].bidder_score''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paginatedDatabidderdetailsid(dynamic response) => (getJsonField(
        response,
        r'''$.paginatedData[:].bidder_details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paginatedDatacreatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.paginatedData[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paginatedDataupdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.paginatedData[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? paginatedDatav(dynamic response) => (getJsonField(
        response,
        r'''$.paginatedData[:].__v''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class CreateSupplyOrderCall {
  Future<ApiCallResponse> call({
    String? tenderNumber = '',
    String? tenderValue = '',
    String? supplyQuantity = '',
    String? invoiceNumber = '',
    String? invoiceAmount = '',
    FFUploadedFile? proofOfSupply,
    FFUploadedFile? invoiceSubmission,
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Create Supply Order',
      apiUrl: '${baseUrl}/api/osic/createSupplyOrder',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'tender_number': tenderNumber,
        'tender_value': tenderValue,
        'supply_quantity': supplyQuantity,
        'invoice_number': invoiceNumber,
        'invoice_amount': invoiceAmount,
        'proof_of_supply': proofOfSupply,
        'invoice_submission': invoiceSubmission,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSupplyOrderCall {
  Future<ApiCallResponse> call({
    String? supplyDetails = '',
    String? proofOfSupply = '',
    String? invoiceSubmission = '',
    String? paymentAsPerInvoice = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "supply_details": "${escapeStringForJson(supplyDetails)}",
  "proof_of_supply": "${escapeStringForJson(proofOfSupply)}",
  "invoice_submission": "${escapeStringForJson(invoiceSubmission)}",
  "payment_as_per_invoice": "${escapeStringForJson(paymentAsPerInvoice)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Supply Order',
        apiUrl: '${baseUrl}/api/osic/updateSupplyOrder',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class FilterSupplyOrdersCall {
  Future<ApiCallResponse> call({
    String? supplyDetails = '',
    String? page = '',
    String? limit = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "page": "${escapeStringForJson(page)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'filter Supply Orders',
        apiUrl: '${baseUrl}/api/osic/filterSupplyOrders',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class DashboardCountsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Dashboard Counts',
        apiUrl: '${baseUrl}/api/osic/dashboardCounts',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];

  int? governmentOrders(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.governmentOrders''',
      ));
  int? floatTenders(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.floatTenders''',
      ));
  int? tenderResults(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.tenderResults''',
      ));
  int? supplyOrders(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.supplyOrders''',
      ));
}

class CreateSanctionOrderCall {
  Future<ApiCallResponse> call({
    String? headOfAccount = '',
    String? payeeName = '',
    String? address = '',
    String? purpose = '',
    String? paymentProposedBy = '',
    String? fileReference = '',
    String? expenditureAuthOrder = '',
    String? expenditureAuthDate = '',
    String? billReceiptDate = '',
    String? natureOfPayment = '',
    String? paymentType = '',
    String? mmrOrStockEntryNo = '',
    String? supplierAdvanceLFR = '',
    String? amountOfAdvance = '',
    String? advanceDate = '',
    String? modeOfPayment = '',
    String? modeOfRemittance = '',
    String? totalAmount = '',
    String? totalAmountInWords = '',
    bool? paymentRecommended,
    bool? paymentAuthorised,
    String? proposingOfficerName = '',
    String? proposingOfficerDesignation = '',
    String? recommendingOfficerDesignation = '',
    String? sanctioningAuthorityName = '',
    String? sanctioningAuthorityDesignation = '',
    String? paymentModeUsed = '',
    String? transactionRefNo = '',
    dynamic billDetailsJson,
    String? recommendingOfficerName = '',
    String? paidPartyDate = '',
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    final billDetails = _serializeJson(billDetailsJson, true);
    final ffApiRequestBody = '''
{
  "headOfAccount": "${escapeStringForJson(headOfAccount)}",
  "payeeName": "${escapeStringForJson(payeeName)}",
  "address": "${escapeStringForJson(address)}",
  "purpose": "${escapeStringForJson(purpose)}",
  "paymentProposedBy": "${escapeStringForJson(paymentProposedBy)}",
  "fileReference": "${escapeStringForJson(fileReference)}",
  "expenditureAuthOrder": "${escapeStringForJson(expenditureAuthOrder)}",
  "expenditureAuthDate": "<Date>",
  "billReceiptDate": "${escapeStringForJson(billReceiptDate)}",
  "natureOfPayment": "${escapeStringForJson(natureOfPayment)}",
  "paymentType": "${escapeStringForJson(paymentType)}",
  "mmrOrStockEntryNo": "${escapeStringForJson(mmrOrStockEntryNo)}",
  "supplierAdvanceLFR": "${escapeStringForJson(supplierAdvanceLFR)}",
  "amountOfAdvance": "${escapeStringForJson(amountOfAdvance)}",
  "advanceDate": "${escapeStringForJson(advanceDate)}",
  "modeOfPayment": "${escapeStringForJson(modeOfPayment)}",
  "modeOfRemittance": "${escapeStringForJson(modeOfRemittance)}",
  "totalAmount": "${escapeStringForJson(totalAmount)}",
  "totalAmountInWords": "${escapeStringForJson(totalAmountInWords)}",
  "paymentRecommended": ${paymentRecommended},
  "paymentAuthorised": ${paymentAuthorised},
  "proposingOfficer_name": "${escapeStringForJson(proposingOfficerName)}",
  "proposingOfficer_designation": "${escapeStringForJson(proposingOfficerDesignation)}",
  "recommendingOfficer_name": "${escapeStringForJson(recommendingOfficerName)}",
  "recommendingOfficer_designation": "${escapeStringForJson(recommendingOfficerDesignation)}",
  "sanctioningAuthority_name": "${escapeStringForJson(sanctioningAuthorityName)}",
  "sanctioningAuthority_designation": "${escapeStringForJson(sanctioningAuthorityDesignation)}",
  "paidPartyDate": "${escapeStringForJson(paidPartyDate)}",
  "paymentModeUsed": "${escapeStringForJson(paymentModeUsed)}",
  "transactionRefNo": "${escapeStringForJson(transactionRefNo)}",
  "billDetails": ${billDetails}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: ' Create Sanction Order',
        apiUrl: '${baseUrl}/api/osic/createSanctionOrder',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

class GgetAllSanctionOrdersCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = MsmeOsicGroup.getBaseUrl(
      authToken: authToken,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Gget All Sanction Orders',
        apiUrl: '${baseUrl}/api/osic/getAllSanctionOrders',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    EncDecInterceptor(),
  ];
}

/// End MSME OSIC Group Code

/// Start OKVI Group Code

class OkviGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://0b2d1b5d-3b9b-4e15-bba5-9de0e19a1b0d-00-r4zwniir4gzm.pike.replit.dev';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
  };
  static OkviGetCaptchaCall getCaptchaCall = OkviGetCaptchaCall();
  static OKVILoginCall oKVILoginCall = OKVILoginCall();
  static OKVIRegisterCall oKVIRegisterCall = OKVIRegisterCall();
  static EmailVerifysCall emailVerifysCall = EmailVerifysCall();
  static OtpVerifyCall otpVerifyCall = OtpVerifyCall();
  static OpenStockCreateCall openStockCreateCall = OpenStockCreateCall();
  static CloseStockCreateCall closeStockCreateCall = CloseStockCreateCall();
  static ClaimDocumentsFormICall claimDocumentsFormICall =
      ClaimDocumentsFormICall();
  static ClaimDocumentsFormVCall claimDocumentsFormVCall =
      ClaimDocumentsFormVCall();
  static ClaimDocumentsFormVICall claimDocumentsFormVICall =
      ClaimDocumentsFormVICall();
  static ClaimDocumentsDeclarationCertificateCall
      claimDocumentsDeclarationCertificateCall =
      ClaimDocumentsDeclarationCertificateCall();
  static ClaimDocumentsAuditCertificateCall claimDocumentsAuditCertificateCall =
      ClaimDocumentsAuditCertificateCall();
  static ClaimDocumentsBankDepositProofCall claimDocumentsBankDepositProofCall =
      ClaimDocumentsBankDepositProofCall();
  static AdminDashboardWithStatisticsCall adminDashboardWithStatisticsCall =
      AdminDashboardWithStatisticsCall();
  static GetClaimHeaderCall getClaimHeaderCall = GetClaimHeaderCall();
  static GetClaimDataCall getClaimDataCall = GetClaimDataCall();
  static FinalSubmitCall finalSubmitCall = FinalSubmitCall();
  static GetDeclarationCertificatesCall getDeclarationCertificatesCall =
      GetDeclarationCertificatesCall();
  static GetAuditCertificatesCall getAuditCertificatesCall =
      GetAuditCertificatesCall();
  static CreateHolidayCall createHolidayCall = CreateHolidayCall();
  static UpdateHolidayCall updateHolidayCall = UpdateHolidayCall();
  static DeleteHolidayCall deleteHolidayCall = DeleteHolidayCall();
  static GetAllHeadTypesCall getAllHeadTypesCall = GetAllHeadTypesCall();
  static CreateHeadTypeCall createHeadTypeCall = CreateHeadTypeCall();
  static UpdateHeadTypeCall updateHeadTypeCall = UpdateHeadTypeCall();
  static DeleteHeadTypeCall deleteHeadTypeCall = DeleteHeadTypeCall();
  static GetAllUnitTypesCall getAllUnitTypesCall = GetAllUnitTypesCall();
  static CreateUnitTypeCall createUnitTypeCall = CreateUnitTypeCall();
  static UpdateUnitTypeCall updateUnitTypeCall = UpdateUnitTypeCall();
  static DeleteUnitTypeCall deleteUnitTypeCall = DeleteUnitTypeCall();
  static BankProofsCall bankProofsCall = BankProofsCall();
  static GetCalendarHolidaysCall getCalendarHolidaysCall =
      GetCalendarHolidaysCall();
  static DashboardUserCall dashboardUserCall = DashboardUserCall();
  static TestDsfgerbdsfCall testDsfgerbdsfCall = TestDsfgerbdsfCall();
  static GetOpeningStocksCall getOpeningStocksCall = GetOpeningStocksCall();
  static GetClosingStocksCall getClosingStocksCall = GetClosingStocksCall();
  static TestdddddCall testdddddCall = TestdddddCall();
  static TestGggCall testGggCall = TestGggCall();
  static TestjjjCall testjjjCall = TestjjjCall();
  static TestVvvCall testVvvCall = TestVvvCall();
  static TestCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall
      testCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall =
      TestCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall();
  static TestCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall
      testCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall =
      TestCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall();
}

class OkviGetCaptchaCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = OkviGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'OKVI Get Captcha',
      apiUrl: '${baseUrl}/api/okvi/auth/get-captcha',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OKVILoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OKVI Login',
      apiUrl: '${baseUrl}/api/okvi/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OKVIRegisterCall {
  Future<ApiCallResponse> call({
    String? institutionInfoName = '',
    String? institutionInfoEmail = '',
    String? institutionInfoDist = '',
    String? institutionInfoAdress = '',
    String? institutionInfoGmdicType = '',
    String? registrationInfoRegdWithADM = '',
    String? registrationInfoAdmRegdNo = '',
    String? registrationInfoRegdWithOKVIB = '',
    String? registrationInfoHasOkvibRegdNo = '',
    String? registrationInfoOkvibRegdNo = '',
    String? registrationInfoRegdWithKVIC = '',
    String? registrationInfoKvicRegdNo = '',
    String? registrationInfoValidityTill = '',
    String? bankDetailsAccountNo = '',
    String? bankDetailsAccountHolderName = '',
    String? bankDetailsIfscCode = '',
    String? bankDetailsBankBranch = '',
    String? secretaryInfoName = '',
    String? secretaryInfoMobile = '',
    String? secretaryInfoAddress = '',
    String? presidentInfoName = '',
    String? presidentInfoMobile = '',
    String? presidentInfoAddress = '',
    dynamic committeeMembersJson,
    String? password = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final committeeMembers = _serializeJson(committeeMembersJson, true);
    final ffApiRequestBody = '''
{
  "institutionInfo": {
    "name": "${escapeStringForJson(institutionInfoName)}",
    "email": "${escapeStringForJson(institutionInfoEmail)}",
    "district": "${escapeStringForJson(institutionInfoDist)}",
    "gmdicType": "${escapeStringForJson(institutionInfoGmdicType)}",
    "address": "${escapeStringForJson(institutionInfoAdress)}"
  },
  "registrationInfo": {
    "regdWithADM": "${escapeStringForJson(registrationInfoRegdWithADM)}",
    "admRegdNo": "${escapeStringForJson(registrationInfoAdmRegdNo)}",
    "regdWithOKVIB": "${escapeStringForJson(registrationInfoRegdWithOKVIB)}",
    "hasOkvibRegdNo": "${escapeStringForJson(registrationInfoHasOkvibRegdNo)}",
    "okvibRegdNo": "${escapeStringForJson(registrationInfoOkvibRegdNo)}",
    "regdWithKVIC": "${escapeStringForJson(registrationInfoRegdWithKVIC)}",
    "kvicRegdNo": "${escapeStringForJson(registrationInfoKvicRegdNo)}",
    "validityTill": "${escapeStringForJson(registrationInfoValidityTill)}"
  },
  "bankDetails": {
    "accountNo": "${escapeStringForJson(bankDetailsAccountNo)}",
    "accountHolderName": "${escapeStringForJson(bankDetailsAccountHolderName)}",
    "ifscCode": "${escapeStringForJson(bankDetailsIfscCode)}",
    "bankBranch": "${escapeStringForJson(bankDetailsBankBranch)}"
  },
  "secretaryInfo": {
    "name": "${escapeStringForJson(secretaryInfoName)}",
    "mobile": "${escapeStringForJson(secretaryInfoMobile)}",
    "address": "${escapeStringForJson(secretaryInfoAddress)}"
  },
  "presidentInfo": {
    "name": "${escapeStringForJson(presidentInfoName)}",
    "mobile": "${escapeStringForJson(presidentInfoMobile)}",
    "address": "${escapeStringForJson(presidentInfoAddress)}"
  },
  "committeeMembers":${committeeMembers}
  ,
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OKVI Register',
      apiUrl: '${baseUrl}/api/okvi/user/registerUserDetails',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmailVerifysCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Email Verifys',
      apiUrl: '${baseUrl}/api/okvi/user/sendotp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class OtpVerifyCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "otp": "${escapeStringForJson(otp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Otp Verify',
      apiUrl: '${baseUrl}/api/okvi/user/verifyotp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OpenStockCreateCall {
  Future<ApiCallResponse> call({
    String? subHeadName = '',
    String? unitType = '',
    double? unitPrice,
    double? quantity,
    double? totalPrice,
    String? festivalId = '',
    String? head = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "festivalId": "${escapeStringForJson(festivalId)}",
  "head": "${escapeStringForJson(head)}",
  "subHeadDetails": [
    {
      "subHeadName": "${escapeStringForJson(subHeadName)}",
      "unitType": "${escapeStringForJson(unitType)}",
      "unitPrice": ${unitPrice},
      "quantity": ${quantity},
      "totalPrice": ${totalPrice}
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Open Stock Create',
      apiUrl: '${baseUrl}/api/okvi/opening-stock/create',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CloseStockCreateCall {
  Future<ApiCallResponse> call({
    String? subHeadName = '',
    String? unitType = '',
    double? unitPrice,
    double? quantity,
    double? totalPrice,
    String? festivalId = '',
    String? head = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "festivalId": "${escapeStringForJson(festivalId)}",
  "head": "${escapeStringForJson(head)}",
  "subHeadDetails": [
    {
      "subHeadName": "${escapeStringForJson(subHeadName)}",
      "unitType": "${escapeStringForJson(unitType)}",
      "unitPrice": ${unitPrice},
      "quantity": ${quantity},
      "totalPrice": ${totalPrice}
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Close Stock Create',
      apiUrl: '${baseUrl}/api/okvi/closing-stock/create',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClaimDocumentsFormICall {
  Future<ApiCallResponse> call({
    String? festivalName = '',
    dynamic retailSalesJson,
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final retailSales = _serializeJson(retailSalesJson, true);
    final ffApiRequestBody = '''
{
  "festivalName": "${escapeStringForJson(festivalName)}",
  "retailSales": "${retailSales}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Claim Documents Form I',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/form-i',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClaimDocumentsFormVCall {
  Future<ApiCallResponse> call({
    String? festivalName = '',
    String? method = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "festivalName": "${escapeStringForJson(festivalName)}",
  "method": "${escapeStringForJson(method)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Claim Documents FormV',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/form-v',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClaimDocumentsFormVICall {
  Future<ApiCallResponse> call({
    String? festivalName = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "festivalName": "${escapeStringForJson(festivalName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Claim Documents Form VI',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/form-vi',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClaimDocumentsDeclarationCertificateCall {
  Future<ApiCallResponse> call({
    String? festivalName = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "festivalName": "${escapeStringForJson(festivalName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Claim Documents Declaration Certificate',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/declaration-certificate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClaimDocumentsAuditCertificateCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? auditFile,
    String? festivalName = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Claim Documents Audit Certificate',
      apiUrl: '${baseUrl}api/okvi/claim-documents/upload-audit-certificate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'auditFile': auditFile,
        'festivalName': festivalName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClaimDocumentsBankDepositProofCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? bankProofFile,
    String? festivalName = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Claim Documents Bank Deposit Proof',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/upload-bank-deposit-proof',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'bankProofFile': bankProofFile,
        'festivalName': festivalName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AdminDashboardWithStatisticsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Admin dashboard with statistics',
      apiUrl: '${baseUrl}/api/okvi/admin/dashboard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetClaimHeaderCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Claim Header',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/getClaimHeader',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetClaimDataCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? festival = '',
    String? action = '',
    String? claimId = '',
    String? form = '',
    String? approvalStatus = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "type": "${escapeStringForJson(type)}",
  "festival": "${escapeStringForJson(festival)}",
  "action": "${escapeStringForJson(action)}",
  "claimId": "${escapeStringForJson(claimId)}",
  "form": "${escapeStringForJson(form)}",
  "approval_status": "${escapeStringForJson(approvalStatus)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Claim Data',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/getClaimData',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FinalSubmitCall {
  Future<ApiCallResponse> call({
    String? festivalName = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "festivalName": "${escapeStringForJson(festivalName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Final Submit',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/final-submit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDeclarationCertificatesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Declaration Certificates',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/declaration-certificates',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAuditCertificatesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Audit Certificates',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/audit-certificates',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateHolidayCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? startDate = '',
    String? endDate = '',
    String? type = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "startDate": "${escapeStringForJson(startDate)}",
  "endDate": "${escapeStringForJson(endDate)}",
  "type": "${escapeStringForJson(type)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create holiday',
      apiUrl: '${baseUrl}/api/okvi/holidays/createHoliday',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateHolidayCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Update holiday',
      apiUrl: '${baseUrl}/api/okvi/holidays/updateHoliday',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteHolidayCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete holiday',
      apiUrl: '${baseUrl}/api/okvi/holidays/deleteHoliday',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllHeadTypesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get all head types',
      apiUrl: '${baseUrl}/api/okvi/head-types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateHeadTypeCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create head type',
      apiUrl: '${baseUrl}/api/okvi/head-types',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateHeadTypeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Update head type',
      apiUrl: '${baseUrl}/api/okvi/head-types/:id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteHeadTypeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete head type',
      apiUrl: '${baseUrl}/api/okvi/head-types/:id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllUnitTypesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get all unit types',
      apiUrl: '${baseUrl}/api/okvi/unit-types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateUnitTypeCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create unit type',
      apiUrl: '${baseUrl}/api/okvi/unit-types',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUnitTypeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Update unit type',
      apiUrl: '${baseUrl}/api/okvi/unit-types/:id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUnitTypeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete unit type',
      apiUrl: '${baseUrl}/api/okvi/unit-types/:id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BankProofsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Bank Proofs',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/bank-proofs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCalendarHolidaysCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get Calendar Holidays',
      apiUrl: '${baseUrl}/api/okvi/holidays/getCalendarHolidays',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DashboardUserCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Dashboard User',
      apiUrl: '${baseUrl}/api/okvi/auth/dashboard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestDsfgerbdsfCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'test dsfgerbdsf',
      apiUrl: '${baseUrl}/api/okvi/admin/dashboard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOpeningStocksCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Opening Stocks',
      apiUrl: '${baseUrl}/api/okvi/opening-stock/getOpeningStocks',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetClosingStocksCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Closing Stocks',
      apiUrl: '${baseUrl}/api/okvi/closing-stock/getClosingStocks',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestdddddCall {
  Future<ApiCallResponse> call({
    String? festivalName = '',
    String? method = '',
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'testddddd',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/getClaimData',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestGggCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Test ggg',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/declaration-certificates',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestjjjCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: ' Testjjj',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/audit-certificates',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestVvvCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Test vvv',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/bank-proofs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName:
          'test Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/upload-bank-deposit-proof',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = OkviGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName:
          'test Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/api/okvi/claim-documents/upload-bank-deposit-proof',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OKVI Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
