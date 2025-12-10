import ClaimApplication from '../../models/OKVI/claimApplication.js';
import OkviAuth from '../../models/OKVI/okviauth.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import mongoose from 'mongoose';
import { sendEmail } from '../../utils/emailService.js';
import Holiday from '../../models/OKVI/holidayFestival.js';
import Form1 from '../../models/OKVI/formI.js';
import FormV from '../../models/OKVI/formV.js';
import FormVI from '../../models/OKVI/formVI.js';
import DeclarationCertificate from '../../models/OKVI/declarationCertificate.js';
import AuditCertificate from '../../models/OKVI/auditCertificate.js';
import BankDepositProof from '../../models/OKVI/bankproof.js';
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
  const { id, comments } = req.body;
  let { sanctionAmount } = req.body; // allow reassignment for Addl. Director
  const userRole = req.user.user_role; // 0 = GMDIC, 1 = DI, 2 = Addl. Director
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
  let calculationDetails = null;

  switch (userRole) {
    case 0: // GMDIC
      if (!['submitted', 'gmdic_review'].includes(claim.status)) {
        return next(
          new AppError(
            `Claim is in status "${claim.status}", expected submitted or gmdic_review`,
            400
          )
        );
      }
      newStatus = 'gmdic_approved';
      const diApprover = await OkviAuth.findOne({ role: 1 }); // DI
      nextApprover = diApprover?._id;
      break;

    case 1: // DI
      if (!['gmdic_approved', 'di_review'].includes(claim.status)) {
        return next(
          new AppError(
            `Claim is in status "${claim.status}", expected gmdic_approved or di_review`,
            400
          )
        );
      }
      newStatus = 'di_approved';
      const addlDirector = await OkviAuth.findOne({ role: 2 }); // Addl. Director
      nextApprover = addlDirector?._id;
      break;

    case 2: // Addl. Director
      if (!['di_approved', 'addl_director_review'].includes(claim.status)) {
        return next(
          new AppError(
            `Claim is in status "${claim.status}", expected di_approved or addl_director_review`,
            400
          )
        );
      }
      newStatus = 'sanctioned';
      let finalSanctionAmount = sanctionAmount;

      if (!finalSanctionAmount) {
        const calculation = await calculateSanctionAmount(id);
        finalSanctionAmount = calculation.calculatedAmount;
        calculationDetails = calculation;
        console.log('Auto-calculated sanction amount:', finalSanctionAmount);
      }

      if (!finalSanctionAmount || finalSanctionAmount <= 0) {
        return next(
          new AppError('Invalid sanction amount calculated or provided', 400)
        );
      }

      sanctionAmount = finalSanctionAmount;
      break;

    default:
      return next(new AppError('Unauthorized to approve claims', 403));
  }

  // Approval entry
  const approvalEntry = {
    approver: userId,
    approverRole: userRole,
    action: 'approved',
    comments: comments || '',
    sanctionAmount: userRole === 2 ? sanctionAmount : undefined,
    actionDate: new Date()
  };

  // Update data
  const updateData = {
    status: newStatus,
    currentApprover: nextApprover,
    $push: { approvalHistory: approvalEntry }
  };

  if (userRole === 2) {
    updateData.finalSanctionAmount = sanctionAmount;
  }

  const updatedClaim = await ClaimApplication.findByIdAndUpdate(
    id,
    updateData,
    { new: true }
  ).populate('userId', 'name email');

  // Email notification
  try {
    let emailSubject, emailMessage;

    if (newStatus === 'sanctioned') {
      emailSubject = 'Claim Application Approved - Sanction Amount Sanctioned';
      emailMessage = `
        Dear ${claim.userId.name},

        Your claim application has been approved by all authorities.

        Sanction Amount: ₹${sanctionAmount}
        ${
          calculationDetails
            ? `
        Calculation Details:
        - Base Rebate Amount: ₹${calculationDetails.baseRebateAmount}
        - Applied Percentage: ${
          calculationDetails.appliedPercentage * 100
        }%
        - Processing Fee Deducted: ₹${
          calculationDetails.processingFeeDeducted
        }
        `
            : ''
        }

        Please upload the sanction order document to complete the process.

        Best regards,
        OKVI Admin Team
      `;
    } else {
      const roleName =
        userRole === 0 ? 'GMDIC' : userRole === 1 ? 'DI' : 'Addl. Director';

      emailSubject = `Claim Application Approved by ${roleName}`;
      emailMessage = `
        Dear ${claim.userId.name},

        Your claim application has been approved by ${roleName} and forwarded to the next authority for review.

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
    message: `Claim approved by role ${userRole}`,
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
      currentFestival,
      upcomingHoliday,
      users,
      holidays: holidaysWithStatus
    }
  });
});

const FORM_MODELS = {
  form1: Form1,
  formv: FormV,
  formvi: FormVI,
  declaration: DeclarationCertificate,
  audit: AuditCertificate,
  bank: BankDepositProof
};

const FORM_ID_FIELDS = {
  form1: 'formIId',
  formv: 'formVId',
  formvi: 'formVIId',
  declaration: 'declarationCertificateId',
  audit: 'auditCertificateId',
  bank: 'bankDepositProofId'
};

const FORM_NAMES = {
  form1: 'Form I',
  formv: 'Form V',
  formvi: 'Form VI',
  declaration: 'Declaration Certificate',
  audit: 'Audit Certificate',
  bank: 'Bank Deposit Proof'
};

const checkAllFormsApproved = async (claim, approverRole) => {
  const formIds = [
    { model: Form1, id: claim.formIId, name: 'Form I' },
    { model: FormV, id: claim.formVId, name: 'Form V' },
    { model: FormVI, id: claim.formVIId, name: 'Form VI' },
    { model: DeclarationCertificate, id: claim.declarationCertificateId, name: 'Declaration Certificate' },
    { model: AuditCertificate, id: claim.auditCertificateId, name: 'Audit Certificate' },
    { model: BankDepositProof, id: claim.bankDepositProofId, name: 'Bank Deposit Proof' }
  ];

  const unapprovedForms = [];
  for (const { model, id, name } of formIds) {
    if (!id) {
      unapprovedForms.push(name);
      continue;
    }
    const form = await model.findById(id);
    if (!form || form.approval_status !== 1) {
      unapprovedForms.push(name);
    } else if (form.reviewedByRole !== approverRole) {
      unapprovedForms.push(`${name} (not reviewed at current level)`);
    }
  }
  
  return {
    allApproved: unapprovedForms.length === 0,
    unapprovedForms
  };
};

const getFormsStatus = async (claim) => {
  const forms = [];
  
  if (claim.formIId) {
    const form = await Form1.findById(claim.formIId).populate('approvedBy', 'name email role').lean();
    forms.push({
      name: 'Form I',
      type: 'form1',
      id: form?._id,
      submitted: !!form,
      approval_status: form?.approval_status || 0,
      approvedBy: form?.approvedBy ? { name: form.approvedBy.name, email: form.approvedBy.email, role: ROLE_NAMES[form.reviewedByRole] } : null,
      approvedAt: form?.approvedAt,
      rejectionReason: form?.rejectionReason
    });
  }

  if (claim.formVId) {
    const form = await FormV.findById(claim.formVId).populate('approvedBy', 'name email role').lean();
    forms.push({
      name: 'Form V',
      type: 'formv',
      id: form?._id,
      submitted: !!form,
      approval_status: form?.approval_status || 0,
      approvedBy: form?.approvedBy ? { name: form.approvedBy.name, email: form.approvedBy.email, role: ROLE_NAMES[form.reviewedByRole] } : null,
      approvedAt: form?.approvedAt,
      rejectionReason: form?.rejectionReason,
      totalSaleAmt: form?.totalSaleAmt,
      totalRebateAmt: form?.totalRebateAmt
    });
  }

  if (claim.formVIId) {
    const form = await FormVI.findById(claim.formVIId).populate('approvedBy', 'name email role').lean();
    forms.push({
      name: 'Form VI',
      type: 'formvi',
      id: form?._id,
      submitted: !!form,
      approval_status: form?.approval_status || 0,
      approvedBy: form?.approvedBy ? { name: form.approvedBy.name, email: form.approvedBy.email, role: ROLE_NAMES[form.reviewedByRole] } : null,
      approvedAt: form?.approvedAt,
      rejectionReason: form?.rejectionReason
    });
  }

  if (claim.declarationCertificateId) {
    const form = await DeclarationCertificate.findById(claim.declarationCertificateId).populate('approvedBy', 'name email role').lean();
    forms.push({
      name: 'Declaration Certificate',
      type: 'declaration',
      id: form?._id,
      submitted: !!form,
      approval_status: form?.approval_status || 0,
      approvedBy: form?.approvedBy ? { name: form.approvedBy.name, email: form.approvedBy.email, role: ROLE_NAMES[form.reviewedByRole] } : null,
      approvedAt: form?.approvedAt,
      rejectionReason: form?.rejectionReason
    });
  }

  if (claim.auditCertificateId) {
    const form = await AuditCertificate.findById(claim.auditCertificateId).populate('approvedBy', 'name email role').lean();
    forms.push({
      name: 'Audit Certificate',
      type: 'audit',
      id: form?._id,
      submitted: !!form,
      approval_status: form?.approval_status || 0,
      approvedBy: form?.approvedBy ? { name: form.approvedBy.name, email: form.approvedBy.email, role: ROLE_NAMES[form.reviewedByRole] } : null,
      approvedAt: form?.approvedAt,
      rejectionReason: form?.rejectionReason
    });
  }

  if (claim.bankDepositProofId) {
    const form = await BankDepositProof.findById(claim.bankDepositProofId).populate('approvedBy', 'name email role').lean();
    forms.push({
      name: 'Bank Deposit Proof',
      type: 'bank',
      id: form?._id,
      submitted: !!form,
      approval_status: form?.approval_status || 0,
      approvedBy: form?.approvedBy ? { name: form.approvedBy.name, email: form.approvedBy.email, role: ROLE_NAMES[form.reviewedByRole] } : null,
      approvedAt: form?.approvedAt,
      rejectionReason: form?.rejectionReason
    });
  }

  return forms;
};

export const approveForm = catchAsync(async (req, res, next) => {
  const { claimId, formType, comments } = req.body;
  const userRole = req.user.user_role;
  const userId = req.user.id;

  if (!claimId || !formType) {
    return next(new AppError('claimId and formType are required', 400));
  }

  const formTypeLower = formType.toLowerCase();
  const Model = FORM_MODELS[formTypeLower];
  const idField = FORM_ID_FIELDS[formTypeLower];

  if (!Model || !idField) {
    return next(new AppError('Invalid form type. Valid types: form1, formv, formvi, declaration, audit, bank', 400));
  }

  if (!mongoose.isValidObjectId(claimId)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  const claim = await ClaimApplication.findById(claimId);
  if (!claim) {
    return next(new AppError('Claim not found', 404));
  }

  if (claim.approval_level !== userRole) {
    return next(new AppError(`This claim is not at your approval level. Current level: ${ROLE_NAMES[claim.approval_level]}`, 403));
  }

  const formId = claim[idField];
  if (!formId) {
    return next(new AppError(`${FORM_NAMES[formTypeLower]} not found in this claim`, 404));
  }

  const form = await Model.findById(formId);
  if (!form) {
    return next(new AppError(`${FORM_NAMES[formTypeLower]} not found`, 404));
  }

  if (form.approval_status === 1 && form.reviewedByRole === userRole) {
    return next(new AppError(`${FORM_NAMES[formTypeLower]} is already approved by ${ROLE_NAMES[userRole]}`, 400));
  }

  form.approval_status = 1;
  form.approvedBy = userId;
  form.approvedAt = new Date();
  form.reviewedByRole = userRole;
  form.rejectionReason = null;
  await form.save();

  const approvalCheck = await checkAllFormsApproved(claim, userRole);

  res.status(200).json({
    status: 'success',
    message: `${FORM_NAMES[formTypeLower]} approved successfully`,
    data: {
      formType: formTypeLower,
      approval_status: 1,
      approvedBy: userId,
      approvedAt: form.approvedAt,
      allFormsApproved: approvalCheck.allApproved,
      unapprovedForms: approvalCheck.unapprovedForms
    }
  });
});

export const rejectForm = catchAsync(async (req, res, next) => {
  const { claimId, formType, rejectionReason } = req.body;
  const userRole = req.user.user_role;
  const userId = req.user.id;

  if (!claimId || !formType) {
    return next(new AppError('claimId and formType are required', 400));
  }

  if (!rejectionReason || !rejectionReason.trim()) {
    return next(new AppError('Rejection reason is required', 400));
  }

  const formTypeLower = formType.toLowerCase();
  const Model = FORM_MODELS[formTypeLower];
  const idField = FORM_ID_FIELDS[formTypeLower];

  if (!Model || !idField) {
    return next(new AppError('Invalid form type. Valid types: form1, formv, formvi, declaration, audit, bank', 400));
  }

  if (!mongoose.isValidObjectId(claimId)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  const claim = await ClaimApplication.findById(claimId);
  if (!claim) {
    return next(new AppError('Claim not found', 404));
  }

  if (claim.approval_level !== userRole) {
    return next(new AppError(`This claim is not at your approval level. Current level: ${ROLE_NAMES[claim.approval_level]}`, 403));
  }

  const formId = claim[idField];
  if (!formId) {
    return next(new AppError(`${FORM_NAMES[formTypeLower]} not found in this claim`, 404));
  }

  const form = await Model.findById(formId);
  if (!form) {
    return next(new AppError(`${FORM_NAMES[formTypeLower]} not found`, 404));
  }

  form.approval_status = -1;
  form.approvedBy = userId;
  form.approvedAt = new Date();
  form.reviewedByRole = userRole;
  form.rejectionReason = rejectionReason.trim();
  await form.save();

  res.status(200).json({
    status: 'success',
    message: `${FORM_NAMES[formTypeLower]} rejected`,
    data: {
      formType: formTypeLower,
      approval_status: -1,
      rejectedBy: userId,
      rejectedAt: form.approvedAt,
      rejectionReason: form.rejectionReason
    }
  });
});

export const approveAllFormsAndMoveClaim = catchAsync(async (req, res, next) => {
  const { claimId, comments, sanctionAmount } = req.body;
  const userRole = req.user.user_role;
  const userId = req.user.id;

  if (!claimId) {
    return next(new AppError('claimId is required', 400));
  }

  if (!mongoose.isValidObjectId(claimId)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  const claim = await ClaimApplication.findById(claimId).populate('userId', 'name email');
  if (!claim) {
    return next(new AppError('Claim not found', 404));
  }

  if (claim.approval_level !== userRole) {
    return next(new AppError(`This claim is not at your approval level. Current level: ${ROLE_NAMES[claim.approval_level]}`, 403));
  }

  const approvalCheck = await checkAllFormsApproved(claim, userRole);
  if (!approvalCheck.allApproved) {
    return next(new AppError(`All forms must be approved before moving claim to next level. Unapproved: ${approvalCheck.unapprovedForms.join(', ')}`, 400));
  }

  let newStatus, nextApprover, newApprovalLevel;
  let finalSanctionAmount = null;
  let calculationDetails = null;

  switch (userRole) {
    case ROLES.GMDIC:
      newStatus = 'gmdic_approved';
      newApprovalLevel = ROLES.DI;
      const diUser = await OkviAuth.findOne({ role: ROLES.DI });
      nextApprover = diUser?._id || null;
      break;

    case ROLES.DI:
      newStatus = 'di_approved';
      newApprovalLevel = ROLES.ADDL_DIRECTOR;
      const addlDir = await OkviAuth.findOne({ role: ROLES.ADDL_DIRECTOR });
      nextApprover = addlDir?._id || null;
      break;

    case ROLES.ADDL_DIRECTOR:
      newStatus = 'sanctioned';
      newApprovalLevel = claim.approval_level;
      nextApprover = null;

      if (sanctionAmount) {
        finalSanctionAmount = sanctionAmount;
      } else {
        const calculation = await calculateSanctionAmount(claimId);
        finalSanctionAmount = calculation.calculatedAmount;
        calculationDetails = calculation;
      }
      break;

    default:
      return next(new AppError('Unauthorized to approve claims', 403));
  }

  const approvalEntry = {
    approver: userId,
    approverRole: userRole,
    action: 'approved',
    comments: comments || '',
    sanctionAmount: finalSanctionAmount || undefined,
    actionDate: new Date()
  };

  const updateData = {
    status: newStatus,
    approval_level: newApprovalLevel,
    currentApprover: nextApprover,
    $push: { approvalHistory: approvalEntry }
  };

  if (finalSanctionAmount) {
    updateData.finalSanctionAmount = finalSanctionAmount;
  }

  const updatedClaim = await ClaimApplication.findByIdAndUpdate(claimId, updateData, { new: true }).populate('userId', 'name email');

  try {
    let emailSubject, emailMessage;

    if (newStatus === 'sanctioned') {
      emailSubject = 'Claim Application Sanctioned - OKVI';
      emailMessage = `
        Dear ${claim.userId.name},

        Your claim application has been approved and sanctioned.

        Sanction Amount: Rs. ${finalSanctionAmount}
        ${calculationDetails ? `
        Calculation Details:
        - Base Rebate Amount: Rs. ${calculationDetails.baseRebateAmount}
        - Applied Percentage: ${calculationDetails.appliedPercentage * 100}%
        - Processing Fee Deducted: Rs. ${calculationDetails.processingFeeDeducted}
        ` : ''}

        Please upload the sanction order document to complete the process.

        Best regards,
        OKVI Admin Team
      `;
    } else {
      emailSubject = `Claim Application Approved by ${ROLE_NAMES[userRole]} - OKVI`;
      emailMessage = `
        Dear ${claim.userId.name},

        Your claim application has been approved by ${ROLE_NAMES[userRole]} and forwarded to ${ROLE_NAMES[newApprovalLevel]} for review.

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
    message: `Claim approved by ${ROLE_NAMES[userRole]} and moved to ${newStatus === 'sanctioned' ? 'sanctioned' : ROLE_NAMES[newApprovalLevel]}`,
    data: {
      claim: updatedClaim,
      newStatus,
      newApprovalLevel,
      ...(calculationDetails && { calculationDetails })
    }
  });
});

