import { Router } from 'express';
import {createOpeningStock} from '../../controllers/OKVI/openingStock.controller.js'; 
import { authenticateToken } from '../../middlewares/auth.middleware.js';

const router = Router();
router.post('/create',authenticateToken, createOpeningStock);
// router.post('/filter',authenticateToken, filterOpeningStock);

export default router;
