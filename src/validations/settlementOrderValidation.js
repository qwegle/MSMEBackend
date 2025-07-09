// src/validations/settlementOrderValidation.js
import Joi from 'joi';
import { Types } from 'mongoose';

const isValidObjectId = (value, helpers) => {
  if (!Types.ObjectId.isValid(value)) {
    return helpers.error('any.invalid');
  }
  return value;
};

const settlementOrderValidation = Joi.object({
  userId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.required': 'userId is required',
      'any.invalid': 'Invalid userId format',
    }),

  otsId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.required': 'otsId is required',
      'any.invalid': 'Invalid otsId format',
    }),

  AckId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.required': 'AckId is required',
      'any.invalid': 'Invalid AckId format',
    }),

  memoId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.required': 'memoId is required',
      'any.invalid': 'Invalid memoId format',
    }),

  // Uncomment below if status is added later
  // status: Joi.number()
  //   .valid(0, 1)
  //   .required()
  //   .messages({
  //     'any.required': 'status is required',
  //     'any.only': 'status must be 0 (Rejected) or 1 (Approved)',
  //   }),

  pdfData: Joi.string()
    .required()
    .messages({
      'any.required': 'pdfData is required',
    }),
});

export default settlementOrderValidation;
