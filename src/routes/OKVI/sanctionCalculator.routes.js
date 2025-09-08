import { Router } from 'express';
import {
  calculateSanctionForClaim,
  getSanctionConfig,
  bulkCalculateSanction
} from '../../controllers/OKVI/sanctionCalculator.controller.js';
import { authenticateOkviToken, authorizeOkviRoles } from '../../middlewares/okviAuth.middleware.js';

const router = Router();

// Get sanction calculation configuration (accessible to all admin roles)
router.get('/config', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), getSanctionConfig);

// Calculate sanction amount for a specific claim (accessible to all admin roles)
router.get('/calculate/:claimId', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), calculateSanctionForClaim);

// Bulk calculate sanction amounts (accessible to all admin roles)
router.post('/bulk-calculate', authenticateOkviToken, authorizeOkviRoles(0, 1, 2), bulkCalculateSanction);

export default router;
