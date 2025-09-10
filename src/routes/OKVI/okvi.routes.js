import { Router } from 'express';
import holidays from './holiday.routes.js';
import user from './okviuser.routes.js';
import openingStock from './openingstock.routes.js';
import closingStock from './closingstock.route.js';
import headType from './headType.routes.js';
import unitType from './unitType.routes.js';
import admin from './admin.routes.js';
import claimDocuments from './claimDocuments.routes.js';
import sanctionCalculator from './sanctionCalculator.routes.js';
const router = Router();

router.use('/auth', user);
router.use('/holidays', holidays);
router.use('/user', user);
router.use('/opening-stock', openingStock);
router.use('/closing-stock', closingStock);
router.use('/head-types', headType);
router.use('/unit-types', unitType);
router.use('/admin', admin);
router.use('/claim-documents', claimDocuments);
router.use('/sanction-calculator', sanctionCalculator);

export default router;
