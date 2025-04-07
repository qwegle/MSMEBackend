const express = require('express');
const { createAckForm } = require('../controllers/ack.controller');
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

module.exports = router;
