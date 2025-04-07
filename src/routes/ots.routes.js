const express = require('express');
const {
    createOTSForm,
    getUserOTSForms,
    getOTSFormById,
    getAllOTSForms,
    getOTSFormsByBranch,
    updateOTSForm,
    trackStatus,
    rejectOtsApplication,
    filterOTS,
} = require('../controllers/ots.controller');

const { authenticateToken } = require('../middlewares/auth.middleware');
const validateRequest = require('../middlewares/validateRequest');
const otsFormSchema = require('../validations/otsFormValidation');

const router = express.Router();

// Submit a new OTS form
router.post(
    '/submitOTS',
    authenticateToken,
    validateRequest(otsFormSchema),
    createOTSForm
);
router.put('/updateOTsform/:id', 
    authenticateToken, 
    updateOTSForm
);
// Get all OTS forms for the logged-in user
router.get(
    '/myforms',
    authenticateToken,
    getUserOTSForms
);

// Get a specific OTS form by ID (for logged-in user)
router.get(
    '/myforms/:id',
    authenticateToken,
    getOTSFormById
);

// (Optional) Get all OTS forms (admin only — apply role middleware if needed)
router.get(
    '/all',
    authenticateToken,
    getAllOTSForms
);

router.get(
    '/otsbybranch',
    authenticateToken,
    getOTSFormsByBranch,
);

router.get(
    '/trackStatus',
    authenticateToken,
    trackStatus
);
router.post(
    '/rejectOTS',
    authenticateToken,
    rejectOtsApplication
);
router.post(
    '/filterOTS',
    authenticateToken,
    filterOTS
);
module.exports = router;
