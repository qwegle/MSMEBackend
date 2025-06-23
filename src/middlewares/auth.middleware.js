const jwt = require('jsonwebtoken');
const { isBlacklisted } = require('../utils/tokenBlacklist');
const AppError = require('../utils/AppError');

const JWT_SECRET = process.env.JWT_SECRET;
exports.authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader?.split(' ')[1];

  if (!token) {
    return next(new AppError('Token required', 401));
  }

  if (isBlacklisted(token)) {
    return next(new AppError('Token is invalid (logged out)', 403));
  }

  jwt.verify(token, JWT_SECRET, (err, decoded) => {
    if (err) {
      return next(new AppError('Invalid or expired token', 403));
    }

    req.user = decoded;
    next();
  });
};

exports.authorizeRoles = (...allowedRoles) => {
  return (req, res, next) => {
    if (!req.user || typeof req.user.user_role === 'undefined') {
      return next(new AppError('Unauthorized access', 401));
    }

    if (!allowedRoles.includes(req.user.user_role)) {
      return next(new AppError('Access denied: insufficient permissions', 403));
    }

    next();
  };
};
