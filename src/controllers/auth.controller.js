const {
  registerUser,
  loginUser,
  register_ofsc_superadmin,
  register_ofsc_subadmin,
  forgotPasswordService,
  resetPasswordService

} = require('../services/auth.service');
const { blacklistToken } = require('../utils/tokenBlacklist');
const catchAsync = require('../utils/catchAsync');
const AppError = require('../utils/AppError');


exports.register = catchAsync(async (req, res) => {
  const result = await registerUser(req.body);
  res.status(201).json(result);
});


exports.login = catchAsync(async (req, res) => {
  const result = await loginUser(req.body);
  res.status(200).json(result);
});


exports.register_OFSC_SuperAdmin = catchAsync(async (req, res, next) => {
  const { dev_pass } = req.body;
  if (!dev_pass || dev_pass != process.env.DEV_PASS) {
    return next(new AppError('You are not authorized to use this endpoint ', 401));
  }
  const result = await register_ofsc_superadmin(req.body);
  res.status(201).json(result);
});

exports.register_OFSC_SubAdmin = catchAsync(async (req, res) => {
  const { dev_pass } = req.body;
  if (!dev_pass || dev_pass != process.env.DEV_PASS) {
    return next(new AppError('You are not authorized to use this endpoint ', 401));
  }
  const result = await register_ofsc_subadmin(req.body);
  res.status(201).json(result);
});


exports.logout = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader?.split(' ')[1];
  if (!token) return next(new AppError('Token required', 401));
  blacklistToken(token);
  res.json({ message: 'Logout successful' });
};

exports.forgotPassword = catchAsync(async (req, res) => {
  const baseUrl = `${req.protocol}://${req.get('host')}`;
  const result = await forgotPasswordService(req.body.email, baseUrl);
  res.status(200).json(result);
});

exports.resetPassword = catchAsync(async (req, res) => {
  const { token } = req.body;
  const { password } = req.body;
  const result = await resetPasswordService(token, password);
  res.status(200).json(result);
});


exports.protectedRoute = (req, res) => {
  res.status(200).json({ message: 'Access granted', user: req.user });
};
