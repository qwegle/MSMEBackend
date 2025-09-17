// import ClosingStock from '../models/closingStock.js';
// import AppError from '../utils/AppError.js';
// import catchAsync from '../utils/catchAsync.js';

// const isWithin7Days = (spellEndDate) => {
//   const now = new Date();
//   const diffInMs = now - new Date(spellEndDate);
//   return diffInMs <= 7 * 24 * 60 * 60 * 1000;
// };

// export const createClosingStock = catchAsync(async (req, res, next) => {
//   const { festivalName, head, spellEndDate, subHeadDetails } = req.body;
//   const userId = req.user.id;

//   if (!isWithin7Days(spellEndDate)) {
//     return next(new AppError('Closing stock entry window expired (7-day limit)', 400));
//   }

//   const calculatedsubHeadDetails = subHeadDetails.map(item => ({
//     ...item,
//     totalPrice: item.unitPrice * item.quantity
//   }));

//   const closingStock = await ClosingStock.create({
//     festivalName,
//     head,
//     spellEndDate,
//     userId,
//     subHeadDetails: calculatedsubHeadDetails
//   });

//   res.status(201).json({
//     status: 'success',
//     data: closingStock
//   });
// });

// export const getClosingStocks = catchAsync(async (req, res, next) => {
//   const stocks = await ClosingStock.find().populate('userId', 'name email');
//   res.status(200).json({
//     status: 'success',
//     data: stocks
//   });
// });

import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import Holiday from '../../models/OKVI/holidayFestival.js';
import OpeningStock from '../../models/OKVI/openingstock.js';
import ClosingStock from '../../models/OKVI/closingstock.js';
const isWithinAllowedWindow = (spellEndDate) => {
  const now = new Date();
  const end = new Date(spellEndDate);
  if (now <= end) return true;
  const diffInMs = now - end;
  return diffInMs >= 0 && diffInMs <= 7 * 24 * 60 * 60 * 1000;
  };

export const createClosingStock = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId, head, subHeadDetails } = req.body;
  if (!festivalId || !head || !Array.isArray(subHeadDetails) || subHeadDetails.length === 0) {
    return next(new AppError('festivalId, head, and non-empty subHeadDetails array are required', 400));
  }
  const holiday = await Holiday.findById(festivalId);
  if (!holiday) {
    return next(new AppError('Invalid festivalId', 404));
  }

  if (!isWithinAllowedWindow(holiday.endDate)) {
    return next(new AppError('Closing stock entry window expired (allowed only before or within 7 days after spell end date)', 400));
  }
  const opening = await OpeningStock.findOne({ user: userId, festivalId });
  if (!opening) {
    return next(new AppError('Opening stock must be submitted before closing stock', 400));
  }
  const exists = await ClosingStock.findOne({ userId, festivalId });
  if (exists) {
    return next(new AppError('Closing stock already submitted for this festival', 400));
  }
  const closing = await ClosingStock.create({
    userId,
    festivalId,
    openingStockId: opening._id,
    head,
    subHeads: subHeadDetails 
  });

  res.status(201).json({ status: 'success', data: closing });
});

export const getClosingStocks = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const stocks = await ClosingStock.find({ userId }).populate('festivalId', 'name startDate endDate');
  res.status(200).json({
    status: 'success',
    results: stocks.length,
    data: stocks
  });
});

export const updateClosingStock = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const userId = req.user.id;
  
  const stock = await ClosingStock.findOne({ _id: id, userId });
  if (!stock) {
    return next(new AppError('Closing stock not found', 404));
  }

  const updatedStock = await ClosingStock.findByIdAndUpdate(id, req.body, {
    new: true,
    runValidators: true
  });

  res.status(200).json({
    status: 'success',
    data: updatedStock
  });
});

export const deleteClosingStock = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const userId = req.user.id;
  
  const stock = await ClosingStock.findOne({ _id: id, userId });
  if (!stock) {
    return next(new AppError('Closing stock not found', 404));
  }

  await ClosingStock.findByIdAndDelete(id);

  res.status(204).json({
    status: 'success',
    data: null
  });
});
