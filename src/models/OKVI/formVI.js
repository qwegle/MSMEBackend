import mongoose from 'mongoose';

const centerWiseSaleSchema = new mongoose.Schema({
  subCenter: { type: String, required: true },
  totalSaleAmt: { type: Number, required: true },
  totalRebateAmt: { type: Number, required: true }
}, { _id: false });

const formVISchema = new mongoose.Schema({
  openingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  closingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'ClosingStock', required: true },
  formIId: {type: mongoose.Schema.Types.ObjectId, ref: 'Form1', required: true },
  FormVId: {type: mongoose.Schema.Types.ObjectId, ref: 'FormV', required: true },
  institutionName: { type: String, required: true },
  address: { type: String, required: true },
  month: { type: String, required: true },
  centerWiseSales: {
    type: [centerWiseSaleSchema],
    required: true
  },

  totalSaleAmt: { type: Number, required: true },
  totalRebateAmt: { type: Number, required: true },

  createdAt: { type: Date, default: Date.now }
});

const FormVI = mongoose.model('FormVI', formVISchema);

export default FormVI;
