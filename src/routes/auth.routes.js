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
     } from '../controllers/auth.controller.js';
import { authenticateToken} from '../middlewares/auth.middleware.js';
import  verifyAppCheck  from '../middlewares/appcheckVerification.js'
const router = Router();

router.post('/register', verifyAppCheck, register);
router.post('/login', verifyAppCheck, login);
router.post('/register_ofsc_superadmin', register_OFSC_SuperAdmin);
router.post('/register_ofsc_subadmin',register_OFSC_SubAdmin);
router.post('/logout',authenticateToken, logout);
router.post('/forgot-password', verifyAppCheck, forgotPassword);
router.post('/reset-password', verifyAppCheck, resetPassword);
router.post('/resend-otp', resendResetOTP);
router.post('/update-password',authenticateToken, updateProfile);

router.get('/protected', authenticateToken, protectedRoute);

export default router;
