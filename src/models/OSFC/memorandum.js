import { Schema, model } from 'mongoose';

const memorandum = new Schema(
  {
    userId: {
      type: Schema.Types.ObjectId,
      ref: 'User',
      required: true,
    },
    otsFormId: {
      type: Schema.Types.ObjectId,
      ref: 'OTSForm',
      required: true,
    },

    ackId: {
      type: Schema.Types.ObjectId,
      ref: 'AckForm',
      required: true,
    },
    status: {
      type: Number,
      enum: [0, 1, 2], // 0 = pending, 1 = Approved, 2 = Rejected
      required: true,
      default:0
    },
    remarks: {
      type: String,
      required:true,
      default:"Pending"
    },
    memoVersion:{
      type: Number,
      required:true,
      default:1

    },
    pdfData: {
      type: String,
      required: true
    },

  },
  { timestamps: true } 
);

const Memorandum = model('Memos', memorandum);

export default Memorandum;
