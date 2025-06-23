const express = require('express');
const router = express.Router();
const govController = require('../controllers/osic.controller');
const { supplyOrderUpload, validatePdfMagicNumber, multerErrorHandler} = require('../middlewares/fileUploadHandler');
// Government Order Routes
router.post('/createGovernmentOrder', authenticateToken, govController.createGovernmentOrder);
router.put('/updateGovernmentOrder', authenticateToken, govController.updateGovernmentOrder);
router.post('/filterGovernmentOrders',authenticateToken, govController.filterGovernmentOrders);

// Float Tender Routes
router.post('/createFloatTender',authenticateToken, govController.createFloatTender);
router.put('/updateFloatTender', authenticateToken, govController.updateFloatTender);
router.post('/filterFloatTenders', authenticateToken, govController.filterFloatTenders);

// Tender Result Routes
router.post('/createTenderResult',authenticateToken, govController.createTenderResult);
router.put('/updateTenderResult',authenticateToken, govController.updateTenderResult);
router.post('/filterTenderResults',authenticateToken, govController.filterTenderResults);

// Supply Order Routes
router.post('/createSupplyOrder', supplyOrderUpload,validatePdfMagicNumber,multerErrorHandler,authenticateToken, govController.createSupplyOrder);
router.put('/updateSupplyOrder',authenticateToken, govController.updateSupplyOrder);
router.post('/filterSupplyOrders', authenticateToken, govController.filterSupplyOrders);

router.get('/dashboardCounts', authenticateToken, govController.getDashboardCounts);

module.exports = router;
