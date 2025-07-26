// encrypt.js
import CryptoJS from 'crypto-js';

// Change this to your secret key (same as backend)
const SECRET_KEY = 'b066c79cad3f5eed28a22f55ebaf54c7236b30e44bda6e736cabc75477674f6f';

// The JSON you want to encrypt as string
const jsonString = `{
  "email":"iamsikun99@gmail.com"
}`;

const jsonResponse = "U2FsdGVkX1+2xFNJ9sfFTQygXyHIuwNAkPvM1lAT+/zoMhph1yibwRPgGLNsmLkMOit7kUJ3gGg7rEmFmXyMRg=="
function encryptData(data) {
  const jsonString = JSON.stringify(data); // ensures valid JSON for decryption
  return CryptoJS.AES.encrypt(jsonString, SECRET_KEY).toString();
}

export function decryptData(ciphertext) {
  const bytes = CryptoJS.AES.decrypt(ciphertext, SECRET_KEY);
  const decrypted = bytes.toString(CryptoJS.enc.Utf8); // throws if invalid UTF-8
  return JSON.parse(decrypted); // throws if not JSON
}


const encrypted = encryptData(jsonString);
const decrypted = decryptData(jsonResponse);
console.log("Encrypted data:");
console.log(encrypted);
console.log(decrypted);

