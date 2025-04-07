const express = require('express');
const authRoutes = require('./auth.routes');
const userRoutes = require('./user.routes');
const otsRoutes = require('./ots.routes');
const ackRoutes = require('./ack.routes');
const memoRoutes = require('./memo.route');
const orderRoutes = require('./order.routes');
const certificateRoutes = require('./certificate.routes');

const router = express.Router();

router.use('/auth', authRoutes);
router.use('/ots', otsRoutes);
router.use('/users', userRoutes);
router.use('/ack', ackRoutes);
router.use('/memo', memoRoutes);
router.use('/order', orderRoutes);
router.use('/certificate', certificateRoutes);

module.exports = router;
