import rateLimit from 'express-rate-limit';
import { sendEncryptedResponse } from '../utils/encryption.js';

export const emailLimiter = rateLimit({
  windowMs: 60 * 1000,
  max: 8,
  handler: (req, res) => {
    sendEncryptedResponse(res, 429, {
      message: 'Too many email requests. Please try again later.',
    });
  },
  standardHeaders: true,
  legacyHeaders: false,
  skipFailedRequests: false,
  skipSuccessfulRequests: false
});

export const submitApplicationLimiter = rateLimit({
  windowMs: 60 * 1000,
  max: 5,
  handler: (req, res) => {
    sendEncryptedResponse(res, 429, {
      message: 'Too many application submissions. Please try again later.',
    });
  },
  standardHeaders: true,
  legacyHeaders: false,
  skipFailedRequests: false,
  skipSuccessfulRequests: false
});

