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
