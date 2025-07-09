// src/validations/tenderResultValidation.js
import Joi from 'joi';

const tenderResultValidation = Joi.object({
  tender_number: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'tender_number is required',
    }),

  name: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'name is required',
    }),

  bid_value: Joi.number()
    .min(0)
    .required()
    .messages({
      'any.required': 'bid_value is required',
      'number.min': 'bid_value cannot be negative',
    }),

  bidder_score: Joi.number()
    .min(0)
    .max(100)
    .required()
    .messages({
      'any.required': 'bidder_score is required',
      'number.min': 'bidder_score cannot be less than 0',
      'number.max': 'bidder_score cannot be more than 100',
    }),
});

export default tenderResultValidation;
