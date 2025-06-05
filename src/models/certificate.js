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
    certificate: {
      type: String,
      required: true
    },
  },
  { timestamps: true }
);

const CertificateOrder = mongoose.model('CertificateOrder', certificateOrderSchema);

module.exports = CertificateOrder;
