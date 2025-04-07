const mongoose = require('mongoose');

const otsFormSchema = new mongoose.Schema({
    // applicationId: { type: String, required: true, unique: true }, // Unique primary key
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true }, // Foreign key referencing User table
    first_name: { type: String, required: true },
    last_name: { type: String, required: true },
    number: { type: String, required: true },
    email: { type: String, required: true },
    street_address: { type: String, required: true },
    state: { type: String, required: true },
    city: { type: String, required: true },
    branch: { type: String, required: true },
    pin_code: { type: String, required: true },
    liability_ofsc: { type: String, required: true },
    industry: { type: String, required: true },
    financial_heights: { type: String, required: true },
    reason_ots: { type: String, required: true },
    payment_source: { type: String, required: true },
    terms_payment: { type: String, required: true },
    any_others_particulars: { type: String },
    status: {type: Number, required: true, default: 0},
    status_msg:{type: String, required: true, default: "Application submitted"} // 0 - pending, 1 - accepted, -1 - rejected
}, { timestamps: true });

const OTSForm = mongoose.model('OTSForm', otsFormSchema);

module.exports = OTSForm;
