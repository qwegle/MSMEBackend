import mongoose from 'mongoose';
import GovernmentOrder from '../../models/OSIC/governmentModel.js';
import FloatTender from '../../models/OSIC/floatTender.js';
import TenderResult from '../../models/OSIC/tenderResult.js';
import SupplyOrder from '../../models/OSIC/supplyOrderModel.js';
import SanctionOrder from '../../models/OSIC/SanctionOrder.js';
import AppError from '../../utils/AppError.js';
import catchAsync from '../../utils/catchAsync.js';
import { decryptRequestBody, sendEncryptedResponse } from '../../utils/encryption.js';

export const createGovernmentOrder = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const newOrder = new GovernmentOrder(req.decryptedBody);
    await newOrder.save();
    sendEncryptedResponse(res, 201, { message: 'Government Order created', order: newOrder });
  }),
];

export const updateGovernmentOrder = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { id } = req.decryptedBody;
    const updatedOrder = await GovernmentOrder.findByIdAndUpdate(id, req.decryptedBody, {
      new: true, runValidators: true
    });
    if (!updatedOrder) return next(new AppError('Government Order not found', 404));
    sendEncryptedResponse(res, 200, { message: 'Order updated', order: updatedOrder });
  }),
];

export const filterGovernmentOrders = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const { departmentName, pointOfContact, letterNumber, page = 1, limit = 10 } = req.decryptedBody;
    const skip = (page - 1) * limit;
    const filters = {};
    if (departmentName) filters.departmentName = new RegExp(departmentName, 'i');
    if (pointOfContact) filters.pointOfContact = new RegExp(pointOfContact, 'i');
    if (letterNumber) filters.letterNumber = letterNumber;

    const [orders, totalCount] = await Promise.all([
      GovernmentOrder.find(filters).sort({ createdAt: -1 }).skip(skip).limit(limit),
      GovernmentOrder.countDocuments(filters)
    ]);

    const totalPages = Math.ceil(totalCount / limit);
    sendEncryptedResponse(res, 200, {
      paginatedData: orders, page, limit, totalItems: totalCount,
      totalPages, previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null, currentPageCount: orders.length
    });
  }),
];

// --- Float Tenders ---
export const createFloatTender = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const tender = new FloatTender(req.decryptedBody);
    await tender.save();
    sendEncryptedResponse(res, 201, { message: 'Tender created', tender });
  }),
];

export const updateFloatTender = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { id } = req.decryptedBody;
    const updated = await FloatTender.findByIdAndUpdate(id, req.decryptedBody, {
      new: true, runValidators: true
    });
    if (!updated) return next(new AppError('Float Tender not found', 404));
    sendEncryptedResponse(res, 200, { message: 'Tender updated', tender: updated });
  }),
];

export const filterFloatTenders = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const { project_title, tender_number, page = 1, limit = 10 } = req.decryptedBody;
    const skip = (page - 1) * limit;
    const filters = {};
    if (project_title) filters.project_title = new RegExp(project_title, 'i');
    if (tender_number) filters.tender_number = tender_number;

    const [tenders, totalCount] = await Promise.all([
      FloatTender.find(filters).sort({ createdAt: -1 }).skip(skip).limit(limit),
      FloatTender.countDocuments(filters)
    ]);

    const totalPages = Math.ceil(totalCount / limit);
    sendEncryptedResponse(res, 200, {
      paginatedData: tenders, page, limit, totalItems: totalCount,
      totalPages, previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null, currentPageCount: tenders.length
    });
  }),
];

// --- Tender Results ---
export const createTenderResult = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { tender_number, bidder_details } = req.decryptedBody;
    if (!tender_number || !Array.isArray(bidder_details) || bidder_details.length === 0) {
      return next(new AppError('tender_number and bidder_details[] are required', 400));
    }

    const result = new TenderResult({ tender_number, bidder_details });
    await result.save();
    sendEncryptedResponse(res, 201, { message: 'Tender result recorded', result });
  }),
];

