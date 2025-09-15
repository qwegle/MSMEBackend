import CryptoJS from 'crypto-js';

// Hex-encoded 32-byte secret key (256-bit AES key)
const SECRET_KEY_HEX = 'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';
const key = CryptoJS.enc.Hex.parse(SECRET_KEY_HEX);

// Sample data to encrypt
const jsonData = {
  email: "iamsikun99@gmail.com",
};

// Example encrypted response from backend (IV + ciphertext in hex)
const jsonResponse = "7a92ab4711a5350a04eb87bdc2937c583304c2c6d1e898fe049980ac180093263bd61bae460944dde1c57038581a7bc7f75242652e9db1c7acb955e8871a1dc3ba3f225ef60b3c99b47f3b0491d0728d3a81d8d0fd360deabdb6b8c6b596921d1ca5581263b9acb4ff17ba4d8b121c1a"
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
