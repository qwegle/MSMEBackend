import multer, { MulterError } from 'multer';
import { extname } from 'path';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import cloudinary from '../config/cloudinary.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const ALLOWED_MIME = ['application/pdf'];
const memoryStorage = multer.memoryStorage();
const fileFilter = (req, file, cb) => {
  const extValid = extname(file.originalname).toLowerCase() === '.pdf';
  const mimeValid = ALLOWED_MIME.includes(file.mimetype);
  console.log(`📁 File filter triggered for: ${file.originalname}`);
  console.log(`📁 MIME type: ${file.mimetype}, ext: ${extname(file.originalname)}`);

  if (extValid && mimeValid) cb(null, true);
  else cb(new Error('Only PDF files are allowed!'));
};
const uploadMemory = multer({
  storage: memoryStorage,
  fileFilter,
  limits: { fileSize: 2 * 1024 * 1024 },
});
export const singlePdfUpload = uploadMemory.single('pdf');
export const upload = uploadMemory;
export const supplyOrderUpload = uploadMemory.fields([
  { name: 'proof_of_supply', maxCount: 1 },
  { name: 'invoice_submission', maxCount: 1 },
]);
export function validatePdfMagicNumber(req, res, next) {
  console.log('Running PDF magic number check...');
  const allFiles = []
    .concat(req.file || [])
    .concat(Object.values(req.files || {}).flat());

  for (const f of allFiles) {
    console.log(`Checking magic number for: ${f.originalname}`);
    const buf = f.buffer;
    if (!buf || buf.length < 4 || buf.slice(0, 4).toString() !== '%PDF') {
      console.warn(`Invalid PDF magic number in file: ${f.originalname}`);
      return res.status(400).json({
        status: 'fail',
        message: `Invalid PDF content: ${f.originalname}`,
      });
    }
  }

  console.log('All PDF files passed magic number check');
  next();
}

async function uploadBufferToCloud(buffer, origName) {
  console.log(`Uploading to Cloudinary: ${origName}`);
  if (!buffer || !Buffer.isBuffer(buffer)) {
    throw new Error('Invalid or empty buffer provided for upload');
  }

  return new Promise((resolve, reject) => {
    const publicIdBase = origName.replace(/\.pdf$/i, '').replace(/[^\w\d-]/g, '');
    const opts = {
      folder: 'MSME/pdfs',
      public_id: `${Date.now()}-${publicIdBase}.pdf`,
      resource_type: 'raw',
      type: 'upload',
      access_mode: 'public',
    };

    const stream = cloudinary.uploader.upload_stream(opts, (error, result) => {
      if (error) {
        console.error('Cloudinary upload error:', error);
        return reject(error);
      }
      console.log(`Cloudinary upload success: ${result.secure_url}`);
      resolve(result);
    });

    stream.on('error', (streamErr) => {
      console.error('Stream error:', streamErr);
      reject(streamErr);
    });

    stream.end(buffer);
  });
}
export async function uploadToCloud(req, res, next) {
  try {
    console.log('uploadToCloud middleware triggered');
    if (req.file) {
      console.log(`Found single file: ${req.file.originalname}`);
      const result = await uploadBufferToCloud(req.file.buffer, req.file.originalname);
      req.file = {
        url: result.secure_url,
        public_id: result.public_id,
      };
    }
    if (req.files) {
      console.log(`Found multiple files: ${Object.keys(req.files).join(', ')}`);
      for (const field of Object.keys(req.files)) {
        req.files[field] = await Promise.all(
          req.files[field].map(async (f) => {
            console.log(` Uploading field "${field}" file: ${f.originalname}`);
            const result = await uploadBufferToCloud(f.buffer, f.originalname);
            return {
              url: result.secure_url,
              public_id: result.public_id,
            };
          })
        );
      }
    }

    console.log('All files uploaded to Cloudinary');
    next();
  } catch (err) {
    console.error('uploadToCloud error:', err);
    return res.status(500).json({
      status: 'error',
      message: err?.message || 'Upload to Cloudinary failed',
    });
  }
}
export const multerErrorHandler = (err, req, res, next) => {
  console.error('Caught in multerErrorHandler:', err);
  const isMulterError = err instanceof MulterError;
  const isPdfError = typeof err?.message === 'string' && err.message.includes('Only PDF');

  if (isMulterError || isPdfError) {
    return res.status(400).json({
      status: 'fail',
      message: err.message || 'Invalid file upload',
    });
  }

  return res.status(500).json({
    status: 'error',
    message: typeof err?.message === 'string'
      ? err.message
      : 'Unexpected file upload error',
  });
};
