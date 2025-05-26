const express = require('express');
const { createAckForm, getAckFormsByUserId, getAllAckForms, filterAckForms } = require('../controllers/ack.controller');
const { authenticateToken } = require('../middlewares/auth.middleware');
const validateRequest = require('../middlewares/validateRequest');
const ackFormValidation = require('../validations/ackFormValidation');

const router = express.Router();

router.post(
    '/submitAck',
    authenticateToken,
    validateRequest(ackFormValidation),
    createAckForm
);

router.get('/getAckById/:userId', authenticateToken, getAckFormsByUserId);
router.get('/getAllAck', authenticateToken, getAllAckForms);
router.post('/filterAckForms', authenticateToken, filterAckForms)

module.exports = router;
