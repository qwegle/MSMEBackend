import mongoose from 'mongoose';

const otpVerificationSchema = new mongoose.Schema({
  email: { type: String, required: true, lowercase: true },
  otp: { type: String, select: false },
  otpExpires: { type: Date },
  isVerified: { type: Boolean, default: false },
  purpose: { type: String, enum: ['registration', 'password_reset'], default: 'registration', required: true }
}, { timestamps: true });

otpVerificationSchema.index({ email: 1, purpose: 1 }, { unique: true });

export default mongoose.model('OkviOtpVerification', otpVerificationSchema);
