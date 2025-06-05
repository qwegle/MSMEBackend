const mongoose = require('mongoose');

const settlementOrderSchema = new mongoose.Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
      required: true,
    },
    otsId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'OTSForm',
      required: true,
    },
    AckId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'AckForm',
      required: true,
    },
    memoId: {
      type: mongoose.Schema.Types.ObjectId,
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

const SettlementOrder = mongoose.model('SettlementOrder', settlementOrderSchema);

module.exports = SettlementOrder;
