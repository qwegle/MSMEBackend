import svgCaptcha from 'svg-captcha';
import { encryptData, decryptData } from '../utils/encryption.js';

const getRandomColor = () => {
  const r = Math.floor(200 + Math.random() * 55);
  const g = Math.floor(200 + Math.random() * 55);
  const b = Math.floor(200 + Math.random() * 55);
  return `rgb(${r}, ${g}, ${b})`;
};

export const generateCaptcha = () => {
  const useMath = Math.random() < 0.5;
  const options = {
    noise: 3,
    color: true,
    background: getRandomColor(),
    width: 150,
    height: 50,
  };

  let captcha;
  if (useMath) {
    captcha = svgCaptcha.createMathExpr(options);
  } else {
    captcha = svgCaptcha.create({
      ...options,
      size: 5,
      ignoreChars: '0o1ilI', // avoid confusing characters
    });
  }

  const code = captcha.text;
  const expiresAt = Date.now() + 5 * 60 * 1000; // 5 min expiry
  const encryptedToken = encryptData(JSON.stringify({ code, expiresAt }));

  return { svg: captcha.data, token: encryptedToken };
};


export const verifyCaptcha = (encryptedToken, userInput) => {
  try {
    if (!encryptedToken || !userInput) return false;
    const decrypted = decryptData(encryptedToken);
    const { code, expiresAt } = JSON.parse(decrypted);
    if (Date.now() > expiresAt) return false;
    return userInput === code;
  } catch (err) {
    console.error('Captcha verification failed:', err.message);
    return false;
  }
};
