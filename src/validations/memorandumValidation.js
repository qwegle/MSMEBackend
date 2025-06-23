const Joi = require('joi');
const mongoose = require('mongoose');

const isValidObjectId = (value, helpers) => {
  if (!mongoose.Types.ObjectId.isValid(value)) {
    return helpers.error('any.invalid');
  }
  return value;
};

const memorandumValidation = Joi.object({
  userId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.required': 'userId is required',
      'any.invalid': 'Invalid userId format',
    }),

  otsFormId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.required': 'otsFormId is required',
      'any.invalid': 'Invalid otsFormId format',
    }),

  ackId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.required': 'ackId is required',
      'any.invalid': 'Invalid ackId format',
    }),

  status: Joi.number()
    .valid(0, 1, 2)
    .required()
    .messages({
      'any.required': 'status is required',
      'any.only': 'status must be 0 (Pending), 1 (Approved), or 2 (Rejected)',
    }),

  remarks: Joi.string()
    .required()
    .messages({
      'any.required': 'remarks is required',
    }),

  memoVersion: Joi.number()
    .integer()
    .min(1)
    .required()
    .messages({
      'any.required': 'memoVersion is required',
      'number.min': 'memoVersion must be at least 1',
    }),

  pdfData: Joi.string()
    .required()
    .messages({
      'any.required': 'pdfData is required',
    }),
});

module.exports = memorandumValidation;
