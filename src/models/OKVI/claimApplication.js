import { Schema, model } from 'mongoose';

const CLAIM_STATUS = {
  DRAFT: 'draft',
  SUBMITTED: 'submitted',
  GMDIC_REVIEW: 'gmdic_review',
  GMDIC_APPROVED: 'gmdic_approved',
  GMDIC_REJECTED: 'gmdic_rejected',
  DI_REVIEW: 'di_review',
  DI_APPROVED: 'di_approved',
  DI_REJECTED: 'di_rejected',
  ADDL_DIRECTOR_REVIEW: 'addl_director_review',
  ADDL_DIRECTOR_APPROVED: 'addl_director_approved',
  ADDL_DIRECTOR_REJECTED: 'addl_director_rejected',
  SANCTIONED: 'sanctioned',
  SANCTION_ORDER_UPLOADED: 'sanction_order_uploaded',
  DISBURSED: 'disbursed'
};

const approvalHistorySchema = new Schema({
  approver: {
    type: Schema.Types.ObjectId,
    ref: 'OkviAuth',
    required: true
  },
  approverRole: {
    type: Number,
    required: true,
    enum: [0, 1, 2] 
  },
  action: {
    type: String,
    required: true,
    enum: ['approved', 'rejected']
  },
  comments: {
    type: String,
    trim: true
  },
  sanctionAmount: {
    type: Number,
    min: 0
  },
  actionDate: {
    type: Date,
    default: Date.now
  }
}, { _id: true });

const claimApplicationSchema = new Schema({
  userId: {
    type: Schema.Types.ObjectId,
    ref: 'OkviAuth',
    required: true
  },
  festivalId: {
    type: Schema.Types.ObjectId,
    ref: 'Holiday',
    required: true
  },
  openingStockId: {
    type: Schema.Types.ObjectId,
    ref: 'OpeningStock',
    required: true
  },
  closingStockId: {
    type: Schema.Types.ObjectId,
    ref: 'ClosingStock'
  },
  formIId: {
    type: Schema.Types.ObjectId,
    ref: 'FormI'
  },
  formVId: {
    type: Schema.Types.ObjectId,
    ref: 'FormV'
  },
  formVIId: {
    type: Schema.Types.ObjectId,
    ref: 'FormVI'
  },
  declarationCertificateId: {
    type: Schema.Types.ObjectId,
    ref: 'DeclarationCertificate'
  },
  auditCertificateId: {
    type: Schema.Types.ObjectId,
    ref: 'AuditCertificate'
  },
  bankDepositProofId: {
    type: Schema.Types.ObjectId,
    ref: 'BankDepositProof'
  },
  status: {
    type: String,
    enum: Object.values(CLAIM_STATUS),
    default: CLAIM_STATUS.DRAFT
  },
  submittedAt: {
    type: Date
  },
  finalSanctionAmount: {
    type: Number,
    min: 0
  },
  sanctionOrderFile: {
    type: String
  },
  sanctionOrderUploadedAt: {
    type: Date
  },
  approvalHistory: [approvalHistorySchema],
  currentApprover: {
    type: Schema.Types.ObjectId,
    ref: 'OkviAuth'
  },
  rejectionReason: {
    type: String,
    trim: true
  },
  disbursementDate: {
    type: Date
  },
  disbursementReference: {
    type: String,
    trim: true
  },
 approval_status: {
    type: Number,
    default: 0,
    required: true
 },
 approval_level: {
  type: Number,
  default: 0,
  required: true
 }
}, { timestamps: true });
claimApplicationSchema.index({ userId: 1, festivalId: 1 });
claimApplicationSchema.index({ status: 1 });
claimApplicationSchema.index({ currentApprover: 1 });
claimApplicationSchema.index({ submittedAt: 1 });

claimApplicationSchema.statics.CLAIM_STATUS = CLAIM_STATUS;
export default model('ClaimApplication', claimApplicationSchema);
