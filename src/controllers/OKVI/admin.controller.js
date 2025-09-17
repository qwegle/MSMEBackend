import ClaimApplication from '../../models/OKVI/claimApplication.js';
import OkviAuth from '../../models/OKVI/okviauth.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import mongoose from 'mongoose';
import { sendEmail } from '../../utils/emailService.js';
import Holiday from '../../models/OKVI/holidayFestival.js';
// Role constants
const ROLES = {
  GMDIC: 0,
  DI: 1,
  ADDL_DIRECTOR: 2
};

const ROLE_NAMES = {
  0: 'GMDIC',
  1: 'DI', 
  2: 'Addl. Director'
};

// Sanction amount calculation configuration
const SANCTION_CONFIG = {
  MAX_SANCTION_LIMIT: 500000, // Maximum sanction amount (₹5 lakhs)
  MIN_SANCTION_AMOUNT: 1000,  // Minimum sanction amount (₹1000)
  SANCTION_CAP_PERCENTAGE: 0.15, // Use 15% of rebate amount as sanction
  PROCESSING_FEE_DEDUCTION: 500 // Processing fee to deduct
};

// Calculate sanction amount based on Form V rebate amount
const calculateSanctionAmount = async (claimId) => {
  try {
    const claim = await ClaimApplication.findById(claimId)
      .populate('formVId');
    
    if (!claim) {
      throw new AppError('Claim application not found', 404);
    }
    
    if (!claim.formVId) {
      throw new AppError('Form V not found for sanction calculation', 404);
    }
    const totalRebateAmount = claim.formVId.totalRebateAmt;
    if (!totalRebateAmount || totalRebateAmount <= 0) {
      throw new AppError('Invalid rebate amount in Form V', 400);
    }
    let calculatedAmount = (totalRebateAmount * SANCTION_CONFIG.SANCTION_CAP_PERCENTAGE) 
                          - SANCTION_CONFIG.PROCESSING_FEE_DEDUCTION;
    calculatedAmount = Math.max(calculatedAmount, SANCTION_CONFIG.MIN_SANCTION_AMOUNT);
    calculatedAmount = Math.min(calculatedAmount, SANCTION_CONFIG.MAX_SANCTION_LIMIT);
    calculatedAmount = Math.round(calculatedAmount);
    console.log(`Sanction calculation for claim ${claimId}:`, {
      totalRebateAmount,
      calculatedAmount,
      appliedCap: SANCTION_CONFIG.SANCTION_CAP_PERCENTAGE,
      processingFee: SANCTION_CONFIG.PROCESSING_FEE_DEDUCTION
    });
    
    return {
      calculatedAmount,
      baseRebateAmount: totalRebateAmount,
      appliedPercentage: SANCTION_CONFIG.SANCTION_CAP_PERCENTAGE,
      processingFeeDeducted: SANCTION_CONFIG.PROCESSING_FEE_DEDUCTION
    };
    
  } catch (error) {
    console.error('Error calculating sanction amount:', error);
    throw error;
  }
};

export const getPendingClaims = catchAsync(async (req, res, next) => {
  const userRole = req.user.user_role;
  const { page = 1, limit = 10, status } = req.query;
  
  let filter = {};
  
  // Filter claims based on user role and status
  switch (userRole) {
    case ROLES.GMDIC:
      filter.status = { $in: ['submitted', 'gmdic_review'] };
      break;
    case ROLES.DI:
      filter.status = { $in: ['gmdic_approved', 'di_review'] };
      break;
    case ROLES.ADDL_DIRECTOR:
      filter.status = { $in: ['di_approved', 'addl_director_review'] };
      break;
    default:
      return next(new AppError('Unauthorized access', 403));
  }

  if (status) {
    filter.status = status;
  }

  const skip = (page - 1) * limit;
  
  const claims = await ClaimApplication.find(filter)
    .populate('userId', 'name email')
    .populate('festivalId', 'name startDate endDate')
    .populate('openingStockId')
    .populate('closingStockId')
    .populate('formIId')
    .populate('formVId')
    .populate('formVIId')
    .populate('declarationCertificateId')
    .populate('auditCertificateId')
    .populate('bankDepositProofId')
    .populate('approvalHistory.approver', 'name email')
    .sort({ submittedAt: -1 })
    .skip(skip)
    .limit(parseInt(limit));

  const total = await ClaimApplication.countDocuments(filter);

  res.status(200).json({
    status: 'success',
    results: claims.length,
    total,
    page: parseInt(page),
    totalPages: Math.ceil(total / limit),
    data: claims
  });
});

