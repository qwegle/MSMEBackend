import { Router } from 'express';
import {
  createUnitType,
  getUnitTypes,
  updateUnitType,
  deleteUnitType,
  getUnitTypeById
} from '../../controllers/OKVI/unitType.controller.js';
import { authenticateOkviToken, authorizeOkviRoles } from '../../middlewares/okviAuth.middleware.js';

const router = Router();

// Get all unit types (accessible to all authenticated users)
router.get('/', authenticateOkviToken, getUnitTypes);

// Get unit type by ID (accessible to all authenticated users)
router.get('/:id', authenticateOkviToken, getUnitTypeById);

// Create unit type (only GMDIC can create)
router.post('/', authenticateOkviToken, authorizeOkviRoles(0), createUnitType);

// Update unit type (only GMDIC can update)
router.put('/:id', authenticateOkviToken, authorizeOkviRoles(0), updateUnitType);

// Delete unit type (only GMDIC can delete)
router.delete('/:id', authenticateOkviToken, authorizeOkviRoles(0), deleteUnitType);

export default router;
