import { Router } from 'express';
import holidays from './holiday.routes.js';
import user from './okviuser.routes.js';
import openingStock from './openingstock.routes.js'
const router = Router();

router.use('/holidays', holidays);
router.use('/user', user);
router.use('/opening-stock', openingStock)

export default router;
