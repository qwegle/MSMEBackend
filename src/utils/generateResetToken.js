import crypto from 'crypto';

export function generateOTP () {
 const otp = Math.floor(100000 + Math.random() * 900000).toString(); // 6-digit
  const hashedOTP = crypto.createHash('sha256').update(otp).digest('hex');
  return { otp, hashedOTP };
}
