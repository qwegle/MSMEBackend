const CertificateOrder = require('../models/certificate');
const OTSForm = require('../models/otsform');
const AckForm = require('../models/acknowledgement');
const Memorandum = require('../models/memorandum');
const SettlementOrder = require('../models/settlementOrder');

exports.uploadCertificateOrder = async (req, res) => {
  try {
    const filePath = req.file ? `/uploads/${req.file.filename}` : null;
    if (!filePath) {
      return res.status(400).json({ error: 'PDF file is required' });
    }

    const { loan_number } = req.body;
    if (!loan_number) {
      return res.status(400).json({ error: 'loan_number is required' });
    }
    const otsForm = await OTSForm.findOne({ loan_number });
    if (!otsForm) {
      return res.status(404).json({ error: 'OTSForm not found for provided loan_number' });
    }
    const userId = otsForm.userId;
    const otsId = otsForm._id;
    const ackForm = await AckForm.findOne({ ots_form_id: otsId });
    if (!ackForm) {
      return res.status(404).json({ error: 'AckForm not found for this OTSForm' });
    }
    const ackId = ackForm._id;
    const memo = await Memorandum.findOne({ ackId });
    if (!memo) {
      return res.status(404).json({ error: 'Memorandum not found for this AckForm' });
    }
    const memoId = memo._id;
    const settlement = await SettlementOrder.findOne({ memoId });
    if (!settlement) {
      return res.status(404).json({ error: 'Settlement Order not found for this Memorandum' });
    }
    const orderId = settlement._id;
    const newOrder = new CertificateOrder({
      userId,
      otsId,
      ackId,
      memoId,
      orderId,
      certificate: filePath,
    });
    await newOrder.save();
    const updatedOTS = await OTSForm.findByIdAndUpdate(
      otsId,
      {
        status_msg: 'Completed',
        status: 1,
      },
      { new: true }
    );

    if (!updatedOTS) {
      return res.status(404).json({ message: 'OTS Form not found for status update' });
    }

    res.status(201).json({
      message: 'Certificate order uploaded and status updated successfully',
      data: newOrder,
    });
  } catch (err) {
    console.error('Certificate Order Upload Error:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

exports.getAllCertificateOrders = async (req, res) => {
  try {
    const orders = await CertificateOrder.find()
      .populate({
        path: 'userId',
        select: 'username email'
      })
      .populate({
        path: 'otsId',
        select: 'loan_number number'
      })
      .populate('ackId memoId')
      .sort({ createdAt: -1 });

    res.status(200).json(orders);
  } catch (err) {
    console.error('Get All Certificates Error:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

exports.getCertificatesByUserId = async (req, res) => {
  try {
    const { userId } = req.params;

    const orders = await CertificateOrder.find({ userId })
      .populate('otsId ackId memoId')
      .sort({ createdAt: -1 });

    if (!orders.length) {
      return res.status(404).json({ message: 'No certificates found for this user' });
    }

    res.status(200).json(orders);
  } catch (err) {
    console.error('Get Certificates by User ID Error:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};
exports.getCertificateOrderCounts = async (req, res) => {
  const { branch, startDate, endDate } = req.body;

  try {
    const pipeline = [
      {
        $lookup: {
          from: 'otsforms',
          localField: 'otsId',
          foreignField: '_id',
          as: 'otsDetails',
        },
      },
      { $unwind: '$otsDetails' }
    ];
    if (branch) {
      pipeline.push({ $match: { 'otsDetails.branch': branch } });
    }
    if (startDate || endDate) {
      const dateMatch = {};

      if (startDate && endDate && startDate === endDate) {
        const start = new Date(startDate);
        const end = new Date(startDate);
        end.setHours(23, 59, 59, 999);
        dateMatch.$gte = start;
        dateMatch.$lte = end;
      } else {
        if (startDate) {
          dateMatch.$gte = new Date(startDate);
        }
        if (endDate) {
          const end = new Date(endDate);
          end.setHours(23, 59, 59, 999);
          dateMatch.$lte = end;
        }
      }

      pipeline.push({
        $match: {
          createdAt: dateMatch
        }
      });
    }
    pipeline.push({
      $group: {
        _id: null,
        count: { $sum: 1 }
      }
    });

    const result = await CertificateOrder.aggregate(pipeline);
    const count = result.length > 0 ? result[0].count : 0;
    const message = branch
      ? `Certificate order count for branch '${branch}' retrieved successfully`
      : 'Total certificate order count retrieved successfully';
    return res.status(200).json({
      message,
      data: { issued: count }
    });

  } catch (error) {
    console.error('Error getting certificate order counts:', error);
    return res.status(500).json({
      message: 'Server error',
      error: error.message
    });
  }
};

// controllers/certificateOrders.js  (add this to your existing file)

exports.getCertificateCountsLast7Days = async (req, res) => {
  try {
    const timezone = 'Asia/Kolkata';
    const end   = new Date();                         // now
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
              timezone 
            }
          },
          count: { $sum: 1 }
        }
      },
      { $project: { _id: 0, date: '$_id', count: 1 } }
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

      response.push({
        date: dateStr,
        count: lookup[dateStr] ?? 0
      });
    }

    return res.status(200).json(response);
  } catch (err) {
    console.error('Error getting 7-day certificate counts:', err);
    return res.status(500).json({ message: 'Server error', error: err.message });
  }
};

exports.filterCertificateOrders = async (req, res) => {
  try {
    const { loan_number, branch, userId } = req.body;
    const pipeline = [
      {
        $lookup: {
          from: 'otsforms',
          localField: 'otsId',
          foreignField: '_id',
          as: 'otsDetails'
        }
      },
      { $unwind: '$otsDetails' }
    ];
    const matchStage = {};

    if (loan_number) {
      matchStage['otsDetails.loan_number'] = loan_number;
    }

    if (branch) {
      matchStage['otsDetails.branch'] = branch;
    }

    if (userId) {
      matchStage['userId'] = new mongoose.Types.ObjectId(userId);
    }

    if (Object.keys(matchStage).length > 0) {
      pipeline.push({ $match: matchStage });
    }
    pipeline.push({
      $lookup: {
        from: 'users',
        localField: 'userId',
        foreignField: '_id',
        as: 'userDetails'
      }
    });
    pipeline.push({ $unwind: '$userDetails' });
    pipeline.push({
      $project: {
        certificate: 1,
        createdAt: 1,
        userId: 1,
        otsId: 1,
        ackId: 1,
        memoId: 1,
        orderId: 1,
        'otsDetails.loan_number': 1,
        'otsDetails.branch': 1,
        'userDetails.username': 1,
        'userDetails.email': 1
      }
    });

    const result = await CertificateOrder.aggregate(pipeline);

    if (!result.length) {
      return res.status(404).json({ message: 'No certificates found matching the filters' });
    }

    return res.status(200).json({ message: 'Filtered certificates retrieved', data: result });

  } catch (err) {
    console.error('Error filtering certificate orders:', err);
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};



// Get count of OTS applications by status



// // Get certificate order by ID
// exports.getCertificateOrderById = async (req, res) => {
//   try {
//     const order = await CertificateOrder.findById(req.params.id).populate('userId otsId ackId memoId');

//     if (!order) {
//       return res.status(404).json({ message: 'Certificate order not found' });
//     }

//     res.set('Content-Type', order.certificate.contentType);
//     res.send(order.certificate.data);
//   } catch (err) {
//     res.status(500).json({ message: 'Server error', error: err.message });
//   }
// };

// // List all certificate orders
// exports.listCertificateOrders = async (req, res) => {
//   try {
//     const orders = await CertificateOrder.find().populate('userId otsId ackId memoId');
//     res.status(200).json(orders);
//   } catch (err) {
//     res.status(500).json({ message: 'Server error', error: err.message });
//   }
// };
