// models/FloatTenderModel.js
import mongoose from 'mongoose';

const floatTenderSchema = new mongoose.Schema({
  tender_number: {
    type: String,
    required: true,
    unique: true,
    trim: true,
  },
  project_title: {
    type: String,
    required: true,
    trim: true,
  },
  tender_date: {
    type: Date,
    required: true,
  },
  prebid_date: {
    type: Date,
    required: true,
  },
  last_tender_submission_date: {
    type: Date,
    required: true,
  },
  bid_opening_date: {
    type: Date,
    required: true,
  },
}, {
  timestamps: true,
});

const FloatTender = mongoose.model('FloatTender', floatTenderSchema);

export default FloatTender;
