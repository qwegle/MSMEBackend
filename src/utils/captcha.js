// import svgCaptcha from 'svg-captcha';
import { encryptData, decryptData } from '../utils/encryption.js';

// const getRandomColor = () => {
//   const r = Math.floor(200 + Math.random() * 55);
//   const g = Math.floor(200 + Math.random() * 55);
//   const b = Math.floor(200 + Math.random() * 55);
//   return `rgb(${r}, ${g}, ${b})`;
// };

// export const generateCaptcha = () => {
//   const useMath = Math.random() < 0.5;
//   const options = {
//     noise: 3,
//     color: true,
//     background: getRandomColor(),
//     width: 150,
//     height: 50,
//   };

//   let captcha;
//   if (useMath) {
//     captcha = svgCaptcha.createMathExpr(options);
//   } else {
//     captcha = svgCaptcha.create({
//       ...options,
//       size: 5,
//       ignoreChars: '0o1ilI', // avoid confusing characters
//     });
//   }

//   const code = captcha.text;
//   const expiresAt = Date.now() + 5 * 60 * 1000; // 5 min expiry
//   const encryptedToken = encryptData(JSON.stringify({ code, expiresAt }));

//   return { svg: captcha.data, token: encryptedToken };
// };


export const verifyCaptcha = (encryptedToken, userInput) => {
  try {
    if (!encryptedToken || !userInput) return false;
    const decrypted = decryptData(encryptedToken);
    const { answer, expiresAt } = decrypted;
    if (!answer || !expiresAt) return false;
    if (Date.now() > Number(expiresAt)) return false;
    const userAnswer = Number(userInput?.toString().trim());
    const expectedAnswer = Number(answer);
    console.log('Comparing:', userAnswer, 'vs', expectedAnswer);
    return userAnswer === expectedAnswer;
  } catch (err) {
    console.error('Captcha verification failed:', err.message);
    return false;
  }
};


const getRandomChars = (length = 5) => {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789'; // avoids confusing chars
  return Array.from({ length }, () => chars[Math.floor(Math.random() * chars.length)]).join('');
};

const getRandomNumbers = (length = 5) => {
  return Array.from({ length }, () => Math.floor(Math.random() * 10)).join('');
};

const getRandomMath = () => {
  const num1 = Math.floor(Math.random() * 10) + 1;
  const num2 = Math.floor(Math.random() * 10) + 1;
  const operators = ['+', '-', '*'];
  const operator = operators[Math.floor(Math.random() * operators.length)];

  const expression = `${num1} ${operator} ${num2}`;
  let answer;
  switch (operator) {
    case '+': answer = num1 + num2; break;
    case '-': answer = num1 - num2; break;
    case '*': answer = num1 * num2; break;
  }
  return { expression, answer };
};

export const generateCaptcha = () => {
  const types = ['math', 'alphanumeric', 'numeric'];
  const selectedType = types[Math.floor(Math.random() * types.length)];
  let captchaQuestion, answer;
  switch (selectedType) {
    case 'math': {
      const math = getRandomMath();
      captchaQuestion = math.expression;
      answer = math.answer.toString();
      break;
    }
    case 'alphanumeric': {
      captchaQuestion = getRandomChars(5);
      answer = captchaQuestion;
      break;
    }
    case 'numeric': {
      captchaQuestion = getRandomNumbers(5);
      answer = captchaQuestion;
      break;
    }
  }
  const expiresAt = Date.now() + 5 * 60 * 1000;
  const captchaToken = encryptData(JSON.stringify({ answer, expiresAt }));
  return {
    captchaType: selectedType,
    captchaQuestion,
    captchaToken,
  };
};
