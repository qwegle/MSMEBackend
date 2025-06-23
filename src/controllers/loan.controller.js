const Loan = require('../models/existing_loans');
const catchAsync = require('../utils/catchAsync');
const AppError = require('../utils/AppError');
const mongoose = require('mongoose');

exports.createLoan = catchAsync(async (req, res, next) => {
  const loan = new Loan(req.body);
  await loan.save();
  res.status(201).json({
    message: 'Loan created successfully',
    data: loan,
  });
});

exports.getAllLoans = catchAsync(async (req, res) => {
  const loans = await Loan.find().sort({ createdAt: -1 });
  res.status(200).json({ data: loans });
});

exports.getLoansByCustomerId = catchAsync(async (req, res, next) => {
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

exports.filterLoans = catchAsync(async (req, res) => {
  const {
    loan_id,
    loanType,
    loanStatus,
    customerName,
    minOverdue,
    maxOverdue,
    branch,
    aadharNumber,
  } = req.body;

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

  const loans = await Loan.find(query).sort({ createdAt: -1 });

  res.status(200).json({ data: loans });
});

// Update loan
exports.updateLoan = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.Types.ObjectId.isValid(id)) {
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

// Delete loan
exports.deleteLoan = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.Types.ObjectId.isValid(id)) {
    return next(new AppError('Invalid loan ID', 400));
  }

  const deletedLoan = await Loan.findByIdAndDelete(id);

  if (!deletedLoan) {
    return next(new AppError('Loan not found', 404));
  }

  res.status(200).json({ message: 'Loan deleted successfully' });
});
