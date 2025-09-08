// controllers/OKVI/claimdocuments.controller.js
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import Form1 from '../../models/OKVI/formI.js';
import FormV from '../../models/OKVI/formV.js';
import FormVI from '../../models/OKVI/formVI.js';
import DeclarationCertificate from '../../models/OKVI/declarationCertificate.js';
import AuditCertificate from '../../models/OKVI/auditCertificate.js';
import BankDepositProof from '../../models/OKVI/bankproof.js';
import OpeningStock from '../../models/OKVI/openingstock.js';
import ClosingStock from '../../models/OKVI/closingstock.js';
import Holiday from '../../models/OKVI/holidayFestival.js';
import ClaimApplication from '../../models/OKVI/claimApplication.js';
import OkviAuth from '../../models/OKVI/okviauth.js';

const getStocks = async (userId, festivalId) => {
  const openingStock = await OpeningStock.findOne({ user: userId, festivalId });
  if (!openingStock) throw new AppError('Opening stock not found', 404);

  const closingStock = await ClosingStock.findOne({ userId, festivalId, openingStockId: openingStock._id });
  if (!closingStock) throw new AppError('Closing stock not found', 404);

  return { openingStock, closingStock };
};
const getFestival = async(festivalName) => {
  const currentYear = new Date().getFullYear();
  const festival = await Holiday.findOne({ name: festivalName, year: currentYear });
  if (!festival) {
    throw new AppError(
      `No festival found with name "${festivalName}" in year ${currentYear}`,
      404
    );
  }
  return festival;
};

export const createForm1 = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName, retailSales } = req.body;
  if (
    !festivalName ||
    !Array.isArray(retailSales) ||
    retailSales.length === 0
  ) {
    return next(
      new AppError(
        'festivalName (string) and at least one retailSale entry are required',
        400
      )
    );
  }
  const requiredKeys = [
    'headType',
    'subCenterName',
    'subCenterAddress',
    'billNo',
    'billDate',
    'item',
    'quantity',
    'rate',
    'totalAmount',
  ];
  for (const sale of retailSales) {
    if (!requiredKeys.every((k) => sale[k] != null)) {
      return next(
        new AppError(
          `Each retailSale must include: ${requiredKeys.join(', ')}`,
          400
        )
      );
    }

    if (isNaN(new Date(sale.billDate).getTime())) {
      return next(new AppError('Each sale must have a valid billDate', 400));
    }
  }
  const festival = await getFestival(festivalName);
  const { openingStock, closingStock } = await getStocks(
    userId,
    festival._id
  );
  const form1 = await Form1.create({
    openingStockId:     openingStock._id,
    closingStockId:     closingStock._id,
    institutionName:    req.user.name,
    institutionAddress: req.user.address || '',
    festival:           festivalName,  
    month:              new Date().toLocaleString('default', { month: 'long' }),
    fromDate:           openingStock.createdAt,
    toDate:             closingStock.createdAt,
    retailSales,                                
  });
  res.status(201).json({ status: 'success', data: form1 });
});

