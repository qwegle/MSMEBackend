const Loan = require('../models/existing_loans.js');

// Create a loan
exports.createLoan = async (req, res) => {
  try {
    const loan = new Loan(req.body);
    await loan.save();
    res.status(201).json({ message: 'Loan created successfully', loan });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Get all loans
exports.getAllLoans = async (req, res) => {
  try {
    const loans = await Loan.find().sort({ createdAt: -1 });
    res.status(200).json(loans);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get loans by customerId
exports.getLoansByCustomerId = async (req, res) => {
  try {
    const { customerId } = req.params;

    if (!customerId) {
      return res.status(400).json({ message: 'Customer ID is required' });
    }

    const loans = await Loan.find({ customerId }).sort({ createdAt: -1 });

    if (!loans.length) {
      return res.status(404).json({ message: 'No loans found for this customer.' });
    }

    res.status(200).json(loans);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Filter loans
exports.filterLoans = async (req, res) => {
  const { loanType, loanStatus, customerName, minOverdue, maxOverdue, branch } = req.body;

  try {
    const query = {};
    if (loanType) query.loanType = loanType;
    if (loanStatus) query.loanStatus = loanStatus;
    if (branch) query.branch = branch;
    if (customerName) query.customerName = { $regex: new RegExp(customerName, 'i') };
    if (minOverdue !== "" || maxOverdue !== "") {
      query.overdueAmount = {};
      if (minOverdue !== "") query.overdueAmount.$gte = minOverdue;
      if (maxOverdue !== "") query.overdueAmount.$lte = maxOverdue;
    }
    console.log(query,"iufgeruigiuergfuierwhferuifweriuhgergye89gyer89gh9er8fgyh9egerghr9eg9r8ege989egh9ergyre9gyer98gyer98yre9ger98th98er98er98gh98erghgherghe0[r");
    const loans = await Loan.find(query).sort({ createdAt: -1 });

    res.status(200).json(loans);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Update loan by ID
exports.updateLoan = async (req, res) => {
  try {
    const updatedLoan = await Loan.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!updatedLoan) {
      return res.status(404).json({ message: 'Loan not found' });
    }

    res.status(200).json({ message: 'Loan updated successfully', loan: updatedLoan });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Delete loan by ID
exports.deleteLoan = async (req, res) => {
  try {
    const deletedLoan = await Loan.findByIdAndDelete(req.params.id);
    if (!deletedLoan) {
      return res.status(404).json({ message: 'Loan not found' });
    }
    res.status(200).json({ message: 'Loan deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
