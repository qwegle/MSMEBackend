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

const User = model('User', userSchema);
export default User;
