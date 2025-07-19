import mongoose from 'mongoose';

const centerBreakupSchema = new mongoose.Schema({
  subCenterName: { type: String, required: true },
  totalSaleAmt:  { type: Number, required: true },  // sum of that center’s Form I totals
  totalRebateAmt:{ type: Number, required: true }   // totalSaleAmt × rebateRate
}, { _id: false });

const formVISchema = new mongoose.Schema({
  formIId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Form1',
    required: true
  },

  centerBreakup: {
    type: [centerBreakupSchema],
    validate: v => Array.isArray(v) && v.length > 0
  },

   sub_admin_status: { 
    type: Number,
    enum: [0, 1, 2],    // 0 = Pending, 1 = Approved, 2 = Rejected
    default: 0,
  },
  super_admin_status: { 
    type: Number,
    enum: [0, 1, 2],    // 0 = Pending, 1 = Approved, 2 = Rejected
    default: 0,
  },
  addl_admin_status: {
    type: Number,
    enum: [0, 1, 2],    // 0 = Pending, 1 = Approved, 2 = Rejected
    default: 0,
  },

  createdAt: { type: Date, default: Date.now }
});

const FormVI = mongoose.model('FormVI', formVISchema);
export default FormVI;
