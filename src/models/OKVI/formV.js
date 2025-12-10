import mongoose from 'mongoose';

const formVSchema = new mongoose.Schema({
  formIId: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: 'Form1', 
    required: true 
  },
  totalSaleAmt:     { type: Number, required: true },  
  totalRebateAmt:   { type: Number, required: true },  
  approval_status:  { type: Number, required: true, default: 0},
  approvedBy:       { type: mongoose.Schema.Types.ObjectId, ref: 'OkviAuth' },
  approvedAt:       { type: Date },
  rejectionReason:  { type: String },
  reviewedByRole:   { type: Number, enum: [0, 1, 2] },
  createdAt:        { type: Date, default: Date.now },
});

const FormV = mongoose.model('FormV', formVSchema);
export default FormV;
