import mongoose from 'mongoose';

const tenderResultSchema = new mongoose.Schema({
  tender_number: {
    type: String,
    required: true,
    trim: true,
  },
  bidder_details: [
    {
      name: {
        type: String,
        required: true,
        trim: true,
      },
      bid_value: {
        type: Number,
        required: true,
        min: 0,
      },
      bidder_score: {
        type: Number,
        required: true,
        min: 0,
        max: 100,
      },
    }
  ],
}, {
  timestamps: true,
});

const TenderResult = mongoose.model('TenderResult', tenderResultSchema);

export default TenderResult;
