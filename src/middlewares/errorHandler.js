import AppError from '../utils/AppError.js';
import { sendEncryptedResponse } from '../utils/encryption.js';

const handleCastErrorDB = err => {
  const message = `Invalid ${err.path}: ${err.value}`;
  return new AppError(message, 400);
};

const handleValidationErrorDB = err => {
  const errors = Object.values(err.errors).map(el => el.message);
  const message = `Validation error: ${errors.join('. ')}`;
  return new AppError(message, 400);
};

const handleDuplicateFieldsDB = err => {
  const field = Object.keys(err.keyValue)[0];
  const value = err.keyValue[field];
  const message = `Duplicate field value: '${value}' for '${field}'. Please use another value.`;
  return new AppError(message, 400);
};

const handleJWTError = () =>
  new AppError('Invalid token. Please log in again!', 401);

const handleJWTExpiredError = () =>
  new AppError('Your token has expired! Please log in again.', 401);

const errorHandler = (err, req, res, next) => {
  let error = { ...err, message: err.message };

  if (err.name === 'CastError') error = handleCastErrorDB(err);
  if (err.name === 'ValidationError') error = handleValidationErrorDB(err);
  if (err.code === 11000) error = handleDuplicateFieldsDB(err);
  if (err.name === 'JsonWebTokenError') error = handleJWTError();
  if (err.name === 'TokenExpiredError') error = handleJWTExpiredError();

  const responsePayload = {
    status: error.status || 'error',
    message: error.message || 'Internal Server Error',
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack }) // include stack in dev
  };

  if (process.env.NODE_ENV === 'development') {
    return res.status(error.statusCode || 500).json(responsePayload);
  } else {
    return sendEncryptedResponse(res, error.statusCode || 500, responsePayload);
  }
};

export default errorHandler;
