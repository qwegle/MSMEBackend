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
import UserOKVI from '../../models/OKVI/okviuserdetails.js';

const isAdminRole = (role) => {
  const r = role ?? null;
  return r === 0 || r === 1 || r === 2;
};

const getStocks = async (userId, festivalId) => {
  const openingStock = await OpeningStock.findOne({ user: userId, festivalId });
  if (!openingStock) throw new AppError('Opening stock not found', 404);

  const closingStock = await ClosingStock.findOne({ userId, festivalId, openingStockId: openingStock._id });
  if (!closingStock) throw new AppError('Closing stock not found', 404);

  return { openingStock, closingStock };
};

const getFestival = async (festivalName) => {
  const currentYear = new Date().getFullYear();
  const festival = await Holiday.findOne({ name: festivalName, year: currentYear });
  if (!festival) {
    throw new AppError(`No festival found with name "${festivalName}" in year ${currentYear}`, 404);
  }
  return festival;
};

// Helpers used by admin/user-scoped listing
const getOpeningStockIdsForUser = async (userId) => {
  const stocks = await OpeningStock.find({ user: userId }, '_id');
  return stocks.map((s) => s._id);
};

const getFormIIdsForOpeningStocks = async (openingStockIds) => {
  const forms = await Form1.find({ openingStockId: { $in: openingStockIds } }, '_id');
  return forms.map((f) => f._id);
};

export const getClaimDocumentHeader = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const userDetails = await UserOKVI.findOne({ user: userId });
  if (!userDetails) {
    return next(new AppError('User details not found', 404));
  }
  const { institutionInfo } = userDetails;
  const openingStock = await OpeningStock.findOne({ user: userId })
    .populate('festivalId')
    .sort({ createdAt: -1 });
  if (!openingStock) {
    return next(new AppError('Opening stock not found', 404));
  }
  const festival = openingStock.festivalId;
  if (!festival) {
    return next(new AppError('Festival not found for opening stock', 404));
  }
  const formatToIST = (date) =>
    new Date(date).toLocaleString('en-IN', {
      timeZone: 'Asia/Kolkata',
      day: '2-digit',
      month: 'long',
      year: 'numeric'
    });
  const header = {
    institutionName: institutionInfo.name,
    address: institutionInfo.address || '',
    festivalName: festival.name,
    startDate: formatToIST(festival.startDate),
    endDate: formatToIST(festival.endDate),
    month: openingStock.createdAt
      ? new Date(openingStock.createdAt).toLocaleString('en-IN', {
          timeZone: 'Asia/Kolkata',
          month: 'long',
          year: 'numeric'
        })
      : new Date().toLocaleString('en-IN', {
          timeZone: 'Asia/Kolkata',
          month: 'long',
          year: 'numeric'
        })
  };
  res.status(200).json({
    status: 'success',
    data: header
  });
});


// --------------------- Form I / Form V / Form VI / Certificates / Proofs - Create / Uploads ---------------------
export const createForm1 = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName, retailSales } = req.body;

  if (!festivalName || !Array.isArray(retailSales) || retailSales.length === 0) {
    return next(new AppError('festivalName (string) and at least one retailSale entry are required', 400));
  }
  const requiredKeys = [
    'headType',
    'subCenterName',
    'subCenterAddress',
    'frombillNo',
    'tobillNo',
    'billDate',
    'retailSalesAmount',
    'rebatePaidAmount'
  ];
  const processedSales = [];
  for (const sale of retailSales) {
    if (!requiredKeys.every((k) => sale[k] != null)) {
      return next(new AppError(`Each retailSale must include: ${requiredKeys.join(', ')}`, 400));
    }
    if (isNaN(new Date(sale.billDate).getTime())) {
      return next(new AppError('Each sale must have a valid billDate', 400));
    }
    const qty = Number(sale.quantity);
    const rate = Number(sale.rate);
    const amount = qty * rate;
    const rebate = Math.round(amount * 0.10);
    processedSales.push({
      headType: sale.headType,
      subCenterName: sale.subCenterName,
      subCenterAddress: sale.subCenterAddress,
      frombillNo: sale.frombillNo,
      billDate: new Date(sale.billDate),
      retailSalesAmount: amount,
      rebatePaidAmount: rebate,
      remarks: sale.remarks || ''
    });
  }

  const festival = await getFestival(festivalName);
  const { openingStock, closingStock } = await getStocks(userId, festival._id);

  const totalSaleAmt = processedSales.reduce((sum, r) => sum + r.retailSalesAmount, 0);
  const totalRebateAmt = processedSales.reduce((sum, r) => sum + r.rebatePaidAmount, 0);

  const form1 = await Form1.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    institutionName: req.user.name,
    institutionAddress: req.user.address || '',
    festival: festivalName,
    month: new Date(openingStock.createdAt).toLocaleString('default', { month: 'long' }),
    fromDate: openingStock.createdAt,
    toDate: closingStock.createdAt,
    retailSales: processedSales,
    totalSaleAmt,
    totalRebateAmt
  });

  res.status(201).json({ status: 'success', data: form1 });
});