export const createFormV = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName, rebateRate } = req.body;
  if (!festivalName || typeof rebateRate !== 'number') {
    return next(new AppError('festivalId and rebateRate (%) are required', 400));
  }
  const festival = await getFestival(festivalName);
  const { openingStock } = await getStocks(userId, festival._id);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) return next(new AppError('Form1 not found', 404));
  const totalSaleAmt = form1.retailSales.reduce((sum, r) => sum + r.totalAmount, 0);
  const totalRebateAmt = Math.round(totalSaleAmt * (rebateRate/100));
  const formV = await FormV.create({
    formIId:form1._id,
    totalSaleAmt,
    totalRebateAmt,
    status: 0
  });
  res.status(201).json({ status: 'success', data: formV });
});
export const createFormVI = catchAsync(async (req, res, next) => {
  const userId       = req.user.id;
  const { festivalName, rebateRate } = req.body;
  if (!festivalName || typeof rebateRate !== 'number') {
    return next(new AppError(
      'festivalName (string) and rebateRate (%) are required',
      400
    ));
  }
  const festival = await getFestival(festivalName);
  const { openingStock } = await getStocks(userId, festival._id);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) {
    return next(new AppError('Form I (retail sales) not found', 404));
  }
  const byCenter = form1.retailSales.reduce((acc, sale) => {
    const key = sale.subCenterName;
    acc[key] = acc[key] || [];
    acc[key].push(sale);
    return acc;
  }, {});
  const centerBreakup = Object.entries(byCenter).map(
    ([subCenterName, entries]) => {
      const totalSaleAmt   = entries.reduce((sum, e) => sum + e.totalAmount, 0);
      const totalRebateAmt = Math.round(totalSaleAmt * (rebateRate / 100));
      return { subCenterName, totalSaleAmt, totalRebateAmt };
    }
  );
  if (centerBreakup.length === 0) {
    return next(new AppError('No retail sales found to build Form VI', 400));
  }
  const formVI = await FormVI.create({
    formIId:form1._id,
    centerBreakup,
  });
  res.status(201).json({ status: 'success', data: formVI });
});
export const createDeclarationCertificate = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId, spellStartDate, spellEndDate } = req.body;
  if (!festivalId || !spellStartDate || !spellEndDate) {
    return next(new AppError('Required fields missing for Declaration Certificate', 400));
  }
  const { openingStock, closingStock } = await getStocks(userId, festivalId);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  const formV = await FormV.findOne({ openingStockId: openingStock._id });
  const formVI = await FormVI.findOne({ openingStockId: openingStock._id });
  if (!form1 || !formV || !formVI) return next(new AppError('All previous forms are required', 404));
  const certificate = await DeclarationCertificate.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    formIId: form1._id,
    formVId: formV._id,
    formVIId: formVI._id,
    khadiInstitutionName: req.user.name,
    address: req.user.address || '',
    month: new Date().toLocaleString('default', { month: 'long' }),
    spellStartDate,
    spellEndDate,
  });
  res.status(201).json({ status: 'success', data: certificate });
});

export const uploadAuditCertificate = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId } = req.body;
  const { file } = req;

  if (!festivalId || !file) return next(new AppError('Festival ID and file are required', 400));

  const { openingStock, closingStock } = await getStocks(userId, festivalId);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  const formV = await FormV.findOne({ openingStockId: openingStock._id });
  const formVI = await FormVI.findOne({ openingStockId: openingStock._id });
  const dc = await DeclarationCertificate.findOne({ openingStockId: openingStock._id });
  if (!form1 || !formV || !formVI || !dc) return next(new AppError('Required forms not submitted', 400));

  const auditCertificate = await AuditCertificate.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    formIId: form1._id,
    formVId: formV._id,
    formVIId: formVI._id,
    dcId: dc._id,
    institutionName: req.user.name,
    address: req.user.address || '',
    festival: openingStock.festivalId?.name || '',
    month: new Date().toLocaleString('default', { month: 'long' }),
    fromDate: openingStock.createdAt,
    toDate: closingStock.createdAt,
    auditCertificateFile: file.path,
  });

  res.status(201).json({ status: 'success', data: auditCertificate });
});

export const uploadBankDepositProof = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId } = req.body;
  const { file } = req;

  if (!festivalId || !file) return next(new AppError('Festival ID and file are required', 400));

  const { openingStock, closingStock } = await getStocks(userId, festivalId);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  const formV = await FormV.findOne({ openingStockId: openingStock._id });
  const formVI = await FormVI.findOne({ openingStockId: openingStock._id });
  const dc = await DeclarationCertificate.findOne({ openingStockId: openingStock._id });
  const ac = await AuditCertificate.findOne({ openingStockId: openingStock._id });
  if (!form1 || !formV || !formVI || !dc || !ac) return next(new AppError('Required forms and certificates not found', 400));

  const proof = await BankDepositProof.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    formIId: form1._id,
    formVId: formV._id,
    formVIId: formVI._id,
    dcId: dc._id,
    acId: ac._id,
    institutionName: req.user.name,
    address: req.user.address || '',
    festival: openingStock.festivalId?.name || '',
    month: new Date().toLocaleString('default', { month: 'long' }),
    fromDate: openingStock.createdAt,
    toDate: closingStock.createdAt,
    depositProofFile: file.path,
  });

  res.status(201).json({ status: 'success', data: proof });
});

