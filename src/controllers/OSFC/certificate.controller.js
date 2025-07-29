import { Types } from 'mongoose';
import AppError from '../../utils/AppError.js';
import catchAsync from '../../utils/catchAsync.js';
import CertificateOrder from '../../models/OSFC/certificate.js';
import OTSForm from '../../models/OSFC/otsform.js';
import Acknowledgement from '../../models/OSFC/acknowledgement.js';
import Memorandum from '../../models/OSFC/memorandum.js';
import SettlementOrder from '../../models/OSFC/settlementOrder.js';
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc.js';
import timezone from 'dayjs/plugin/timezone.js';
import { decryptRequestBody, sendEncryptedResponse } from '../../utils/encryption.js';
dayjs.extend(utc);
dayjs.extend(timezone);
export const uploadCertificateOrder = 
  catchAsync(async (req, res, next) => {
    const fileUrl = req.file?.url;
    if (!fileUrl) return next(new AppError('PDF file is required', 400));
    const { loan_number } = req.decryptedBody;
    if (!loan_number) return next(new AppError('loan_number is required', 400));
    const otsForm = await OTSForm.findOne({ loan_number });
    if (!otsForm) return next(new AppError('OTSForm not found for provided loan_number', 404));
    const ackForm = await Acknowledgement.findOne({ ots_form_id: otsForm._id });
    if (!ackForm) return next(new AppError('AckForm not found for this OTSForm', 404));
    const memo = await Memorandum.findOne({ ackId: ackForm._id });
    if (!memo) return next(new AppError('Memorandum not found for this AckForm', 404));
    const settlement = await SettlementOrder.findOne({ memoId: memo._id });
    if (!settlement) return next(new AppError('Settlement Order not found for this Certificate', 404));
    const existingCertificate = await CertificateOrder.findOne({ otsId: otsForm._id });
    if (existingCertificate) return next(new AppError('Certificate already issued for this Loan Number', 400));
    const newOrder = await CertificateOrder.create({
      userId: otsForm.userId,
      otsId: otsForm._id,
      ackId: ackForm._id,
      memoId: memo._id,
      orderId: settlement._id,
      certificate: fileUrl,
    });
    await OTSForm.findByIdAndUpdate(otsForm._id, { status_msg: 'Completed', status: 1 });
    res.status(201).json({
      message: 'Certificate order uploaded and status updated successfully',
      data: newOrder,
    });
  })
export const reuploadCertificateOrder = 
  catchAsync(async (req, res, next) => {
    const fileUrl = req.file?.url;
    if (!fileUrl) return next(new AppError('PDF file is required.', 400));
    const { loan_number } = req.decryptedBody;
    if (!loan_number) return next(new AppError('loan_number is required.', 400));
    const otsForm = await OTSForm.findOne({ loan_number });
    if (!otsForm) return next(new AppError('OTSForm not found for provided loan_number.', 404));
    const certificate = await CertificateOrder.findOne({ otsId: otsForm._id });
    if (!certificate) return next(new AppError('Certificate not found for this loan_number.', 404));
    certificate.certificate = fileUrl;
    await certificate.save();
    res.status(201).json({
      message: 'Certificate reuploaded successfully.',
      updatedCertificate: certificate,
    });
  })
export const getAllCertificateOrders = catchAsync(async (req, res) => {
  const orders = await CertificateOrder.find()
    .populate({ path: 'userId', select: 'username email' })
    .populate({ path: 'otsId', select: 'loan_number number' })
    .populate('ackId memoId')
    .sort({ createdAt: -1 });
  sendEncryptedResponse(res, 200, orders);
});

export const getCertificatesByUserId = catchAsync(async (req, res, next) => {
  const { userId } = req.params;
  if (!Types.ObjectId.isValid(userId)) return next(new AppError('Invalid user ID format', 400));
  const orders = await CertificateOrder.find({ userId })
    .populate('otsId ackId memoId')
    .sort({ createdAt: -1 });
  if (!orders.length) return next(new AppError('No certificates found for this user', 404));
  sendEncryptedResponse(res, 200, orders);
});

export const getCertificateOrderCounts = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const { branch, startDate, endDate } = req.decryptedBody;
    const pipeline = [
      {
        $lookup: {
          from: 'otsforms',
          localField: 'otsId',
          foreignField: '_id',
          as: 'otsDetails',
        },
      },
      { $unwind: '$otsDetails' },
    ];

    if (branch) pipeline.push({ $match: { 'otsDetails.branch': branch } });

    if (startDate || endDate) {
      const dateMatch = {};
      if (startDate === endDate) {
        const start = new Date(startDate);
        const end = new Date(startDate);
        end.setHours(23, 59, 59, 999);
        dateMatch.$gte = start;
        dateMatch.$lte = end;
      } else {
        if (startDate) dateMatch.$gte = new Date(startDate);
        if (endDate) {
          const end = new Date(endDate);
          end.setHours(23, 59, 59, 999);
          dateMatch.$lte = end;
        }
      }
      pipeline.push({ $match: { createdAt: dateMatch } });
    }

    pipeline.push({ $group: { _id: null, count: { $sum: 1 } } });
    const result = await CertificateOrder.aggregate(pipeline);
    const count = result.length > 0 ? result[0].count : 0;

    sendEncryptedResponse(res, 200, {
      message: branch
        ? `Certificate order count for branch '${branch}' retrieved successfully`
        : 'Total certificate order count retrieved successfully',
      data: { issued: count },
    });
  }),
];

