import CryptoJS from 'crypto-js';

// Hex-encoded 32-byte secret key (256-bit AES key)
const SECRET_KEY_HEX = 'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';

// Static 16-byte IV (all zeros for testing)
const key = CryptoJS.enc.Hex.parse(SECRET_KEY_HEX);
const iv = CryptoJS.enc.Hex.parse('00000000000000000000000000000000');

// Input data to encrypt (as JS object, not string)
const jsonData = {
  email: "iamsikun99@gmail.com",
};

// Base64 ciphertext to decrypt (must match encryption format)
const jsonResponse = "U2FsdGVkX1+2xFNJ9sfFTQygXyHIuwNAkPvM1lAT+/zoMhph1yibwRPgGLNsmLkMOit7kUJ3gGg7rEmFmXyMRg==";

// Encrypt function using AES-CBC with static IV
function encryptData(data) {
  const jsonString = JSON.stringify(data);
  const encrypted = CryptoJS.AES.encrypt(jsonString, key, {
    iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });
  return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
}

// Decrypt function using AES-CBC with static IV
function decryptData(ciphertextBase64) {
  const cipherParams = CryptoJS.lib.CipherParams.create({
    ciphertext: CryptoJS.enc.Base64.parse(ciphertextBase64),
  });
  const decrypted = CryptoJS.AES.decrypt(cipherParams, key, {
    iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });
  const utf8 = decrypted.toString(CryptoJS.enc.Utf8);
  return JSON.parse(utf8);
}

// Test the functions
const encrypted = encryptData(jsonData);
console.log("🔐 Encrypted Data:");
console.log(encrypted);

try {
  const decrypted = decryptData(encrypted); // You can test jsonResponse here too
  console.log("✅ Decrypted Data:");
  console.log(decrypted);
} catch (e) {
  console.error("❌ Failed to decrypt:", e.message);
}
