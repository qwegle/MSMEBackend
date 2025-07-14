import mongoose from 'mongoose';

const retailSaleDetailsSchema = new mongoose.Schema({
  date: { type: Date, required: true },
  fromBillNo: { type: String, required: true },
  toBillNo: { type: String, required: true },
  retailSaleAmt: { type: Number, required: true },
  rebatePaidAmt: { type: Number, required: true },
  remarks: { type: String }
}, { _id: false });

const form1Schema = new mongoose.Schema({
  openingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  closingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'ClosingStock', required: true },
  institutionName: { type: String, required: true },
  address: { type: String, required: true },
  festival: { type: String, required: true },
  month: { type: String, required: true },
  fromDate: { type: Date, required: true },
  toDate: { type: Date, required: true },
  subCenterName: { type: String, required: true },
  subCenterAddress: { type: String, required: true },
  head: { type: String, required: true },

  retailSales: {
    type: [retailSaleDetailsSchema],
    default: []
  },

  createdAt: { type: Date, default: Date.now }
});

const Form1 = mongoose.model('Form1', form1Schema);

export default Form1;
