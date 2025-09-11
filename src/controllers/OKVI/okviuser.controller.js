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
import ClaimApplication from '../../models/OKVI/claimApplication.js';
import Holiday from '../../models/OKVI/holidayFestival.js';
import mongoose from 'mongoose';
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
  const newUser = await OkviAuth.create({
    name,
    email,
    password,
    role: role || 3
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
    role: 3,
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
    html: `
      <div style="font-family: Arial, sans-serif; color: #333; padding: 20px; max-width: 600px; margin: auto; border: 1px solid #eee; border-radius: 8px;">
        <h2 style="text-align: center; color: #4CAF50;">OKVI Email Verification</h2>
        <p style="font-size: 16px;">Hello,</p>
        <p style="font-size: 16px;">Use the following One-Time Password (OTP) to verify your email address. This OTP is valid for <strong>10 minutes</strong>.</p>
        <div style="text-align: center; margin: 30px 0;">
          <span style="font-size: 32px; font-weight: bold; color: #ffffff; background: #4CAF50; padding: 10px 20px; border-radius: 6px; display: inline-block; letter-spacing: 3px;">
            ${otp}
          </span>
        </div>
        <p style="font-size: 14px; color: #666;">If you didn’t request this, you can safely ignore this email.</p>
        <p style="margin-top: 30px; font-size: 14px; color: #999;">Best regards,<br/>The OKVI Team</p>
      </div>
    `
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
  if (!email || !password) {
    return next(new AppError('Email and password are required', 400));
  }
  const authUser = await OkviAuth.findOne({ email }).select('+password +sessionVersion');
  if (!authUser || !(await compare(password, authUser.password))) {
    return next(new AppError('Invalid email or password', 401));
  }
  const updatedUser = await OkviAuth.findByIdAndUpdate(
    authUser._id,
    { $inc: { sessionVersion: 1 } },
    { new: true }
  ).lean();
  const token = jwt.sign(
    {
      id: updatedUser._id,
      user_role: updatedUser.role,
      sessionVersion: updatedUser.sessionVersion
    },
    process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRES_IN }
  );
  const { password: _, sessionVersion, __v, createdAt, updatedAt, ...safeUser } = updatedUser;
  res.status(200).json({
    status: 'success',
    token,
    user: safeUser
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


export const getUserDashboard = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const pendingCount = await ClaimApplication.countDocuments({
    userId,
    status: { $in: ['submitted', 'gmdic_review', 'di_review', 'addl_director_review'] }
  });
  const approvedCount = await ClaimApplication.countDocuments({
    userId,
    status: { $in: ['gmdic_approved', 'di_approved', 'addl_director_approved', 'sanctioned'] }
  });
  const rejectedCount = await ClaimApplication.countDocuments({
    userId,
    status: { $in: ['gmdic_rejected', 'di_rejected', 'addl_director_rejected'] }
  });
  const totalCount = await ClaimApplication.countDocuments({ userId });
  const recentClaims = await ClaimApplication.find({ userId })
    .populate('festivalId', 'name')
    .sort({ updatedAt: -1 })
    .limit(10)
    .select('status festivalId updatedAt finalSanctionAmount');
  const sanctionAgg = await ClaimApplication.aggregate([
    {
      $match: {
        userId: new mongoose.Types.ObjectId(userId),
        status: { $in: ['gmdic_approved', 'di_approved', 'addl_director_approved', 'sanctioned'] }
      }
    },
    {
      $group: {
        _id: null,
        totalSanctioned: { $sum: { $ifNull: ['$finalSanctionAmount', 0] } }
      }
    }
  ]);
  const sanctionAmount = (sanctionAgg[0] && sanctionAgg[0].totalSanctioned) || 0;
  const today = new Date();
  const currentFestival = await Holiday.findOne({
    startDate: { $lte: today },
    endDate: { $gte: today }
  }).select('-__v');
  const authUser = await OkviAuth.findById(userId).select('-password -__v').lean();
  const userDetails = await UserOKVI.findOne({ user: userId }).lean();
  const holidays = await Holiday.find().sort({ startDate: 1 }).lean();
  const holidaysWithStatus = holidays.map(holiday => {
    const start = new Date(holiday.startDate);
    const end = new Date(holiday.endDate);

    let status = 0; 
    if (today >= start && today <= end) status = 1;
    else if (today > end) status = 2;

    return { ...holiday, status };
  });

  res.status(200).json({
    status: 'success',
    data: {
      statistics: {
        pending: pendingCount,
        approved: approvedCount,
        rejected: rejectedCount,
        total: totalCount
      },
      recentClaims,
      userRole: ROLE_NAMES[req.user.user_role] || `role_${req.user.user_role}`,
      currentFestival: currentFestival || null,
      sanctionAmount,
      user: {
        auth: authUser,
        details: userDetails || null
      },
      holidays: holidaysWithStatus
    }
  });
});