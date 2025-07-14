import ClosingStock from '../models/closingStock.js';
import AppError from '../utils/AppError.js';
import catchAsync from '../utils/catchAsync.js';

const isWithin7Days = (spellEndDate) => {
  const now = new Date();
  const diffInMs = now - new Date(spellEndDate);
  return diffInMs <= 7 * 24 * 60 * 60 * 1000;
};

export const createClosingStock = catchAsync(async (req, res, next) => {
  const { festivalName, head, spellEndDate, subHeads } = req.body;
  const userId = req.user.id;

  if (!isWithin7Days(spellEndDate)) {
    return next(new AppError('Closing stock entry window expired (7-day limit)', 400));
  }

  const calculatedSubHeads = subHeads.map(item => ({
    ...item,
    totalPrice: item.unitPrice * item.quantity
  }));

  const closingStock = await ClosingStock.create({
    festivalName,
    head,
    spellEndDate,
    userId,
    subHeads: calculatedSubHeads
  });

  res.status(201).json({
    status: 'success',
    data: closingStock
  });
});

export const getClosingStocks = catchAsync(async (req, res, next) => {
  const stocks = await ClosingStock.find().populate('userId', 'name email');
  res.status(200).json({
    status: 'success',
    data: stocks
  });
});
