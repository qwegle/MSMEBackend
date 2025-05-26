const express = require('express');
const router = express.Router();
const loanController = require('../controllers/loan.controller');
const { authenticateToken } = require('../middlewares/auth.middleware');

// router.post('/', loanController.createLoan);
router.get('/getAllLoans', authenticateToken, loanController.getAllLoans);
// router.get('/:customerId', loanController.getLoansByCustomerId);
// router.post('/filter', loanController.filterLoans);
// router.put('/:id', loanController.updateLoan);
// router.delete('/:id', loanController.deleteLoan);

module.exports = router;
