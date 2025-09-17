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
router.get('/getClosingStocks', authenticateOkviToken, getClosingStocks);
router.put('/update/:id', authenticateOkviToken, updateClosingStock);
router.delete('/delete/:id', authenticateOkviToken, deleteClosingStock);

export default router;