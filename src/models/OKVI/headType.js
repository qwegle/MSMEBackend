import { Schema, model } from 'mongoose';

const headTypeSchema = new Schema({
  name: {
    type: String,
    required: true,
    trim: true,
    unique: true
  },
  description: {
    type: String,
    trim: true
  },
  isActive: {
    type: Boolean,
    default: true
  },
  createdBy: {
    type: Schema.Types.ObjectId,
    ref: 'OkviAuth',
    required: true
  }
}, { timestamps: true });

// Note: name field already has unique: true, so no need for separate index
headTypeSchema.index({ isActive: 1 });

export default model('HeadType', headTypeSchema);
