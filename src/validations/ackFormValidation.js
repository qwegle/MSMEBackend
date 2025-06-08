const Joi = require('joi');

const ackFormValidation = Joi.object({
  loan_number: Joi.string().required(),

  deposit_amount: Joi.number().positive().required(),

  deposit_date: Joi.string()
    .pattern(/^\d{4}-\d{2}-\d{2}$/)
    .required()
    .messages({
      'string.pattern.base': 'deposit_date must be in YYYY-MM-DD format'
    }),

  deposit_type: Joi.string()
    .valid('dd', 'cash', 'pay order', 'bankers cheque')
    .required(),

  ofsc_no: Joi.string().required(),

  rac_date: Joi.string()
    .pattern(/^\d{4}-\d{2}-\d{2}$/)
    .required()
    .messages({
      'string.pattern.base': 'date must be in YYYY-MM-DD format'
    }),

  file: Joi.string().uri().required(),

  name_of_recieving_officer: Joi.string().required(),

  date_of_signature: Joi.string()
    .pattern(/^\d{4}-\d{2}-\d{2}$/)
    .required()
    .messages({
      'string.pattern.base': 'date_of_signature must be in YYYY-MM-DD format'
    })
});

module.exports = ackFormValidation;
