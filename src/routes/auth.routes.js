import { Router } from 'express';
import { register, login, logout, protectedRoute, register_OFSC_SuperAdmin, register_OFSC_SubAdmin, forgotPassword, resetPassword, updateProfile } from '../controllers/auth.controller.js';
import { authenticateToken } from '../middlewares/auth.middleware.js';
const router = Router();

router.post('/register', register);
router.post('/login', login);
router.post('/register_ofsc_superadmin', register_OFSC_SuperAdmin);
router.post('/register_ofsc_subadmin', register_OFSC_SubAdmin);
router.post('/logout', logout);
router.post('/forgot-password', forgotPassword);
router.post('/reset-password', resetPassword);
router.post('/update-password',authenticateToken, updateProfile);
router.get('/protected', authenticateToken, protectedRoute);

export default router;
