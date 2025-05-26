const CertificateOrder = require('../models/certificate');
const OTSForm = require('../models/otsform'); // adjust the path if needed

exports.uploadCertificateOrder = async (req, res) => {
  try {
    const { userId, otsId, ackId, memoId, orderId, payment_status } = req.body;

    if (!req.file) {
      return res.status(400).json({ message: 'PDF file is required' });
    }

    // Save the certificate order
    const newOrder = new CertificateOrder({
      userId,
      otsId,
      ackId,
      memoId,
      payment_status,
      orderId,
      certificate: {
        data: req.file.buffer,
        contentType: req.file.mimetype,
      },
    });

    await newOrder.save();

    // Update status in OTSForm
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

    res.status(201).json({ message: 'Certificate order uploaded and status updated successfully', data: newOrder._id });
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
      .populate('ackId memoId') // no change here, you can also limit these if needed
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

    // Build the date window: today 23:59:59.999 back to 6 days ago 00:00:00
    const end   = new Date();                         // now
    end.setHours(23, 59, 59, 999);

    const start = new Date(end);
    start.setDate(end.getDate() - 6);                 // 6 days back = 7 days total
    start.setHours(0, 0, 0, 0);

    // Aggregate counts per day already containing at least one doc
    const raw = await CertificateOrder.aggregate([
      { $match: { createdAt: { $gte: start, $lte: end } } },
      {
        $group: {
          _id: {
            $dateToString: {
              format: '%d/%m/%Y',
              date: '$createdAt',
              timezone              // Asia/Kolkata
            }
          },
          count: { $sum: 1 }
        }
      },
      { $project: { _id: 0, date: '$_id', count: 1 } }
    ]);

    // Convert aggregation result to a lookup map: { '19/05/2025': 3, … }
    const lookup = Object.fromEntries(raw.map(o => [o.date, o.count]));

    // Build the 7-element response, filling gaps with 0
    const response = [];
    for (let i = 6; i >= 0; i--) {
      const d = new Date(end);
      d.setDate(end.getDate() - i);
      const dateStr = d
        .toLocaleDateString('en-GB', { timeZone: timezone }) // DD/MM/YYYY
        .split('/')
        .map(s => s.padStart(2, '0'))                        // zero-pad day/month
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
