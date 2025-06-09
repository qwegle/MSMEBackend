const OTSForm = require('../models/otsform');
const AckForm = require('../models/acknowledgement');
const Memorandum = require('../models/memorandum');
const CertificateOrder = require('../models/certificate');
const sendApplicationSubmittedEmail = require('../utils/sendStatusChangeEmail');
exports.createOTSForm = async (req, res) => {
    try {
        const formData = req.body;
        formData.userId = req.user.id;
        const baseTimestamp = Date.now();
        let newForm;
        let saved = false;
        let attempt = 0;
        while (!saved && attempt < 10) {
            const loanNumber = baseTimestamp.toString().slice(0, 12) + attempt;
            formData.loan_number = loanNumber;
            try {
                newForm = new OTSForm(formData);
                await newForm.save();
                saved = true;
                await sendApplicationSubmittedEmail(newForm)
            } catch (err) {
                if (err.code === 11000 && err.message.includes('loan_number')) {
                    attempt++;
                } else {
                    throw err;
                }
            }
        }
        if (!saved) {
            return res.status(500).json({ message: 'Server busy. Please try again.' });
        }
        res.status(201).json({ message: 'OTS Form submitted successfully', data: newForm });
    } catch (error) {
        console.error('Error creating OTS Form:', error);
        res.status(500).json({ message: 'Error submitting form', error: error.message });
    }
};

exports.getUserOTSForms = async (req, res) => {
    try {
        const forms = await OTSForm.find({ userId: req.user.id }).sort({ createdAt: -1 });
        res.status(200).json(forms);
    } catch (error) {
        console.error('Error fetching OTS forms:', error);
        res.status(500).json({ message: 'Error fetching forms', error: error.message });
    }
};

exports.getOTSFormById = async (req, res) => {
    try {
        const form = await OTSForm.findOne({
            _id: req.params.id,
            userId: req.user.id
        });

        if (!form) {
            return res.status(404).json({ message: 'OTS form not found' });
        }
        res.status(200).json(form);
    } catch (error) {
        console.error('Error fetching OTS form:', error);
        res.status(500).json({ message: 'Error fetching form', error: error.message });
    }
};

exports.getAllOTSForms = async (req, res) => {
    try {
        const forms = await OTSForm.find().populate('userId', 'first_name last_name email');
        // res.status(200).json({ data: forms });
        res.status(200).json(forms);
    } catch (error) {
        console.error('Error fetching all OTS forms:', error);
        res.status(500).json({ message: 'Error fetching all forms', error: error.message });
    }
};

exports.getOTSFormsByBranch = async (req, res) => {
    try {
        const { branch } = req.query;

        if (!branch) {
            return res.status(400).json({ message: 'Branch is required as query parameter' });
        }

        const forms = await OTSForm.find({ branch }).sort({ createdAt: -1 });

        res.status(200).json(forms);
    } catch (error) {
        console.error('Error fetching OTS forms by branch:', error);
        res.status(500).json({ message: 'Error fetching forms', error: error.message });
    }
};

// Update an existing OTS form (only by owner)
exports.updateOTSForm = async (req, res) => {
    try {
        const formId = req.params.id;
        const userId = req.user.id;
        const updatedForm = await OTSForm.findOneAndUpdate(
            { _id: formId, userId }, // Ensure user owns the form
            req.body,
            { new: true, runValidators: true }
        );

        if (!updatedForm) {
            return res.status(404).json({ message: 'OTS form not found or unauthorized' });
        }

        res.status(200).json({ message: 'OTS form updated successfully', data: updatedForm });
    } catch (error) {
        console.error('Error updating OTS form:', error);
        res.status(500).json({ message: 'Error updating form', error: error.message });
    }
};
// Track application status.
exports.trackStatus = async (req, res) => {
    try {
        const {loan_number} = req.body;
        if (!loan_number) {
            return res.status(400).json({ message: 'Application ID is required (query parameter: appId)' });
        }

        const application = await OTSForm.findById(loan_number);
        if (!application) {
            return res.status(404).json({ message: 'Application not found' });
        }

        res.status(200).json({ status: application.status_msg });
    } catch (error) {
        console.error('Error tracking status:', error);
        res.status(500).json({ message: 'Error tracking status', error: error.message });
    }
};

