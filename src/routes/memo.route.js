const express = require('express');
const multer = require('multer');
const router = express.Router();
const memorandumController = require('../controllers/memo.controller');
const {singlePdfUpload} = require("../middlewares/fileUploadHandler");
router.post('/uploadMemorandum', singlePdfUpload, memorandumController.uploadPdf);
router.post('/reuploadMemo', singlePdfUpload, memorandumController.reuploadMemo);
router.post('/updateMemoStatus', memorandumController.updateMemoStatus);
router.get('/getMemoById/:userId', memorandumController.getMemosByUserId);
router.post('/filterMemos', memorandumController.getAllMemos);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;
