import { Schema, model } from 'mongoose';

const districts = [
  "Angul", "Balangir", "Balasore", "Bargarh", "Bhadrak", "Boudh", "Cuttack", "Deogarh",
  "Dhenkanal", "Gajapati", "Ganjam", "Jagatsinghpur", "Jajpur", "Jharsuguda", "Kalahandi",
  "Kandhamal", "Kendrapara", "Kendujhar", "Khordha", "Koraput", "Malkangiri", "Mayurbhanj",
  "Nabarangpur", "Nayagarh", "Nuapada", "Puri", "Rayagada", "Sambalpur", "Subarnapur", "Sundargarh"
];

const mobileRegex = /^[6-9]\d{9}$/;
const nameRegex = /^[a-zA-Z\s]{3,50}$/;
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

const committeeMemberSchema = new Schema({
  name: { type: String, required: true, match: nameRegex },
  mobile: { type: String, required: true, match: mobileRegex },
  address: { type: String, required: true }
}, { _id: false });

const userOkviSchema = new Schema({
  user: { type: Schema.Types.ObjectId, ref: 'OkviAuth', required: true },

  institutionInfo: {
    name: { type: String, required: true, match: nameRegex },
    email: { type: String, required: true, match: emailRegex }, // Removed `unique: true`
    district: { type: String, enum: districts, required: true },
    gmdicType: { type: String, enum: ["GMDIC", "RIC"], required: true },
    address: { type: String }
  },

  registrationInfo: {
    regdWithADM: { type: String, required: true },
    admRegdNo: { type: String, required: true },
    regdWithOKVIB: { type: String, required: true },
    hasOkvibRegdNo: { type: String, enum: ["yes", "no"], required: true },
    okvibRegdNo: { type: String },
    regdWithKVIC: { type: String },
    kvicRegdNo: { type: String },
    validityTill: { type: Date }
  },

  bankDetails: {
    accountNo: { type: String, required: true },
    accountHolderName: { type: String, required: true },
    ifscCode: { type: String },
    bankBranch: { type: String }
  },

  secretaryInfo: {
    name: { type: String, required: true, match: nameRegex },
    mobile: { type: String, required: true, match: mobileRegex },
    address: { type: String, required: true }
  },

  presidentInfo: {
    name: { type: String, required: true, match: nameRegex },
    mobile: { type: String, required: true, match: mobileRegex },
    address: { type: String, required: true }
  },

  committeeMembers: [committeeMemberSchema],

  isEmailVerified: {
    type: Boolean,
    default: false
  },

  emailOTP: {
  type: String,
  select: false
  },
  
  emailOTPExpires: {
    type: Date
  }


}, { timestamps: true });

export default model('UserOKVI', userOkviSchema);
