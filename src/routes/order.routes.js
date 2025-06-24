const express = require('express');
const multer = require('multer');
const router = express.Router();
const orderController = require('../controllers/order.controller');
const { authenticateToken, authorizeRoles } = require('../middlewares/auth.middleware');
const {singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,} = require("../middlewares/fileUploadHandler");

router.post('/uploadOrder', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authenticateToken, authorizeRoles(0),orderController.uploadSettlementOrder);
router.get('/getOrdersById/:userId', orderController.getSettlementOrdersByUserId);
router.get('/getAllOrders',authorizeRoles(0),orderController.listSettlementOrders);
router.post('/filterOrders',orderController.filterSettlementOrders);
router.post('/reuploadOrder',singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authorizeRoles(0),orderController.reuploadSettlementOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;
