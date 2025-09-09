import { Router } from 'express';
import { createHoliday, getHolidays, deleteHoliday, updateHoliday, getOdiaHolidayDropdown } from '../../controllers/OKVI/holiday.controller.js';
import { authenticateOkviToken, authorizeOkviRoles } from '../../middlewares/okviAuth.middleware.js';

const router = Router();
router.get('/getAllHolidays', authenticateOkviToken, getHolidays);
router.post('/createHoliday', authenticateOkviToken, authorizeOkviRoles(0), createHoliday);
router.put('/updateHoliday', authenticateOkviToken, authorizeOkviRoles(0), updateHoliday);
router.delete('/deleteHoliday', authenticateOkviToken, authorizeOkviRoles(0), deleteHoliday);
router.get('/getCalendarHolidays', getOdiaHolidayDropdown);
export default router;
