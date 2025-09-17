import { Router } from 'express';
import {
  getPendingClaims,
  getClaimById,
  approveClaim,
  rejectClaim,
  getAdminDashboard
} from '../../controllers/OKVI/admin.controller.js';
import { authenticateOkviToken, authorizeOkviRoles } from '../../middlewares/okviAuth.middleware.js';

const router = Router();

// Admin dashboard (accessible to all admin roles)
router.get('/dashboard', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getAdminDashboard);

// Get pending claims for approval (accessible to all admin roles)
router.get('/claims/pending', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getPendingClaims);

// Get claim details by ID (accessible to all admin roles)
router.get('/claims/:id', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getClaimById);

// Approve claim (accessible to all admin roles)
router.post('/claims/approve', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), approveClaim);

// Reject claim (accessible to all admin roles)
router.post('/claims/reject', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), rejectClaim);

export default router;
