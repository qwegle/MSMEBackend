// src/validations/certificateOrderValidation.js
import Joi from 'joi';
import { Types } from 'mongoose';

const isValidObjectId = (value, helpers) => {
  if (!Types.ObjectId.isValid(value)) {
    return helpers.error('any.invalid');
  }
  return value;
};

const certificateOrderValidation = Joi.object({
  userId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.invalid': 'Invalid userId format',
      'any.required': 'userId is required'
    }),

  otsId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.invalid': 'Invalid otsId format',
      'any.required': 'otsId is required'
    }),

  ackId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.invalid': 'Invalid ackId format',
      'any.required': 'ackId is required'
    }),

  memoId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.invalid': 'Invalid memoId format',
      'any.required': 'memoId is required'
    }),

  orderId: Joi.string()
    .custom(isValidObjectId, 'ObjectId Validation')
    .required()
    .messages({
      'any.invalid': 'Invalid orderId format',
      'any.required': 'orderId is required'
    }),

  certificate: Joi.string()
    .required()
    .messages({
      'any.required': 'certificate field is required'
    })
});

export default certificateOrderValidation;
