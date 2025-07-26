import multer from 'multer';
import { MulterError } from 'multer';
import { extname } from 'path';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import cloudinary from '../config/cloudinary.js';
import { v2 as cloudinaryV2 } from 'cloudinary';
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const ALLOWED_MIME = ['application/pdf'];
const memoryStorage = multer.memoryStorage();
const fileFilter = (req, file, cb) => {
  const extValid = extname(file.originalname).toLowerCase() === '.pdf';
  const mimeValid = ALLOWED_MIME.includes(file.mimetype);
  if (extValid && mimeValid) cb(null, true);
  else cb(new Error('Only PDF files are allowed!'));
};
const limits = { fileSize: 2 * 1024 * 1024 }; // 2 MB
const uploadMemory = multer({ storage: memoryStorage, fileFilter, limits });
export const singlePdfUpload = uploadMemory.single('pdf');
export const supplyOrderUpload = uploadMemory.fields([
  { name: 'proof_of_supply',    maxCount: 1 },
  { name: 'invoice_submission', maxCount: 1 },
]);
export function validatePdfMagicNumber(req, res, next) {
  const allFiles = []
    .concat(req.file || [])
    .concat(Object.values(req.files || {}).flat());
  for (const f of allFiles) {
    const buf = f.buffer;
    if (!buf || buf.length < 4 || buf.slice(0, 4).toString() !== '%PDF') {
      return res
        .status(400)
        .json({ status: 'fail', message: 'Invalid PDF file content' });
    }
  }
  next();
}
async function uploadBufferToCloud(buffer, origName) {
  return new Promise((resolve, reject) => {
    const publicIdBase = origName.replace(/\.pdf$/i, '');
    const opts = {
      folder: 'MSME/pdfs',
      format: 'pdf',
      public_id: `${Date.now()}-${publicIdBase}`,
      resource_type: 'raw', 
      transformation: [
        { quality: 'auto' },
        { fetch_format: 'auto' }
      ]
    };
    const stream = cloudinaryV2.uploader.upload_stream(
      opts,
      (error, result) => (error ? reject(error) : resolve(result))
    );
    stream.end(buffer);
  });
}

export async function uploadToCloud(req, res, next) {
  try {
    if (req.file) {
      const result = await uploadBufferToCloud(
        req.file.buffer,
        req.file.originalname
      );
      req.file = {
        url: result.secure_url,
        public_id: result.public_id,
      };
    }
    if (req.files) {
      for (const field of Object.keys(req.files)) {
        req.files[field] = await Promise.all(
          req.files[field].map(async (f) => {
            const result = await uploadBufferToCloud(f.buffer, f.originalname);
            return { url: result.secure_url, public_id: result.public_id };
          })
        );
      }
    }
    next();
  } catch (err) {
    next(err);
  }
}
export const multerErrorHandler = (err, req, res, next) => {
  if (err instanceof MulterError || err.message.includes('Only PDF')) {
    return res.status(400).json({ status: 'fail', message: err.message });
  }
  next(err);
};
