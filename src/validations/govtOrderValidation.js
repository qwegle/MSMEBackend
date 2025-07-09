// src/validations/governmentOrderValidation.js
import Joi from 'joi';

const governmentOrderValidation = Joi.object({
  letterNumber: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'letterNumber is required',
    }),

  orderTitle: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'orderTitle is required',
    }),

  departmentName: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'departmentName is required',
    }),

  pointOfContact: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'pointOfContact is required',
    }),

  contactNumber: Joi.string()
    .trim()
    .pattern(/^\d{10}$/)
    .required()
    .messages({
      'any.required': 'contactNumber is required',
      'string.pattern.base': 'contactNumber must be a valid 10-digit number',
    }),
});

export default governmentOrderValidation;
