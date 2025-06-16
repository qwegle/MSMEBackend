const express = require('express');
const multer = require('multer');
const router = express.Router();
const orderController = require('../controllers/order.controller');
const {singlePdfUpload} = require("../middlewares/fileUploadHandler");

router.post('/uploadOrder', singlePdfUpload, orderController.uploadSettlementOrder);
router.get('/getOrdersById/:userId', orderController.getSettlementOrdersByUserId);
router.get('/getAllOrders',orderController.listSettlementOrders);
router.post('/filterOrders',orderController.filterSettlementOrders);
router.post('/reuploadOrder',singlePdfUpload,orderController.reuploadSettlementOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;