export const updateTenderResult = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { id, tender_number, bidder_details } = req.decryptedBody;
    if (!id || !mongoose.Types.ObjectId.isValid(id)) {
      return next(new AppError('Valid tender result ID required', 400));
    }

    const updatedData = {};
    if (tender_number !== undefined) updatedData.tender_number = tender_number;
    if (bidder_details !== undefined) updatedData.bidder_details = bidder_details;

    const updated = await TenderResult.findByIdAndUpdate(id, updatedData, {
      new: true, runValidators: true
    });
    if (!updated) return next(new AppError('Tender result not found', 404));

    sendEncryptedResponse(res, 200, { message: 'Result updated', result: updated });
  }),
];

export const getBidderDetailsByTenderNumber = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const { tender_number } = req.decryptedBody;
    if (!tender_number) return next(new AppError('Tender number required', 400));

    const result = await TenderResult.findOne({ tender_number });
    if (!result) return next(new AppError('Tender result not found', 404));

    sendEncryptedResponse(res, 200, {
      tender_number: result.tender_number,
      bidder_details: result.bidder_details,
    });
  }),
];

export const filterTenderResults = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const { tender_number, name, page = 1, limit = 10 } = req.decryptedBody;
    const skip = (page - 1) * limit;

    const filters = {};
    if (tender_number) filters.tender_number = tender_number;
    if (name) {
      filters.bidder_details = {
        $elemMatch: { name: { $regex: name, $options: 'i' } }
      };
    }

    const [results, totalCount] = await Promise.all([
      TenderResult.find(filters).sort({ createdAt: -1 }).skip(skip).limit(limit),
      TenderResult.countDocuments(filters),
    ]);

    const totalPages = Math.ceil(totalCount / limit);
    sendEncryptedResponse(res, 200, {
      paginatedData: results, page, limit, totalItems: totalCount,
      totalPages, previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null, currentPageCount: results.length
    });
  }),
];

export const getAllTenderResults = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const { page = 1, limit = 10 } = req.decryptedBody;
    const skip = (page - 1) * limit;

    const [results, totalCount] = await Promise.all([
      TenderResult.find().sort({ createdAt: -1 }).skip(skip).limit(limit),
      TenderResult.countDocuments()
    ]);

    const totalPages = Math.ceil(totalCount / limit);
    sendEncryptedResponse(res, 200, {
      paginatedData: results, page, limit, totalItems: totalCount,
      totalPages, previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null, currentPageCount: results.length
    });
  }),
];

// --- Supply Orders ---
export const filterSupplyOrders = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const { page = 1, limit = 10 } = req.decryptedBody;
    const skip = (page - 1) * limit;

    const [orders, totalCount] = await Promise.all([
      SupplyOrder.find().sort({ createdAt: -1 }).skip(skip).limit(limit),
      SupplyOrder.countDocuments(),
    ]);

    const totalPages = Math.ceil(totalCount / limit);
    sendEncryptedResponse(res, 200, {
      paginatedData: orders, page, limit, totalItems: totalCount,
      totalPages, previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null, currentPageCount: orders.length
    });
  }),
];

export const getDashboardCounts = catchAsync(async (req, res) => {
  const [govOrderCount, floatTenderCount, tenderResultCount, supplyOrderCount] = await Promise.all([
    GovernmentOrder.countDocuments(),
    FloatTender.countDocuments(),
    TenderResult.countDocuments(),
    SupplyOrder.countDocuments(),
  ]);

  sendEncryptedResponse(res, 200, {
    governmentOrders: govOrderCount,
    floatTenders: floatTenderCount,
    tenderResults: tenderResultCount,
    supplyOrders: supplyOrderCount,
  });
});

// --- Sanction Orders ---
export const createSanctionOrder = [
  decryptRequestBody,
  catchAsync(async (req, res) => {
    const body = req.decryptedBody;
    const sanctionOrderData = {
      ...body,
      proposingOfficer: {
        name: body.proposingOfficer_name,
        designation: body.proposingOfficer_designation,
      },
      recommendingOfficer: {
        name: body.recommendingOfficer_name,
        designation: body.recommendingOfficer_designation,
      },
      sanctioningAuthority: {
        name: body.sanctioningAuthority_name,
        designation: body.sanctioningAuthority_designation,
      },
      billReceiptDate: body.billReceiptDate ? new Date(body.billReceiptDate) : undefined,
      advanceDate: body.advanceDate ? new Date(body.advanceDate) : undefined,
      paidPartyDate: body.paidPartyDate ? new Date(body.paidPartyDate) : undefined,
    };

    const newOrder = await SanctionOrder.create(sanctionOrderData);
    sendEncryptedResponse(res, 201, { status: 'success', data: newOrder });
  }),
];

