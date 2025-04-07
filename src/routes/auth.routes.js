const express = require('express');
const { register, login, logout, protectedRoute, register_OFSC_SuperAdmin, register_OFSC_SubAdmin} = require('../controllers/auth.controller');
const { authenticateToken } = require('../middlewares/auth.middleware');
const router = express.Router();

router.post('/register', register);
router.post('/login', login);
router.post('/register_ofsc_superadmin', register_OFSC_SuperAdmin);
router.post('/register_ofsc_subadmin', register_OFSC_SubAdmin);
router.post('/logout', logout);
router.get('/protected', authenticateToken, protectedRoute);

module.exports = router;
