const Joi = require('joi');

const otsFormSchema = Joi.object({
    userId: Joi.string().required(),

    first_name: Joi.string().required(),
    last_name: Joi.string().required(),
    number: Joi.string().required(),
    email: Joi.string().email().required(),
    street_address: Joi.string().required(),
    state: Joi.string().required(),
    city: Joi.string().required(),
    branch: Joi.string().required(),
    pin_code: Joi.string().required(),

    liability_ofsc: Joi.string().required(),
    industry: Joi.string().required(),
    financial_heights: Joi.string().required(),
    reason_ots: Joi.string().required(),
    payment_source: Joi.string().required(),
    terms_payment: Joi.string().required(),

    level_of_operation: Joi.string().required(),
    reason_non_payments: Joi.string().required(),
    details_of_dues: Joi.string().required(),
    status_of_npa: Joi.string().required(),
    reason_for_settlement: Joi.string().required(),
    sources_of_payment: Joi.string().required(),

    // loan_number: Joi.string().required(),

    status: Joi.number().optional(), // default handled in Mongoose
    status_msg: Joi.string().optional(), // default handled in Mongoose

    check_box1: Joi.boolean().required(),
    check_box2: Joi.boolean().required(),
    check_box3: Joi.boolean().required(),
    check_box4: Joi.boolean().required(),

    any_others_particulars: Joi.string().allow('', null)
});

module.exports = otsFormSchema;
