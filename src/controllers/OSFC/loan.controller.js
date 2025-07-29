import Loan from '../../models/OSFC/existing_loans.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import { Types } from 'mongoose';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc.js';
import timezone from 'dayjs/plugin/timezone.js';
import { decryptRequestBody, sendEncryptedResponse } from '../../utils/encryption.js';

dayjs.extend(utc);
dayjs.extend(timezone);

// Create loan
export const createLoan = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const loan = new Loan(req.decryptedBody);
    await loan.save();
    sendEncryptedResponse(res, 201, {
      message: 'Loan created successfully',
      data: loan,
    });
  }),
];

// Get all loans
export const getAllLoans = catchAsync(async (req, res) => {
  const loans = await Loan.find().sort({ createdAt: -1 });
  sendEncryptedResponse(res, 200, { data: loans });
});

// Get loans by customer ID
export const getLoansByCustomerId = catchAsync(async (req, res, next) => {
  const { customerId } = req.params;

  if (!customerId) {
    return next(new AppError('Customer ID is required', 400));
  }

  const loans = await Loan.find({ customerId }).sort({ createdAt: -1 });

  if (!loans.length) {
    return next(new AppError('No loans found for this customer.', 404));
  }

  sendEncryptedResponse(res, 200, { data: loans });
});

// Filter loans with pagination
export const filterLoans = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
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
    } = req.decryptedBody;

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

    const paginatedData = loans.map(loan => ({
      ...loan.toObject(),
      createdAtFormatted: dayjs(loan.createdAt)
        .tz('Asia/Kolkata')
        .format('DD/MM/YYYY'),
    }));

    sendEncryptedResponse(res, 200, {
      paginatedData,
      page,
      limit,
      totalItems,
      totalPages,
      previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null,
      currentPageCount: paginatedData.length,
    });
  }),
];

// Update loan
export const updateLoan = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { id } = req.params;

    if (!Types.ObjectId.isValid(id)) {
      return next(new AppError('Invalid loan ID', 400));
    }

    const updatedLoan = await Loan.findByIdAndUpdate(id, req.decryptedBody, {
      new: true,
      runValidators: true,
    });

    if (!updatedLoan) {
      return next(new AppError('Loan not found', 404));
    }

    sendEncryptedResponse(res, 200, {
      message: 'Loan updated successfully',
      data: updatedLoan,
    });
  }),
];

// Delete loan
export const deleteLoan = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!Types.ObjectId.isValid(id)) {
    return next(new AppError('Invalid loan ID', 400));
  }

  const deletedLoan = await Loan.findByIdAndDelete(id);

  if (!deletedLoan) {
    return next(new AppError('Loan not found', 404));
  }

  sendEncryptedResponse(res, 200, { message: 'Loan deleted successfully' });
});
