
import mongoose from 'mongoose';

const governmentOrderSchema = new mongoose.Schema({
  letterNumber: {
    type: String,
    required: true,
    unique: true, 
    trim: true,
  },
  orderTitle: {
    type: String,
    required: true,
    trim: true,
  },
  departmentName: {
    type: String,
    required: true,
    trim: true,
  },
  pointOfContact: {
    type: String,
    required: true,
    trim: true,
  },
  contactNumber: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: function (v) {
        return /^\d{10}$/.test(v); // basic 10-digit number check
      },
      message: props => `${props.value} is not a valid contact number!`,
    },
  },
}, {
  timestamps: true,
});

const GovernmentOrder = mongoose.model('GovernmentOrder', governmentOrderSchema);

export default GovernmentOrder;
