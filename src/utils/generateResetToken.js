import { randomBytes, createHash } from 'crypto';

export function generateResetToken () {
  const resetToken = randomBytes(32).toString('hex');
  const hashedToken = createHash('sha256').update(resetToken).digest('hex');
  return { resetToken, hashedToken };
}
