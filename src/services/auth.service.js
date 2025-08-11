import { hash, compare } from 'bcrypt';
import jwt from 'jsonwebtoken';
import User from '../models/user.js';
import AppError from '../utils/AppError.js';
import { generateOTP } from '../utils/generateResetToken.js';
import sendEmail from '../utils/sendEmail.js';
import crypto from 'crypto';
const { sign } = jwt;
const JWT_SECRET = process.env.JWT_SECRET;
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || '1h';
export async function registerUser({ username, email, password }) {
  const existingUser = await User.findOne({ email });
  if (existingUser) throw new AppError('Email already in use', 400);
  const hashedPassword = await hash(password, 10);
  const newUser = new User({
    username,
    email,
    password: hashedPassword,
    user_type: 0,
    user_role: 2
  });
  await newUser.save();
  return { message: 'User registered successfully' };
}
export async function register_ofsc_superadmin({ username, email, password, dev_pass }) {
  const existingUser = await User.findOne({ email });
  if (existingUser) throw new AppError('Email already in use', 400);
  const hashedPassword = await hash(password, 10);
  const newUser = new User({
    username,
    email,
    password: hashedPassword,
    user_type: 1,
    user_role: 0
  });
  await newUser.save();
  return { message: 'Super admin registered successfully' };
}
export async function register_ofsc_subadmin({ username, email, password }) {
  const existingUser = await User.findOne({ email });
  if (existingUser) throw new AppError('Email already in use', 400);
  const hashedPassword = await hash(password, 10);
  const newUser = new User({
    username,
    email,
    password: hashedPassword,
    user_type: 1,
    user_role: 1
  });
  await newUser.save();
  return { message: 'Sub admin registered successfully' };
}
export async function loginUser({ email, password }) {
  if (!email || !password) throw new AppError('Email and password are required', 400);
  const user = await User.findOne({ email });
  if (!user) throw new AppError('Invalid credentials', 401);
  const isPasswordCorrect = await compare(password, user.password);
  if (!isPasswordCorrect) throw new AppError('Invalid credentials', 401);
    const token = sign(
    {
        id: user._id,
        user_role: user.user_role,
        user_type: user.user_type,
        branch: user.branch
    },
    JWT_SECRET,
    { expiresIn: JWT_EXPIRES_IN }
    );
  return {
    token,
    message: 'Login successful',
    user: {
      id: user._id,
      username: user.username,
      email: user.email,
      user_type: user.user_type,
      user_role: user.user_role,
      branch: user.branch,
      jwtExt: JWT_EXPIRES_IN,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt
    }
  };
}
export async function forgotPasswordService(email) {
  const user = await User.findOne({ email });
  if (!user) throw new AppError('No user found with this email', 404);
  const { otp, hashedOTP } = generateOTP();
  user.resetPasswordToken = hashedOTP;
  user.resetPasswordExpires = Date.now() + 10 * 60 * 1000; // 10 min
  await user.save({ validateBeforeSave: false });
  const html = `
    <div style="padding: 20px; font-family: Arial;">
      <h2 style="color: #333;">Password Reset OTP</h2>
      <p>Hi <strong>${user.username}</strong>,</p>
      <p>Your OTP for resetting your password is:</p>
      <div style="font-size: 24px; font-weight: bold; color: #007bff;">${otp}</div>
      <p>This OTP is valid for 10 minutes.</p>
      <p>If you did not request a reset, please ignore this email.</p>
    </div>
  `;
  await sendEmail({
    to: user.email,
    subject: 'Your OTP for Password Reset',
    html
  });
  return { message: 'OTP sent to email.' };
}
export async function resetPasswordService(otp, newPassword) {
  const hashedOTP = crypto.createHash('sha256').update(otp).digest('hex');
const user = await User.findOne({
  resetPasswordToken: hashedOTP, // FIXED FIELD NAME
  resetPasswordExpires: { $gt: Date.now() }
});
  if (!user) throw new AppError('OTP is invalid or has expired', 400);
  user.password = await hash(newPassword, 10);
  user.resetPasswordToken = undefined;
  user.resetPasswordExpires = undefined;
  await user.save();
  return { message: 'Password has been reset successfully.' };
}
export async function resendResetOTPService(email) {
  const user = await User.findOne({ email });
  if (!user) throw new AppError('No user found with this email', 404);
  const now = Date.now();
  const lastSent = user.resetPasswordLastSentAt?.getTime() || 0;
  const cooldown = 60 * 1000; // 60 seconds
  if (now - lastSent < cooldown) {
    const waitTime = Math.ceil((cooldown - (now - lastSent)) / 1000);
    throw new AppError(`Please wait ${waitTime} more seconds before resending OTP.`, 429);
  }
  const { otp, hashedOTP } = generateOTP();
  user.resetPasswordToken = hashedOTP;
  user.resetPasswordExpires = now + 10 * 60 * 1000; // 10 minutes
  user.resetPasswordLastSentAt = now;
  await user.save({ validateBeforeSave: false });
  const html = `
    <div style="padding: 20px; font-family: Arial;">
      <h2 style="color: #333;">Password Reset OTP</h2>
      <p>Hi <strong>${user.username}</strong>,</p>
      <p>Your OTP for resetting your password is:</p>
      <div style="font-size: 24px; font-weight: bold; color: #007bff;">${otp}</div>
      <p>This OTP is valid for 10 minutes.</p>
      <p>If you did not request a reset, please ignore this email.</p>
    </div>
  `;
  await sendEmail({
    to: user.email,
    subject: 'Your OTP for Password Reset',
    html,
  });
  return { message: 'OTP resent to email.' };
}