export const createFormV = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName, method } = req.body;

  if (!festivalName) {
    return next(new AppError('festivalName is required', 400));
  }
  if (!['get', 'post'].includes(method)) {
    return next(new AppError('Invalid method. Allowed: get | post', 400));
  }

  // get festival + opening stock
  const festival = await getFestival(festivalName);
  const { openingStock } = await getStocks(userId, festival._id);
  if (!openingStock) return next(new AppError('Opening stock not found', 404));

  // get Form1
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) return next(new AppError('Form1 not found', 404));

  const retailSales = Array.isArray(form1.retailSales) ? form1.retailSales : [];
  if (retailSales.length === 0) {
    return next(new AppError('No retail sales found on Form1 to build Form V', 400));
  }

  // check existing Form V
  const existing = await FormV.findOne({ formIId: form1._id });

  // if method === "get"
  if (method === 'get') {
    if (existing) {
      return res.status(200).json({
        status: 'success',
        data: existing,
        message: 'FormV already exists'
      });
    }

    const subheads = retailSales.map((sale) => ({
      headType: sale.headType,
      subCenterName: sale.subCenterName,
      subCenterAddress: sale.subCenterAddress || null,
      frombillNo: sale.frombillNo,
      tobillNo: sale.tobillNo || null,
      billDate: sale.billDate,
      retailSalesAmount: sale.retailSalesAmount,
      rebatePaidAmount: sale.rebatePaidAmount,
      remarks: sale.remarks || null
    }));

    return res.status(200).json({
      status: 'success',
      data: { subheads },
      message: 'FormV does not exist, returning subhead preview only'
    });
  }

  // if method === "post"
  if (method === 'post') {
    if (existing) {
      return res.status(200).json({
        status: 'success',
        data: existing,
        message: 'FormV already exists'
      });
    }

    const totalSaleAmt = retailSales.reduce(
      (sum, sale) => sum + Number(sale.retailSalesAmount || 0),
      0
    );
    const totalRebateAmt = retailSales.reduce(
      (sum, sale) => sum + Number(sale.rebatePaidAmount || 0),
      0
    );

    const formV = await FormV.create({
      formIId: form1._id,
      totalSaleAmt,
      totalRebateAmt,
      createdBy: userId,
      createdAt: new Date()
    });

    const subheads = retailSales.map((sale) => ({
      headType: sale.headType,
      subCenterName: sale.subCenterName,
      subCenterAddress: sale.subCenterAddress || null,
      frombillNo: sale.frombillNo,
      tobillNo: sale.tobillNo || null,
      billDate: sale.billDate,
      retailSalesAmount: sale.retailSalesAmount,
      rebatePaidAmount: sale.rebatePaidAmount,
      remarks: sale.remarks || null
    }));

    return res.status(201).json({
      status: 'success',
      data: { formV, subheads },
      message: 'FormV created successfully'
    });
  }
});

