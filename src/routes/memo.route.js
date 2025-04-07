const express = require('express');
const multer = require('multer');
const router = express.Router();
const memorandumController = require('../controllers/memo.controller');

const storage = multer.memoryStorage();
const upload = multer({ storage });

router.post('/uploadMemorandum', upload.single('pdf'), memorandumController.uploadPdf);
router.post('/reuploadMemo', upload.single('pdf'), memorandumController.reuploadMemo);
router.post('/updateMemoStatus', upload.single('pdf'), memorandumController.updateMemoStatus);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

module.exports = router;
