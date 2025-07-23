// src/middlewares/fileUploadHandler.js
import multer, { diskStorage, MulterError } from 'multer';
import { fileURLToPath } from 'url';
import { dirname, join, basename, extname } from 'path';
import { existsSync, mkdirSync, readFileSync, unlinkSync } from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Upload directory
const uploadDir = join(__dirname, '..', 'uploads');
if (!existsSync(uploadDir)) mkdirSync(uploadDir, { recursive: true });

const sanitizeFilename = (originalName) => {
  const safeName = basename(originalName).replace(/[^a-zA-Z0-9_.-]/g, '');
  const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
  return uniqueSuffix + '-' + safeName;
};

const storage = diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => cb(null, sanitizeFilename(file.originalname))
});

const fileFilter = (req, file, cb) => {
  const allowedMimeTypes = ['application/pdf'];
  const isMimeValid = allowedMimeTypes.includes(file.mimetype);
  const isExtValid = extname(file.originalname).toLowerCase() === '.pdf';

  if (isMimeValid && isExtValid) cb(null, true);
  else cb(new Error('Only PDF files are allowed!'));
};

const upload = multer({
  storage,
  fileFilter,
  limits: {
    fileSize: 2 * 1024 * 1024 // 2MB
  }
});

export const singlePdfUpload = upload.single('pdf');

export const supplyOrderUpload = upload.fields([
  { name: 'proof_of_supply', maxCount: 1 },
  { name: 'invoice_submission', maxCount: 1 }
]);

export const validatePdfMagicNumber = (req, res, next) => {
  const file = req.file || (req.files?.pdf?.[0]);
  if (!file) return next();

  try {
    const buffer = readFileSync(file.path);
    if (!buffer.toString().startsWith('%PDF')) {
      unlinkSync(file.path);
      return res.status(400).json({ status: 'fail', message: 'Invalid PDF file content' });
    }
    next();
  } catch (err) {
    return res.status(500).json({ status: 'error', message: 'File validation failed' });
  }
};

export const multerErrorHandler = (err, req, res, next) => {
  if (err instanceof MulterError || err.message.includes('Only PDF')) {
    return res.status(400).json({ status: 'fail', message: err.message });
  }
  next(err);
};
