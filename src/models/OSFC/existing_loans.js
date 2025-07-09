import { Schema, model } from 'mongoose';

const loanSchema = new Schema({
  loanId: {
    type: String,
    required: true,
    unique: true,
  },
  customerName: {
    type: String,
    required: true,
  },
  customerId: {
    type: String,
    required: true,
  },
  loanType: {
    type: String,
    enum: ['Home', 'Personal', 'Car', 'Education'],
    required: true,
  },
  loanAmount: {
    type: Number,
    required: true,
  },
  interestRate: {
    type: Number,
    required: true,
  },
  loanTerm: {
    type: Number,
    required: true,
  },
  startDate: {
    type: Date,
    required: true,
  },
  endDate: {
    type: Date,
    required: true,
  },
  outstandingAmount: {
    type: Number,
    required: true,
  },
  monthlyEmi: {
    type: Number,
    required: true,
  },
  loanStatus: {
    type: String,
    enum: ['Active', 'Closed', 'Defaulted'],
    required: true,
  },
  overdueAmount: {
    type: Number,
    required: true,
  },
  branch: {
    type: String,
    enum: ['khorda', 'paradip'],
    required: true,
  },
  aadharNumber:{
    type: String,
    required: true
  }
}, {
  timestamps: true
});

export default model('Loan', loanSchema);
