import { Router } from 'express';
import { registerOkviUser, sendOtp, verifyOtp, registerOkviUserdetails, loginOkviUser, logoutOkvi} from '../../controllers/OKVI/okviuser.controller.js'; 
import { authenticateToken } from '../../middlewares/auth.middleware.js';

const router = Router();
router.post('/login', loginOkviUser);
router.post('/registerUser', registerOkviUser);
router.post('/sendotp', sendOtp);
router.post('/verifyotp', verifyOtp);
router.post('/registerUserDetails', registerOkviUserdetails);
router.post('/logout',authenticateToken, logoutOkvi)


export default router;