// Get claim details by ID
export const getClaimById = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  const claim = await ClaimApplication.findById(id)
    .populate('userId', 'name email address phone')
    .populate('festivalId', 'name startDate endDate')
    .populate('openingStockId')
    .populate('closingStockId')
    .populate('formIId')
    .populate('formVId')
    .populate('formVIId')
    .populate('declarationCertificateId')
    .populate('auditCertificateId')
    .populate('bankDepositProofId')
    .populate('approvalHistory.approver', 'name email role')
    .populate('currentApprover', 'name email role');

  if (!claim) {
    return next(new AppError('Claim not found', 404));
  }

  res.status(200).json({
    status: 'success',
    data: claim
  });
});

// Approve claim (GMDIC -> DI -> Addl. Director workflow)
export const approveClaim = catchAsync(async (req, res, next) => {
  const { id } = req.body;
  const { comments, sanctionAmount } = req.body;
  const userRole = req.user.user_role;
  const userId = req.user.id;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  const claim = await ClaimApplication.findById(id).populate('userId', 'name email');

  if (!claim) {
    return next(new AppError('Claim not found', 404));
  }

  let newStatus;
  let nextApprover = null;

  // Determine next status and approver based on current role
  switch (userRole) {
    case ROLES.GMDIC:
      if (!['submitted', 'gmdic_review'].includes(claim.status)) {
        return next(new AppError('Claim is not in correct status for GMDIC approval', 400));
      }
      newStatus = 'gmdic_approved';
      // Find next DI approver
      const diApprover = await OkviAuth.findOne({ role: ROLES.DI });
      nextApprover = diApprover?._id;
      break;

    case ROLES.DI:
      if (!['gmdic_approved', 'di_review'].includes(claim.status)) {
        return next(new AppError('Claim is not in correct status for DI approval', 400));
      }
      newStatus = 'di_approved';
      // Find next Addl. Director approver
      const addlDirector = await OkviAuth.findOne({ role: ROLES.ADDL_DIRECTOR });
      nextApprover = addlDirector?._id;
      break;

    case ROLES.ADDL_DIRECTOR:
      if (!['di_approved', 'addl_director_review'].includes(claim.status)) {
        return next(new AppError('Claim is not in correct status for Addl. Director approval', 400));
      }
      newStatus = 'sanctioned';
      let finalSanctionAmount = sanctionAmount;
      let calculationDetails = null;
      
      if (!finalSanctionAmount) {
        const calculation = await calculateSanctionAmount(id);
        finalSanctionAmount = calculation.calculatedAmount;
        calculationDetails = calculation;
        
        console.log('Auto-calculated sanction amount:', finalSanctionAmount);
      }
      
      if (!finalSanctionAmount || finalSanctionAmount <= 0) {
        return next(new AppError('Invalid sanction amount calculated or provided', 400));
      }
      
      sanctionAmount = finalSanctionAmount;
      break;

    default:
      return next(new AppError('Unauthorized to approve claims', 403));
  }

  // Add approval to history
  const approvalEntry = {
    approver: userId,
    approverRole: userRole,
    action: 'approved',
    comments: comments || '',
    sanctionAmount: userRole === ROLES.ADDL_DIRECTOR ? sanctionAmount : undefined,
    actionDate: new Date()
  };

  // Update claim
  const updateData = {
    status: newStatus,
    currentApprover: nextApprover,
    $push: { approvalHistory: approvalEntry }
  };

  if (userRole === ROLES.ADDL_DIRECTOR) {
    updateData.finalSanctionAmount = sanctionAmount;
  }

  const updatedClaim = await ClaimApplication.findByIdAndUpdate(
    id,
    updateData,
    { new: true }
  ).populate('userId', 'name email');

  // Send email notification
  try {
    let emailSubject, emailMessage;
    
    if (newStatus === 'sanctioned') {
      emailSubject = 'Claim Application Approved - Sanction Amount Sanctioned';
      emailMessage = `
        Dear ${claim.userId.name},
        
        Your claim application has been approved by all authorities.
        
        Sanction Amount: ₹${sanctionAmount}
        ${calculationDetails ? `
        Calculation Details:
        - Base Rebate Amount: ₹${calculationDetails.baseRebateAmount}
        - Applied Percentage: ${(calculationDetails.appliedPercentage * 100)}%
        - Processing Fee Deducted: ₹${calculationDetails.processingFeeDeducted}
        ` : ''}
        
        Please upload the sanction order document to complete the process.
        
        Best regards,
        OKVI Admin Team
      `;
    } else {
      emailSubject = `Claim Application Approved by ${ROLE_NAMES[userRole]}`;
      emailMessage = `
        Dear ${claim.userId.name},
        
        Your claim application has been approved by ${ROLE_NAMES[userRole]} and forwarded to the next authority for review.
        
        Comments: ${comments || 'No comments'}
        
        Best regards,
        OKVI Admin Team
      `;
    }

    await sendEmail({
      to: claim.userId.email,
      subject: emailSubject,
      text: emailMessage
    });
  } catch (emailError) {
    console.error('Email notification failed:', emailError);
  }

  res.status(200).json({
    status: 'success',
    message: `Claim approved by ${ROLE_NAMES[userRole]}`,
    data: updatedClaim,
    ...(calculationDetails && { calculationDetails })
  });
});

