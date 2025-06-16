const express = require('express');
const { createAckForm, getAckFormsByUserId, getAllAckForms, filterAckForms, reuploadAckSignature } = require('../controllers/ack.controller');
const { authenticateToken } = require('../middlewares/auth.middleware');
const validateRequest = require('../middlewares/validateRequest');
const ackFormValidation = require('../validations/ackFormValidation');
const {singlePdfUpload} = require("../middlewares/fileUploadHandler");
const router = express.Router();

router.post(
    '/submitAck',
    authenticateToken,
    singlePdfUpload,
    validateRequest(ackFormValidation),
    createAckForm
);

router.get('/getAckById/:userId', authenticateToken, getAckFormsByUserId);
router.get('/getAllAck', authenticateToken, getAllAckForms);
router.post('/filterAckForms', authenticateToken, filterAckForms);
router.post('/reuploadAck', singlePdfUpload, authenticateToken, reuploadAckSignature);

module.exports = router;
