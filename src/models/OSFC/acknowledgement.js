import { Schema, model } from 'mongoose';

const acknowledgementSchema = new Schema({
  ots_form_id: {
    type: Schema.Types.ObjectId,
    ref: 'OTSForm', // Replace with actual name of referenced model
    required: true
  },
  deposit_amount: {
    type: Number,
    required: true
  },
  deposit_date: {
    type: String,
    required: true,
    validate: {
      validator: function (v) {
        return /^\d{4}-\d{2}-\d{2}$/.test(v); // YYYY-MM-DD format
      },
      message: props => `${props.value} is not a valid date format (YYYY-MM-DD)!`
    }
  },
  deposit_type: {
    type: String,
    enum: ['dd', 'cash', 'pay order', 'bankers cheque'],
    required: true
  },
  ofsc_no: {
    type: String,
    required: true
  },
  rac_date: {
    type: String,
    required: true,
    validate: {
      validator: function (v) {
        return /^\d{4}-\d{2}-\d{2}$/.test(v); // YYYY-MM-DD format
      },
      message: props => `${props.value} is not a valid date format (YYYY-MM-DD)!`
    }
  },
  img_link_sign_stamp: {
    type: String,
    required: true
  },
  name_of_recieving_officer: {
    type: String,
    required: true
  },
  date_of_signature: {
    type: String,
    required: true,
    validate: {
      validator: function (v) {
        return /^\d{4}-\d{2}-\d{2}$/.test(v); // YYYY-MM-DD format
      },
      message: props => `${props.value} is not a valid date format (YYYY-MM-DD)!`
    }
  }
}, {
  timestamps: true
});

const acknowledgementForm = model('AckForm', acknowledgementSchema);

export default acknowledgementForm;
