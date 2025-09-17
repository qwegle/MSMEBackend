import CryptoJS from 'crypto-js';

// Hex-encoded 32-byte secret key (256-bit AES key)
const SECRET_KEY_HEX = 'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';
const key = CryptoJS.enc.Hex.parse(SECRET_KEY_HEX);

// Sample data to encrypt
const jsonData = {
  email: "iamsikun99@gmail.com",
};

// Example encrypted response from backend (IV + ciphertext in hex)
const jsonResponse = "49e27c32d654d34aea2ad1f6c8f2eaaea40f7c268af4d5b2d0bb8f24fae77d69bcf75369cbfe2315979a18442d27db91d124edfcdcd6afd513e305549948cc01169f36701ecd9665cebe5621a279d9bf4e4ba97442c9281fdbba49f682d0b64571fa1d0532767ecb44cbdabcb4ed01ee00ac6f4e319fae0456157178d96b99d8";

function encryptData(data) {
  const jsonString = JSON.stringify(data);
  const iv = CryptoJS.lib.WordArray.random(16); // 128-bit IV
  const encrypted = CryptoJS.AES.encrypt(jsonString, key, {
    iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });

  // Combine IV + ciphertext (both WordArrays)
  const combined = iv.clone().concat(encrypted.ciphertext);

  return combined.toString(CryptoJS.enc.Hex);
}

// Decrypt function (split IV from ciphertext)
function decryptData(encryptedHex) {
  const encryptedWA = CryptoJS.enc.Hex.parse(encryptedHex);

  // Extract IV (first 16 bytes = 4 words)
  const iv = CryptoJS.lib.WordArray.create(encryptedWA.words.slice(0, 4), 16);

  // Extract ciphertext (remaining bytes)
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
  return JSON.parse(utf8);
}

const encrypted = encryptData(jsonData);
console.log("🔐 Encrypted Data (Hex):");
console.log(encrypted);

try {
  const decrypted = decryptData(jsonResponse); // Can also test `encrypted` here
  console.log("✅ Decrypted Data:");
  console.log(decrypted);
} catch (e) {
  console.error("❌ Failed to decrypt:", e.message);
}
