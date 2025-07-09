import Holiday from '../../models/OKVI/hoildayFestival.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';

export const createHoliday = catchAsync(async (req, res, next) => {
  const { name, startDate, endDate, type } = req.body;

  if (!startDate || !endDate || new Date(endDate) < new Date(startDate)) {
    return next(new AppError('Invalid start or end date', 400));
  }

  const holiday = await Holiday.create({
    name,
    startDate,
    endDate,
    type,
    createdBy: req.user?._id,
  });

  res.status(201).json({ status: 'success', data: holiday });
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

  const holiday = await Holiday.findByIdAndUpdate(
    id,
    { name, startDate, endDate, type },
    { new: true, runValidators: true }
  );

  if (!holiday) return next(new AppError('Holiday not found', 404));

  res.status(200).json({ status: 'success', data: holiday });
});

export const deleteHoliday = catchAsync(async (req, res, next) => {
  const holiday = await Holiday.findByIdAndDelete(req.params.id);
  if (!holiday) return next(new AppError('Holiday not found', 404));

  res.status(204).json({ status: 'success', data: null });
});
