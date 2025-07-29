import {
  registerUser,
  loginUser,
  register_ofsc_superadmin,
  register_ofsc_subadmin,
  forgotPasswordService,
  resetPasswordService,
  resendResetOTPService,
} from '../services/auth.service.js';

import {
  decryptRequestBody,
  sendEncryptedResponse,
} from '../utils/encryption.js';

import { blacklistToken } from '../utils/tokenBlacklist.js';
import catchAsync from '../utils/catchAsync.js';
import AppError from '../utils/AppError.js';
import User from '../models/user.js';
import { compare, hash } from 'bcrypt';
import { generateCaptcha, verifyCaptcha } from '../utils/captcha.js';

export const register = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { captcha, captchaToken } = req.decryptedBody;
    const isValid = verifyCaptcha(captchaToken, captcha);
    if (!isValid) return next(new AppError('Invalid or expired CAPTCHA', 400));
    const result = await registerUser(req.decryptedBody);
    sendEncryptedResponse(res, 201, result);
  }),
];

export const login = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { captcha, captchaToken } = req.decryptedBody;
    const isValid = verifyCaptcha(captchaToken, captcha);
    if (!isValid) return next(new AppError('Invalid or expired CAPTCHA', 400));
    const result = await loginUser(req.decryptedBody);
    sendEncryptedResponse(res, 200, result);
  }),
];

export const register_OFSC_SuperAdmin = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { dev_pass } = req.decryptedBody;
    if (!dev_pass || dev_pass != process.env.DEV_PASS) {
      return next(new AppError('You are not authorized to use this endpoint', 401));
    }
    const result = await register_ofsc_superadmin(req.decryptedBody);
    sendEncryptedResponse(res, 201, result);
  }),
];

export const register_OFSC_SubAdmin = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { dev_pass } = req.decryptedBody;
    if (!dev_pass || dev_pass != process.env.DEV_PASS) {
      return next(new AppError('You are not authorized to use this endpoint', 401));
    }
    const result = await register_ofsc_subadmin(req.decryptedBody);
    sendEncryptedResponse(res, 201, result);
  }),
];

export function logout(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader?.split(' ')[1];
  if (!token) return next(new AppError('Token required', 401));
  blacklistToken(token);
  res.json({ message: 'Logout successful' }); // No encryption needed
}

export const forgotPassword = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const result = await forgotPasswordService(req.decryptedBody.email);
    sendEncryptedResponse(res, 200, result);
  }),
];

export const resetPassword = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const { otp, password } = req.decryptedBody;
    const result = await resetPasswordService(otp, password);
    sendEncryptedResponse(res, 200, result);
  }),
];

export const resendResetOTP = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const result = await resendResetOTPService(req.decryptedBody.email);
    sendEncryptedResponse(res, 200, result);
  }),
];

export const protectedRoute = (req, res) => {
  sendEncryptedResponse(res, 200, { message: 'Access granted', user: req.user });
};

export const updateProfile = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const userId = req.user.id;
    const {
      username,
      phone,
      aadharNumber,
      currentPassword,
      newPassword,
    } = req.decryptedBody;

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
    sendEncryptedResponse(res, 200, { message: 'Profile updated successfully' });
  }),
];

export const getCaptcha = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
  const captcha = generateCaptcha();
  await sendEncryptedResponse(res, 200, {
    message: 'Captcha generated successfully',
    captchaType: captcha.captchaType,
    captchaQuestion: captcha.captchaQuestion,
    captchaToken: captcha.captchaToken,
  });
}),
]

