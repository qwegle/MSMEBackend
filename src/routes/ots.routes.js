import { Router } from 'express';
import { createOTSForm, updateOTSForm, trackStatus, filterOTS, getOTSStatusCounts, ApproveRejectOtsApplication, getUserStats } from '../controllers/OSFC/ots.controller.js';

import { authenticateToken, authorizeRoles, authorizeType } from '../middlewares/auth.middleware.js';
import validateRequest from '../middlewares/validateRequest.js';
// import otsFormSchema from '../validations/otsFormValidation.js';

const router = Router();

router.post(
    '/submitOTS',
    authenticateToken,
    authorizeRoles(2),
    authorizeType(0),
    // validateRequest(otsFormSchema),
    createOTSForm
);
router.put('/updateOTsform/:id', 
    authenticateToken,
    authorizeRoles(2),
    authorizeType(0),
    updateOTSForm
);
router.post(
    '/trackStatus',
    authenticateToken,
    authorizeType(0),
    trackStatus
);
router.post(
    '/ApproveRejectOTS',
    authenticateToken,
    authorizeRoles(0,1),
    authorizeType(1),
    ApproveRejectOtsApplication
);
router.post(
    '/filterOTS',
    authenticateToken,
    authorizeType(0,1),
    filterOTS
);
router.post(
    '/count_applications',
    authenticateToken,
    authorizeType(0,1),
    getOTSStatusCounts
);

router.post(
    '/user_stats',
    authenticateToken,
    authorizeType(0,1),
    getUserStats 
)

export default router;
