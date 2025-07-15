import mongoose from 'mongoose';

const salesRebateSchema = new mongoose.Schema({
  head: { type: String, required: true },
  totalSaleAmt: { type: Number, required: true },
  totalRebateAmt: { type: Number, required: true }
}, { _id: false });

const formVSchema = new mongoose.Schema({
  openingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  closingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'ClosingStock', required: true },
  FormIId: {type: mongoose.Schema.Types.ObjectId, ref: 'Form1', required: true },
  institutionName: { type: String, required: true },
  address: { type: String, required: true },
  festival: { type: String, required: true },
  month: { type: String, required: true },
  fromDate: { type: Date, required: true },
  toDate: { type: Date, required: true },

  salesRebateDetails: {
    type: [salesRebateSchema],
    required: true
  },

  totalSaleAmt: { type: Number, required: true },
  totalRebateAmt: { type: Number, required: true },

  createdAt: { type: Date, default: Date.now }
});

const FormV = mongoose.model('FormV', formVSchema);

export default FormV;
