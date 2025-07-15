// controllers/OKVI/claimdocuments.controller.js
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import Form1 from '../../models/OKVI/Form1.js';
import FormV from '../../models/OKVI/FormV.js';
import FormVI from '../../models/OKVI/FormVI.js';
import DeclarationCertificate from '../../models/OKVI/DeclarationCertificate.js';
import AuditCertificate from '../../models/OKVI/AuditCertificate.js';
import BankDepositProof from '../../models/OKVI/BankDepositProof.js';
import OpeningStock from '../../models/OKVI/openingstock.js';
import ClosingStock from '../../models/OKVI/closingstock.js';

const getStocks = async (userId, festivalId) => {
  const openingStock = await OpeningStock.findOne({ user: userId, festivalId });
  if (!openingStock) throw new AppError('Opening stock not found', 404);

  const closingStock = await ClosingStock.findOne({ userId, festivalId, openingStockId: openingStock._id });
  if (!closingStock) throw new AppError('Closing stock not found', 404);

  return { openingStock, closingStock };
};
export const createForm1 = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId, subCenterName, subCenterAddress, head, retailSales } = req.body;

  if (!festivalId || !subCenterName || !subCenterAddress || !head || !Array.isArray(retailSales)) {
    return next(new AppError('Missing required fields for Form1', 400));
  }
  const { openingStock, closingStock } = await getStocks(userId, festivalId);
  const form1 = await Form1.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    institutionName: req.user.name,
    address: req.user.address || '',
    festival: openingStock.festivalId?.name || '',
    month: new Date().toLocaleString('default', { month: 'long' }),
    fromDate: openingStock.createdAt,
    toDate: closingStock.createdAt,
    subCenterName,
    subCenterAddress,
    head,
    retailSales,
  });

  res.status(201).json({ status: 'success', data: form1 });
});
export const createFormV = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId, totalSaleAmt, totalRebateAmt, salesRebateDetails } = req.body;
  if (!festivalId || !totalSaleAmt || !totalRebateAmt || !Array.isArray(salesRebateDetails)) {
    return next(new AppError('Missing required fields for FormV', 400));
  }
  const { openingStock, closingStock } = await getStocks(userId, festivalId);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  if (!form1) return next(new AppError('Form1 not found', 404));

  const formV = await FormV.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    FormIId: form1._id,
    institutionName: req.user.name,
    address: req.user.address || '',
    festival: openingStock.festivalId?.name || '',
    month: new Date().toLocaleString('default', { month: 'long' }),
    fromDate: openingStock.createdAt,
    toDate: closingStock.createdAt,
    salesRebateDetails,
    totalSaleAmt,
    totalRebateAmt,
  });

  res.status(201).json({ status: 'success', data: formV });
});

export const createFormVI = catchAsync(async (req, res, next) => {
  const userId = req.user.id;
  const { festivalId, centerWiseSales, totalSaleAmt, totalRebateAmt } = req.body;

  if (!festivalId || !Array.isArray(centerWiseSales)) {
    return next(new AppError('Missing required fields for FormVI', 400));
  }

  const { openingStock, closingStock } = await getStocks(userId, festivalId);
  const form1 = await Form1.findOne({ openingStockId: openingStock._id });
  const formV = await FormV.findOne({ openingStockId: openingStock._id });
  if (!form1 || !formV) return next(new AppError('Required previous forms not found', 404));

  const formVI = await FormVI.create({
    openingStockId: openingStock._id,
    closingStockId: closingStock._id,
    formIId: form1._id,
    FormVId: formV._id,
    institutionName: req.user.name,
    address: req.user.address || '',
    month: new Date().toLocaleString('default', { month: 'long' }),
    centerWiseSales,
    totalSaleAmt,
    totalRebateAmt,
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
