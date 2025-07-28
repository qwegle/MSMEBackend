import CryptoJS from 'crypto-js';
import AppError from './AppError.js';

const SECRET_KEY_HEX = 'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';
const key = CryptoJS.enc.Hex.parse(SECRET_KEY_HEX);

// Generate random IV and prepend it to the ciphertext in hex format
export function encryptData(data) {
  const jsonString = JSON.stringify(data);
  const iv = CryptoJS.lib.WordArray.random(16); // 128-bit IV
  const encrypted = CryptoJS.AES.encrypt(jsonString, key, {
    iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });

  // Combine IV and ciphertext (both are WordArrays)
  const combined = iv.clone().concat(encrypted.ciphertext);
  return combined.toString(CryptoJS.enc.Hex); // Output as hex string
}

export function decryptData(encryptedHex) {
  try {
    const encryptedWA = CryptoJS.enc.Hex.parse(encryptedHex);

    // Extract IV (first 16 bytes = 4 words)
    const iv = CryptoJS.lib.WordArray.create(encryptedWA.words.slice(0, 4), 16);
    const ciphertext = CryptoJS.lib.WordArray.create(
      encryptedWA.words.slice(4),
      encryptedWA.sigBytes - 16
    );

    const decrypted = CryptoJS.AES.decrypt(
      { ciphertext },
      key,
      {
        iv,
        mode: CryptoJS.mode.CBC,
        padding: CryptoJS.pad.Pkcs7,
      }
    );

    const utf8 = decrypted.toString(CryptoJS.enc.Utf8);
    if (!utf8) throw new Error('Empty decrypted string');

    let parsed = JSON.parse(utf8);
    if (typeof parsed === 'string') parsed = JSON.parse(parsed);
    return parsed;
  } catch (err) {
    console.error('❌ Decryption failed:', err.message);
    throw new AppError('Invalid or corrupted encrypted data', 400);
  }
}

export function decryptRequestBody(req, res, next) {
  try {
    const payload = req.body?.data;
    if (!payload) throw new AppError('Missing encrypted data in request body', 400);

    console.log('Encrypted data (hex):', payload);
    req.decryptedBody = decryptData(payload);

    if (!req.decryptedBody || typeof req.decryptedBody !== 'object' || Array.isArray(req.decryptedBody)) {
      throw new AppError('Failed to decrypt request body', 400);
    }

    next();
  } catch (err) {
    next(err instanceof AppError ? err : new AppError('Failed to decrypt request body', 400));
  }
}

export function sendEncryptedResponse(res, statusCode, payload) {
  const encryptedPayload = encryptData(payload);
  return res.status(statusCode).json({ data: encryptedPayload });
}
