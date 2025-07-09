import { Router } from 'express';
import multer from 'multer';
const router = Router();
import { uploadPdf, reuploadMemo, updateMemoStatus, getMemosByUserId, getAllMemos } from '../controllers/OSFC/memo.controller.js';
import { authenticateToken, authorizeRoles, authorizeType } from '../middlewares/auth.middleware.js';
import { singlePdfUpload, validatePdfMagicNumber, multerErrorHandler } from "../middlewares/fileUploadHandler.js";
router.post('/uploadMemorandum', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authenticateToken,authorizeRoles(1), authorizeType(1), uploadPdf);
router.post('/reuploadMemo', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler, authenticateToken,authorizeRoles(1), authorizeType(1), reuploadMemo);
router.post('/updateMemoStatus', authenticateToken,authorizeRoles(0), authorizeType(1), updateMemoStatus);
router.get('/getMemoById/:userId', authenticateToken, authorizeType(1), getMemosByUserId);
router.post('/filterMemos',authenticateToken, authorizeType(0,1), getAllMemos);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

export default router;
