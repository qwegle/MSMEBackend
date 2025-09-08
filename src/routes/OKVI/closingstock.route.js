import { Router } from 'express';
import { 
  createClosingStock, 
  getClosingStocks, 
  updateClosingStock, 
  deleteClosingStock 
} from '../../controllers/OKVI/closingStock.controller.js';
import { authenticateOkviToken } from '../../middlewares/okviAuth.middleware.js';

const router = Router();

router.post('/create', authenticateOkviToken, createClosingStock);
router.get('/', authenticateOkviToken, getClosingStocks);
router.put('/:id', authenticateOkviToken, updateClosingStock);
router.delete('/:id', authenticateOkviToken, deleteClosingStock);

export default router;