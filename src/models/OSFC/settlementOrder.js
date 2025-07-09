import { Schema, model } from 'mongoose';

const settlementOrderSchema = new Schema(
  {
    userId: {
      type: Schema.Types.ObjectId,
      ref: 'User',
      required: true,
    },
    otsId: {
      type: Schema.Types.ObjectId,
      ref: 'OTSForm',
      required: true,
    },
    AckId: {
      type: Schema.Types.ObjectId,
      ref: 'AckForm',
      required: true,
    },
    memoId: {
      type: Schema.Types.ObjectId,
      ref: 'Memos', // Assuming your memorandum model is named 'Pdf'
      required: true,
    },
    // status: {
    //   type: Number,
    //   enum: [0, 1], // 0 = Rejected, 1 = Approved
    //   required: true,
    // },
    pdfData: {
    type: String,
    required: true
    },
  },
  { timestamps: true }
);

const SettlementOrder = model('SettlementOrder', settlementOrderSchema);

export default SettlementOrder;
