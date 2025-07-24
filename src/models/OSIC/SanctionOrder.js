import mongoose from 'mongoose';

const billSchema = new mongoose.Schema({
  nameOfPayee: { type: String, required: true },
  voucherOrBillNoDate: { type: String, required: true },
  amount: { type: Number, required: true }
});

const sanctionOrderSchema = new mongoose.Schema({
  headOfAccount: { type: String, required: true },
  payeeName: { type: String, required: true },
  address: {type: String, required: true},
  purpose: { type: String, required: true },
  paymentProposedBy: { type: String },
  fileReference: { type: String },
  expenditureAuthOrder: { type: String },
  expenditureAuthDate:{ type: String },
  billReceiptDate: { type: Date },
  natureOfPayment: { type: String },
  paymentType: { 
    type: String, 
    enum: ['Advance', 'Running Bill', 'Final Payment'] 
  },
  mmrOrStockEntryNo: { type: String },
  supplierAdvanceLFR: { type: String },
  amountOfAdvance: { type: Number },
  advanceDate: { type: Date },
  modeOfPayment: { 
    type: String, 
    enum: ['Cash', 'Cheque', 'Draft', 'NEFT', 'RTGS'] 
  },
  modeOfRemittance: { type: String },
  totalAmount: { type: Number },
  totalAmountInWords: { type: String },
  billDetails: [billSchema],
  paymentRecommended: { type: Boolean, default: false },
  paymentAuthorised: { type: Boolean, default: false },
  proposingOfficer: {
    name: { type: String },
    designation: { type: String }
  },
  recommendingOfficer: {
    name: { type: String },
    designation: { type: String }
  },
  sanctioningAuthority: {
    name: { type: String },
    designation: { type: String }
  },
  paidPartyDate: { type: Date },
  paymentModeUsed: { type: String, enum: ['Cash', 'Cheque', 'Draft', 'NEFT', 'RTGS'] },
  transactionRefNo: { type: String }
}, {
  timestamps: true
});

export default mongoose.model('SanctionOrder', sanctionOrderSchema);