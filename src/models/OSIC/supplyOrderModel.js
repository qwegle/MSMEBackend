
import mongoose from 'mongoose';

const supplyOrderSchema = new mongoose.Schema({
  tender_number: {
    type: String,
    required: true,
    trim: true,
  },
  tender_value: {
    type: String,
    required: true,
    trim: true,
  },
  supply_quantity: {
    type: String,
    required: true,
    trim: true,
  },
  invoice_number: {
    type: String,
    required: true,
    trim: true,
  },
  invoice_amount: {
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