// Reject claim
export const rejectClaim = catchAsync(async (req, res, next) => {
  const { id } = req.body;
  const { comments } = req.body;
  const userRole = req.user.user_role;
  const userId = req.user.id;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  if (!comments || !comments.trim()) {
    return next(new AppError('Rejection reason is required', 400));
  }

  const claim = await ClaimApplication.findById(id).populate('userId', 'name email');

  if (!claim) {
    return next(new AppError('Claim not found', 404));
  }

  // Verify user can reject this claim
  const validStatuses = {
    [ROLES.GMDIC]: ['submitted', 'gmdic_review'],
    [ROLES.DI]: ['gmdic_approved', 'di_review'],
    [ROLES.ADDL_DIRECTOR]: ['di_approved', 'addl_director_review']
  };

  if (!validStatuses[userRole] || !validStatuses[userRole].includes(claim.status)) {
    return next(new AppError('Cannot reject claim in current status', 400));
  }

  // Add rejection to history
  const rejectionEntry = {
    approver: userId,
    approverRole: userRole,
    action: 'rejected',
    comments: comments.trim(),
    actionDate: new Date()
  };

  // Update claim status to rejected
  let rejectedStatus;
  switch (userRole) {
    case ROLES.GMDIC:
      rejectedStatus = 'gmdic_rejected';
      break;
    case ROLES.DI:
      rejectedStatus = 'di_rejected';
      break;
    case ROLES.ADDL_DIRECTOR:
      rejectedStatus = 'addl_director_rejected';
      break;
  }

  const updatedClaim = await ClaimApplication.findByIdAndUpdate(
    id,
    {
      status: rejectedStatus,
      rejectionReason: comments.trim(),
      currentApprover: null,
      $push: { approvalHistory: rejectionEntry }
    },
    { new: true }
  ).populate('userId', 'name email');

  // Send rejection email
  try {
    const emailSubject = `Claim Application Rejected by ${ROLE_NAMES[userRole]}`;
    const emailMessage = `
      Dear ${claim.userId.name},
      
      Your claim application has been rejected by ${ROLE_NAMES[userRole]}.
      
      Rejection Reason: ${comments}
      
      Please review and resubmit your application if needed.
      
      Best regards,
      OKVI Admin Team
    `;

    await sendEmail({
      to: claim.userId.email,
      subject: emailSubject,
      text: emailMessage
    });
  } catch (emailError) {
    console.error('Email notification failed:', emailError);
  }

  res.status(200).json({
    status: 'success',
    message: `Claim rejected by ${ROLE_NAMES[userRole]}`,
    data: updatedClaim
  });
});