export const getCertificateCountsLast7Days = catchAsync(async (req, res) => {
  const timezone = 'Asia/Kolkata';
  const end = new Date();
  end.setHours(23, 59, 59, 999);
  const start = new Date(end);
  start.setDate(end.getDate() - 6);
  start.setHours(0, 0, 0, 0);

  const raw = await CertificateOrder.aggregate([
    { $match: { createdAt: { $gte: start, $lte: end } } },
    {
      $group: {
        _id: {
          $dateToString: {
            format: '%d/%m/%Y',
            date: '$createdAt',
            timezone,
          },
        },
        count: { $sum: 1 },
      },
    },
    { $project: { _id: 0, date: '$_id', count: 1 } },
  ]);

  const lookup = Object.fromEntries(raw.map(o => [o.date, o.count]));
  const response = [];
  for (let i = 6; i >= 0; i--) {
    const d = new Date(end);
    d.setDate(end.getDate() - i);
    const dateStr = d
      .toLocaleDateString('en-GB', { timeZone: timezone })
      .split('/')
      .map(s => s.padStart(2, '0'))
      .join('/');
    response.push({ date: dateStr, count: lookup[dateStr] ?? 0 });
  }

  sendEncryptedResponse(res, 200, response);
});

export const filterCertificateOrders = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { loan_number, branch, userId} = req.decryptedBody;
    const { user_role } = req.user;
    const page = req.body.page && Number(req.body.page) > 0 ? Number(req.body.page) : 1;
    const limit = req.body.limit && Number(req.body.limit) > 0 ? Number(req.body.limit) : 10;
    const skip = (page - 1) * limit;
    if (user_role === 2) {
      if (!userId || !Types.ObjectId.isValid(userId)) {
        return next(new AppError('User ID is required and must be valid for regular users.', 400));
      }
      if (branch) return next(new AppError('Branch filter is not allowed for regular users.', 403));
    } else if (user_role === 1 && !branch) {
      return next(new AppError('Branch is required for sub-admins.', 400));
    } else if (user_role !== 0 && user_role !== 1 && user_role !== 2) {
      return next(new AppError('Access denied: your role is not authorized.', 403));
    }
    const matchStage = {
      ...(loan_number && { 'otsDetails.loan_number': loan_number }),
      ...(branch && { 'otsDetails.branch': branch }),
    };
    if (userId) {
      if (!Types.ObjectId.isValid(userId)) return next(new AppError('Invalid userId format', 400));
      matchStage.userId = new Types.ObjectId(userId);
    }
    const pipeline = [
      {
        $lookup: {
          from: 'otsforms',
          localField: 'otsId',
          foreignField: '_id',
          as: 'otsDetails',
        },
      },
      { $unwind: '$otsDetails' },
      { $match: matchStage },
      {
        $lookup: {
          from: 'users',
          localField: 'userId',
          foreignField: '_id',
          as: 'userDetails',
        },
      },
      { $unwind: '$userDetails' },
      {
        $lookup: {
          from: 'userdetails',
          localField: 'userId',
          foreignField: 'userId',
          as: 'userExtraDetails',
        },
      },
      {
        $unwind: {
          path: '$userExtraDetails',
          preserveNullAndEmptyArrays: true,
        },
      },
      {
        $project: {
          certificate: 1,
          createdAt: 1,
          userId: 1,
          otsId: 1,
          ackId: 1,
          memoId: 1,
          orderId: 1,
          otsDetails: 1,
          userDetails: 1,
          userExtraDetails: 1,
        },
      },
      {
        $facet: {
          paginatedData: [{ $skip: skip }, { $limit: limit }],
          totalCount: [{ $count: 'count' }],
        },
      },
    ];
    const result = await CertificateOrder.aggregate(pipeline);
    const rawData = result[0]?.paginatedData || [];
    const totalCount = result[0]?.totalCount[0]?.count || 0;
    const totalPages = Math.ceil(totalCount / limit);
    if (!rawData.length) return next(new AppError('No certificates found matching the filters', 404));
    const paginatedData = rawData.map(item => ({
      ...item,
      createdAt: dayjs(item.createdAt).tz('Asia/Kolkata').format('DD/MM/YYYY'),
    }));
    sendEncryptedResponse(res, 200, {
      paginatedData,
      page,
      limit,
      totalItems: totalCount,
      totalPages,
      previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null,
      currentPageCount: paginatedData.length,
    });
  }),
];
