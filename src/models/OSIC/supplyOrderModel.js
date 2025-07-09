
import mongoose from 'mongoose';

const supplyOrderSchema = new mongoose.Schema({
  supply_details: {
    type: String,
    required: true,
    trim: true,
  },
  proof_of_supply: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (v) => v.endsWith('.pdf'),
      message: 'Proof of supply must be a PDF file link.',
    },
  },
  invoice_submission: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (v) => v.endsWith('.pdf'),
      message: 'Invoice submission must be a PDF file link.',
    },
  },
  payment_as_per_invoice: {
    type: Number,
    required: true,
    min: 0,
  },
}, {
  timestamps: true,
});

const SupplyOrder = mongoose.model('SupplyOrder', supplyOrderSchema);

export default SupplyOrder;
