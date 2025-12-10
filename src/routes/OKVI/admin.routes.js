import { Router } from 'express';
import {
  getPendingClaims,
  getClaimById,
  approveClaim,
  rejectClaim,
  getAdminDashboard,
  approveForm,
  rejectForm,
  approveAllFormsAndMoveClaim,
  getClaimWithFormStatuses
} from '../../controllers/OKVI/admin.controller.js';
import { authenticateOkviToken, authorizeOkviRoles } from '../../middlewares/okviAuth.middleware.js';

const router = Router();

router.get('/dashboard', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getAdminDashboard);
router.get('/claims/pending', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getPendingClaims);
router.get('/claims/:id', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getClaimById);
router.get('/claims/:id/forms', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getClaimWithFormStatuses);
router.post('/claims/approve', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), approveClaim);
router.post('/claims/reject', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), rejectClaim);
router.post('/forms/approve', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), approveForm);
router.post('/forms/reject', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), rejectForm);
router.post('/claims/approve-and-move', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), approveAllFormsAndMoveClaim);

export default router;
