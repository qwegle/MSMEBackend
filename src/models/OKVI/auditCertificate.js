import mongoose from 'mongoose';

const auditCertificateSchema = new mongoose.Schema({
  openingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  closingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'ClosingStock', required: true },
  formIId: {type: mongoose.Schema.Types.ObjectId, ref: 'Form1', required: true },
  formVId: {type: mongoose.Schema.Types.ObjectId, ref: 'FormV', required: true },
  formVIId: {type: mongoose.Schema.Types.ObjectId, ref: 'FormVI', required: true },
  dcId: {type: mongoose.Schema.Types.ObjectId, ref: 'DeclarationCertificate', required: true},
  institutionName: { type: String, required: true },
  address: { type: String, required: true },
  festival: { type: String, required: true },
  month: { type: String, required: true },
  fromDate: { type: Date, required: true },
  toDate: { type: Date, required: true },
  status: {type: Number, required: true,default: 0,enum: [0, 1, 2]}, // 0 - Pending, 1 - Approved, 2 - Rejected
  auditCertificateFile: { type: String, required: true },
  createdAt: { type: Date, default: Date.now }
});

const AuditCertificate = mongoose.model('AuditCertificate', auditCertificateSchema);

export default AuditCertificate;
