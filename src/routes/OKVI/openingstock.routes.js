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
router.get('/getOpeningStocks', authenticateOkviToken, getOpeningStocks);
router.put('/updateOpeningStock/:id', authenticateOkviToken, updateOpeningStock);
router.delete('/deleteOpeningStock/:id', authenticateOkviToken, deleteOpeningStock);

// router.post('/filter',authenticateToken, filterOpeningStock);

export default router;
