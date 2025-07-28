import {
  registerUser,
  loginUser,
  register_ofsc_superadmin,
  register_ofsc_subadmin,
  forgotPasswordService,
  resetPasswordService,
  resendResetOTPService,
} from '../services/auth.service.js';
import { encryptData, decryptRequestBody, sendEncryptedResponse } from '../utils/encryption.js';
import { blacklistToken } from '../utils/tokenBlacklist.js';
import catchAsync from '../utils/catchAsync.js';
import AppError from '../utils/AppError.js';
import User from '../models/user.js';
import { compare, hash } from 'bcrypt';
import { generateCaptcha, verifyCaptcha } from '../utils/captcha.js';

export const register = catchAsync(async (req, res, next) => {
  const { captcha, captchaToken } = req.body;
  const isValid = verifyCaptcha(captchaToken, captcha);
  if (!isValid) {
    return next(new AppError('Invalid or expired CAPTCHA', 400));
  }
  const result = await registerUser(req.body);
  res.status(201).json(result);
});

export const login = catchAsync(async (req, res) => {
  const { captcha, captchaToken } = req.body;
  const isValid = verifyCaptcha(captchaToken, captcha);
  if (!isValid) {
    return next(new AppError('Invalid or expired CAPTCHA', 400));
  }
  const result = await loginUser(req.body);
  res.status(200).json(result);
});

export const register_OFSC_SuperAdmin = catchAsync(async (req, res, next) => {
  const { dev_pass } = req.body;
  if (!dev_pass || dev_pass != process.env.DEV_PASS) {
    return next(new AppError('You are not authorized to use this endpoint ', 401));
  }
  const result = await register_ofsc_superadmin(req.body);
  res.status(201).json(result);
});

export const register_OFSC_SubAdmin = catchAsync(async (req, res) => {
  const { dev_pass } = req.body;
  if (!dev_pass || dev_pass != process.env.DEV_PASS) {
    return next(new AppError('You are not authorized to use this endpoint ', 401));
  }
  const result = await register_ofsc_subadmin(req.body);
  res.status(201).json(result);
});


export function logout(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader?.split(' ')[1];
  if (!token) return next(new AppError('Token required', 401));
  blacklistToken(token);
  res.json({ message: 'Logout successful' });
}

export const forgotPassword = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    console.log(req.decryptedBody.email)
    const result = await forgotPasswordService(req.decryptedBody.email);
    sendEncryptedResponse(res, 200, result);
  }),
];

export const resetPassword = catchAsync(async (req, res) => {
  const { otp, password } = req.body;
  const result = await resetPasswordService(otp, password);
  res.status(200).json(result);
});

export const resendResetOTP = catchAsync(async (req, res) => {
  const result = await resendResetOTPService(req.body.email);
  res.status(200).json(result);
});


export function protectedRoute(req, res) {
  res.status(200).json({ message: 'Access granted', user: req.user });
}

export const updateProfile = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { username, phone, aadharNumber, currentPassword, newPassword } = req.body;
  const user = await User.findById(userId);
  if (!user) return next(new AppError('User not found', 404));
  if (username) user.username = username;
  if (phone) user.phone = phone;
  if (aadharNumber) user.aadharNumber = aadharNumber;
  if (newPassword) {
    if (!currentPassword) {
      return next(new AppError('Current password is required to change password', 400));
    }
    const isMatch = await compare(currentPassword, user.password);
    if (!isMatch) {
      return next(new AppError('Current password is incorrect', 401));
    }
    user.password = await hash(newPassword, 10);
  }
  await user.save();
  res.status(200).json({ message: 'Profile updated successfully' });
});

export const getCaptcha = catchAsync(async (req, res) => {
  const { svg, token } = generateCaptcha();
  res.setHeader('Content-Type', 'image/svg+xml');
  res.setHeader('Cache-Control', 'no-store');
  res.setHeader('captcha-token', token);
  res.status(200).send(svg); // Send raw SVG
});

