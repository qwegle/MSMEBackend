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
// __dirname replacement for ESM
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const app = express();
app.disable('x-powered-by');
app.set('trust proxy', 1);

if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

app.use(helmet());
// app.use(cors());
const allowedOrigins = [
  'http://127.0.0.1:5500',
  'https://msme.qwegle.info',
  'https://msme-odisha.flutterflow.app'
];

app.use(cors({
  origin: function (origin, callback) {
    // Allow requests with no origin (like mobile apps or curl)
    if (!origin) return callback(null, true);
    if (allowedOrigins.includes(origin)) {
      return callback(null, true);
    } else {
      return callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true, // 🔥 Allow cookies and auth headers
}));
app.use(json());
app.use(hpp());
app.use(compression());

// Input sanitization
const sanitizeInput = (input) => {
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
  const sanitizedQuery = sanitizeInput({ ...req.query });
  for (const key in sanitizedQuery) {
    req.query[key] = sanitizedQuery[key];
  }
  req.params = mongoSanitize(sanitizeInput(req.params));
  next();
});


// Rate limiting
// const limiter = rateLimit({
//   windowMs: 15 * 60 * 1000,
//   max: 100,
//   message: 'Too many requests from this IP, please try again later.',
// });
// app.use('/api', limiter);

// Static file serving
app.use('/uploads', express.static(join(__dirname, 'uploads')));

// Routes
app.use('/api', routes);

// Handle bad JSON
app.use((err, req, res, next) => {
  if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
    return res.status(400).json({
      status: 'fail',
      message: 'Malformed JSON payload',
    });
  }
  next(err);
});

// General error logging
app.use((err, req, res, next) => {
  console.error('Error stack:', err.stack);
  res.status(500).json({
    status: 'error',
    message: err.message,
  });
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

// import express from 'express';
// import cors from 'cors';
// import helmet from 'helmet';
// import compression from 'compression';
// import rateLimit from 'express-rate-limit';
// import mongoSanitize from 'express-mongo-sanitize';
// import xss from 'xss-clean';
// import hpp from 'hpp';
// // import cookieParser from 'cookie-parser';
// import morgan from 'morgan';
// import { join } from 'path';
// import { config } from 'dotenv';
// import { fileURLToPath } from 'url';
// import { dirname } from 'path';

// import connectDB from './config/db.js';
// import routes from './routes/index.js';
// import AppError from './utils/AppError.js';
// import errorHandler from './middlewares/errorHandler.js';
// // import { generateTimestamp } from './middlewares/timestamp.middleware.js';

// config();

// const app = express();
// const __filename = fileURLToPath(import.meta.url);
// const __dirname = dirname(__filename);

// const PORT = process.env.PORT || 3000;

// (async () => {
//   try {
//     await connectDB();
//     app.listen(PORT, () => {
//       console.log(`Server running on port ${PORT}`);
//     });
//   } catch (error) {
//     console.error('Failed to connect to database:', error);
//     process.exit(1);
//   }
// })();

// // app.use(helmet());

// app.use(
//   helmet.contentSecurityPolicy({
//     directives: {
//       defaultSrc: ["'self'"],
//       scriptSrc: ["'self'", "https:"],
//       styleSrc: ["'self'", "'unsafe-inline'", "https:"],
//       imgSrc: ["'self'", "data:", "https:"],
//       connectSrc: ["'self'", "https:"],
//       fontSrc: ["'self'", "https:"],
//       objectSrc: ["'none'"],
//       upgradeInsecureRequests: [],
//     },
//   })
// );

// app.use(
//   helmet.hsts({
//     maxAge: 31536000,
//     includeSubDomains: true,
//     preload: true,
//   })
// );

// if (process.env.NODE_ENV === 'development') {
//   app.use(morgan('dev'));
// }

// app.use(express.json({ limit: '10kb' }));
// app.use(express.urlencoded({ extended: true }));

// // app.use(cookieParser());

// // const limiter = rateLimit({
// //   windowMs: 15 * 60 * 1000, // 15 minutes
// //   max: 100,
// //   standardHeaders: true,
// //   legacyHeaders: false,
// // });
// // app.use('/api', limiter);

// app.use(mongoSanitize());
// app.use(xss());
// app.use(hpp());

// function sanitizeInput(input) {
//   if (typeof input === 'string') {
//     return input.replace(/[<>"'&;]/g, '');
//   }
//   if (typeof input === 'object' && input !== null) {
//     for (const key in input) {
//       if (['__proto__', 'constructor', 'prototype'].includes(key)) continue;
//       input[key] = sanitizeInput(input[key]);
//     }
//   }
//   return input;
// }
// app.use((req, res, next) => {
//   req.body = sanitizeInput(req.body);
//   req.query = sanitizeInput(req.query);
//   req.params = sanitizeInput(req.params);
//   next();
// });

// app.use(
//   compression({
//     filter: (req, res) => {
//       if (/\/api\/auth/.test(req.originalUrl)) return false;
//       return compression.filter(req, res);
//     },
//   })
// );

// app.use(cors({ origin: true, credentials: true }));

// // app.use(generateTimestamp);

// app.use(
//   '/uploads',
//   express.static(join(__dirname, 'uploads'), {
//     setHeaders: (res, path) => {
//       res.setHeader('X-Content-Type-Options', 'nosniff');
//       res.setHeader('Content-Security-Policy', "default-src 'none'");
//     },
//   })
// );

// app.use('/api', routes);

// app.use((req, res, next) => {
//   next(new AppError(`Can't find ${req.originalUrl} on this server`, 404));
// });

// app.use(errorHandler);

// export default app;
