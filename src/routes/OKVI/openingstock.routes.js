import { Router } from 'express';
import { 
  createOpeningStock, 
  getOpeningStocks, 
  updateOpeningStock, 
  deleteOpeningStock 
} from '../../controllers/OKVI/openingStock.controller.js';
import { authenticateOkviToken } from '../../middlewares/okviAuth.middleware.js';

const router = Router();

router.post('/create', authenticateOkviToken, createOpeningStock);
router.get('/', authenticateOkviToken, getOpeningStocks);
router.put('/:id', authenticateOkviToken, updateOpeningStock);
router.delete('/:id', authenticateOkviToken, deleteOpeningStock);

// router.post('/filter',authenticateToken, filterOpeningStock);

export default router;
