const multer = require('multer');
const path = require('path');
const fs = require('fs');

// Define the upload directory
const uploadDir = path.join(__dirname, '..', 'uploads');

// Ensure upload directory exists
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

// Configure multer storage
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, uploadDir);
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + path.extname(file.originalname));
  }
});

// Common file filter for PDFs only
const fileFilter = function (req, file, cb) {
  const allowedMimeTypes = ['application/pdf'];
  if (
    allowedMimeTypes.includes(file.mimetype) &&
    path.extname(file.originalname).toLowerCase() === '.pdf'
  ) {
    cb(null, true);
  } else {
    cb(new Error('Only PDF files are allowed!'));
  }
};

// Create base upload instance
const upload = multer({
  storage,
  fileFilter,
  limits: {
    fileSize: 2 * 1024 * 1024 // 2MB
  }
});

// Single PDF upload (e.g., memorandum)
const singlePdfUpload = upload.single('pdf');

// Two PDF fields for supply order
const supplyOrderUpload = upload.fields([
  { name: 'proof_of_supply', maxCount: 1 },
  { name: 'invoice_submission', maxCount: 1 }
]);

module.exports = {
  singlePdfUpload,
  supplyOrderUpload
};
