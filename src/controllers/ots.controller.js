const OTSForm = require('../models/otsform');

// Create a new OTS form
exports.createOTSForm = async (req, res) => {
    try {
        const formData = req.body;
        formData.userId = req.user.id;
        formData.loan_number = Date.now().toString();
        const newForm = new OTSForm(formData);
        await newForm.save();

        res.status(201).json({ message: 'OTS Form submitted successfully', data: newForm });
    } catch (error) {
        console.error('Error creating OTS Form:', error);
        res.status(500).json({ message: 'Error submitting form', error: error.message });
    }
};

// Get all OTS forms for the logged-in user
exports.getUserOTSForms = async (req, res) => {
    try {
        const forms = await OTSForm.find({ userId: req.user.id }).sort({ createdAt: -1 });

        // res.status(200).json({ data: forms });
        res.status(200).json(forms);
    } catch (error) {
        console.error('Error fetching OTS forms:', error);
        res.status(500).json({ message: 'Error fetching forms', error: error.message });
    }
};

// Get a single OTS form by ID for the logged-in user
exports.getOTSFormById = async (req, res) => {
    try {
        const form = await OTSForm.findOne({
            _id: req.params.id,
            userId: req.user.id
        });

        if (!form) {
            return res.status(404).json({ message: 'OTS form not found' });
        }

        // res.status(200).json({ data: form });
        res.status(200).json(form);
    } catch (error) {
        console.error('Error fetching OTS form:', error);
        res.status(500).json({ message: 'Error fetching form', error: error.message });
    }
};

// (Optional) Admin - Get all OTS forms (use role check middleware if needed)
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

// Get all OTS forms filtered by branch
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
        const appId = req.query.appId;
        if (!appId) {
            return res.status(400).json({ message: 'Application ID is required (query parameter: appId)' });
        }

        const application = await OTSForm.findById(appId);
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

exports.rejectOtsApplication = async (req, res) => {
    try {
      const { otsFormId } = req.body;
  
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
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };

  // filter OTS application

exports.filterOTS = async (req, res) => {
  try {
    const { otsId, userId, branch, status } = req.body;

    // Build dynamic filter
    const filter = {};

    if (otsId) filter._id = otsId;
    if (userId) filter.userId = userId;
    if (branch) filter.branch = branch;
    if (status) filter.status = status;
    console.log(filter);
    let results;
    if(filter){
        results = await OTSForm.find(filter);
    }
    else {
        results = await OTSForm.find();
        console.log("ghreuihgier");
    }

    // res.status(200).json({
    //   message: 'Filtered OTS applications fetched successfully',
    //   count: results.length,
    //   data: results,
    // });

    res.status(200).json(results);
  } catch (error) {
    console.error('Filter OTS Error:', error);
    res.status(500).json({ message: 'Server Error', error: error.message });
  }
};



 