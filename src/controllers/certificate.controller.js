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
  const { branch } = req.body;

  try {
    // Step 1: Lookup and unwind OTS form
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

    // Step 2: Optionally filter by branch
    if (branch) {
      pipeline.push({ $match: { 'otsDetails.branch': branch } });
    }

    // Step 3: Group by branch
    pipeline.push({
      $group: {
        _id: '$otsDetails.branch',
        count: { $sum: 1 },
      },
    });

    const counts = await CertificateOrder.aggregate(pipeline);

    if (branch) {
      // If specific branch is queried
      const countObj = counts.find(item => item._id === branch);
      return res.status(200).json({
        message: `Certificate order count for branch '${branch}' retrieved successfully`,
        data: { [branch]: countObj ? countObj.count : 0 },
      });
    } else {
      // If all branches: preload known branches from OTSForm
      const allBranches = await OTSForm.distinct('branch');

      const data = {};
      allBranches.forEach(b => {
        data[b] = 0; // Default count
      });

      counts.forEach(item => {
        data[item._id] = item.count;
      });

      return res.status(200).json({
        message: 'All certificate order counts retrieved successfully',
        data,
      });
    }
  } catch (error) {
    console.error('Error getting certificate order counts:', error);
    return res.status(500).json({ message: 'Server error', error: error.message });
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
