import { Schema } from 'mongoose';
const okviAuthSchema = new Schema({
  name: { type: String, required: true, trim: true },
  email: { type: String, required: true, unique: true, lowercase: true, trim: true },
  password: { type: String, required: true, minlength: 8, select: false },
  role: { type: Number, enum: [0, 1, 2], default: 2 },
  resetPasswordToken: String,
  resetPasswordExpires: Date,
  isEmailVerified: { type: Boolean, default: false, required: true },
  otp: { type: String, select: false },
  otpExpires: { type: Date, select: false }
}, {
  timestamps: true
});

module.exports = mongoose.model('OkviAuth', okviAuthSchema);