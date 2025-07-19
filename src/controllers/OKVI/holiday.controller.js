import Holiday from '../../models/OKVI/hoildayFestival.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import mongoose from 'mongoose';
function handleDuplicateKey(err, next) {
  if (err.code === 11000) {
    return next(new AppError('A holiday with that name already exists for this year.', 400));
  }
  return next(err);
}
export const createHoliday = catchAsync(async (req, res, next) => {
  const { name, startDate, endDate, type } = req.body;
  if (!startDate || !endDate || new Date(endDate) < new Date(startDate)) {
    return next(new AppError('Invalid start or end date', 400));
  }
  const year = new Date(startDate).getFullYear();
  try {
    const holiday = await Holiday.create({
      name,
      year,
      startDate,
      endDate,
      type,
      createdBy: req.user._id,
    });
    res.status(201).json({ status: 'success', data: holiday });
  } catch (err) {
    return handleDuplicateKey(err, next);
  }
});
export const getHolidays = catchAsync(async (req, res) => {
  const holidays = await Holiday.find().sort({ startDate: 1 });
  res.status(200).json({ status: 'success', data: holidays });
});
export const updateHoliday = catchAsync(async (req, res, next) => {
  const { id, name, startDate, endDate, type } = req.body;
  if (!startDate || !endDate || new Date(endDate) < new Date(startDate)) {
    return next(new AppError('Invalid start or end date', 400));
  }
  const year = new Date(startDate).getFullYear();
  try {
    const holiday = await Holiday.findByIdAndUpdate(
      id,
      { name, year, startDate, endDate, type },
      {
        new: true,
        runValidators: true,
        context: 'query',
      }
    );
    if (!holiday) {
      return next(new AppError('Holiday not found', 404));
    }
    res.status(200).json({ status: 'success', data: holiday });
  } catch (err) {
    return handleDuplicateKey(err, next);
  }
});
export const deleteHoliday = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid holiday ID', 400));
  }
  const holiday = await Holiday.findByIdAndDelete(id);
  if (!holiday) {
    return next(new AppError('Holiday not found', 404));
  }
  res.status(204).json({ status: 'success', data: null });
});
