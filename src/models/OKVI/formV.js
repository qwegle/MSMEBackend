import mongoose from 'mongoose';

const formVSchema = new mongoose.Schema({
  formIId: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: 'Form1', 
    required: true 
  },

  // These two fields are _only_ written by your server logic:
  totalSaleAmt:   { type: Number, required: true },  
  totalRebateAmt: { type: Number, required: true },  

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

  createdAt: { type: Date, default: Date.now },
});

const FormV = mongoose.model('FormV', formVSchema);
export default FormV;
