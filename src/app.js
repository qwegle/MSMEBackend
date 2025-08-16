import dotenv from 'dotenv';
dotenv.config();

import express, { json } from 'express';
import helmet from 'helmet';
import cors from 'cors';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import hpp from 'hpp';
import compression from 'compression';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';
import mongoSanitize from 'mongo-sanitize';
import xss from 'xss';
import connectDB from './config/db.js';
import routes from './routes/index.js';
import errorHandler from './middlewares/errorHandler.js';
import { sendEncryptedResponse } from './utils/encryption.js';
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const app = express();
app.disable('x-powered-by');
app.disable('etag');
app.set('trust proxy', 1);
app.use((req, res, next) => {
  res.removeHeader('Server');
  res.setHeader('Server', 'secure-gateway');
  next();
});
const allowedOrigins = (process.env.ALLOWED_ORIGINS || 'https://msme.qwegle.info,https://msme-odisha.flutterflow.app')
  .split(',')
  .map(o => o.trim());
app.use(cors({
  origin: (origin, callback) => {
    if (!origin || allowedOrigins.includes(origin)) {
      return callback(null, true);
    }
    return callback(new Error('Not allowed by CORS'));
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));
app.options('*', cors());
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}
app.use(helmet({
  contentSecurityPolicy: false,
  crossOriginEmbedderPolicy: false
}));
app.use((req, res, next) => {
  const apiOrigin = process.env.NODE_APP_URL || 'https://msmebackend.onrender.com';
  const connectSrcList = [
    "'self'",
    apiOrigin,
    ...allowedOrigins,
    'https://*',
    'wss://*'
  ];
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');
  res.setHeader(
    'Content-Security-Policy',
    [
      "default-src 'self'",
      "script-src 'self' 'unsafe-inline' 'unsafe-eval' https:",
      "style-src 'self' 'unsafe-inline' https:",
      "img-src 'self' data: https:",
      `connect-src ${connectSrcList.join(' ')}`,
      "font-src 'self' https: data:",
      "frame-ancestors 'self'",
      "object-src 'none'",
      "upgrade-insecure-requests",
      "base-uri 'self'",
      "form-action 'self'"
    ].join('; ')
  );
  res.setHeader('X-XSS-Protection', '1; mode=block');
  res.setHeader(
    'Permissions-Policy',
    'geolocation=(), microphone=(), camera=(), fullscreen=(), payment=(), accelerometer=(), autoplay=(), usb=()'
  );
  next();
});
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  handler: (req, res) => {
    sendEncryptedResponse(res, 429, {
      message: 'Too many requests. Try again later.'
    });
  },
  standardHeaders: true,
  legacyHeaders: false
});
app.use('/api', limiter);
app.use(json());
app.use(hpp());
app.use(compression());
const sanitizeInput = input => {
  if (typeof input === 'string') return xss(input);
  if (Array.isArray(input)) return input.map(sanitizeInput);
  if (typeof input === 'object' && input !== null) {
    const sanitized = {};
    for (const key in input) {
      sanitized[key] = sanitizeInput(input[key]);
    }
    return sanitized;
  }
  return input;
};
app.use((req, res, next) => {
  req.body = mongoSanitize(sanitizeInput(req.body));
  Object.keys(req.query).forEach(key => {
    req.query[key] = sanitizeInput(mongoSanitize(req.query[key]));
  });
  Object.keys(req.params).forEach(key => {
    req.params[key] = sanitizeInput(mongoSanitize(req.params[key]));
  });
  next();
});
app.use('/api', (req, res, next) => {
  res.setHeader('Cache-Control', 'no-store');
  res.setHeader('Pragma', 'no-cache');
  next();
});
app.use('/uploads', express.static(join(__dirname, 'uploads')));
app.use('/api', routes);
app.use((err, req, res, next) => {
  if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
    return res.status(400).json({
      status: 'fail',
      message: 'Malformed JSON payload'
    });
  }
  next(err);
});
app.use(errorHandler);
const PORT = process.env.PORT || 3000;
(async () => {
  try {
    await connectDB();
    app.listen(PORT, () => {
      console.log(`Server running on port ${PORT}`);
    });
  } catch (error) {
    console.error('Failed to connect to database:', error);
    process.exit(1);
  }
})();

export default app;
