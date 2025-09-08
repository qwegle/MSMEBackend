// Sanction Calculator Controller - For testing and manual calculation
import ClaimApplication from '../../models/OKVI/claimApplication.js';
import FormV from '../../models/OKVI/formV.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import mongoose from 'mongoose';

// Sanction amount calculation configuration
const SANCTION_CONFIG = {
  MAX_SANCTION_LIMIT: 500000, // Maximum sanction amount (₹5 lakhs)
  MIN_SANCTION_AMOUNT: 1000,  // Minimum sanction amount (₹1000)
  SANCTION_CAP_PERCENTAGE: 0.15, // Use 15% of rebate amount as sanction
  PROCESSING_FEE_DEDUCTION: 500 // Processing fee to deduct
};

// Calculate sanction amount for a specific claim (for preview/testing)
export const calculateSanctionForClaim = catchAsync(async (req, res, next) => {
  const { claimId } = req.params;

  if (!mongoose.isValidObjectId(claimId)) {
    return next(new AppError('Invalid claim ID', 400));
  }

  const claim = await ClaimApplication.findById(claimId)
    .populate('formVId')
    .populate('userId', 'name email');

  if (!claim) {
    return next(new AppError('Claim application not found', 404));
  }

  if (!claim.formVId) {
    return next(new AppError('Form V not found for this claim', 404));
  }

  const totalRebateAmount = claim.formVId.totalRebateAmt;

  if (!totalRebateAmount || totalRebateAmount <= 0) {
    return next(new AppError('Invalid rebate amount in Form V', 400));
  }

  // Calculate sanction amount
  let calculatedAmount = (totalRebateAmount * SANCTION_CONFIG.SANCTION_CAP_PERCENTAGE) 
                        - SANCTION_CONFIG.PROCESSING_FEE_DEDUCTION;

  // Apply limits
  const beforeLimits = calculatedAmount;
  calculatedAmount = Math.max(calculatedAmount, SANCTION_CONFIG.MIN_SANCTION_AMOUNT);
  calculatedAmount = Math.min(calculatedAmount, SANCTION_CONFIG.MAX_SANCTION_LIMIT);
  calculatedAmount = Math.round(calculatedAmount);

  const calculation = {
    claimId: claim._id,
    applicantName: claim.userId.name,
    baseRebateAmount: totalRebateAmount,
    appliedPercentage: SANCTION_CONFIG.SANCTION_CAP_PERCENTAGE,
    processingFeeDeducted: SANCTION_CONFIG.PROCESSING_FEE_DEDUCTION,
    calculatedBeforeLimits: Math.round(beforeLimits),
    finalSanctionAmount: calculatedAmount,
    limitApplied: {
      minLimit: calculatedAmount === SANCTION_CONFIG.MIN_SANCTION_AMOUNT,
      maxLimit: calculatedAmount === SANCTION_CONFIG.MAX_SANCTION_LIMIT
    },
    config: SANCTION_CONFIG
  };

  res.status(200).json({
    status: 'success',
    data: calculation
  });
});

// Get sanction calculation configuration
export const getSanctionConfig = catchAsync(async (req, res) => {
  res.status(200).json({
    status: 'success',
      data: {
        config: SANCTION_CONFIG,
        formula: {
          description: 'Sanction Amount = (Rebate Amount × 15%) - Processing Fee',
          steps: [
            '1. Get total rebate amount from Form V',
            '2. Apply 15% of rebate amount',
            '3. Deduct processing fee of ₹500',
            '4. Apply minimum limit of ₹1,000',
            '5. Apply maximum limit of ₹5,00,000',
            '6. Round to nearest rupee'
          ]
        }
      }
  });
});

// Bulk calculate sanction amounts for multiple claims
export const bulkCalculateSanction = catchAsync(async (req, res, next) => {
  const { claimIds } = req.body;

  if (!Array.isArray(claimIds) || claimIds.length === 0) {
    return next(new AppError('Claim IDs array is required', 400));
  }

  const calculations = [];
  const errors = [];

  for (const claimId of claimIds) {
    try {
      if (!mongoose.isValidObjectId(claimId)) {
        errors.push({ claimId, error: 'Invalid claim ID' });
        continue;
      }

      const claim = await ClaimApplication.findById(claimId)
        .populate('formVId')
        .populate('userId', 'name email');

      if (!claim) {
        errors.push({ claimId, error: 'Claim not found' });
        continue;
      }

      if (!claim.formVId) {
        errors.push({ claimId, error: 'Form V not found' });
        continue;
      }

      const totalRebateAmount = claim.formVId.totalRebateAmt;

      if (!totalRebateAmount || totalRebateAmount <= 0) {
        errors.push({ claimId, error: 'Invalid rebate amount' });
        continue;
      }

      // Calculate sanction amount
      let calculatedAmount = (totalRebateAmount * SANCTION_CONFIG.SANCTION_CAP_PERCENTAGE) 
                            - SANCTION_CONFIG.PROCESSING_FEE_DEDUCTION;

      calculatedAmount = Math.max(calculatedAmount, SANCTION_CONFIG.MIN_SANCTION_AMOUNT);
      calculatedAmount = Math.min(calculatedAmount, SANCTION_CONFIG.MAX_SANCTION_LIMIT);
      calculatedAmount = Math.round(calculatedAmount);

      calculations.push({
        claimId: claim._id,
        applicantName: claim.userId.name,
        baseRebateAmount: totalRebateAmount,
        finalSanctionAmount: calculatedAmount
      });

    } catch (error) {
      errors.push({ claimId, error: error.message });
    }
  }

  res.status(200).json({
    status: 'success',
    data: {
      calculations,
      errors,
      summary: {
        totalProcessed: claimIds.length,
        successful: calculations.length,
        failed: errors.length
      }
    }
  });
});
