const express = require('express');
const multer = require('multer');
const router = express.Router();
const orderController = require('../controllers/order.controller');

const storage = multer.memoryStorage();
const upload = multer({ storage });

router.post('/uploadOrder', upload.single('pdf'), orderController.uploadSettlementOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;
