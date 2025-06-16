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
    const filters = {};

    if (req.query.departmentName) {
      filters.departmentName = new RegExp(req.query.departmentName, 'i'); // case-insensitive match
    }
    if (req.query.pointOfContact) {
      filters.pointOfContact = new RegExp(req.query.pointOfContact, 'i');
    }
    if (req.query.letterNumber) {
      filters.letterNumber = req.query.letterNumber;
    }

    const orders = await GovernmentOrder.find(filters).sort({ createdAt: -1 });

    res.json({ results: orders });
  } catch (err) {
    res.status(500).json({ error: 'Error filtering government orders' });
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
    const filters = {};

    if (req.query.project_title) {
      filters.project_title = new RegExp(req.query.project_title, 'i');
    }
    if (req.query.tender_number) {
      filters.tender_number = req.query.tender_number;
    }

    const tenders = await FloatTender.find(filters).sort({ createdAt: -1 });
    res.json({ results: tenders });
  } catch (err) {
    res.status(500).json({ error: 'Error filtering tenders' });
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
    const filters = {};

    if (req.query.tender_number) {
      filters.tender_number = req.query.tender_number;
    }
    if (req.query.name) {
      filters.name = new RegExp(req.query.name, 'i');
    }

    const results = await TenderResult.find(filters).sort({ createdAt: -1 });
    res.json({ results });
  } catch (err) {
    res.status(500).json({ error: 'Error filtering results' });
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
    const filters = {};

    if (req.query.supply_details) {
      filters.supply_details = new RegExp(req.query.supply_details, 'i');
    }

    const orders = await SupplyOrder.find(filters).sort({ createdAt: -1 });
    res.json({ results: orders });
  } catch (err) {
    res.status(500).json({ error: 'Error filtering supply orders' });
  }
};

