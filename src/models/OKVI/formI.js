import mongoose from 'mongoose';

const retailSaleDetailsSchema = new mongoose.Schema({
  headType:           { type: String, required: true },   
  subCenterName:      { type: String, required: true },
  subCenterAddress:   { type: String, required: true },
  frombillNo:         { type: String, required: true },
  tobillNo:            { type: String, required: true },
  billDate:           { type: Date,   required: true },
  retailSalesAmount:  { type: Number, required: true },
  rebatePaidAmount:   { type: Number, required: true },
  remarks:            { type: String },
}, { _id: false });

const form1Schema = new mongoose.Schema({
  openingStockId:   { type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  closingStockId:   { type: mongoose.Schema.Types.ObjectId, ref: 'ClosingStock', required: true },
  institutionName:  { type: String },
  institutionAddress:{ type: String },
  festival:         { type: String, required: true },
  month:            { type: String, required: true },
  fromDate:         { type: Date,   required: true },
  toDate:           { type: Date,   required: true },
  approval_status:  { type: Number, required: true, default: 0},
  approvedBy:       { type: mongoose.Schema.Types.ObjectId, ref: 'OkviAuth' },
  approvedAt:       { type: Date },
  rejectionReason:  { type: String },
  reviewedByRole:   { type: Number, enum: [0, 1, 2] },
  retailSales: {
    type: [retailSaleDetailsSchema],
    validate: v => Array.isArray(v) && v.length > 0,
  },
  totalSaleAmt:     { type: Number, required: true },
  totalRebateAmt:   { type: Number, required: true },
  createdAt:        { type: Date, default: Date.now },
});

const Form1 = mongoose.model('Form1', form1Schema);
export default Form1;