export const createFormVI = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName, method } = req.body;

  if (!festivalName) {
    return next(new AppError('festivalName is required', 400));
  }
  if (!['get', 'post'].includes(method)) {
    return next(new AppError('Invalid method. Allowed: get | post', 400));
  }

  const festival = await getFestival(festivalName);
  const { openingStock } = await getStocks(userId, festival._id);
  if (!openingStock) {
    return next(new AppError('Opening stock not found', 404));
  }

  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) {
    return next(new AppError('Form I (retail sales) not found', 404));
  }

  const retailSales = Array.isArray(form1.retailSales) ? form1.retailSales : [];
  if (retailSales.length === 0) {
    return next(new AppError('No retail sales found to build Form VI', 400));
  }

  // check if already exists
  const existing = await FormVI.findOne({ formIId: form1._id });

  // helper: build breakup by center
  const byCenter = retailSales.reduce((acc, sale) => {
    const key = sale.subCenterName || 'UNKNOWN';
    if (!acc[key]) acc[key] = { entries: [], subCenterAddress: sale.subCenterAddress || null };
    acc[key].entries.push(sale);
    return acc;
  }, {});

  const centerBreakup = Object.entries(byCenter).map(([subCenterName, { entries, subCenterAddress }]) => {
    const totalSaleAmt = entries.reduce((sum, e) => sum + Number(e.retailSalesAmount || 0), 0);
    const totalRebateAmt = entries.reduce((sum, e) => sum + Number(e.rebatePaidAmount || 0), 0);
    const retailSalesArr = entries.map((e) => ({
      headType: e.headType,
      frombillNo: e.frombillNo,
      tobillNo: e.tobillNo || null,
      billDate: e.billDate,
      retailSalesAmount: e.retailSalesAmount,
      rebatePaidAmount: e.rebatePaidAmount,
      remarks: e.remarks || null
    }));
    return {
      subCenterName,
      subCenterAddress,
      totalSaleAmt,
      totalRebateAmt,
      retailSales: retailSalesArr
    };
  });

  // method === "get"
  if (method === 'get') {
    if (existing) {
      return res.status(200).json({
        status: 'success',
        data: existing,
        message: 'FormVI already exists'
      });
    }
    return res.status(200).json({
      status: 'success',
      data: { centerBreakup },
      message: 'FormVI does not exist, returning breakup preview only'
    });
  }

  // method === "post"
  if (method === 'post') {
    if (existing) {
      return res.status(200).json({
        status: 'success',
        data: existing,
        message: 'FormVI already exists'
      });
    }
    const formVI = await FormVI.create({
      formIId: form1._id,
      centerBreakup,
      createdBy: userId,
      createdAt: new Date()
    });

    return res.status(201).json({
      status: 'success',
      data: formVI,
      message: 'FormVI created successfully'
    });
  }
});

export const createDeclarationCertificate = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName } = req.body;
  if (!festivalName) {
    return next(new AppError('festivalName is required', 400));
  }
  const festival = await getFestival(festivalName);
  if (!festival) return next(new AppError('Festival not found', 404));
  const { openingStock, closingStock } = await getStocks(userId, festival._1d || festival._id);
  // Note: getStocks already throws if stocks not found
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) return next(new AppError('Form I not found', 404));
  const formV = await FormV.findOne({ formIId: form1._id });
  const formVI = await FormVI.findOne({ formIId: form1._id });

  if (!formV || !formVI) {
    return next(new AppError('Form V and Form VI are required before creating Declaration Certificate', 400));
  }
  const certificate = await DeclarationCertificate.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    formIId: form1._id,
    formVId: formV._id,
    formVIId: formVI._id,
    khadiInstitutionName: req.user.name,
    address: req.user.address || '',
    festival: festival.name || '',
    month: openingStock.createdAt
      ? new Date(openingStock.createdAt).toLocaleString('default', { month: 'long' })
      : new Date().toLocaleString('default', { month: 'long' }),
    spellStartDate: openingStock.createdAt,
    spellEndDate: closingStock.createdAt
  });

  res.status(201).json({ status: 'success', data: certificate });
});

export const uploadAuditCertificate = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName } = req.body;
  const { file } = req;
  if (!festivalName || !file) {
    return next(new AppError('festivalName and file are required', 400));
  }
  const festival = await getFestival(festivalName);
  if (!festival) return next(new AppError('Festival not found', 404));
  const { openingStock, closingStock } = await getStocks(userId, festival._id);
  if (!openingStock || !closingStock) {
    return next(new AppError('Opening/Closing stock not found for this festival', 404));
  }
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) return next(new AppError('Form I not found', 404));
  const formV = await FormV.findOne({ formIId: form1._id });
  const formVI = await FormVI.findOne({ formIId: form1._id });
  const dc = await DeclarationCertificate.findOne({ formIId: form1._id });
  if (!formV || !formVI || !dc) {
    return next(new AppError('Form V, Form VI and Declaration Certificate are required before uploading Audit Certificate', 400));
  }
  const auditCertificate = await AuditCertificate.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    formIId: form1._id,
    formVId: formV._id,
    formVIId: formVI._id,
    dcId: dc._id,
    institutionName: req.user.name,
    address: req.user.address || '',
    festival: festival.name || '',
    month: openingStock.createdAt
      ? new Date(openingStock.createdAt).toLocaleString('default', { month: 'long' })
      : new Date().toLocaleString('default', { month: 'long' }),
    fromDate: openingStock.createdAt,
    toDate: closingStock.createdAt,
    auditCertificateFile: req.file.url
  });
  res.status(201).json({ status: 'success', data: auditCertificate });
});

