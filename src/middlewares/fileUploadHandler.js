const multer = require('multer');
const path = require('path');
const fs = require('fs');

// Upload directory
const uploadDir = path.join(__dirname, '..', 'uploads');

// Ensure upload directory exists
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

// Filename sanitization and uniqueness
const sanitizeFilename = (originalName) => {
  const safeName = path.basename(originalName).replace(/[^a-zA-Z0-9_.-]/g, '');
  const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
  return uniqueSuffix + '-' + safeName;
};

// Multer storage config
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, uploadDir);
  },
  filename: (req, file, cb) => {
    cb(null, sanitizeFilename(file.originalname));
  }
});

// File filter for strict PDF validation
const fileFilter = (req, file, cb) => {
  const allowedMimeTypes = ['application/pdf'];
  const isMimeValid = allowedMimeTypes.includes(file.mimetype);
  const isExtValid = path.extname(file.originalname).toLowerCase() === '.pdf';
  
  if (isMimeValid && isExtValid) {
    cb(null, true);
  } else {
    cb(new Error('Only PDF files are allowed!'));
  }
};

// Base upload middleware
const upload = multer({
  storage,
  fileFilter,
  limits: {
    fileSize: 2 * 1024 * 1024 // 2MB
  }
});

// Exported upload middlewares
const singlePdfUpload = upload.single('pdf');

const supplyOrderUpload = upload.fields([
  { name: 'proof_of_supply', maxCount: 1 },
  { name: 'invoice_submission', maxCount: 1 }
]);

// Optional PDF magic number check
const validatePdfMagicNumber = (req, res, next) => {
  const file = req.file || (req.files?.pdf?.[0]);
  if (!file) return next();

  try {
    const buffer = fs.readFileSync(file.path);
    if (!buffer.toString().startsWith('%PDF')) {
      fs.unlinkSync(file.path); // Remove fake PDF
      return res.status(400).json({ status: 'fail', message: 'Invalid PDF file content' });
    }
    next();
  } catch (err) {
    return res.status(500).json({ status: 'error', message: 'File validation failed' });
  }
};

// Multer error handler
const multerErrorHandler = (err, req, res, next) => {
  if (err instanceof multer.MulterError || err.message.includes('Only PDF')) {
    return res.status(400).json({ status: 'fail', message: err.message });
  }
  next(err);
};

module.exports = {
  singlePdfUpload,
  supplyOrderUpload,
  validatePdfMagicNumber,
  multerErrorHandler
};
