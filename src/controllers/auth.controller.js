import { registerUser, loginUser, register_ofsc_superadmin, register_ofsc_subadmin, forgotPasswordService, resetPasswordService } from '../services/auth.service.js';
import { blacklistToken } from '../utils/tokenBlacklist.js';
import catchAsync from '../utils/catchAsync.js';
import AppError from '../utils/AppError.js';


export const register = catchAsync(async (req, res) => {
  const result = await registerUser(req.body);
  res.status(201).json(result);
});


export const login = catchAsync(async (req, res) => {
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

export const forgotPassword = catchAsync(async (req, res) => {
  const result = await forgotPasswordService(req.body.email);
  res.status(200).json(result);
});

export const resetPassword = catchAsync(async (req, res) => {
  const { otp, password } = req.body;
  const result = await resetPasswordService(otp, password);
  res.status(200).json(result);
});


export function protectedRoute(req, res) {
  res.status(200).json({ message: 'Access granted', user: req.user });
}
