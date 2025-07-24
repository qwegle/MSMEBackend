import GovernmentOrder from '../../models/OSIC/governmentModel.js';
import FloatTender from '../../models/OSIC/floatTender.js';
import TenderResult from '../../models/OSIC/tenderResult.js';
import SupplyOrder from '../../models/OSIC/supplyOrderModel.js';
import Bidder from '../../models/OSIC/bidder.js';
import SanctionOrder from '../../models/OSIC/SanctionOrder.js';
import AppError from '../../utils/AppError.js';
import catchAsync from '../../utils/catchAsync.js';

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
    const { tender_number, bidder_details } = req.body;
    if (!tender_number || !Array.isArray(bidder_details) || bidder_details.length === 0) {
      return res.status(400).json({
        error: 'tender_number and at least one bidder in bidder_details are required',
      });
    }
    for (const bidder of bidder_details) {
      const { name, bid_value, bidder_score } = bidder;
      if (
        !name ||
        bid_value === undefined ||
        bidder_score === undefined ||
        typeof bid_value !== 'string' ||
        typeof bidder_score !== 'string'
      ) {
        return res.status(400).json({
          error: 'Each bidder must include name (string), bid_value (number), and bidder_score (number)',
        });
      }
    }
    const result = new TenderResult({ tender_number, bidder_details });
    await result.save();
    res.status(201).json({ message: 'Tender result recorded', result });
  } catch (err) {
    console.error('Error creating tender result:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const getBidderDetailsByTenderNumber = async (req, res) => {
  try {
    const { tender_number } = req.body;

    if (!tender_number) {
      return res.status(400).json({ error: 'Tender number is required' });
    }

    const result = await TenderResult.findOne({ tender_number });

    if (!result) {
      return res.status(404).json({ error: 'Tender result not found' });
    }

    res.status(200).json({
      tender_number: result.tender_number,
      bidder_details: result.bidder_details,
    });
  } catch (err) {
    console.error('Error fetching bidder details:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const updateTenderResult = async (req, res) => {
  try {
    const { id } = req.body;
    if (!id || !mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ error: 'Valid tender result ID is required' });
    }
    const { tender_number, bidder_details } = req.body;
    if (bidder_details && (!Array.isArray(bidder_details) || bidder_details.length === 0)) {
      return res.status(400).json({
        error: 'bidder_details must be a non-empty array if provided',
      });
    }
    if (Array.isArray(bidder_details)) {
      for (const bidder of bidder_details) {
        const { name, bid_value, bidder_score } = bidder;
        if (
          !name ||
          bid_value === undefined ||
          bidder_score === undefined ||
          typeof bid_value !== 'number' ||
          typeof bidder_score !== 'number'
        ) {
          return res.status(400).json({
            error:
              'Each bidder must include name (string), bid_value (number), and bidder_score (number)',
          });
        }
      }
    }
    const updatedData = {};
    if (tender_number !== undefined) updatedData.tender_number = tender_number;
    if (bidder_details !== undefined) updatedData.bidder_details = bidder_details;
    const updatedResult = await TenderResult.findByIdAndUpdate(id, updatedData, {
      new: true,
      runValidators: true,
    });
    if (!updatedResult) {
      return res.status(404).json({ error: 'Tender result not found' });
    }
    res.status(200).json({
      message: 'Result updated successfully',
      result: updatedResult,
    });
  } catch (err) {
    console.error('Error updating tender result:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
export const filterTenderResults = async (req, res) => {
  try {
    const { tender_number, name,  } = req.body;
    const page = parseInt(req.body.page) || 1;
    const limit = parseInt(req.body.limit) || 10;
    const skip = (page - 1) * limit;

    const filters = {};

    if (tender_number) {
      filters.tender_number = tender_number;
    }

    if (name) {
      filters.bidder_details = {
        $elemMatch: {
          name: { $regex: name, $options: 'i' } // case-insensitive regex search
        }
      };
    }

    const [results, totalCount] = await Promise.all([
      TenderResult.find(filters)
        .sort({ createdAt: -1 })
        .skip(skip)
        .limit(limit),
      TenderResult.countDocuments(filters)
    ]);

    const totalPages = Math.ceil(totalCount / limit);

    // if (!results.length) {
    //   return res.status(404).json({ message: 'No tender results found matching the filters' });
    // }

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

export const getAllTenderResults = async (req, res) => {
  try {
    const page = parseInt(req.body.page) || 1;
    const limit = parseInt(req.body.limit) || 10;
    const skip = (page - 1) * limit;

    const [results, totalCount] = await Promise.all([
      TenderResult.find().sort({ createdAt: -1 }).skip(skip).limit(limit),
      TenderResult.countDocuments()
    ]);

    const totalPages = Math.ceil(totalCount / limit);

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
    console.error('Error fetching tender results:', err);
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
    const {
      tender_number,
      tender_value,
      supply_quantity,
      invoice_number,
      invoice_amount,
      payment_as_per_invoice
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
    const fileBaseURL = process.env.NODE_APP_URL + '/uploads';
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
      proof_of_supply: req.files?.proof_of_supply?.[0]
        ? `${fileBaseURL}/${req.files.proof_of_supply[0].filename}`
        : existingOrder.proof_of_supply,
      invoice_submission: req.files?.invoice_submission?.[0]
        ? `${fileBaseURL}/${req.files.invoice_submission[0].filename}`
        : existingOrder.invoice_submission,
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


// export const createBidder = async (req, res, next) => {
//   try {
//     const { name, bid_value, bid_score } = req.body;
//     if (!name || !bid_value || !bid_score) {
//       return res.status(400).json({ message: 'All fields are required: name, bid_value, bid_score' });
//     }
//     const bidder = await Bidder.create({ name, bid_value, bid_score });
//     res.status(201).json({
//       status: 'success',
//       data: bidder,
//     });
//   } catch (error) {
//     console.error('Error creating bidder:', error);
//     res.status(500).json({ message: 'Server error', error: error.message });
//   }
// };

// export const getAllBidders = async (req, res) => {
//   try {
//     const bidders = await Bidder.find().sort({ createdAt: -1 });
//     res.status(200).json({
//       status: 'success',
//       count: bidders.length,
//       data: bidders,
//     });
//   } catch (error) {
//     res.status(500).json({ message: 'Server error', error: error.message });
//   }
// };

// export const deleteBidderById = async (req, res) => {
//   try {
//     const { id } = req.body;

//     const bidder = await Bidder.findByIdAndDelete(id);

//     if (!bidder) {
//       return res.status(404).json({ message: 'Bidder not found' });
//     }

//     res.status(200).json({
//       status: 'success',
//       message: `Bidder with ID ${id} deleted successfully.`,
//     });
//   } catch (error) {
//     res.status(500).json({ message: 'Server error', error: error.message });
//   }
// };


// export const updateBidderById = async (req, res) => {
//   try {
//     const { id, name, bid_value, bid_score } = req.body;
//     if (!id) {
//       return res.status(400).json({ message: 'Bidder ID is required' });
//     }
//     if (!mongoose.Types.ObjectId.isValid(id)) {
//       return res.status(400).json({ message: 'Invalid Bidder ID format' });
//     }
//     const updateFields = {};
//     if (name !== undefined) updateFields.name = name;
//     if (bid_value !== undefined) updateFields.bid_value = bid_value;
//     if (bid_score !== undefined) updateFields.bid_score = bid_score;
//     const updatedBidder = await Bidder.findByIdAndUpdate(
//       id,
//       updateFields,
//       { new: true, runValidators: true }
//     );
//     if (!updatedBidder) {
//       return res.status(404).json({ message: 'Bidder not found' });
//     }
//     res.status(200).json({
//       status: 'success',
//       data: updatedBidder,
//     });
//   } catch (error) {
//     res.status(500).json({ message: 'Server error', error: error.message });
//   }
// };


export const createSanctionOrder = catchAsync(async (req, res, next) => {
  const newOrder = await SanctionOrder.create(req.body);
  res.status(201).json({
    status: 'success',
    data: newOrder,
  });
});

export const getAllSanctionOrders = catchAsync(async (req, res, next) => {
  const orders = await SanctionOrder.find();
  res.status(200).json({
    status: 'success',
    results: orders.length,
    data: orders,
  });
});


export const getSanctionOrderById = catchAsync(async (req, res, next) => {
  const order = await SanctionOrder.findById(req.body.id);
  if (!order) return next(new AppError('Sanction Order not found', 404));

  res.status(200).json({
    status: 'success',
    data: order,
  });
});

export const updateSanctionOrder = catchAsync(async (req, res, next) => {
  const updatedOrder = await SanctionOrder.findByIdAndUpdate(req.body.id, req.body, {
    new: true,
    runValidators: true,
  });

  if (!updatedOrder) return next(new AppError('Sanction Order not found', 404));

  res.status(200).json({
    status: 'success',
    data: updatedOrder,
  });
});

export const deleteSanctionOrder = catchAsync(async (req, res, next) => {
  const deleted = await SanctionOrder.findByIdAndDelete(req.params.id);
  if (!deleted) return next(new AppError('Sanction Order not found', 404));

  res.status(204).json({
    status: 'success',
    data: null,
  });
});



