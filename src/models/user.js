import { Schema, model } from 'mongoose';
const userSchema = new Schema({
  username: { type: String, required: true },
  password: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  phone: { type: String },
  aadharNumber: { type: String },
  user_type: { type: Number, required: true, default: 0 },
  user_role: { type: Number, required: true, default: 2 },
  branch: { type: String },
  resetPasswordToken: { type: String },
  resetPasswordExpires: { type: Date },
}, { timestamps: true });

const User = model('User', userSchema);

export default User;