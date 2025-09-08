import { Schema, model } from 'mongoose';
import slugify from 'slugify';
const HOLIDAY_TYPES = ['Holiday','Festival'];
const holidaySchema = new Schema({
  name: {
    type: String,
    required: true,
    trim: true
  },
  year: {
    type: Number,
    required: true,
    min: 2000,
    max: 2100
  },
  slug: {
    type: String,
    required: true,
    unique: true
  },
  startDate: {
    type: Date,
    required: true
  },
  endDate: {
    type: Date,
    required: true,
    validate: {
      validator: function (v) { return v >= this.startDate; },
      message: 'End date must be on or after start date'
    }
  },
  type: {
    type: String,
    enum: HOLIDAY_TYPES,
    default: 'Holiday'
  },
  createdBy: {
    type: Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, { timestamps: true });
holidaySchema.index({ name: 1, year: 1 }, { unique: true });
holidaySchema.pre('validate', function(next) {
  if (this.isModified('name') || this.isModified('year')) {
    this.slug = slugify(`${this.name}-${this.year}`, { lower: true, strict: true });
  }
  next();
});
holidaySchema.index({ startDate: 1 });
holidaySchema.index({ endDate: 1 });
export default model('Holiday', holidaySchema);