// Final submit - creates claim application and submits for approval
export const finalSubmitClaim = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName } = req.body;

  if (!festivalName) {
    return next(new AppError('Festival name is required', 400));
  }

  const festival = await getFestival(festivalName);
  const { openingStock, closingStock } = await getStocks(userId, festival._id);

  // Check if all required documents are submitted
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  const formV = await FormV.findOne({ formIId: form1?._id });
  const formVI = await FormVI.findOne({ formIId: form1?._id });
  const declarationCert = await DeclarationCertificate.findOne({ openingStockId: openingStock._id });
  const auditCert = await AuditCertificate.findOne({ openingStockId: openingStock._id });
  const bankProof = await BankDepositProof.findOne({ openingStockId: openingStock._id });

  if (!form1 || !formV || !formVI || !declarationCert || !auditCert || !bankProof) {
    return next(new AppError('Please submit all required forms and documents before final submission', 400));
  }

  // Check if claim application already exists
  let claimApplication = await ClaimApplication.findOne({
    userId,
    festivalId: festival._id,
    openingStockId: openingStock._id
  });

  if (claimApplication && claimApplication.status !== 'draft') {
    return next(new AppError('Claim application already submitted', 400));
  }

  // Find GMDIC for initial assignment
  const gmdic = await OkviAuth.findOne({ role: 0 });
  if (!gmdic) {
    return next(new AppError('No GMDIC found for approval assignment', 500));
  }

  if (claimApplication) {
    // Update existing draft
    claimApplication = await ClaimApplication.findByIdAndUpdate(
      claimApplication._id,
      {
        formIId: form1._id,
        formVId: formV._id,
        formVIId: formVI._id,
        declarationCertificateId: declarationCert._id,
        auditCertificateId: auditCert._id,
        bankDepositProofId: bankProof._id,
        status: 'submitted',
        submittedAt: new Date(),
        currentApprover: gmdic._id
      },
      { new: true }
    );
  } else {
    // Create new claim application
    claimApplication = await ClaimApplication.create({
      userId,
      festivalId: festival._id,
      openingStockId: openingStock._id,
      closingStockId: closingStock._id,
      formIId: form1._id,
      formVId: formV._id,
      formVIId: formVI._id,
      declarationCertificateId: declarationCert._id,
      auditCertificateId: auditCert._id,
      bankDepositProofId: bankProof._id,
      status: 'submitted',
      submittedAt: new Date(),
      currentApprover: gmdic._id
    });
  }

  res.status(201).json({
    status: 'success',
    message: 'Claim application submitted successfully for approval',
    data: claimApplication
  });
});

// Upload sanction order document (after final approval)
export const uploadSanctionOrder = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { claimId } = req.body;
  const { file } = req;

  if (!claimId || !file) {
    return next(new AppError('Claim ID and sanction order file are required', 400));
  }

  const claimApplication = await ClaimApplication.findOne({
    _id: claimId,
    userId,
    status: 'sanctioned'
  });

  if (!claimApplication) {
    return next(new AppError('Claim not found or not in sanctioned status', 404));
  }

  // Update claim with sanction order file
  const updatedClaim = await ClaimApplication.findByIdAndUpdate(
    claimId,
    {
      sanctionOrderFile: file.path,
      sanctionOrderUploadedAt: new Date(),
      status: 'sanction_order_uploaded'
    },
    { new: true }
  );

  res.status(200).json({
    status: 'success',
    message: 'Sanction order uploaded successfully',
    data: updatedClaim
  });
});

// Get user's claim applications
export const getUserClaims = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { page = 1, limit = 10, status } = req.query;

  const filter = { userId };
  if (status) {
    filter.status = status;
  }

  const skip = (page - 1) * limit;

  const claims = await ClaimApplication.find(filter)
    .populate('festivalId', 'name startDate endDate')
    .populate('openingStockId')
    .populate('closingStockId')
    .populate('approvalHistory.approver', 'name role')
    .sort({ createdAt: -1 })
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

// Get claim application details
export const getClaimDetails = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { id } = req.params;

  const claim = await ClaimApplication.findOne({ _id: id, userId })
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
