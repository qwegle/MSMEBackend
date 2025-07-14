import { Schema, model } from 'mongoose';

const openingStockSchema = new Schema({
  user: {
    type: Schema.Types.ObjectId,
    ref: 'OkviAuth',
    required: true
  },
  festivalId: {
    type: Schema.Types.ObjectId,
    ref: 'Holiday',
    required: true,
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

export default model('OpeningStock', openingStockSchema);