export const getAllSanctionOrders = catchAsync(async (req, res) => {
  const orders = await SanctionOrder.find();
  sendEncryptedResponse(res, 200, { status: 'success', results: orders.length, data: orders });
});

export const getSanctionOrderById = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const order = await SanctionOrder.findById(req.decryptedBody.id);
    if (!order) return next(new AppError('Sanction Order not found', 404));
    sendEncryptedResponse(res, 200, { status: 'success', data: order });
  }),
];

export const updateSanctionOrder = [
  decryptRequestBody,
  catchAsync(async (req, res, next) => {
    const updated = await SanctionOrder.findByIdAndUpdate(req.decryptedBody.id, req.decryptedBody, {
      new: true, runValidators: true,
    });
    if (!updated) return next(new AppError('Sanction Order not found', 404));
    sendEncryptedResponse(res, 200, { status: 'success', data: updated });
  }),
];

export const deleteSanctionOrder = catchAsync(async (req, res, next) => {
  const deleted = await SanctionOrder.findByIdAndDelete(req.params.id);
  if (!deleted) return next(new AppError('Sanction Order not found', 404));
  sendEncryptedResponse(res, 200, { status: 'success', data: null });
});

export const createSupplyOrder = async (req, res) => {
  try {
    const proofOfSupply = req.files?.proof_of_supply?.[0];
    const invoiceSubmission = req.files?.invoice_submission?.[0];
    if (!proofOfSupply || !invoiceSubmission) {
      return res.status(400).json({
        error: 'Both proof_of_supply and invoice_submission PDF files are required.',
      });
    }
    const fileBaseURL = process.env.NODE_APP_URL + '/uploads';
    const {
      tender_number,
      tender_value,
      supply_quantity,
      invoice_number,
      invoice_amount,
      // payment_as_per_invoice
    } = req.body;
    if (
      !tender_number || !tender_value || !supply_quantity ||
      !invoice_number || !invoice_amount || payment_as_per_invoice === undefined
    ) {
      return res.status(400).json({ error: 'All supply order fields are required.' });
    }
    const newOrder = new SupplyOrder({
      tender_number: tender_number.trim(),
      tender_value: tender_value.trim(),
      supply_quantity: supply_quantity.trim(),
      invoice_number: invoice_number.trim(),
      invoice_amount: invoice_amount.trim(),
      proof_of_supply: `${fileBaseURL}/${proofOfSupply.filename}`,
      invoice_submission: `${fileBaseURL}/${invoiceSubmission.filename}`,
      payment_as_per_invoice: Number(payment_as_per_invoice),
    });
    await newOrder.save();
    res.status(201).json({
      message: 'Supply order recorded successfully',
      order: newOrder,
    });
  } catch (err) {
    console.error('Error in createSupplyOrder:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const updateSupplyOrder = async (req, res) => {
  try {
    const { id } = req.params;
    if (!id || !mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ error: 'Valid supply order ID is required' });
    }
    const existingOrder = await SupplyOrder.findById(id);
    if (!existingOrder) {
      return res.status(404).json({ error: 'Supply order not found' });
    }
    const updatedFields = {
      tender_number: req.body.tender_number ?? existingOrder.tender_number,
      tender_value: req.body.tender_value ?? existingOrder.tender_value,
      supply_quantity: req.body.supply_quantity ?? existingOrder.supply_quantity,
      invoice_number: req.body.invoice_number ?? existingOrder.invoice_number,
      invoice_amount: req.body.invoice_amount ?? existingOrder.invoice_amount,
      payment_as_per_invoice:
        req.body.payment_as_per_invoice !== undefined
          ? Number(req.body.payment_as_per_invoice)
          : existingOrder.payment_as_per_invoice,
      proof_of_supply: req.files?.proof_of_supply?.[0]?.url || existingOrder.proof_of_supply,
      invoice_submission: req.files?.invoice_submission?.[0]?.url || existingOrder.invoice_submission,
    };
    const updatedOrder = await SupplyOrder.findByIdAndUpdate(id, updatedFields, {
      new: true,
      runValidators: true,
    });
    res.status(200).json({
      message: 'Supply order updated successfully',
      order: updatedOrder,
    });
  } catch (err) {
    console.error('Error updating supply order:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};