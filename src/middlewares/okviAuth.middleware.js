import jwt from 'jsonwebtoken';
import { isBlacklisted } from '../utils/tokenBlacklist.js';
import AppError from '../utils/AppError.js';
import OkviAuth from '../models/OKVI/okviauth.js';

const { verify } = jwt;
const JWT_SECRET = process.env.JWT_SECRET;

export async function authenticateOkviToken(req, res, next) {
  try {
    const authHeader = req.headers['authorization'];
    const token = authHeader?.split(' ')[1];
    
    if (!token) {
      return next(new AppError('Token required', 401));
    }

    if (isBlacklisted(token)) {
      return next(new AppError('Token is invalid (logged out)', 401));
    }

    verify(token, JWT_SECRET, async (err, decoded) => {
      if (err) {
        return next(new AppError('Invalid or expired token', 401));
      }

      const user = await OkviAuth.findById(decoded.id).select('+sessionVersion +passwordChangedAt');
      if (!user) {
        return next(new AppError('User no longer exists', 401));
      }

      if (decoded.sessionVersion !== user.sessionVersion) {
        return next(new AppError('Session expired due to new login', 401));
      }

      if (user.passwordChangedAt) {
        const changedTimestamp = parseInt(user.passwordChangedAt.getTime() / 1000, 10);
        if (decoded.iat < changedTimestamp) {
          return next(new AppError('Password recently changed, please log in again', 401));
        }
      }

      req.user = {
        id: user._id,
        email: user.email,
        name: user.name,
        role: user.role,
        user_role: user.role, // Keep both for backward compatibility
        sessionVersion: user.sessionVersion
      };
      
      next();
    });
  } catch (error) {
    next(error);
  }
}

export function authorizeOkviRoles(...allowedRoles) {
  return (req, res, next) => {
    if (!req.user || typeof req.user.user_role === 'undefined') {
      return next(new AppError('Unauthorized access', 401));
    }

    if (!allowedRoles.includes(req.user.user_role)) {
      return next(new AppError('Access denied: insufficient permissions', 403));
    }

    next();
  };
}
