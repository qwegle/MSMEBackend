const express = require('express');
const multer = require('multer');
const router = express.Router();
const certificateController = require('../controllers/certificate.controller');

const storage = multer.memoryStorage();
const upload = multer({ storage });

router.post('/uploadCertificate', upload.single('pdf'), certificateController.uploadCertificateOrder);
router.post('/getCertificateById/:userId', certificateController.getCertificatesByUserId);
router.post('/getAllCertificate', certificateController.getAllCertificateOrders);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;