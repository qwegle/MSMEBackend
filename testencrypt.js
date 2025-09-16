import CryptoJS from 'crypto-js';

// Hex-encoded 32-byte secret key (256-bit AES key)
const SECRET_KEY_HEX = 'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';
const key = CryptoJS.enc.Hex.parse(SECRET_KEY_HEX);

// Sample data to encrypt
const jsonData = {
  email: "iamsikun99@gmail.com",
};

// Example encrypted response from backend (IV + ciphertext in hex)
const jsonResponse = "c8b733a003345c575eecded3d4752b53989e1d78481b791b5e921a0efaabeca52bd6808527e0fd582e894f2fc7523b72b7c0d161c80ee47c1e04e178833debbe12a755035d2b2b14851f7005000fe8a8";
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
