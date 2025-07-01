const express = require('express');
const {
    createOTSForm,
    updateOTSForm,
    trackStatus,
    filterOTS,
    getOTSStatusCounts,
    ApproveRejectOtsApplication,
    getUserStats
} = require('../controllers/ots.controller');

const { authenticateToken, authorizeRoles, authorizeType } = require('../middlewares/auth.middleware');
const validateRequest = require('../middlewares/validateRequest');
const otsFormSchema = require('../validations/otsFormValidation');

const router = express.Router();

router.post(
    '/submitOTS',
    authenticateToken,
    authorizeRoles(2),
    authorizeType(0),
    validateRequest(otsFormSchema),
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

module.exports = router;