export const getClaimWithFormStatuses = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const userRole = req.user.user_role;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  const claim = await ClaimApplication.findById(id)
    .populate('userId', 'name email')
    .populate('festivalId', 'name startDate endDate')
    .populate('approvalHistory.approver', 'name email role')
    .populate('currentApprover', 'name email role')
    .lean();

  if (!claim) {
    return next(new AppError('Claim not found', 404));
  }

  const formStatuses = await getFormsStatus(claim);

  let formV = null;
  if (claim.formVId) {
    formV = await FormV.findById(claim.formVId).lean();
  }

  const totals = {
    totalSaleAmt: formV?.totalSaleAmt || 0,
    totalRebateAmt: formV?.totalRebateAmt || 0,
    sanctionAmount: claim.finalSanctionAmount || null
  };

  const allApproved = formStatuses.every(f => f.approval_status === 1);
  const hasRejected = formStatuses.some(f => f.approval_status === -1);

  res.status(200).json({
    status: 'success',
    data: {
      claim: {
        _id: claim._id,
        status: claim.status,
        approval_status: claim.approval_status,
        approval_level: claim.approval_level,
        currentApprover: claim.currentApprover,
        submittedAt: claim.submittedAt,
        approvalHistory: claim.approvalHistory,
        rejectionReason: claim.rejectionReason,
        finalSanctionAmount: claim.finalSanctionAmount
      },
      user: claim.userId,
      festival: claim.festivalId,
      forms: formStatuses,
      totals,
      summary: {
        allFormsApproved: allApproved,
        hasRejectedForms: hasRejected,
        canMoveToNextLevel: allApproved && !hasRejected
      }
    }
  });
});
