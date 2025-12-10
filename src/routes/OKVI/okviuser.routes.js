import { Router } from 'express';
import { registerOkviUser, sendOtp, verifyOtp, registerOkviUserdetails, loginOkviUser, logoutOkvi, getUserDashboard, forgotPasswordSendOtp, forgotPasswordVerifyOtp, resetPassword, changePassword, getCaptcha } from '../../controllers/OKVI/okviuser.controller.js'; 
import { authenticateOkviToken } from '../../middlewares/okviAuth.middleware.js';

const router = Router();
router.get('/get-captcha', getCaptcha);
router.post('/login', loginOkviUser);
router.post('/registerAdmin', registerOkviUser);
router.post('/sendotp', sendOtp);
router.post('/verifyotp', verifyOtp);
router.post('/registerUserDetails', registerOkviUserdetails);
router.post('/logout', authenticateOkviToken, logoutOkvi);
router.get('/dashboard', authenticateOkviToken, getUserDashboard);
router.post('/forgot-password/send-otp', forgotPasswordSendOtp);
router.post('/forgot-password/verify-otp', forgotPasswordVerifyOtp);
router.post('/forgot-password/reset', resetPassword);
router.post('/change-password', authenticateOkviToken, changePassword);

export default router;
