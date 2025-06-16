const express = require('express');
const router = express.Router();
const govController = require('../controllers/osic.controller');
const { supplyOrderUpload } = require('../middlewares/fileUploadHandler');
// Government Order Routes
router.post('/createGovernmentOrder', govController.createGovernmentOrder);
router.put('/updateGovernmentOrder', govController.updateGovernmentOrder);
router.post('/filterGovernmentOrders', govController.filterGovernmentOrders);

// Float Tender Routes
router.post('/createFloatTender', govController.createFloatTender);
router.put('/updateFloatTender', govController.updateFloatTender);
router.post('/filterFloatTenders', govController.filterFloatTenders);

// Tender Result Routes
router.post('/createTenderResult', govController.createTenderResult);
router.put('/updateTenderResult', govController.updateTenderResult);
router.post('/filterTenderResults', govController.filterTenderResults);

// Supply Order Routes
router.post('/createSupplyOrder', supplyOrderUpload, govController.createSupplyOrder);
router.put('/updateSupplyOrder', govController.updateSupplyOrder);
router.post('/filterSupplyOrders', govController.filterSupplyOrders);

module.exports = router;
