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
      .populate('userId otsId ackId memoId')
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
