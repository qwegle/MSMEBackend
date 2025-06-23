const express = require('express');
const { createAckForm, getAckFormsByUserId, getAllAckForms, filterAckForms, reuploadAckSignature } = require('../controllers/ack.controller');
const { authenticateToken, authorizeRoles } = require('../middlewares/auth.middleware');
const validateRequest = require('../middlewares/validateRequest');
const ackFormValidation = require('../validations/ackFormValidation');
const {singlePdfUpload,validatePdfMagicNumber, multerErrorHandler} = require("../middlewares/fileUploadHandler");
const router = express.Router();

router.post(
    '/submitAck',
    authenticateToken,
    singlePdfUpload,
    validatePdfMagicNumber,
    multerErrorHandler,
    validateRequest(ackFormValidation),
    createAckForm
);

router.get('/getAckById/:userId', authenticateToken, getAckFormsByUserId);
router.get('/getAllAck', authenticateToken, authorizeRoles(0), getAllAckForms);
router.post('/filterAckForms', authenticateToken, filterAckForms);
router.post('/reuploadAck', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler, authorizeRoles(1), authenticateToken, reuploadAckSignature);

module.exports = router;
