const mongoose = require('mongoose');
const {sendStatusChangeEmail} = require('../utils/sendStatusChangeEmail'); // adjust path as needed

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
    level_of_operation: {type: String, required: true},
    reason_non_payments: {type: String, required: true},
    details_of_dues: {type: String, required: true},
    status_of_npa: {type: String, required:true},
    reason_for_settlement: {type: String, required:true},
    sources_of_payment:{type: String, required:true},
    status_msg: { type: String, required: true, default: "Application submitted" },
    loan_number:{ type: String, required: true, unique:true},
    check_box1: { type: Boolean,required: true},
    check_box2: { type: Boolean,required: true}, 
    check_box3: { type: Boolean,required: true},
    check_box4: { type: Boolean,required: true} 
}, { timestamps: true });

// Track the old status_msg
otsFormSchema.pre('findOneAndUpdate', async function (next) {
    const query = this.getQuery(); // filter used in the update
    const docToUpdate = await this.model.findOne(query).lean();

    if (docToUpdate) {
        this._oldStatusMsg = docToUpdate.status_msg;
    }

    next();
});


// After saving, send email if status_msg changed
otsFormSchema.post('findOneAndUpdate', async function (doc) {
    if (!doc || !this._oldStatusMsg) return;

    const update = this.getUpdate();
    const newStatusMsg = update.status_msg || (update.$set && update.$set.status_msg);

    if (newStatusMsg && this._oldStatusMsg !== newStatusMsg) {
        console.log("Sending email from pre+post findOneAndUpdate hooks");
        doc.status_msg = newStatusMsg; // make sure email gets the latest
        await sendStatusChangeEmail(doc, this._oldStatusMsg, newStatusMsg);
    }
});


const OTSForm = mongoose.model('OTSForm', otsFormSchema);
module.exports = OTSForm;
