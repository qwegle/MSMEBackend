import { Schema, model } from 'mongoose';

const certificateOrderSchema = new Schema(
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
    ackId: {
      type: Schema.Types.ObjectId,
      ref: 'AckForm',
      required: true,
    },
    memoId: {
      type: Schema.Types.ObjectId,
      ref: 'Memos',
      required: true,
    },
    orderId:{
      type: Schema.Types.ObjectId,
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

const CertificateOrder = model('CertificateOrder', certificateOrderSchema);

export default CertificateOrder;