export const uploadBankDepositProof = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName } = req.body;
  const { file } = req;
  if (!festivalName || !file) {
    return next(new AppError('festivalName and file are required', 400));
  }
  const festival = await getFestival(festivalName);
  if (!festival) return next(new AppError('Festival not found', 404));
  const { openingStock, closingStock } = await getStocks(userId, festival._id);
  if (!openingStock || !closingStock) {
    return next(new AppError('Opening/Closing stock not found for this festival', 404));
  }
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) return next(new AppError('Form I not found', 404));
  const formV = await FormV.findOne({ formIId: form1._id });
  const formVI = await FormVI.findOne({ formIId: form1._id });
  const dc = await DeclarationCertificate.findOne({ formIId: form1._id });
  const ac = await AuditCertificate.findOne({ formIId: form1._id });

  if (!formV || !formVI || !dc || !ac) {
    return next(new AppError('Form V, Form VI, Declaration Certificate and Audit Certificate are required before uploading Bank Deposit Proof', 400));
  }
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
    festival: festival.name || '',
    month: openingStock.createdAt
      ? new Date(openingStock.createdAt).toLocaleString('default', { month: 'long' })
      : new Date().toLocaleString('default', { month: 'long' }),
    fromDate: openingStock.createdAt,
    toDate: closingStock.createdAt,
    depositProofFile: req.file.url
  });
  res.status(201).json({ status: 'success', data: proof });
});

export const finalSubmitClaim = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalName } = req.body;

  if (!festivalName) {
    return next(new AppError('Festival name is required', 400));
  }
  const festival = await getFestival(festivalName);
  const { openingStock, closingStock } = await getStocks(userId, festival._id);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  const formV = await FormV.findOne({ formIId: form1?._id });
  const formVI = await FormVI.findOne({ formIId: form1?._id });
  const declarationCert = await DeclarationCertificate.findOne({ openingStockId: openingStock._id });
  const auditCert = await AuditCertificate.findOne({ openingStockId: openingStock._id });
  const bankProof = await BankDepositProof.findOne({ openingStockId: openingStock._id });

  if (!form1 || !formV || !formVI || !declarationCert || !auditCert || !bankProof) {
    return next(new AppError('Please submit all required forms and documents before final submission', 400));
  }
  let claimApplication = await ClaimApplication.findOne({
    userId,
    festivalId: festival._id,
    openingStockId: openingStock._id
  });

  if (claimApplication && claimApplication.status !== 'draft') {
    return next(new AppError('Claim application already submitted', 400));
  }
  const gmdic = await OkviAuth.findOne({ role: 0 });
  if (!gmdic) {
    return next(new AppError('No GMDIC found for approval assignment', 500));
  }

  if (claimApplication) {
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

export const uploadSanctionOrder = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { claimId } = req.body;
  const { file } = req;

  if (!claimId || !file) {
    return next(new AppError('Claim ID and sanction order file are required', 400));
  }

  const claimApplication = await ClaimApplication.findOne({ _id: claimId, userId, status: 'sanctioned' });

  if (!claimApplication) {
    return next(new AppError('Claim not found or not in sanctioned status', 404));
  }

  const updatedClaim = await ClaimApplication.findByIdAndUpdate(
    claimId,
    {
      sanctionOrderFile: req.file.url,
      sanctionOrderUploadedAt: new Date(),
      status: 'sanction_order_uploaded'
    },
    { new: true }
  );

  res.status(200).json({ status: 'success', message: 'Sanction order uploaded successfully', data: updatedClaim });
});

