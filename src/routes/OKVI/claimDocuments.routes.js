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
  getClaimDetails,
  getClaims,
  deleteClaim,
  getFormIs,
  getFormIById,
  deleteFormI,
  getFormVs,
  getFormVById,
  deleteFormV,
  getFormVIs,
  getFormVIById,
  deleteFormVI,
  getDeclarationCertificates,
  getDeclarationCertificateById,
  deleteDeclarationCertificate,
  getAuditCertificates,
  getAuditCertificateById,
  deleteAuditCertificate,
  getBankProofs,
  getBankProofById,
  deleteBankProof,
  getClaimDocumentHeader
} from '../../controllers/OKVI/claimdocuments.controller.js';
import { authenticateOkviToken } from '../../middlewares/okviAuth.middleware.js';
import { upload, uploadToCloud } from '../../middlewares/fileUploadHandler.js';

const router = Router();
router.post('/form-i', authenticateOkviToken, createForm1);
router.post('/form-v', authenticateOkviToken, createFormV);
router.post('/form-vi', authenticateOkviToken, createFormVI);
router.post('/declaration-certificate', authenticateOkviToken, createDeclarationCertificate);
router.post('/upload-audit-certificate', authenticateOkviToken, upload.single('auditFile'), uploadToCloud,  uploadAuditCertificate);
router.post('/upload-bank-deposit-proof', authenticateOkviToken, upload.single('bankProofFile'),uploadToCloud, uploadBankDepositProof);
router.post('/final-submit', authenticateOkviToken, finalSubmitClaim);
router.post('/upload-sanction-order', authenticateOkviToken, upload.single('sanctionOrderFile'),uploadToCloud, uploadSanctionOrder);
router.get('/claims', authenticateOkviToken, getClaims); 
router.get('/my-claims', authenticateOkviToken, getUserClaims);
router.get('/claims/:id', authenticateOkviToken, getClaimDetails);
router.delete('/claims/:id', authenticateOkviToken, deleteClaim);
router.get('/form-i', authenticateOkviToken, getFormIs);
router.get('/form-i/:id', authenticateOkviToken, getFormIById);
router.delete('/form-i/:id', authenticateOkviToken, deleteFormI);
router.get('/form-v', authenticateOkviToken, getFormVs);
router.get('/form-v/:id', authenticateOkviToken, getFormVById);
router.delete('/form-v/:id', authenticateOkviToken, deleteFormV);
router.get('/form-vi', authenticateOkviToken, getFormVIs);
router.get('/form-vi/:id', authenticateOkviToken, getFormVIById);
router.delete('/form-vi/:id', authenticateOkviToken, deleteFormVI);
router.get('/declaration-certificates', authenticateOkviToken, getDeclarationCertificates);
router.get('/declaration-certificate/:id', authenticateOkviToken, getDeclarationCertificateById);
router.delete('/declaration-certificate/:id', authenticateOkviToken, deleteDeclarationCertificate);
router.get('/audit-certificates', authenticateOkviToken, getAuditCertificates);
router.get('/audit-certificate/:id', authenticateOkviToken, getAuditCertificateById);
router.delete('/audit-certificate/:id', authenticateOkviToken, deleteAuditCertificate);
router.get('/bank-proofs', authenticateOkviToken, getBankProofs);
router.get('/bank-proof/:id', authenticateOkviToken, getBankProofById);
router.delete('/bank-proof/:id', authenticateOkviToken, deleteBankProof);

router.get('/getClaimHeader', authenticateOkviToken,getClaimDocumentHeader);// only user

export default router;
