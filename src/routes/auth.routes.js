import { Router } from 'express';
import { register, 
    login, 
    logout, 
    protectedRoute, 
    register_OFSC_SuperAdmin, 
    register_OFSC_SubAdmin, 
    forgotPassword, 
    resetPassword, 
    updateProfile, 
    resendResetOTP,
    getCaptcha, 
     } from '../controllers/auth.controller.js';
import { authenticateToken } from '../middlewares/auth.middleware.js';
import { emailLimiter } from '../utils/limiters.js';
const router = Router();

router.post('/register',  register);
router.post('/login',  login);
router.post('/register_ofsc_superadmin', register_OFSC_SuperAdmin);
router.post('/register_ofsc_subadmin',register_OFSC_SubAdmin);
router.post('/logout',authenticateToken, logout);
router.post('/forgot-password', emailLimiter, forgotPassword);
router.post('/reset-password', emailLimiter,  resetPassword);
router.post('/resend-otp', emailLimiter, resendResetOTP);
router.post('/update-password',authenticateToken, updateProfile);
router.get('/get-captcha', getCaptcha);
router.get('/protected', authenticateToken, protectedRoute);

export default router;
