const express = require('express');
const multer = require('multer');
const router = express.Router();
const orderController = require('../controllers/order.controller');
const { authenticateToken, authorizeRoles, authorizeType } = require('../middlewares/auth.middleware');
const {singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,} = require("../middlewares/fileUploadHandler");

router.post('/uploadOrder', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authenticateToken, authorizeRoles(0), authorizeType(1),orderController.uploadSettlementOrder);
router.get('/getOrdersById/:userId', authorizeType(1), orderController.getSettlementOrdersByUserId);
router.get('/getAllOrders', authorizeRoles(0), authorizeType(1), orderController.listSettlementOrders);
router.post('/filterOrders', authorizeType(0, 1), orderController.filterSettlementOrders);
router.post('/reuploadOrder',singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authorizeRoles(0), authorizeType(1), orderController.reuploadSettlementOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;
