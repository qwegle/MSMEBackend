import mongoose from 'mongoose';

const bankDepositProofSchema = new mongoose.Schema({
  openingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  closingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'ClosingStock', required: true },
  formIId: {type: mongoose.Schema.Types.ObjectId, ref: 'Form1', required: true },
  formVId: {type: mongoose.Schema.Types.ObjectId, ref: 'FormV', required: true },
  formVIId: {type: mongoose.Schema.Types.ObjectId, ref: 'FormVI', required: true },
  dcId: {type: mongoose.Schema.Types.ObjectId, ref: 'DeclarationCertificate', required: true},
  acId: {type: mongoose.Schema.Types.ObjectId, red: 'AuditCertificate', required: true}, 
  institutionName: { type: String, required: true },
  address: { type: String, required: true },
  festival: { type: String, required: true },
  month: { type: String, required: true },
  fromDate: { type: Date, required: true },
  toDate: { type: Date, required: true },
  depositProofFile: { type: String, required: true }, 
  createdAt: { type: Date, default: Date.now }
});
const BankDepositProof = mongoose.model('BankDepositProof', bankDepositProofSchema);
export default BankDepositProof;
