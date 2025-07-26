import CryptoJS from 'crypto-js';
import AppError from './AppError.js';

const SECRET_KEY = process.env.AES_SECRET;

// Encrypts a JS object into AES-encrypted string
export function encryptData(data) {
  const jsonString = JSON.stringify(data);
  const encrypted = CryptoJS.AES.encrypt(jsonString, SECRET_KEY).toString();
  return encrypted;
}

// Decrypts an AES string and returns the original JS object
export function decryptData(ciphertext) {
  try {
    const bytes = CryptoJS.AES.decrypt(ciphertext, SECRET_KEY);
    const decryptedUtf8 = bytes.toString(CryptoJS.enc.Utf8);

    console.log('🧩 UTF8 decrypted string:', decryptedUtf8);

    if (!decryptedUtf8) throw new Error('Empty decrypted string');

    let parsed = JSON.parse(decryptedUtf8);

    // Handle double-stringified JSON
    if (typeof parsed === 'string') {
      parsed = JSON.parse(parsed);
    }

    return parsed;
  } catch (err) {
    console.error('❌ Failed to decrypt AES payload:', err.message);
    throw new AppError('Invalid or corrupted encrypted data', 400);
  }
}

// Middleware to decrypt `req.body.data` and attach to `req.decryptedBody`
export function decryptRequestBody(req, res, next) {
  try {
    if (!req.body?.data) {
      throw new AppError('Missing encrypted data in request body', 400);
    }

    console.log('🔐 Encrypted data:', req.body.data);
    req.decryptedBody = decryptData(req.body.data);

    if (
      !req.decryptedBody ||
      typeof req.decryptedBody !== 'object' ||
      Array.isArray(req.decryptedBody)
    ) {
      console.error('❌ Decryption middleware error: Decryption did not yield valid object');
      throw new AppError('Failed to decrypt request body', 400);
    }

    next();
  } catch (err) {
    next(err instanceof AppError ? err : new AppError('Failed to decrypt request body', 400));
  }
}

// Sends AES-encrypted response with payload
export function sendEncryptedResponse(res, statusCode, payload) {
  const encryptedPayload = encryptData(payload);
  return res.status(statusCode).json({ data: encryptedPayload });
}