export const getClaims = catchAsync(async (req, res) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const page = parseInt(req.query.page, 10) || 1;
  const limit = parseInt(req.query.limit, 10) || 10;
  const status = req.query.status;
  const queryUserId = req.query.userId;
  const skip = (page - 1) * limit;
  const filter = {};
  if (status) filter.status = status;
  if (isAdminRole(userRole)) {
    if (queryUserId) filter.userId = queryUserId;
  } else {
    filter.userId = requesterId;
  }
  const claims = await ClaimApplication.find(filter)
    .populate('festivalId', 'name startDate endDate')
    .populate('openingStockId')
    .populate('closingStockId')
    .populate('approvalHistory.approver', 'name role')
    .sort({ createdAt: -1 })
    .skip(skip)
    .limit(limit);
  const total = await ClaimApplication.countDocuments(filter);

  res.status(200).json({
    status: 'success',
    results: claims.length,
    total,
    page,
    totalPages: Math.ceil(total / limit),
    data: claims
  });
});

export const getUserClaims = getClaims;
export const getClaimDetails = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;
  let findFilter;
  if (isAdminRole(userRole)) {
    findFilter = { _id: id };
  } else {
    findFilter = { _id: id, userId: requesterId };
  }
  const claim = await ClaimApplication.findOne(findFilter)
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
  if (!claim) return next(new AppError('Claim not found or access denied', 404));
  res.status(200).json({ status: 'success', data: claim });
});

export const deleteClaim = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  let filter;
  if (isAdminRole(userRole)) {
    filter = { _id: id };
  } else {
    filter = { _id: id, userId: requesterId };
  }

  const deleted = await ClaimApplication.findOneAndDelete(filter);
  if (!deleted) return next(new AppError('Claim not found or access denied for delete', 404));

  res.status(200).json({ status: 'success', message: 'Claim deleted successfully', data: deleted });
});

// --------------------- GET / DELETE for each form/certificate/proof ---------------------
/* ---------- FORM I ---------- */
export const getFormIs = catchAsync(async (req, res) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const page = parseInt(req.query.page, 10) || 1;
  const limit = parseInt(req.query.limit, 10) || 10;
  const skip = (page - 1) * limit;
  const filter = {};
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }
  const docs = await Form1.find(filter)
    .populate('openingStockId closingStockId')
    .sort({ createdAt: -1 })
    .skip(skip)
    .limit(limit);
  const total = await Form1.countDocuments(filter);
  const transformed = docs.map(doc => ({
    openingStockId: doc.openingStockId?._id ?? doc.openingStockId,
    closingStockId: doc.closingStockId?._id ?? doc.closingStockId,
    institutionName: doc.institutionName,
    institutionAddress: doc.institutionAddress,
    festival: doc.festival,
    month: doc.month,
    fromDate: doc.fromDate,
    toDate: doc.toDate,
    formData: doc.retailSales?.map(sale => ({
      form1_id: doc._id,
      headType: sale.headType,
      subCenterName: sale.subCenterName,
      subCenterAddress: sale.subCenterAddress,
      frombillNo: sale.frombillNo,
      tobillNo: sale.tobillNo,
      billDate: sale.billDate,
      retailSalesAmount: sale.retailSalesAmount,
      rebatePaidAmount: sale.rebatePaidAmount,
      remarks: sale.remarks
    })),
    totalSaleAmt: doc.totalSaleAmt,
    totalRebateAmt: doc.totalRebateAmt,
    createdAt: doc.createdAt,
    __v: doc.__v
  }));

  res.status(200).json({
    status: 'success',
    results: transformed.length,
    total,
    page,
    totalPages: Math.ceil(total / limit),
    data: transformed
  });
});


export const getFormIById = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  if (isAdminRole(userRole)) {
    const doc = await Form1.findById(id).populate('openingStockId').populate('closingStockId');
    if (!doc) return next(new AppError('Form I not found', 404));
    return res.status(200).json({ status: 'success', data: doc });
  }

  const openingStockIds = await getOpeningStockIdsForUser(requesterId);
  const doc = await Form1.findOne({ _id: id, openingStockId: { $in: openingStockIds } }).populate('openingStockId').populate('closingStockId');
  if (!doc) return next(new AppError('Form I not found or access denied', 404));
  res.status(200).json({ status: 'success', data: doc });
});

