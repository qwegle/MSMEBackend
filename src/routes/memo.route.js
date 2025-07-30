import { Router } from 'express';
const router = Router();

import {
  uploadPdf,
  reuploadMemo,
  updateMemoStatus,
  getMemosByUserId,
  getAllMemos,
  // getAllMemosNE
} from '../controllers/OSFC/memo.controller.js';

import {
  authenticateToken,
  authorizeRoles,
  authorizeType
} from '../middlewares/auth.middleware.js';

import {
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,   
  multerErrorHandler
} from '../middlewares/fileUploadHandler.js';

router.post(
  '/uploadMemorandum',
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,     
  multerErrorHandler,
  authenticateToken,
  authorizeRoles(1),
  authorizeType(1),
  uploadPdf
);

router.post(
  '/reuploadMemo',
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,        
  multerErrorHandler,
  authenticateToken,
  authorizeRoles(1),
  authorizeType(1),
  reuploadMemo
);

router.post(
  '/updateMemoStatus',
  authenticateToken,
  authorizeRoles(0),
  authorizeType(1),
  updateMemoStatus
);

router.get(
  '/getMemoById/:userId',
  authenticateToken,
  authorizeType(1),
  getMemosByUserId
);

router.post(
  '/filterMemos',
  authenticateToken,
  authorizeType(0, 1),
  getAllMemos
);

// router.post(
//   '/filterMemosNE',
//   // authenticateToken,
//   // authorizeType(0, 1),
//   getAllMemosNE
// );

export default router;

