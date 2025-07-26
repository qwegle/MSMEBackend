import CryptoJS from 'crypto-js';
import AppError from './AppError.js';

const SECRET_KEY = process.env.AES_SECRET;

export function encryptData(data) {
  const jsonString = JSON.stringify(data);
  return CryptoJS.AES.encrypt(jsonString, SECRET_KEY).toString();
}

export function decryptData(ciphertext) {
  const bytes = CryptoJS.AES.decrypt(ciphertext, SECRET_KEY);
  const decrypted = bytes.toString(CryptoJS.enc.Utf8);
  return JSON.parse(decrypted);
}

export function decryptRequestBody(req, res, next) {
  try {
    if (!req.body?.data) {
      throw new AppError('Missing encrypted data in request body', 400);
    }
    req.decryptedBody = decryptData(req.body.data);
    next();
  } catch (err) {
    next(new AppError('Failed to decrypt request body', 400));
  }
}

export function sendEncryptedResponse(res, statusCode, payload) {
  const encryptedPayload = encryptData(payload);
  return res.status(statusCode).json({ data: encryptedPayload });
}
