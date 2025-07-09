const mongoose = require('mongoose');

const openingStockSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'OkviAuth',
    required: true
  },
  festivalName: {
    type: String,
    required: true,
    trim: true
  },
  head: {
    type: String,
    required: true,
    trim: true
  },
  subHeadDetails: [
    {
      subHeadName: {
        type: String,
        required: true,
        trim: true
      },
      unitType: {
        type: String,
        required: true
      },
      unitPrice: {
        type: Number,
        required: true,
        min: 0
      },
      quantity: {
        type: Number,
        required: true,
        min: 0
      },
      totalPrice: {
        type: Number,
        required: true,
        min: 0
      }
    }
  ],
  createdAt: {
    type: Date,
    default: Date.now
  }
});

module.exports = mongoose.model('OpeningStock', openingStockSchema);