export const deleteFormI = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  let filter = { _id: id };
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }

  const deleted = await Form1.findOneAndDelete(filter);
  if (!deleted) return next(new AppError('Form I not found or access denied to delete', 404));

  res.status(200).json({ status: 'success', message: 'Form I deleted', data: deleted });
});
export const getFormVs = catchAsync(async (req, res) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const page = parseInt(req.query.page, 10) || 1;
  const limit = parseInt(req.query.limit, 10) || 10;
  const skip = (page - 1) * limit;
  const filter = {};
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    const formIIds = await getFormIIdsForOpeningStocks(openingStockIds);
    filter.formIId = { $in: formIIds };
  }
  const docs = await FormV.find(filter)
    .populate('formIId')
    .sort({ createdAt: -1 })
    .skip(skip)
    .limit(limit);
  const total = await FormV.countDocuments(filter);
  const transformed = docs.map(doc => {
    const formI = doc.formIId;
    return {
      openingStockId: formI?.openingStockId,
      closingStockId: formI?.closingStockId,
      institutionName: formI?.institutionName,
      institutionAddress: formI?.institutionAddress,
      festival: formI?.festival,
      month: formI?.month,
      fromDate: formI?.fromDate,
      toDate: formI?.toDate,
      formData: formI?.retailSales?.map(sale => ({
        form1_id: formI?._id,
        formV_id: doc._id,
        headType: sale.headType,
        subCenterName: sale.subCenterName,
        subCenterAddress: sale.subCenterAddress,
        frombillNo: sale.frombillNo,
        tobillNo: sale.tobillNo,
        billDate: sale.billDate,
        retailSalesAmount: sale.retailSalesAmount,
        rebatePaidAmount: sale.rebatePaidAmount,
        remarks: sale.remarks
      })),
      totalSaleAmt: formI?.totalSaleAmt,
      totalRebateAmt: formI?.totalRebateAmt,
      createdAt: formI?.createdAt,
      __v: formI?.__v,
      totalSaleAmtAll: doc.totalSaleAmt,
      totalRebateAmtAll: doc.totalRebateAmt,
      createdAtFormV: doc.createdAt,
      __vFormV: doc.__v
    };
  });
  res.status(200).json({
    status: 'success',
    results: transformed.length,
    total,
    page,
    totalPages: Math.ceil(total / limit),
    data: transformed.length === 1 ? transformed[0] : transformed
  });
});


export const getFormVById = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  if (isAdminRole(userRole)) {
    const doc = await FormV.findById(id).populate('formIId');
    if (!doc) return next(new AppError('Form V not found', 404));
    return res.status(200).json({ status: 'success', data: doc });
  }

  const openingStockIds = await getOpeningStockIdsForUser(requesterId);
  const formIIds = await getFormIIdsForOpeningStocks(openingStockIds);
  const doc = await FormV.findOne({ _id: id, formIId: { $in: formIIds } }).populate('formIId');
  if (!doc) return next(new AppError('Form V not found or access denied', 404));
  res.status(200).json({ status: 'success', data: doc });
});

export const deleteFormV = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  let filter = { _id: id };
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    const formIIds = await getFormIIdsForOpeningStocks(openingStockIds);
    filter.formIId = { $in: formIIds };
  }

  const deleted = await FormV.findOneAndDelete(filter);
  if (!deleted) return next(new AppError('Form V not found or access denied to delete', 404));
  res.status(200).json({ status: 'success', message: 'Form V deleted', data: deleted });
});

/* ---------- FORM VI ---------- */
export const getFormVIs = catchAsync(async (req, res) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const page = parseInt(req.query.page, 10) || 1;
  const limit = parseInt(req.query.limit, 10) || 10;
  const skip = (page - 1) * limit;

  const filter = {};
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    const formIIds = await getFormIIdsForOpeningStocks(openingStockIds);
    filter.formIId = { $in: formIIds };
  }
  const docs = await FormVI.find(filter)
    .populate('formIId')
    .sort({ createdAt: -1 })
    .skip(skip)
    .limit(limit);
  const total = await FormVI.countDocuments(filter);
  const transformed = docs.map(doc => {
    const formI = doc.formIId;

    return {
      openingStockId: formI?.openingStockId,
      closingStockId: formI?.closingStockId,
      institutionName: formI?.institutionName,
      institutionAddress: formI?.institutionAddress,
      festival: formI?.festival,
      month: formI?.month,
      fromDate: formI?.fromDate,
      toDate: formI?.toDate,
      formData: doc.centerBreakup?.map(center => ({
        form1_id: formI?._id,
        formVI_id: doc._id,
        subCenterName: center.subCenterName,
        totalSaleAmt: center.totalSaleAmt,
        totalRebateAmt: center.totalRebateAmt
      })),
      totalSaleAmt: formI?.totalSaleAmt,
      totalRebateAmt: formI?.totalRebateAmt,
      createdAt: formI?.createdAt,
      __v: formI?.__v,
      createdAtFormVI: doc.createdAt,
      __vFormVI: doc.__v
    };
  });

  res.status(200).json({
    status: 'success',
    results: transformed.length,
    total,
    page,
    totalPages: Math.ceil(total / limit),
    data: transformed
  });
});


