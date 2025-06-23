const Joi = require('joi');

const supplyOrderValidation = Joi.object({
  supply_details: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'supply_details is required',
    }),

  proof_of_supply: Joi.string()
    .trim()
    .pattern(/\.pdf$/i)
    .required()
    .messages({
      'any.required': 'proof_of_supply is required',
      'string.pattern.base': 'proof_of_supply must be a PDF file link',
    }),

  invoice_submission: Joi.string()
    .trim()
    .pattern(/\.pdf$/i)
    .required()
    .messages({
      'any.required': 'invoice_submission is required',
      'string.pattern.base': 'invoice_submission must be a PDF file link',
    }),

  payment_as_per_invoice: Joi.number()
    .min(0)
    .required()
    .messages({
      'any.required': 'payment_as_per_invoice is required',
      'number.min': 'payment_as_per_invoice cannot be negative',
    }),
});

module.exports = supplyOrderValidation;
