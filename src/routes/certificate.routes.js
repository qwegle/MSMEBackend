import { Router } from 'express';
import multer from 'multer';
const router = Router();
import { uploadCertificateOrder, getCertificatesByUserId, getAllCertificateOrders, getCertificateOrderCounts, getCertificateCountsLast7Days, filterCertificateOrders, reuploadCertificateOrder } from '../controllers/OSFC/certificate.controller.js';
import { authenticateToken, authorizeRoles, authorizeType } from '../middlewares/auth.middleware.js';
import { singlePdfUpload, validatePdfMagicNumber, multerErrorHandler } from "../middlewares/fileUploadHandler.js";

router.post('/uploadCertificate', singlePdfUpload,validatePdfMagicNumber, multerErrorHandler,authenticateToken, authorizeRoles(0), authorizeType(1),uploadCertificateOrder);
router.post('/getCertificateById/:userId', authenticateToken, authorizeType(0,1),  getCertificatesByUserId);
router.post('/getAllCertificate', authenticateToken, authorizeRoles(0), authorizeType(1), getAllCertificateOrders);
router.post('/getCeritificateCount', authenticateToken, authorizeType(0,1), getCertificateOrderCounts);
router.get('/getCertificateCount7Days', authenticateToken, authorizeRoles(0,1), authorizeType(1), getCertificateCountsLast7Days);
router.post('/filterCertificates', authenticateToken, authorizeType(0,1), filterCertificateOrders);
router.post('/reuploadCertificate', singlePdfUpload, validatePdfMagicNumber, multerErrorHandler, authenticateToken, authorizeRoles(0,1), authorizeType(1), reuploadCertificateOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

export default router;




