import { Schema, model } from 'mongoose';

// Strong password regex: 
// - At least 12 characters
// - At least 1 lowercase
// - At least 1 uppercase
// - At least 1 number
// - At least 1 special character
const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{12,}$/;

const userSchema = new Schema({
  username: { type: String, required: true },

  password: { 
    type: String, 
    required: true,
    validate: {
      validator: function(value) {
        return passwordRegex.test(value);
      },
      message: props => 
        `Password must be at least 12 characters long, contain uppercase, lowercase, number, and special character.`
    }
  },

  email: { type: String, required: true, unique: true },
  phone: { type: String },
  aadharNumber: { type: String },
  user_type: { type: Number, required: true, default: 0 },
  user_role: { type: Number, required: true, default: 2 },
  branch: { type: String },
  resetPasswordToken: { type: String },
  resetPasswordExpires: { type: Date },
  resetPasswordLastSentAt: { type: Date }
}, { timestamps: true });

const User = model('User', userSchema);

export default User;
