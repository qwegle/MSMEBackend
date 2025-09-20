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
  approval_status:  { type: Number, required: true, default: 0},
  centerBreakup: {
    type: [centerBreakupSchema],
    validate: v => Array.isArray(v) && v.length > 0
  },

  createdAt: { type: Date, default: Date.now }
});

const FormVI = mongoose.model('FormVI', formVISchema);
export default FormVI;
