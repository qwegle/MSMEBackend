import { Schema, model } from 'mongoose';
import bcrypt from 'bcrypt';
const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{12,}$/;
const userSchema = new Schema({
  username: { type: String, required: true },
  password: { 
    type: String, 
    required: true,
    validate: {
      validator: value => passwordRegex.test(value),
      message: () => 
        `Password must be at least 12 characters long, contain uppercase, lowercase, number, and special character.`
    },
    select: false // don't return password by default
  },
  email: { type: String, required: true, unique: true },
  phone: { type: String },
  aadharNumber: { type: String },
  user_type: { type: Number, required: true, default: 0 },
  user_role: { type: Number, required: true, default: 2 },
  branch: { type: String },
  resetPasswordToken: { type: String },
  resetPasswordExpires: { type: Date },
  resetPasswordLastSentAt: { type: Date },
  sessionVersion: { type: Number, default: 0 },
  passwordChangedAt: { type: Date }
}, { timestamps: true });

userSchema.pre('save', async function(next) {
  if (!this.isModified('password')) return next();
  this.password = await bcrypt.hash(this.password, 12);
  this.passwordChangedAt = new Date();
  next();
});

const User = model('User', userSchema);
export default User;
