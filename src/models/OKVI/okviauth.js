import mongoose from 'mongoose';
import bcrypt from 'bcrypt';

const okviAuthSchema = new mongoose.Schema({
  name: { type: String, required: true, trim: true },
  email: { type: String, required: true, unique: true, lowercase: true, trim: true },
  password: { type: String, required: true, minlength: 8, select: false },
  role: { type: Number, enum: [0, 1, 2, 3], default: 3 }, // 0: GMDIC, 1: DI, 2: Addl. Director, 3: User
  resetPasswordToken: String,
  resetPasswordExpires: Date,
  isEmailVerified: { type: Boolean, default: false, required: true },
  otp: { type: String, select: false },
  otpExpires: { type: Date, select: false },
  sessionVersion: { type: Number, default: 0, select: false },
  passwordChangedAt: { type: Date, select: false }
}, {
  timestamps: true
});

// Hash password before saving
// okviAuthSchema.pre('save', async function(next) {
//   if (!this.isModified('password')) return next();
  
//   this.password = await bcrypt.hash(this.password, 12);
//   next();
// });

// Update passwordChangedAt when password is modified
okviAuthSchema.pre('save', function(next) {
  if (!this.isModified('password') || this.isNew) return next();
  
  this.passwordChangedAt = Date.now() - 1000;
  next();
});

const OkviAuth = mongoose.model('OkviAuth', okviAuthSchema);
export default OkviAuth;