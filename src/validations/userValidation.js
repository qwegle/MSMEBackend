const Joi = require('joi');

const strongPassword = Joi.string()
  .min(12)
  .max(64)
  .pattern(new RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$'))
  .required()
  .messages({
    'string.pattern.base':
      'Password must include at least one uppercase letter, one lowercase letter, one number, and one special character',
    'string.min': 'Password must be at least 12 characters long',
    'string.max': 'Password must not exceed 64 characters',
    'any.required': 'Password is required',
  });

const userValidation = Joi.object({
  username: Joi.string()
    .trim()
    .required()
    .messages({
      'any.required': 'Username is required',
    }),

  password: strongPassword,

  email: Joi.string()
    .email()
    .required()
    .messages({
      'any.required': 'Email is required',
      'string.email': 'Email must be a valid email address',
    }),

  user_type: Joi.number()
    .valid(0, 1, 2, 3)
    .required()
    .messages({
      'any.required': 'user_type is required',
      'any.only': 'user_type must be one of 0 (citizen), 1 (ofsc), 2 (okvi), 3 (osic)',
    }),

  user_role: Joi.number()
    .valid(0, 1, 2)
    .required()
    .messages({
      'any.required': 'user_role is required',
      'any.only': 'user_role must be one of 0 (admin), 1 (sub-admin), or 2 (user)',
    }),

  branch: Joi.string()
    .allow('', null)
    .messages({
      'string.base': 'branch must be a string',
    }),

  aadharNumber: Joi.string()
    .pattern(/^\d{12}$/)
    .allow('', null)
    .messages({
      'string.pattern.base': 'aadharNumber must be a 12-digit numeric string',
    }),
});

module.exports = userValidation;