export const getFormVIById = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  if (isAdminRole(userRole)) {
    const doc = await FormVI.findById(id).populate('formIId');
    if (!doc) return next(new AppError('Form VI not found', 404));
    return res.status(200).json({ status: 'success', data: doc });
  }

  const openingStockIds = await getOpeningStockIdsForUser(requesterId);
  const formIIds = await getFormIIdsForOpeningStocks(openingStockIds);
  const doc = await FormVI.findOne({ _id: id, formIId: { $in: formIIds } }).populate('formIId');
  if (!doc) return next(new AppError('Form VI not found or access denied', 404));
  res.status(200).json({ status: 'success', data: doc });
});

export const deleteFormVI = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  let filter = { _id: id };
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    const formIIds = await getFormIIdsForOpeningStocks(openingStockIds);
    filter.formIId = { $in: formIIds };
  }

  const deleted = await FormVI.findOneAndDelete(filter);
  if (!deleted) return next(new AppError('Form VI not found or access denied to delete', 404));
  res.status(200).json({ status: 'success', message: 'Form VI deleted', data: deleted });
});

export const getDeclarationCertificates = catchAsync(async (req, res) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const page = parseInt(req.query.page, 10) || 1;
  const limit = parseInt(req.query.limit, 10) || 10;
  const skip = (page - 1) * limit;

  const filter = {};
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }

  const docs = await DeclarationCertificate.find(filter)
    .populate('formIId', '_id')
    .populate('formVId', '_id')
    .populate('formVIId', '_id')
    .populate('openingStockId', '_id')
    .populate('closingStockId', '_id')
    .sort({ createdAt: -1 })
    .skip(skip)
    .limit(limit);

  const formattedDocs = docs.map(doc => {
    const combinedText = doc.declarations.map(d => d.text).join(' ');
    const allAgreed = doc.declarations.every(d => d.agreed === true);

    return {
      _id: doc._id,
      openingStockId: doc.openingStockId,
      closingStockId: doc.closingStockId,
      formIId: doc.formIId,
      formVId: doc.formVId,
      formVIId: doc.formVIId,
      khadiInstitutionName: doc.khadiInstitutionName,
      address: doc.address,
      month: doc.month,
      spellStartDate: doc.spellStartDate,
      spellEndDate: doc.spellEndDate,
      status: doc.status,
      declaration: {
        text: combinedText,
        agreed: allAgreed
      },
      createdAt: doc.createdAt
    };
  });

  const total = await DeclarationCertificate.countDocuments(filter);

  res.status(200).json({
    status: 'success',
    results: formattedDocs.length,
    total,
    page,
    totalPages: Math.ceil(total / limit),
    data: formattedDocs
  });
});


export const getDeclarationCertificateById = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  if (isAdminRole(userRole)) {
    const doc = await DeclarationCertificate.findById(id).populate('formIId formVId formVIId openingStockId closingStockId');
    if (!doc) return next(new AppError('Declaration Certificate not found', 404));
    return res.status(200).json({ status: 'success', data: doc });
  }

  const openingStockIds = await getOpeningStockIdsForUser(requesterId);
  const doc = await DeclarationCertificate.findOne({ _id: id, openingStockId: { $in: openingStockIds } }).populate('formIId formVId formVIId openingStockId closingStockId');
  if (!doc) return next(new AppError('Declaration Certificate not found or access denied', 404));
  res.status(200).json({ status: 'success', data: doc });
});

