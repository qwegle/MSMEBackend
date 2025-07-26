import { Router } from 'express';
import {
  createAckForm,
  getAckFormsByUserId,
  getAllAckForms,
  filterAckForms,
  reuploadAckSignature
} from '../controllers/OSFC/ack.controller.js';
import {
  authenticateToken,
  authorizeRoles,
  authorizeType
} from '../middlewares/auth.middleware.js';
import validateRequest from '../middlewares/validateRequest.js';
import ackFormValidation from '../validations/ackFormValidation.js';
import {
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,
  multerErrorHandler
} from '../middlewares/fileUploadHandler.js';

const router = Router();

router.post(
  '/submitAck',
  authenticateToken,
  authorizeRoles(1),
  authorizeType(1),
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,
  multerErrorHandler,
  validateRequest(ackFormValidation),
  createAckForm
);

router.get(
  '/getAckById/:userId',
  authenticateToken,
  authorizeType(1),
  getAckFormsByUserId
);

router.get(
  '/getAllAck',
  authenticateToken,
  authorizeRoles(0),
  authorizeType(1),
  getAllAckForms
);

router.post(
  '/filterAckForms',
  authenticateToken,
  authorizeType(0, 1),
  filterAckForms
);

router.post(
  '/reuploadAck',
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,
  multerErrorHandler,
  authenticateToken,
  authorizeRoles(1),
  authorizeType(1),
  reuploadAckSignature
);

export default router;
