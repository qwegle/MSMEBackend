// import OpeningStock from '../../models/openingStock.js'; 
// import Holiday from '../../models/OKVI/holidayFestival.js'; 
// import catchAsync from '../../utils/catchAsync.js';
// import AppError from '../../utils/AppError.js';

// export const createOpeningStock = catchAsync(async (req, res, next) => {
//   const userId = req.user.id;
//   const { festivalName, head, subHeadDetails } = req.body;

//   if (!festivalName || !head || !Array.isArray(subHeadDetails) || subHeadDetails.length === 0) {
//     return next(new AppError('Festival name, head, and at least one sub head detail are required', 400));
//   }

//   const today = new Date();
//   today.setHours(0, 0, 0, 0);

//   const festival = await Holiday.findOne({ name: festivalName, type: 'Festival' });
//   if (!festival) {
//     return next(new AppError('Festival not found', 404));
//   }

//   const festivalStart = new Date(festival.startDate);
//   const festivalEnd = new Date(festival.endDate);
//   festivalStart.setHours(0, 0, 0, 0);
//   festivalEnd.setHours(0, 0, 0, 0);

//   if (today < festivalStart || today > festivalEnd) {
//     return next(
//       new AppError('Opening stock can only be entered within the festival period', 400)
//     );
//   }

//   const computedSubHeads = subHeadDetails.map((item) => {
//     if (typeof item.unitPrice !== 'number' || typeof item.quantity !== 'number') {
//       throw new AppError('Each sub head must have numeric unitPrice and quantity', 400);
//     }
//     return {
//       ...item,
//       totalPrice: item.unitPrice * item.quantity
//     };
//   });

//   const openingStock = await OpeningStock.create({
//     user: userId,
//     festivalName,
//     head,
//     subHeadDetails: computedSubHeads
//   });

//   res.status(201).json({
//     status: 'success',
//     data: openingStock
//   });
// });

// export const filterOpeningStock = catchAsync(async (req, res, next) => {
//   const {
//     festivalName,
//     head,
//     subHeadName,
//     userId,
//     startDate,
//     endDate,
//     page = 1,
//     limit = 10
//   } = req.body;

//   const filter = {};

//   if (festivalName) {
//     filter.festivalName = { $regex: festivalName, $options: 'i' };
//   }

//   if (head) {
//     filter.head = { $regex: head, $options: 'i' };
//   }

//   if (userId) {
//     filter.user = userId;
//   }

//   if (startDate || endDate) {
//     filter.createdAt = {};
//     if (startDate) filter.createdAt.$gte = new Date(startDate);
//     if (endDate) {
//       const end = new Date(endDate);
//       end.setHours(23, 59, 59, 999);
//       filter.createdAt.$lte = end;
//     }
//   }

//   if (subHeadName) {
//     filter.subHeadDetails = {
//       $elemMatch: {
//         subHeadName: { $regex: subHeadName, $options: 'i' }
//       }
//     };
//   }

//   const skip = (page - 1) * limit;
//   const [results, total] = await Promise.all([
//     OpeningStock.find(filter)
//       .sort({ createdAt: -1 })
//       .skip(skip)
//       .limit(Number(limit))
//       .populate('user', 'name email'),
//     OpeningStock.countDocuments(filter)
//   ]);

//   res.status(200).json({
//     status: 'success',
//     total,
//     page: Number(page),
//     limit: Number(limit),
//     results
//   });
// });

import OpeningStock from '../../models/OKVI/openingstock.js';
import Holiday from '../../models/OKVI/holidayFestival.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
export const createOpeningStock = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId, head, subHeadDetails } = req.body;
  if (!festivalId || !head || !Array.isArray(subHeadDetails) || subHeadDetails.length === 0) {
    return next(new AppError('festivalId, head and non empty subHeadDetails array are required', 400));
  }
  const holiday = await Holiday.findById(festivalId);
  if (!holiday) return next(new AppError('Invalid festivalId', 404));
  const exists = await OpeningStock.findOne({ user: userId, festivalId });
  if (exists) {
    return next(new AppError('Opening stock already submitted for this festival', 400));
  }
  const opening = await OpeningStock.create({
    user: userId,
    festivalId,
    head,
    subHeadDetails
  });
  res.status(201).json({ status: 'success', data: opening });
});

export const getOpeningStocks = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const stocks = await OpeningStock.find({ user: userId })
    .populate('festivalId', 'name startDate endDate')
    .sort({ createdAt: -1 });
  
  res.status(200).json({
    status: 'success',
    results: stocks.length,
    data: stocks
  });
});

export const updateOpeningStock = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const userId = req.user.id;
  
  const stock = await OpeningStock.findOne({ _id: id, user: userId });
  if (!stock) {
    return next(new AppError('Opening stock not found', 404));
  }

  const updatedStock = await OpeningStock.findByIdAndUpdate(id, req.body, {
    new: true,
    runValidators: true
  });

  res.status(200).json({
    status: 'success',
    data: updatedStock
  });
});

export const deleteOpeningStock = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const userId = req.user.id;
  
  const stock = await OpeningStock.findOne({ _id: id, user: userId });
  if (!stock) {
    return next(new AppError('Opening stock not found', 404));
  }

  await OpeningStock.findByIdAndDelete(id);

  res.status(204).json({
    status: 'success',
    data: null
  });
});

