import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { createHash } from 'crypto';
import OkviAuth from '../../models/OKVI/okviauth.js';
import UserOKVI from '../../models/OKVI/okviuserdetails.js';
import OkviOtpVerification from '../../models/OKVI/otpverificationschema.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import sendEmail from '../../utils/sendEmail.js';
import { blacklistToken } from '../../utils/tokenBlacklist.js';

const { hash, compare } = bcrypt;

export const registerOkviUser = catchAsync(async (req, res, next) => {
  const { name, email, password, role, dev_pass } = req.body;
  if (!name || !email || !password) {
    return next(new AppError('Name, email, and password are required', 400));
  }
  if (role === 0 || role === 1) {
    if (!dev_pass || dev_pass !== process.env.DEV_PASS) {
      return next(new AppError('Unauthorized to register as admin', 403));
    }
  }
  const hashedPassword = await hash(password, 12);
  const newUser = await OkviAuth.create({
    name,
    email,
    password: hashedPassword,
    role: role || 2 
  });
  res.status(201).json({
    status: 'success',
    data: {
      id: newUser._id,
      name: newUser.name,
      email: newUser.email,
      role: newUser.role
    }
  });
});

export const registerOkviUserdetails = catchAsync(async (req, res, next) => {
  const {
    password,
    institutionInfo,
    registrationInfo,
    bankDetails,
    secretaryInfo,
    presidentInfo,
    committeeMembers
  } = req.body;

  const { email, name } = institutionInfo || {};
  if (!email || !name || !password) {
    return next(new AppError('Institution email, name, and password are required', 400));
  }

  const otpStatus = await OkviOtpVerification.findOne({ email });
  if (!otpStatus || !otpStatus.isVerified) {
    return next(new AppError('Email not verified via OTP', 401));
  }

  const existing = await OkviAuth.findOne({ email });
  if (existing) {
    return next(new AppError('Email already registered', 400));
  }

  const hashedPassword = await hash(password, 12);

  const newUser = await OkviAuth.create({
    name,
    email,
    password: hashedPassword,
    role: 2,
    isEmailVerified: true
  });

  const userDetails = await UserOKVI.create({
    user: newUser._id,
    institutionInfo,
    registrationInfo,
    bankDetails,
    secretaryInfo,
    presidentInfo,
    committeeMembers,
    isEmailVerified: true
  });

  await OkviOtpVerification.deleteOne({ email });

  res.status(201).json({
    status: 'success',
    message: 'User registered successfully',
    data: {
      auth: {
        id: newUser._id,
        name: newUser.name,
        email: newUser.email
      },
      details: userDetails
    }
  });
});

export const sendOtp = catchAsync(async (req, res, next) => {
  const { email } = req.body;
  if (!email) return next(new AppError('Email is required', 400));

  const otp = Math.floor(100000 + Math.random() * 900000).toString();
  const otpExpires = Date.now() + 10 * 60 * 1000;
  const hashedOtp = createHash('sha256').update(otp).digest('hex');

  const existing = await OkviOtpVerification.findOne({ email });
  if (existing) {
    existing.otp = hashedOtp;
    existing.otpExpires = otpExpires;
    existing.isVerified = false;
    await existing.save();
  } else {
    await OkviOtpVerification.create({
      email,
      otp: hashedOtp,
      otpExpires
    });
  }

  await sendEmail({
    to: email,
    subject: 'Your OTP for OKVI Email Verification',
    text: `Your OTP is ${otp}. It is valid for 10 minutes.`
  });

  res.status(200).json({
    status: 'success',
    message: 'OTP sent to email'
  });
});

export const verifyOtp = catchAsync(async (req, res, next) => {
  const { email, otp } = req.body;
  if (!email || !otp) return next(new AppError('Email and OTP are required', 400));

  const hashedOtp = createHash('sha256').update(otp).digest('hex');

  const entry = await OkviOtpVerification.findOne({
    email,
    otp: hashedOtp,
    otpExpires: { $gt: Date.now() }
  });

  if (!entry) return next(new AppError('Invalid or expired OTP', 400));

  entry.isVerified = true;
  entry.otp = undefined;
  entry.otpExpires = undefined;
  await entry.save();

  res.status(200).json({
    status: 'success',
    message: 'Email verified successfully'
  });
});

export const loginOkviUser = catchAsync(async (req, res, next) => {
  const { email, password } = req.body;
  if (!email || !password)
    return next(new AppError('Email and password are required', 400));

  const authUser = await OkviAuth.findOne({ email }).select('+password');
  if (!authUser || !(await compare(password, authUser.password)))
    return next(new AppError('Invalid email or password', 401));

  const token = jwt.sign(
    { id: authUser._id, user_role: authUser.role },
    process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRES_IN }
  );

  res.status(200).json({
    status: 'success',
    token
  });
});

export const logoutOkvi = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return next(new AppError('Authorization token is required', 401));
  }

  const token = authHeader.split(' ')[1];
  if (!token) {
    return next(new AppError('Invalid token format', 400));
  }

  blacklistToken(token);

  res.status(200).json({
    status: 'success',
    message: 'Logout successful'
  });
};
