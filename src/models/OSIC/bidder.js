
import mongoose from 'mongoose';
const bidder = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  bid_value: {
    type: String,
    required: true,
    trim: true,
  },
  bid_score: {
    type: Date,
    required: true,
  },
}, {
  timestamps: true,
});
const Bidder = mongoose.model('Bidder', bidder);
export default Bidder;
