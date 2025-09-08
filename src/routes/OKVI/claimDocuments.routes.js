import { Router } from 'express';
import {
  createForm1,
  createFormV,
  createFormVI,
  createDeclarationCertificate,
  uploadAuditCertificate,
  uploadBankDepositProof,
  finalSubmitClaim,
  uploadSanctionOrder,
  getUserClaims,
  getClaimDetails
} from '../../controllers/OKVI/claimdocuments.controller.js';
import { authenticateOkviToken } from '../../middlewares/okviAuth.middleware.js';
import { upload } from '../../middlewares/fileUploadHandler.js';

const router = Router();

// Form submissions (accessible to regular users)
router.post('/form-i', authenticateOkviToken, createForm1);
router.post('/form-v', authenticateOkviToken, createFormV);
router.post('/form-vi', authenticateOkviToken, createFormVI);
router.post('/declaration-certificate', authenticateOkviToken, createDeclarationCertificate);

// File uploads (accessible to regular users)
router.post('/upload-audit-certificate', authenticateOkviToken, upload.single('auditFile'), uploadAuditCertificate);
router.post('/upload-bank-deposit-proof', authenticateOkviToken, upload.single('bankProofFile'), uploadBankDepositProof);

// Final submission (accessible to regular users)
router.post('/final-submit', authenticateOkviToken, finalSubmitClaim);

// Sanction order upload (accessible to regular users after approval)
router.post('/upload-sanction-order', authenticateOkviToken, upload.single('sanctionOrderFile'), uploadSanctionOrder);

// Get user's claims (accessible to regular users)
router.get('/my-claims', authenticateOkviToken, getUserClaims);

// Get claim details (accessible to regular users)
router.get('/claims/:id', authenticateOkviToken, getClaimDetails);

export default router;
