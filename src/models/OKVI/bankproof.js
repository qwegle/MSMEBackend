import mongoose from 'mongoose';

const bankDepositProofSchema = new mongoose.Schema({
  institutionName: { type: String, required: true },
  address: { type: String, required: true },
  festival: { type: String, required: true },
  month: { type: String, required: true },
  fromDate: { type: Date, required: true },
  toDate: { type: Date, required: true },

  depositProofFile: { type: String, required: true }, // File path

  createdAt: { type: Date, default: Date.now }
});

const BankDepositProof = mongoose.model('BankDepositProof', bankDepositProofSchema);

export default BankDepositProof;
