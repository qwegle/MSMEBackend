import { Schema, model } from 'mongoose';

const holidaySchema = new Schema({
  name: {
    type: String,
    required: true,
    trim: true
  },
  startDate: {
    type: Date,
    required: true
  },
  endDate: {
    type: Date,
    required: true,
    validate: {
      validator: function (value) {
        return value >= this.startDate;
      },
      message: 'End date must be greater than or equal to start date'
    }
  },
  type: {
    type: String,
    enum: ['Holiday', 'Festival'],
    default: 'Holiday'
  },
  createdBy: {
    type: Schema.Types.ObjectId,
    ref: 'User'
  }
}, { timestamps: true });

export default model('Holiday', holidaySchema);
