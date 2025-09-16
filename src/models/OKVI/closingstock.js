import mongoose from 'mongoose';

const subHeadSchema = new mongoose.Schema({
  subHeadName: { type: String, required: true },
  unitType: { type: String, required: true },
  unitPrice: { type: Number, required: true },
  quantity: { type: Number, required: true },
  totalPrice: { type: Number, required: true }
});

const closingStockSchema = new mongoose.Schema({
  festivalId: {type: mongoose.Schema.Types.ObjectId, ref: 'Holiday', required: true },
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'OkviAuth', required: true },
  openingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  head: { type: String, required: true },
  subHeads: [subHeadSchema]
}, {
  timestamps: true 
});

export default mongoose.model('ClosingStock', closingStockSchema);
