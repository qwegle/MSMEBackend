import mongoose from 'mongoose';

const auditCertificateSchema = new mongoose.Schema({
  institutionName: { type: String, required: true },
  address: { type: String, required: true },
  festival: { type: String, required: true },
  month: { type: String, required: true },
  fromDate: { type: Date, required: true },
  toDate: { type: Date, required: true },

  auditCertificateFile: { type: String, required: true }, // Path to uploaded file

  createdAt: { type: Date, default: Date.now }
});

const AuditCertificate = mongoose.model('AuditCertificate', auditCertificateSchema);

export default AuditCertificate;
