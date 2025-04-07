const mongoose = require('mongoose');

const certificateOrderSchema = new mongoose.Schema(
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
    ackId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'AckForm',
      required: true,
    },
    memoId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Memos',
      required: true,
    },
    orderId:{
      type: mongoose.Schema.Types.ObjectId,
      ref: 'SettlementOrder',
      required: true,
    },
    payment_status: {
      type: Number,
      enum: [0, 1], // 0 = not done, 1 = done
      required: true,
    },
    certificate: {
      data: Buffer,
      contentType: String,
    },
  },
  { timestamps: true }
);

const CertificateOrder = mongoose.model('CertificateOrder', certificateOrderSchema);

module.exports = CertificateOrder;
