// src/validations/floatTenderValidation.js
import Joi from 'joi';

const floatTenderValidation = Joi.object({
  tender_number: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'tender_number is required',
    }),

  project_title: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'project_title is required',
    }),

  tender_date: Joi.date()
    .iso()
    .required()
    .messages({
      'any.required': 'tender_date is required',
      'date.format': 'tender_date must be in ISO format (YYYY-MM-DD)',
    }),

  prebid_date: Joi.date()
    .iso()
    .required()
    .messages({
      'any.required': 'prebid_date is required',
      'date.format': 'prebid_date must be in ISO format (YYYY-MM-DD)',
    }),

  last_tender_submission_date: Joi.date()
    .iso()
    .required()
    .messages({
      'any.required': 'last_tender_submission_date is required',
      'date.format': 'last_tender_submission_date must be in ISO format (YYYY-MM-DD)',
    }),

  bid_opening_date: Joi.date()
    .iso()
    .required()
    .messages({
      'any.required': 'bid_opening_date is required',
      'date.format': 'bid_opening_date must be in ISO format (YYYY-MM-DD)',
    }),
});

export default floatTenderValidation;
