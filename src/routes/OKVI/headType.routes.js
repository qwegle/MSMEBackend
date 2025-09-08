import { Router } from 'express';
import {
  createHeadType,
  getHeadTypes,
  updateHeadType,
  deleteHeadType,
  getHeadTypeById
} from '../../controllers/OKVI/headType.controller.js';
import { authenticateOkviToken, authorizeOkviRoles } from '../../middlewares/okviAuth.middleware.js';

const router = Router();

// Get all head types (accessible to all authenticated users)
router.get('/', authenticateOkviToken, getHeadTypes);

// Get head type by ID (accessible to all authenticated users)
router.get('/:id', authenticateOkviToken, getHeadTypeById);

// Create head type (only GMDIC can create)
router.post('/', authenticateOkviToken, authorizeOkviRoles(0), createHeadType);

// Update head type (only GMDIC can update)
router.put('/:id', authenticateOkviToken, authorizeOkviRoles(0), updateHeadType);

// Delete head type (only GMDIC can delete)
router.delete('/:id', authenticateOkviToken, authorizeOkviRoles(0), deleteHeadType);

export default router;
