import { Router } from 'express';
const router = Router();

import {
  uploadSettlementOrder,
  getSettlementOrdersByUserId,
  listSettlementOrders,
  filterSettlementOrders,
  reuploadSettlementOrder
} from '../controllers/OSFC/order.controller.js';

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
  '/uploadOrder',
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,      
  multerErrorHandler,
  authenticateToken,
  authorizeRoles(0),
  authorizeType(1),
  uploadSettlementOrder
);

router.post(
  '/reuploadOrder',
  singlePdfUpload,
  validatePdfMagicNumber,
  uploadToCloud,      
  multerErrorHandler,
  authorizeRoles(0),
  authorizeType(1),
  reuploadSettlementOrder
);

router.get(
  '/getOrdersById/:userId',
  authorizeType(1),
  getSettlementOrdersByUserId
);

router.get(
  '/getAllOrders',
  authorizeRoles(0),
  authorizeType(1),
  listSettlementOrders
);

router.post(
  '/filterOrders',
  filterSettlementOrders
);

export default router;
