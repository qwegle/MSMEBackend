const express = require('express');
const {
  createHoliday,
  getHolidays,
  deleteHoliday,
  updateHoliday
} = require('../controllers/holiday.controller'); // corrected the controller name
const {
  authenticateToken,
  authorizeRoles,
  authorizeType
} = require('../middlewares/auth.middleware');

const router = express.Router();
router.get('/getAllHolidays', authenticateToken, getHolidays);
router.post('/createHoliday', authenticateToken, authorizeRoles(0), authorizeType(2), createHoliday);
router.put('/updateHoliday', authenticateToken, authorizeRoles(0), authorizeType(2), updateHoliday);
router.delete('/deleteHoiday', authenticateToken, authorizeRoles(0), authorizeType(2), deleteHoliday);

module.exports = router;
