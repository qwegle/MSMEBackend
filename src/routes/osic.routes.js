const express = require('express');
const router = express.Router();
const govController = require('../controllers/osic.controller');
const {authenticateToken, authorizeType, authorizeRoles} = require('../middlewares/auth.middleware');
const { supplyOrderUpload, validatePdfMagicNumber, multerErrorHandler} = require('../middlewares/fileUploadHandler');
// Government Order Routes
router.post('/createGovernmentOrder', authenticateToken, authorizeRoles(0), authorizeType(3), govController.createGovernmentOrder);
router.put('/updateGovernmentOrder', authenticateToken, authorizeRoles(0), authorizeType(3), govController.updateGovernmentOrder);
router.post('/filterGovernmentOrders',authenticateToken, authorizeRoles(0), authorizeType(3), govController.filterGovernmentOrders);

// Float Tender Routes
router.post('/createFloatTender',authenticateToken, authorizeRoles(0), authorizeType(3), govController.createFloatTender);
router.put('/updateFloatTender', authenticateToken, authorizeRoles(0), authorizeType(3), govController.updateFloatTender);
router.post('/filterFloatTenders', authenticateToken, authorizeRoles(0), authorizeType(3), govController.filterFloatTenders);

// Tender Result Routes
router.post('/createTenderResult',authenticateToken, authorizeRoles(0), authorizeType(3), govController.createTenderResult);
router.put('/updateTenderResult',authenticateToken, authorizeRoles(0), authorizeType(3), govController.updateTenderResult);
router.post('/filterTenderResults',authenticateToken, authorizeRoles(0), authorizeType(3), govController.filterTenderResults);

// Supply Order Routes
router.post('/createSupplyOrder', supplyOrderUpload,validatePdfMagicNumber,multerErrorHandler,authenticateToken, authorizeRoles(0), authorizeType(3), govController.createSupplyOrder);
router.put('/updateSupplyOrder',authenticateToken, authorizeRoles(0), authorizeType(3), govController.updateSupplyOrder);
router.post('/filterSupplyOrders', authenticateToken, authorizeRoles(0), authorizeType(3), govController.filterSupplyOrders);

router.get('/dashboardCounts', authenticateToken, authorizeRoles(0), authorizeType(3), govController.getDashboardCounts);

module.exports = router;
