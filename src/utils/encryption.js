import CryptoJS from 'crypto-js';
import AppError from './AppError.js';

const SECRET_KEY_HEX =
  'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';
const key = CryptoJS.enc.Hex.parse(SECRET_KEY_HEX);
const iv = CryptoJS.enc.Hex.parse('00000000000000000000000000000000');
export function encryptData(data) {
  const jsonString = JSON.stringify(data);
  const encrypted = CryptoJS.AES.encrypt(jsonString, key, {
    iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });
  return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
}
export function decryptData(ciphertextBase64) {
  try {
    const cipherParams = CryptoJS.lib.CipherParams.create({
      ciphertext: CryptoJS.enc.Base64.parse(ciphertextBase64),
    });
    const decrypted = CryptoJS.AES.decrypt(cipherParams, key, {
      iv,
      mode: CryptoJS.mode.CBC,
      padding: CryptoJS.pad.Pkcs7,
    });
    const utf8 = decrypted.toString(CryptoJS.enc.Utf8);
    if (!utf8) throw new Error('Empty decrypted string');
    let parsed = JSON.parse(utf8);
    if (typeof parsed === 'string') {
      parsed = JSON.parse(parsed);
    }
    return parsed;
  } catch (err) {
    console.error('Failed to decrypt AES payload:', err.message);
    throw new AppError('Invalid or corrupted encrypted data', 400);
  }
}
export function decryptRequestBody(req, res, next) {
  try {
    const payload = req.body?.data;
    if (!payload) {
      throw new AppError('Missing encrypted data in request body', 400);
    }
    console.log('🔐 Encrypted data:', payload);
    req.decryptedBody = decryptData(payload);
    if (
      !req.decryptedBody ||
      typeof req.decryptedBody !== 'object' ||
      Array.isArray(req.decryptedBody)
    ) {
      console.error(
        'Decryption middleware error: Decryption did not yield valid object'
      );
      throw new AppError('Failed to decrypt request body', 400);
    }
    return next();
  } catch (err) {
    next(err instanceof AppError ? err : new AppError('Failed to decrypt request body', 400));
  }
}
export function sendEncryptedResponse(res, statusCode, payload) {
  const encryptedPayload = encryptData(payload);
  return res.status(statusCode).json({ data: encryptedPayload });
}
