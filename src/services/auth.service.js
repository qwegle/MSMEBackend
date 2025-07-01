const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/user');
const AppError = require('../utils/AppError');
const { generateResetToken } = require('../utils/generateResetToken');
const sendEmail = require('../utils/sendEmail');

const JWT_SECRET = process.env.JWT_SECRET;
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || '1h';

// Register Normal User
exports.registerUser = async ({ username, email, password }) => {
  const existingUser = await User.findOne({ email });
  if (existingUser) throw new AppError('Email already in use', 400);

  const hashedPassword = await bcrypt.hash(password, 10);
  const newUser = new User({
    username,
    email,
    password: hashedPassword,
    user_type: 0,
    user_role: 2
  });
  await newUser.save();

  return { message: 'User registered successfully' };
};

// Register OFSC Super Admin
exports.register_ofsc_superadmin = async ({ username, email, password, dev_pass }) => {
  const existingUser = await User.findOne({ email });
  if (existingUser) throw new AppError('Email already in use', 400);

  const hashedPassword = await bcrypt.hash(password, 10);
  const newUser = new User({
    username,
    email,
    password: hashedPassword,
    user_type: 1,
    user_role: 0
  });
  await newUser.save();

  return { message: 'Super admin registered successfully' };
};

// Register OFSC Sub Admin
exports.register_ofsc_subadmin = async ({ username, email, password }) => {
  const existingUser = await User.findOne({ email });
  if (existingUser) throw new AppError('Email already in use', 400);

  const hashedPassword = await bcrypt.hash(password, 10);
  const newUser = new User({
    username,
    email,
    password: hashedPassword,
    user_type: 1,
    user_role: 1
  });
  await newUser.save();

  return { message: 'Sub admin registered successfully' };
};

// Login
exports.loginUser = async ({ email, password }) => {
  if (!email || !password) throw new AppError('Email and password are required', 400);

  const user = await User.findOne({ email });
  if (!user) throw new AppError('Invalid credentials', 401);

  const isPasswordCorrect = await bcrypt.compare(password, user.password);
  if (!isPasswordCorrect) throw new AppError('Invalid credentials', 401);

    const token = jwt.sign(
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
      createdAt: user.createdAt,
      updatedAt: user.updatedAt
    }
  };
};

// Forgot Password
exports.forgotPasswordService = async (email, baseUrl) => {
  const user = await User.findOne({ email });
  if (!user) throw new AppError('No user found with this email', 404);

  const { resetToken, hashedToken } = generateResetToken();
  user.resetPasswordToken = hashedToken;
  user.resetPasswordExpires = Date.now() + 10 * 60 * 1000; // 10 minutes
  await user.save({ validateBeforeSave: false });

  const resetURL = `${baseUrl}/api/auth/reset-password/${resetToken}`;
  const html= `
  <div style="max-width: 600px; margin: auto; padding: 30px; font-family: Arial, sans-serif; background-color: #f9f9f9; border: 1px solid #e0e0e0; border-radius: 10px;">
    <h2 style="color: #2c3e50; text-align: center;">Password Reset Request</h2>
    <p style="font-size: 16px; color: #555;">Hi <strong>${user.username}</strong>,</p>
    <p style="font-size: 16px; color: #555;">
      We received a request to reset your password. Click the button below to set a new password:
    </p>
    <div style="text-align: center; margin: 30px 0;">
      <a href="${resetURL}" style="background-color: #007bff; color: #fff; padding: 12px 24px; border-radius: 5px; text-decoration: none; font-size: 16px;">
        Reset Password
      </a>
    </div>
    <p style="font-size: 14px; color: #777;">
      This link will expire in <strong>10 minutes</strong>. If you didn’t request a password reset, you can safely ignore this email.
    </p>
    <hr style="border: none; border-top: 1px solid #eee; margin: 20px 0;">
    <p style="font-size: 13px; color: #aaa; text-align: center;">
      &copy; ${new Date().getFullYear()} MSME. All rights reserved.
    </p>
  </div>
`;

  await sendEmail({
    to: user.email,
    subject: 'Reset Password Link',
    html
  });

  return { message: 'Reset link sent to email.' };
};

// Reset Password
exports.resetPasswordService = async (token, newPassword) => {
  const hashedToken = crypto.createHash('sha256').update(token).digest('hex');

  const user = await User.findOne({
    resetPasswordToken: hashedToken,
    resetPasswordExpires: { $gt: Date.now() }
  });

  if (!user) throw new AppError('Token is invalid or has expired', 400);

  user.password = await bcrypt.hash(newPassword, 10);
  user.resetPasswordToken = undefined;
  user.resetPasswordExpires = undefined;
  await user.save();

  return { message: 'Password has been reset successfully.' };
};