// reject OTS application status

exports.ApproveRejectOtsApplication = async (req, res) => {
    try {
      const { otsFormId, flag } = req.body;

      if(flag == 2){
        const updatedForm = await OTSForm.findByIdAndUpdate(
        otsFormId,
        {
          status: 2, // assuming 2 = rejected, 1 = active/in-progress/completed
          status_msg: "OTS Application rejected"
        },
        { new: true }
      );
      if (!updatedForm) {
        return res.status(404).json({ message: 'OTS application not found' });
      }
      res.status(200).json({ message: 'OTS application rejected successfully', form: updatedForm });
      }
      else if(flag == 1){
        const updatedForm = await OTSForm.findByIdAndUpdate(
        otsFormId,
        {
          status: 2, // assuming 2 = rejected, 1 = active/in-progress/completed
          status_msg: "OTS Application rejected"
        },
        { new: true }
      );
        if (!updatedForm) {
        return res.status(404).json({ message: 'OTS application not found' });
      }
      res.status(200).json({ message: 'OTS application approved successfully', form: updatedForm });
      }
      else{
      res.status(200).json({ message: 'Flag value must be 1(Approved) or 2(Rejected)', form: updatedForm });
      }
      
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };

  // filter OTS application

exports.filterOTS = async (req, res) => {
  try {
    const { otsId, userId, branch, status } = req.body;
    const filter = {};
    if (otsId) filter.loan_number= otsId;
    if (userId) filter.userId = userId;
    if (branch) filter.branch = branch;
    if (status) filter.status = status;
    const otsForms = await OTSForm.find(filter);
    const enrichedResults = await Promise.all(otsForms.map(async (ots) => {
      const ack = await AckForm.findOne({ ots_form_id: ots._id }, 'img_link_sign_stamp');
      const memo = await Memorandum.findOne({ otsFormId: ots._id }, 'pdfData');
      const certificate = await CertificateOrder.findOne({ otsId: ots._id }, 'certificate');
      return {
        ots,
        ackFile: ack?.img_link_sign_stamp || null,
        memoFile: memo?.pdfData || null,
        certificateFile: certificate?.certificate || null
      };
    }));
    return res.status(200).json(enrichedResults);
  } catch (error) {
    console.error('Filter OTS Error:', error);
    return res.status(500).json({ message: 'Server Error', error: error.message });
  }
};

exports.getOTSStatusCounts = async (req, res) => {
  const { branch } = req.body;
  try {
    const matchStage = branch ? { $match: { branch } } : null;
    const pipeline = [];
    if (matchStage) pipeline.push(matchStage);
    pipeline.push({
      $group: {
        _id: '$status',
        count: { $sum: 1 }
      }
    });
    const counts = await OTSForm.aggregate(pipeline);
    if (branch && counts.length === 0) {
      return res.status(404).json({ message: 'Invalid branch' });
    }
    const statusCounts = {
      pending: 0,   
      approved: 0,  
      rejected: 0   
    };
    counts.forEach(item => {
      if (item._id === 0) statusCounts.pending = item.count;
      else if (item._id === 1) statusCounts.approved = item.count;
      else if (item._id === 2) statusCounts.rejected = item.count;
    });
    res.status(200).json({
      message: branch
        ? `OTS application status counts for branch '${branch}' retrieved successfully`
        : 'All OTS application status counts retrieved successfully',
      data: statusCounts
    });
  } catch (error) {
    console.error('Error getting status counts:', error);
    res.status(500).json({ message: 'Server error', error: error.message });
  }
};

exports.approveOtsApplication = async (req, res) => {
  try {
    const { otsFormId } = req.body;

    const updatedForm = await OTSForm.findByIdAndUpdate(
      otsFormId,
      {
        status: 1, // assuming 1 = approved
        status_msg: "OTS Application approved"
      },
      { new: true }
    );

    if (!updatedForm) {
      return res.status(404).json({ message: 'OTS application not found' });
    }

    res.status(200).json({ message: 'OTS application approved successfully', form: updatedForm });
  } catch (error) {
    console.error('Error approving OTS application:', error);
    res.status(500).json({ message: 'Server error', error: error.message });
  }
};



 