import admin from '../utils/firebaseAdmin.js';
import AppError from '../utils/AppError.js';
const verifyAppCheck = async (req, res, next) => {
  const appCheckToken = req.headers['x-firebase-appcheck'];
  if (!appCheckToken) {
    return next(new AppError('App Check token missing', 401));
  }
  try {
    const appCheckClaims = await admin.appCheck().verifyToken(appCheckToken);
    req.appCheck = appCheckClaims;
    next();
  } catch (error) {
    return next(new AppError('Invalid App Check token', 403));
  }
};
export default verifyAppCheck;
