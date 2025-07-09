import { Router } from 'express';
import { createHoliday, getHolidays, deleteHoliday, updateHoliday } from '../../controllers/OKVI/holiday.controller.js'; // corrected the controller name
import { authenticateToken, authorizeRoles, authorizeType } from '../../middlewares/auth.middleware.js';

const router = Router();
router.get('/getAllHolidays', authenticateToken, getHolidays);
router.post('/createHoliday', authenticateToken, authorizeRoles(0), createHoliday);
router.put('/updateHoliday', authenticateToken, authorizeRoles(0), updateHoliday);
router.delete('/deleteHoliday', authenticateToken, authorizeRoles(0), deleteHoliday);

export default router;
