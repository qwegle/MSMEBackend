const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  username: { type: String, required: true },
  password: { type: String, required: true, unique: true },
  email: { type: String, required: true },
  user_type: { type: Number, required: true, default: 0 }, // 0 - citizen, 1 - ofsc, 2 - okvi, 3 - osic
  user_role: { type: Number, required: true, default: 2 }, // 0 - admin, 1 - sub admin/ district admin, 2 - user
  branch: { type: String },
  aadharNumber: { type: String },

  // 🔐 For password reset
  resetPasswordToken: { type: String },
  resetPasswordExpires: { type: Date },

}, { timestamps: true });

const User = mongoose.model('User', userSchema);

module.exports = User;
