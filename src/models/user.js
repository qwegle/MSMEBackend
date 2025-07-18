const userSchema = new Schema({
  username: { type: String, required: true },
  password: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  phone: { type: String }, // <- Add this
  aadharNumber: { type: String },
  user_type: { type: Number, required: true, default: 0 },
  user_role: { type: Number, required: true, default: 2 },
  branch: { type: String },
  resetPasswordToken: { type: String },
  resetPasswordExpires: { type: Date },
}, { timestamps: true });
