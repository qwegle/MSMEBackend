import { Router } from 'express';
const router = Router();
import { getAllLoans, filterLoans } from '../controllers/OSFC/loan.controller.js';
import { authenticateToken } from '../middlewares/auth.middleware.js';

// router.post('/', loanController.createLoan);
router.get('/getAllLoans', authenticateToken, getAllLoans);
// router.get('/:customerId', loanController.getLoansByCustomerId);
router.post('/filterLoans', authenticateToken, filterLoans);
// router.put('/:id', loanController.updateLoan);
// router.delete('/:id', loanController.deleteLoan);

export default router;

