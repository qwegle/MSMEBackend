const express = require('express');
const multer = require('multer');
const router = express.Router();
const memorandumController = require('../controllers/memo.controller');
const { authenticateToken, authorizeRoles, authorizeType } = require('../middlewares/auth.middleware');
const {singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,} = require("../middlewares/fileUploadHandler");
router.post('/uploadMemorandum', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authenticateToken,authorizeRoles(1), authorizeType(1), memorandumController.uploadPdf);
router.post('/reuploadMemo', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler, authenticateToken,authorizeRoles(1), authorizeType(1), memorandumController.reuploadMemo);
router.post('/updateMemoStatus', authenticateToken,authorizeRoles(0), authorizeType(1), memorandumController.updateMemoStatus);
router.get('/getMemoById/:userId', authenticateToken, authorizeType(1), memorandumController.getMemosByUserId);
router.post('/filterMemos',authenticateToken, authorizeType(0,1), memorandumController.getAllMemos);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;
