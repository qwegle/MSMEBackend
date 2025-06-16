const express = require('express');
const multer = require('multer');
const router = express.Router();
const certificateController = require('../controllers/certificate.controller');
const {singlePdfUpload} = require("../middlewares/fileUploadHandler");

router.post('/uploadCertificate', singlePdfUpload, certificateController.uploadCertificateOrder);
router.post('/getCertificateById/:userId', certificateController.getCertificatesByUserId);
router.post('/getAllCertificate', certificateController.getAllCertificateOrders);
router.post('/getCeritificateCount', certificateController.getCertificateOrderCounts);
router.get('/getCertificateCount7Days', certificateController.getCertificateCountsLast7Days);
router.post('/filterCertificates', certificateController.filterCertificateOrders);
router.post('/reuploadCertificate', singlePdfUpload,certificateController.reuploadCertificateOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;




