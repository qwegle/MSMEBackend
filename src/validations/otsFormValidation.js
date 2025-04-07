// validations/otsFormValidation.js
const Joi = require('joi');
const otsFormSchema = Joi.object({
    // applicationId: Joi.string().required(),
    // userId: Joi.string().required(),
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
    any_others_particulars: Joi.string().allow('', null),
});

module.exports = otsFormSchema;
