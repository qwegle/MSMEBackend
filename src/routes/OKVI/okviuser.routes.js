import { Router } from 'express';
import { registerOkviUser, sendOtp, verifyOtp, registerOkviUserdetails, loginOkviUser, logoutOkvi, getUserDashboard} from '../../controllers/OKVI/okviuser.controller.js'; 
import { authenticateOkviToken } from '../../middlewares/okviAuth.middleware.js';

const router = Router();
router.post('/login', loginOkviUser);
router.post('/registerUser', registerOkviUser);
router.post('/sendotp', sendOtp);
router.post('/verifyotp', verifyOtp);
router.post('/registerUserDetails', registerOkviUserdetails);
router.post('/logout', authenticateOkviToken, logoutOkvi);
router.post('/dashboard', authenticateOkviToken, getUserDashboard);


export default router;
