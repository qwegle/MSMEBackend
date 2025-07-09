// src/validations/loanValidation.js
import Joi from 'joi';

const loanValidation = Joi.object({
  loanId: Joi.string().required().messages({
    'any.required': 'loanId is required',
  }),

  customerName: Joi.string().required().messages({
    'any.required': 'customerName is required',
  }),

  customerId: Joi.string().required().messages({
    'any.required': 'customerId is required',
  }),

  loanType: Joi.string()
    .valid('Home', 'Personal', 'Car', 'Education')
    .required()
    .messages({
      'any.required': 'loanType is required',
      'any.only': 'loanType must be one of Home, Personal, Car, or Education',
    }),

  loanAmount: Joi.number().positive().required().messages({
    'any.required': 'loanAmount is required',
    'number.positive': 'loanAmount must be a positive number',
  }),

  interestRate: Joi.number().positive().required().messages({
    'any.required': 'interestRate is required',
    'number.positive': 'interestRate must be a positive number',
  }),

  loanTerm: Joi.number().integer().positive().required().messages({
    'any.required': 'loanTerm is required',
    'number.positive': 'loanTerm must be a positive integer',
  }),

  startDate: Joi.date().iso().required().messages({
    'any.required': 'startDate is required',
    'date.format': 'startDate must be in ISO format (YYYY-MM-DD)',
  }),

  endDate: Joi.date().iso().required().messages({
    'any.required': 'endDate is required',
    'date.format': 'endDate must be in ISO format (YYYY-MM-DD)',
  }),

  outstandingAmount: Joi.number().min(0).required().messages({
    'any.required': 'outstandingAmount is required',
    'number.min': 'outstandingAmount cannot be negative',
  }),

  monthlyEmi: Joi.number().positive().required().messages({
    'any.required': 'monthlyEmi is required',
    'number.positive': 'monthlyEmi must be a positive number',
  }),

  loanStatus: Joi.string()
    .valid('Active', 'Closed', 'Defaulted')
    .required()
    .messages({
      'any.required': 'loanStatus is required',
      'any.only': 'loanStatus must be one of Active, Closed, or Defaulted',
    }),

  overdueAmount: Joi.number().min(0).required().messages({
    'any.required': 'overdueAmount is required',
    'number.min': 'overdueAmount cannot be negative',
  }),

  branch: Joi.string()
    .valid('khorda', 'paradip')
    .required()
    .messages({
      'any.required': 'branch is required',
      'any.only': 'branch must be one of khorda or paradip',
    }),

  aadharNumber: Joi.string()
    .pattern(/^\d{12}$/)
    .required()
    .messages({
      'any.required': 'aadharNumber is required',
      'string.pattern.base': 'aadharNumber must be a 12-digit number',
    }),
});

export default loanValidation;
