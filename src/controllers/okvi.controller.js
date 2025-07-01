const Holiday = require('../models/holidayFestival');
const catchAsync = require('../utils/catchAsync');
const AppError = require('../utils/AppError');

exports.createHoliday = catchAsync(async (req, res) => {
  const { name, date, type } = req.body;

  const holiday = await Holiday.create({
    name,
    date,
    type,
    createdBy: req.user?._id
  });

  res.status(201).json({ status: 'success', data: holiday });
});

exports.getHolidays = catchAsync(async (req, res) => {
  const holidays = await Holiday.find().sort({ date: 1 });
  res.status(200).json({ status: 'success', data: holidays });
});

exports.updateHoliday = catchAsync(async (req, res, next) => {
  const { id, name, date, type } = req.body;

  const holiday = await Holiday.findByIdAndUpdate(
    id,
    { name, date, type },
    { new: true, runValidators: true }
  );

  if (!holiday) return next(new AppError('Holiday not found', 404));

  res.status(200).json({ status: 'success', data: holiday });
});

exports.deleteHoliday = catchAsync(async (req, res, next) => {
  const holiday = await Holiday.findByIdAndDelete(req.params.id);
  if (!holiday) return next(new AppError('Holiday not found', 404));
  res.status(204).json({ status: 'success', data: null });
});
