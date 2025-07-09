import { Router } from 'express';
import authRoutes from './auth.routes.js';
import userRoutes from './user.routes.js';
import otsRoutes from './ots.routes.js';
import ackRoutes from './ack.routes.js';
import memoRoutes from './memo.route.js';
import orderRoutes from './order.routes.js';
import certificateRoutes from './certificate.routes.js';
import existingLoan from './loan.routes.js';
import OSIC from './osic.routes.js';
import OKVI from './OKVI/holiday.routes.js';
const router = Router();

router.use('/auth', authRoutes);
router.use('/ots', otsRoutes);
router.use('/users', userRoutes);
router.use('/ack', ackRoutes);
router.use('/memo', memoRoutes);
router.use('/order', orderRoutes);
router.use('/certificate', certificateRoutes);
router.use('/loan', existingLoan);
router.use('/osic', OSIC);
router.use('/okvi', OKVI);

export default router;
