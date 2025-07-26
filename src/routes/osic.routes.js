import { Router } from 'express';
const router = Router();

import {
  createGovernmentOrder,
  updateGovernmentOrder,
  filterGovernmentOrders,
  createFloatTender,
  updateFloatTender,
  filterFloatTenders,
  createTenderResult,
  updateTenderResult,
  filterTenderResults,
  createSupplyOrder,
  updateSupplyOrder,
  filterSupplyOrders,
  getDashboardCounts,
  getAllTenderResults,
  createSanctionOrder,
  getAllSanctionOrders,
  getSanctionOrderById,
  updateSanctionOrder,
  deleteSanctionOrder
} from '../controllers/OSIC/osic.controller.js';

import {
  authenticateToken,
  authorizeType,
  authorizeRoles
} from '../middlewares/auth.middleware.js';

import {
  supplyOrderUpload,
  validatePdfMagicNumber,
  uploadToCloud,               // ✅ Added Cloudinary upload middleware
  multerErrorHandler
} from '../middlewares/fileUploadHandler.js';

// Government Order Routes
router.post('/createGovernmentOrder', authenticateToken, authorizeRoles(0), authorizeType(3), createGovernmentOrder);
router.put('/updateGovernmentOrder', authenticateToken, authorizeRoles(0), authorizeType(3), updateGovernmentOrder);
router.post('/filterGovernmentOrders', authenticateToken, authorizeRoles(0), authorizeType(3), filterGovernmentOrders);

// Float Tender Routes
router.post('/createFloatTender', authenticateToken, authorizeRoles(0), authorizeType(3), createFloatTender);
router.put('/updateFloatTender', authenticateToken, authorizeRoles(0), authorizeType(3), updateFloatTender);
router.post('/filterFloatTenders', authenticateToken, authorizeRoles(0), authorizeType(3), filterFloatTenders);

// Tender Result Routes
router.post('/createTenderResult', authenticateToken, authorizeRoles(0), authorizeType(3), createTenderResult);
router.put('/updateTenderResult', authenticateToken, authorizeRoles(0), authorizeType(3), updateTenderResult);
router.post('/filterTenderResults', authenticateToken, authorizeRoles(0), authorizeType(3), filterTenderResults);
router.post('/getAllTenderResults', authenticateToken, authorizeRoles(0), authorizeType(3), getAllTenderResults);

// Supply Order Routes (✅ updated)
router.post(
  '/createSupplyOrder',
  supplyOrderUpload,
  validatePdfMagicNumber,
  uploadToCloud,               // ✅ Upload to Cloudinary
  multerErrorHandler,
  authenticateToken,
  authorizeRoles(0),
  authorizeType(3),
  createSupplyOrder
);

router.put('/updateSupplyOrder', authenticateToken, authorizeRoles(0), authorizeType(3), updateSupplyOrder);
router.post('/filterSupplyOrders', authenticateToken, authorizeRoles(0), authorizeType(3), filterSupplyOrders);
router.get('/dashboardCounts', authenticateToken, authorizeRoles(0), authorizeType(3), getDashboardCounts);

// Sanction Order Routes
router.post('/createSanctionOrder', authenticateToken, authorizeRoles(0), authorizeType(3), createSanctionOrder);
router.get('/getAllSanctionOrders', authenticateToken, authorizeRoles(0), authorizeType(3), getAllSanctionOrders);
router.post('/getSanctionOrderById', authenticateToken, authorizeRoles(0), authorizeType(3), getSanctionOrderById);
router.put('/updateSanctionOrder', authenticateToken, authorizeRoles(0), authorizeType(3), updateSanctionOrder);
router.delete('/deleteSanctionOrder/:id', authenticateToken, authorizeRoles(0), authorizeType(3), deleteSanctionOrder);

export default router;
