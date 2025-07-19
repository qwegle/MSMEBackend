import mongoose from 'mongoose';

const clauseSchema = new mongoose.Schema({
  text: { type: String, required: true },
  agreed: { type: Boolean, default: true } // Automatically true if user submits
}, { _id: false });

const declarationCertificateSchema = new mongoose.Schema({
  openingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'OpeningStock', required: true },
  closingStockId: {type: mongoose.Schema.Types.ObjectId, ref: 'ClosingStock', required: true },
  formIId: {type: mongoose.Schema.Types.ObjectId, ref: 'Form1', required: true },
  formVId: {type: mongoose.Schema.Types.ObjectId, ref: 'FormV', required: true },
  formVIId: {type: mongoose.Schema.Types.ObjectId, ref: 'FormVI', required: true },
  khadiInstitutionName: { type: String, required: true },
  address: { type: String, required: true },
  month: { type: String, required: true },
  spellStartDate: { type: Date, required: true },
  spellEndDate: { type: Date, required: true },
  status: {type: Number, required: true,default: 0,enum: [0, 1, 2]}, // 0 - Pending, 1 - Approved, 2 - Rejected
  declarations: {
    type: [clauseSchema],
    required: true,
    default: () => [
      {
        text: 'That the benefit of the subsidy on weaving wages and processing cost received from the Director of Industries, Odisha will be passed on to the customers.',
        agreed: true
      },
      {
        text: 'That no incentive wages has been taken into account in claiming the subsidy.',
        agreed: true
      },
      {
        text: 'That the claim is correct and made according to rules and conditions prescribed by the MSME dept. Govt. of Odisha.',
        agreed: true
      },
      {
        text: 'That the claims are strictly according to the books of the account of the institution and that the amount of the claims has not been claimed and received previously and in the event of any amount is to have been over paid as a result of security of initial accounts event the auditors of the Directorate of Industries or by the statutory audit, the institution promptly repay such amounts to the Directorate of Industries.',
        agreed: true
      },
      {
        text: 'That we shall produce all the books of accounts, cash memo, vouchers and necessary records for inspection to the auditor’s or other representative of the commission and/or the audit department of the Govt. of India / Govt. of Odisha when demanded.',
        agreed: true
      }
    ]
  },

  createdAt: { type: Date, default: Date.now }
});

const DeclarationCertificate = mongoose.model('DeclarationCertificate', declarationCertificateSchema);

export default DeclarationCertificate;
