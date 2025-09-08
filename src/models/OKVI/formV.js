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

  createdAt: { type: Date, default: Date.now },
});

const FormV = mongoose.model('FormV', formVSchema);
export default FormV;
