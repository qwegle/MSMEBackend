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

    console.log("🔑 Auth Header:", authHeader);
    console.log("🔑 Extracted Token:", token);
    console.log("🔑 JWT_SECRET loaded:", JWT_SECRET ? "YES" : "NO");

    if (!token) {
      return next(new AppError('Token required', 401));
    }

    if (isBlacklisted(token)) {
      console.log("🚫 Token is blacklisted");
      return next(new AppError('Token is invalid (logged out)', 401));
    }

    verify(token, JWT_SECRET, async (err, decoded) => {
      if (err) {
        console.error("❌ JWT Verify Error:", err.message);
        return next(new AppError(`Invalid or expired token: ${err.message}`, 401));
      }

      console.log("✅ Decoded JWT Payload:", decoded);

      const user = await OkviAuth.findById(decoded.id).select('+sessionVersion +passwordChangedAt');
      if (!user) {
        console.warn("⚠️ No user found for token id:", decoded.id);
        return next(new AppError('User no longer exists', 401));
      }

      if (decoded.sessionVersion !== user.sessionVersion) {
        console.warn("⚠️ Session mismatch:", {
          decodedSession: decoded.sessionVersion,
          userSession: user.sessionVersion
        });
        return next(new AppError('Session expired due to new login', 401));
      }

      if (user.passwordChangedAt) {
        const changedTimestamp = parseInt(user.passwordChangedAt.getTime() / 1000, 10);
        console.log("⏰ passwordChangedAt:", changedTimestamp, " | tokenIssuedAt:", decoded.iat);

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

      console.log("✅ Authenticated User:", req.user);

      next();
    });
  } catch (error) {
    console.error("🔥 Middleware Error:", error);
    next(error);
  }
}

export function authorizeOkviRoles(...allowedRoles) {
  return (req, res, next) => {
    if (!req.user || typeof req.user.user_role === 'undefined') {
      return next(new AppError('Unauthorized access', 401));
    }

    if (!allowedRoles.includes(req.user.user_role)) {
      console.warn("🚫 Role not allowed:", {
        userRole: req.user.user_role,
        allowedRoles
      });
      return next(new AppError('Access denied: insufficient permissions', 403));
    }

    next();
  };
}