export const getAdminDashboard = catchAsync(async (req, res) => {
  const userRole = req.user.user_role;
  let pendingCount = 0;
  let approvedCount = 0;
  let rejectedCount = 0;
  switch (userRole) {
    case ROLES.GMDIC:
      pendingCount = await ClaimApplication.countDocuments({
        status: { $in: ['submitted', 'gmdic_review'] }
      });
      approvedCount = await ClaimApplication.countDocuments({
        status: { $in: ['gmdic_approved', 'di_approved', 'addl_director_approved', 'sanctioned'] }
      });
      rejectedCount = await ClaimApplication.countDocuments({
        status: 'gmdic_rejected'
      });
      break;
    case ROLES.DI:
      pendingCount = await ClaimApplication.countDocuments({
        status: { $in: ['gmdic_approved', 'di_review'] }
      });
      approvedCount = await ClaimApplication.countDocuments({
        status: { $in: ['di_approved', 'addl_director_approved', 'sanctioned'] }
      });
      rejectedCount = await ClaimApplication.countDocuments({
        status: 'di_rejected'
      });
      break;
    case ROLES.ADDL_DIRECTOR:
      pendingCount = await ClaimApplication.countDocuments({
        status: { $in: ['di_approved', 'addl_director_review'] }
      });
      approvedCount = await ClaimApplication.countDocuments({
        status: { $in: ['addl_director_approved', 'sanctioned'] }
      });
      rejectedCount = await ClaimApplication.countDocuments({
        status: 'addl_director_rejected'
      });
      break;
  }

  const totalCount = await ClaimApplication.countDocuments({});

  const recentClaims = await ClaimApplication.find({})
    .populate('userId', 'name email')
    .populate('festivalId', 'name')
    .sort({ updatedAt: -1 })
    .limit(10)
    .select('status userId festivalId updatedAt finalSanctionAmount');

  const sanctionAgg = await ClaimApplication.aggregate([
    {
      $match: {
        status: { $in: ['gmdic_approved', 'di_approved', 'addl_director_approved', 'sanctioned'] }
      }
    },
    {
      $group: {
        _id: null,
        totalSanctioned: { $sum: { $ifNull: ['$finalSanctionAmount', 0] } }
      }
    }
  ]);
  const sanctionAmount = (sanctionAgg[0] && sanctionAgg[0].totalSanctioned) || 0;

  const today = new Date();
  const formatDate = date =>
    new Date(date).toLocaleDateString('en-IN', {
      day: '2-digit',
      month: 'short',
      year: 'numeric'
    });

  // Build holidays with status
  const holidays = await Holiday.find().sort({ startDate: 1 }).lean();
  const holidaysWithStatus = holidays.map(holiday => {
    const start = new Date(holiday.startDate);
    const end = new Date(holiday.endDate);

    let status = 0;
    if (today >= start && today <= end) status = 1;
    else if (today > end) status = 2;

    return {
      _id: holiday._id,
      name: holiday.name,
      year: holiday.year,
      status,
      startDate: formatDate(holiday.startDate),
      endDate: formatDate(holiday.endDate)
    };
  });

  // Derive current and upcoming from holidaysWithStatus
  const currentFestival = holidaysWithStatus.find(h => h.status === 1) || null;
  const upcomingHoliday = holidaysWithStatus
    .filter(h => h.status === 0)
    .sort((a, b) => new Date(a.startDate) - new Date(b.startDate))[0] || null;

  const users = await OkviAuth.find().select('_id name email user_role').lean();

  res.status(200).json({
    status: 'success',
    data: {
      statistics: {
        pending: pendingCount,
        approved: approvedCount,
        rejected: rejectedCount,
        total: totalCount
      },
      recentClaims,
      sanctionAmount,
      currentFestival,      // now includes status
      upcomingHoliday,      // now includes status
      users,
      holidays: holidaysWithStatus
    }
  });
});
