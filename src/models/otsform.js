const mongoose = require('mongoose');
const sendStatusChangeEmail = require('../utils/sendStatusChangeEmail'); // adjust path as needed

const otsFormSchema = new mongoose.Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
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
    status: { type: Number, required: true, default: 0 },
    status_msg: { type: String, required: true, default: "Application submitted" }
}, { timestamps: true });

// Track the old status_msg
otsFormSchema.pre('save', function (next) {
    if (this.isModified('status_msg')) {
        this._oldStatusMsg = this.get('status_msg');
    }
    next();
});

// After saving, send email if status_msg changed
otsFormSchema.post('save', async function (doc) {
    if (this._oldStatusMsg && this._oldStatusMsg !== doc.status_msg) {
        await sendStatusChangeEmail(doc, this._oldStatusMsg, doc.status_msg);
    }
});

const OTSForm = mongoose.model('OTSForm', otsFormSchema);
module.exports = OTSForm;
