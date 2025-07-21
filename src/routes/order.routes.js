import { Router } from 'express';
import multer from 'multer';
const router = Router();
import { uploadSettlementOrder, getSettlementOrdersByUserId, listSettlementOrders, filterSettlementOrders, reuploadSettlementOrder } from '../controllers/OSFC/order.controller.js';
import { authenticateToken, authorizeRoles, authorizeType } from '../middlewares/auth.middleware.js';
import { singlePdfUpload, validatePdfMagicNumber, multerErrorHandler } from "../middlewares/fileUploadHandler.js";

router.post('/uploadOrder', singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authenticateToken, authorizeRoles(0), authorizeType(1),uploadSettlementOrder);
router.get('/getOrdersById/:userId', authorizeType(1), getSettlementOrdersByUserId);
router.get('/getAllOrders', authorizeRoles(0), authorizeType(1), listSettlementOrders);
router.post('/filterOrders', filterSettlementOrders);
router.post('/reuploadOrder',singlePdfUpload,validatePdfMagicNumber,multerErrorHandler,authorizeRoles(0), authorizeType(1), reuploadSettlementOrder);
// router.get('/:id', memorandumController.getPdfById);
// router.get('/', memorandumController.listAllPdfs);

export default router;
