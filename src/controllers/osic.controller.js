import GovernmentOrder from '../models/governmentModel.js';
import FloatTender from '../models/floatTender.js';
import TenderResult from '../models/tenderResult.js';
import SupplyOrder from '../models/supplyOrderModel.js';

export const createGovernmentOrder = async (req, res) => {
  try {
    const newOrder = new GovernmentOrder(req.body);
    await newOrder.save();
    res.status(201).json({ message: 'Government Order created successfully', order: newOrder });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

export const updateGovernmentOrder = async (req, res) => {
  try {
    const { id } = req.body;
    const updatedOrder = await GovernmentOrder.findByIdAndUpdate(id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!updatedOrder) {
      return res.status(404).json({ error: 'Government Order not found' });
    }

    res.json({ message: 'Order updated successfully', order: updatedOrder });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

export const filterGovernmentOrders = async (req, res) => {
  try {
    const { departmentName, pointOfContact, letterNumber } = req.body;
    const page = parseInt(req.body.page) || 1;
    const limit = parseInt(req.body.limit) || 10;
    const skip = (page - 1) * limit;

    const filters = {};
    if (departmentName) {
      filters.departmentName = new RegExp(departmentName, 'i'); // case-insensitive match
    }
    if (pointOfContact) {
      filters.pointOfContact = new RegExp(pointOfContact, 'i');
    }
    if (letterNumber) {
      filters.letterNumber = letterNumber;
    }

    const [orders, totalCount] = await Promise.all([
      GovernmentOrder.find(filters).sort({ createdAt: -1 }).skip(skip).limit(limit),
      GovernmentOrder.countDocuments(filters)
    ]);

    const totalPages = Math.ceil(totalCount / limit);

    if (!orders.length) {
      return res.status(404).json({ message: 'No government orders found matching the filters' });
    }

    return res.status(200).json({
      paginatedData: orders,
      page,
      limit,
      totalItems: totalCount,
      totalPages,
      previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null,
      currentPageCount: orders.length
    });
  } catch (err) {
    console.error('Error filtering government orders:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};


export const createFloatTender = async (req, res) => {
  try {
    const tender = new FloatTender(req.body);
    await tender.save();
    res.status(201).json({ message: 'Tender floated successfully', tender });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

export const updateFloatTender = async (req, res) => {
  try {
    const { id } = req.body;
    const updatedTender = await FloatTender.findByIdAndUpdate(id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!updatedTender) {
      return res.status(404).json({ error: 'Float Tender not found' });
    }

    res.json({ message: 'Tender updated successfully', tender: updatedTender });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

export const filterFloatTenders = async (req, res) => {
  try {
    const { project_title, tender_number } = req.body;
    const page = parseInt(req.body.page) || 1;
    const limit = parseInt(req.body.limit) || 10;
    const skip = (page - 1) * limit;

    const filters = {};
    if (project_title) {
      filters.project_title = new RegExp(project_title, 'i'); // case-insensitive
    }
    if (tender_number) {
      filters.tender_number = tender_number;
    }

    const [tenders, totalCount] = await Promise.all([
      FloatTender.find(filters).sort({ createdAt: -1 }).skip(skip).limit(limit),
      FloatTender.countDocuments(filters)
    ]);

    const totalPages = Math.ceil(totalCount / limit);

    if (!tenders.length) {
      return res.status(404).json({ message: 'No float tenders found matching the filters' });
    }

    return res.status(200).json({
      paginatedData: tenders,
      page,
      limit,
      totalItems: totalCount,
      totalPages,
      previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null,
      currentPageCount: tenders.length
    });
  } catch (err) {
    console.error('Error filtering float tenders:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

export const createTenderResult = async (req, res) => {
  try {
    const result = new TenderResult(req.body);
    await result.save();
    res.status(201).json({ message: 'Tender result recorded', result });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

export const updateTenderResult = async (req, res) => {
  try {
    const { id } = req.body;
    const updatedResult = await TenderResult.findByIdAndUpdate(id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!updatedResult) {
      return res.status(404).json({ error: 'Tender result not found' });
    }

    res.json({ message: 'Result updated successfully', result: updatedResult });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

export const filterTenderResults = async (req, res) => {
  try {
    const { tender_number, name } = req.body;
    const page = parseInt(req.body.page) || 1;
    const limit = parseInt(req.body.limit) || 10;
    const skip = (page - 1) * limit;

    const filters = {};
    if (tender_number) {
      filters.tender_number = tender_number;
    }
    if (name) {
      filters.name = new RegExp(name, 'i'); // case-insensitive
    }

    const [results, totalCount] = await Promise.all([
      TenderResult.find(filters).sort({ createdAt: -1 }).skip(skip).limit(limit),
      TenderResult.countDocuments(filters)
    ]);

    const totalPages = Math.ceil(totalCount / limit);

    if (!results.length) {
      return res.status(404).json({ message: 'No tender results found matching the filters' });
    }

    return res.status(200).json({
      paginatedData: results,
      page,
      limit,
      totalItems: totalCount,
      totalPages,
      previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null,
      currentPageCount: results.length
    });
  } catch (err) {
    console.error('Error filtering tender results:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};


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

    const newOrder = new SupplyOrder({
      supply_details: req.body.supply_details,
      proof_of_supply: `${fileBaseURL}/${proofOfSupply.filename}`,
      invoice_submission: `${fileBaseURL}/${invoiceSubmission.filename}`,
      payment_as_per_invoice: req.body.payment_as_per_invoice,
    });

    await newOrder.save();

    res.status(201).json({ message: 'Supply order recorded successfully', order: newOrder });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const updateSupplyOrder = async (req, res) => {
  try {
    const { id, supply_details, payment_as_per_invoice } = req.body;

    if (!id) {
      return res.status(400).json({ error: 'Supply order ID is required' });
    }

    const existingOrder = await SupplyOrder.findById(id);
    if (!existingOrder) {
      return res.status(404).json({ error: 'Supply order not found' });
    }
    const proof_of_supply = req.files?.proof_of_supply?.[0]
      ? `${process.env.NODE_APP_URL}/uploads/${req.files.proof_of_supply[0].filename}`
      : existingOrder.proof_of_supply;

    const invoice_submission = req.files?.invoice_submission?.[0]
      ? `${process.env.NODE_APP_URL}/uploads/${req.files.invoice_submission[0].filename}`
      : existingOrder.invoice_submission;
    const updatedOrder = await SupplyOrder.findByIdAndUpdate(
      id,
      {
        supply_details: supply_details || existingOrder.supply_details,
        payment_as_per_invoice: payment_as_per_invoice ?? existingOrder.payment_as_per_invoice,
        proof_of_supply,
        invoice_submission,
      },
      {
        new: true,
        runValidators: true,
      }
    );

    res.json({ message: 'Supply order updated', order: updatedOrder });
  } catch (err) {
    console.error(err);
    res.status(400).json({ error: err.message });
  }
};

export const filterSupplyOrders = async (req, res) => {
  try {
    const { supply_details } = req.body;
    const page = parseInt(req.body.page) || 1;
    const limit = parseInt(req.body.limit) || 10;
    const skip = (page - 1) * limit;

    const filters = {};
    if (supply_details) {
      filters.supply_details = new RegExp(supply_details, 'i'); // case-insensitive match
    }

    const [orders, totalCount] = await Promise.all([
      SupplyOrder.find(filters).sort({ createdAt: -1 }).skip(skip).limit(limit),
      SupplyOrder.countDocuments(filters)
    ]);

    const totalPages = Math.ceil(totalCount / limit);

    if (!orders.length) {
      return res.status(404).json({ message: 'No supply orders found matching the filters' });
    }

    return res.status(200).json({
      paginatedData: orders,
      page,
      limit,
      totalItems: totalCount,
      totalPages,
      previousPage: page > 1 ? page - 1 : null,
      nextPage: page < totalPages ? page + 1 : null,
      currentPageCount: orders.length
    });
  } catch (err) {
    console.error('Error filtering supply orders:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};


export const getDashboardCounts = async (req, res) => {
  try {
    const [govOrderCount, floatTenderCount, tenderResultCount, supplyOrderCount] = await Promise.all([
      GovernmentOrder.countDocuments(),
      FloatTender.countDocuments(),
      TenderResult.countDocuments(),
      SupplyOrder.countDocuments(),
    ]);

    res.json({
      governmentOrders: govOrderCount,
      floatTenders: floatTenderCount,
      tenderResults: tenderResultCount,
      supplyOrders: supplyOrderCount,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch counts' });
  }
};