export const deleteDeclarationCertificate = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  let filter = { _id: id };
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }

  const deleted = await DeclarationCertificate.findOneAndDelete(filter);
  if (!deleted) return next(new AppError('Declaration Certificate not found or access denied to delete', 404));
  res.status(200).json({ status: 'success', message: 'Declaration Certificate deleted', data: deleted });
});

export const getAuditCertificates = catchAsync(async (req, res) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const page = parseInt(req.query.page, 10) || 1;
  const limit = parseInt(req.query.limit, 10) || 10;
  const skip = (page - 1) * limit;

  const filter = {};
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }
  const docs = await AuditCertificate.find(filter)
  .populate('formIId', '_id')
  .populate('formVId', '_id')
  .populate('formVIId', '_id')
  .populate('openingStockId', '_id')
  .populate('closingStockId', '_id')
  .populate('dcId', '_id')
  .sort({ createdAt: -1 })
  .skip(skip)
  .limit(limit);

  const total = await AuditCertificate.countDocuments(filter);
  res.status(200).json({ status: 'success', results: docs.length, total, page, totalPages: Math.ceil(total / limit), data: docs });
});

export const getAuditCertificateById = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  if (isAdminRole(userRole)) {
    const doc = await AuditCertificate.findById(id).populate('formIId formVId formVIId openingStockId closingStockId dcId');
    if (!doc) return next(new AppError('Audit Certificate not found', 404));
    return res.status(200).json({ status: 'success', data: doc });
  }

  const openingStockIds = await getOpeningStockIdsForUser(requesterId);
  const doc = await AuditCertificate.findOne({ _id: id, openingStockId: { $in: openingStockIds } }).populate('formIId formVId formVIId openingStockId closingStockId dcId');
  if (!doc) return next(new AppError('Audit Certificate not found or access denied', 404));
  res.status(200).json({ status: 'success', data: doc });
});

export const deleteAuditCertificate = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  let filter = { _id: id };
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }

  const deleted = await AuditCertificate.findOneAndDelete(filter);
  if (!deleted) return next(new AppError('Audit Certificate not found or access denied to delete', 404));
  res.status(200).json({ status: 'success', message: 'Audit Certificate deleted', data: deleted });
});

export const getBankProofs = catchAsync(async (req, res) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const page = parseInt(req.query.page, 10) || 1;
  const limit = parseInt(req.query.limit, 10) || 10;
  const skip = (page - 1) * limit;

  const filter = {};
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }

  const docs = await BankDepositProof.find(filter) .populate('formIId', '_id')
  .populate('formVId', '_id')
  .populate('formVIId', '_id')
  .populate('openingStockId', '_id')
  .populate('closingStockId', '_id')
  .populate('dcId', '_id')
  .populate('acId', '_id')
  .sort({ createdAt: -1 })
  .skip(skip)
  .limit(limit);
  const total = await BankDepositProof.countDocuments(filter);
  res.status(200).json({ status: 'success', results: docs.length, total, page, totalPages: Math.ceil(total / limit), data: docs });
});

export const getBankProofById = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  if (isAdminRole(userRole)) {
    const doc = await BankDepositProof.findById(id).populate('formIId formVId formVIId openingStockId closingStockId dcId acId');
    if (!doc) return next(new AppError('Bank Deposit Proof not found', 404));
    return res.status(200).json({ status: 'success', data: doc });
  }

  const openingStockIds = await getOpeningStockIdsForUser(requesterId);
  const doc = await BankDepositProof.findOne({ _id: id, openingStockId: { $in: openingStockIds } }).populate('formIId formVId formVIId openingStockId closingStockId dcId acId');
  if (!doc) return next(new AppError('Bank Deposit Proof not found or access denied', 404));
  res.status(200).json({ status: 'success', data: doc });
});

export const deleteBankProof = catchAsync(async (req, res, next) => {
  const requesterId = req.user.id;
  const userRole = req.user.role ?? req.user.user_role ?? null;
  const { id } = req.params;

  let filter = { _id: id };
  if (!isAdminRole(userRole)) {
    const openingStockIds = await getOpeningStockIdsForUser(requesterId);
    filter.openingStockId = { $in: openingStockIds };
  }

  const deleted = await BankDepositProof.findOneAndDelete(filter);
  if (!deleted) return next(new AppError('Bank Deposit Proof not found or access denied to delete', 404));
  res.status(200).json({ status: 'success', message: 'Bank Deposit Proof deleted', data: deleted });
});
