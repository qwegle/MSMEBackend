import Loan from '../../models/OSFC/existing_loans.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import { Types } from 'mongoose';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc.js';
import timezone from 'dayjs/plugin/timezone.js';
dayjs.extend(utc);
dayjs.extend(timezone);
export const createLoan = catchAsync(async (req, res, next) => {
  const loan = new Loan(req.body);
  await loan.save();
  res.status(201).json({
    message: 'Loan created successfully',
    data: loan,
  });
});

export const getAllLoans = catchAsync(async (req, res) => {
  const loans = await Loan.find().sort({ createdAt: -1 });
  res.status(200).json({ data: loans });
});

export const getLoansByCustomerId = catchAsync(async (req, res, next) => {
  const { customerId } = req.params;

  if (!customerId) {
    return next(new AppError('Customer ID is required', 400));
  }

  const loans = await Loan.find({ customerId }).sort({ createdAt: -1 });

  if (!loans.length) {
    return next(new AppError('No loans found for this customer.', 404));
  }

  res.status(200).json({ data: loans });
});

 export const filterLoans = catchAsync(async (req, res, next) => {
  const {
    loan_id,
    loanType,
    loanStatus,
    customerName,
    minOverdue,
    maxOverdue,
    branch,
    aadharNumber,
    page: rawPage,
    limit: rawLimit,
  } = req.body;

  const page = parseInt(rawPage) || 1;
  const limit = parseInt(rawLimit) || 10;
  const skip = (page - 1) * limit;

  const query = {};

  if (loan_id) query.loanId = loan_id;
  if (loanType) query.loanType = loanType;
  if (loanStatus) query.loanStatus = loanStatus;
  if (aadharNumber) query.aadharNumber = aadharNumber;
  if (branch) query.branch = branch;
  if (customerName) query.customerName = { $regex: new RegExp(customerName, 'i') };

  if (minOverdue !== '' || maxOverdue !== '') {
    query.overdueAmount = {};
    if (minOverdue !== '') query.overdueAmount.$gte = Number(minOverdue);
    if (maxOverdue !== '') query.overdueAmount.$lte = Number(maxOverdue);
  }

  const totalItems = await Loan.countDocuments(query);
  const totalPages = Math.ceil(totalItems / limit);

  const loans = await Loan.find(query)
    .sort({ createdAt: -1 })
    .skip(skip)
    .limit(limit);

  const paginatedData = loans.map(loan => {
    const createdAtFormatted = dayjs(loan.createdAt)
      .tz('Asia/Kolkata')
      .format('DD/MM/YYYY');

    return {
      ...loan.toObject(),
      createdAtFormatted,
    };
  });

  res.status(200).json({
    paginatedData,
    page,
    limit,
    totalItems,
    totalPages,
    previousPage: page > 1 ? page - 1 : null,
    nextPage: page < totalPages ? page + 1 : null,
    currentPageCount: paginatedData.length,
  });
});


export const updateLoan = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!Types.ObjectId.isValid(id)) {
    return next(new AppError('Invalid loan ID', 400));
  }

  const updatedLoan = await Loan.findByIdAndUpdate(id, req.body, {
    new: true,
    runValidators: true,
  });

  if (!updatedLoan) {
    return next(new AppError('Loan not found', 404));
  }

  res.status(200).json({
    message: 'Loan updated successfully',
    data: updatedLoan,
  });
});

export const deleteLoan = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!Types.ObjectId.isValid(id)) {
    return next(new AppError('Invalid loan ID', 400));
  }

  const deletedLoan = await Loan.findByIdAndDelete(id);

  if (!deletedLoan) {
    return next(new AppError('Loan not found', 404));
  }

  res.status(200).json({ message: 'Loan deleted successfully' });
});
