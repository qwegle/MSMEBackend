const express = require('express');
const multer = require('multer');
const router = express.Router();
const certificateController = require('../controllers/certificate.controller');
const { authenticateToken, authorizeRoles, authorizeType } = require('../middlewares/auth.middleware');
const {singlePdfUpload,validatePdfMagicNumber,
    multerErrorHandler,} = require("../middlewares/fileUploadHandler");

router.post('/uploadCertificate', singlePdfUpload,validatePdfMagicNumber, multerErrorHandler,authenticateToken, authorizeRoles(0), authorizeType(1),certificateController.uploadCertificateOrder);
router.post('/getCertificateById/:userId', authenticateToken, authorizeType(0,1),  certificateController.getCertificatesByUserId);
router.post('/getAllCertificate', authenticateToken, authorizeRoles(0), authorizeType(1), certificateController.getAllCertificateOrders);
router.post('/getCeritificateCount', authenticateToken, authorizeType(0,1), certificateController.getCertificateOrderCounts);
router.get('/getCertificateCount7Days', authenticateToken, authorizeRoles(0,1), authorizeType(1), certificateController.getCertificateCountsLast7Days);
router.post('/filterCertificates', authenticateToken, authorizeType(0,1), certificateController.filterCertificateOrders);
router.post('/reuploadCertificate', singlePdfUpload, validatePdfMagicNumber, multerErrorHandler, authenticateToken, authorizeRoles(0,1), authorizeType(1), certificateController.reuploadCertificateOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;




