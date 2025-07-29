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
  'https://recaptchademo-w4a2bp.flutterflow.app',
  'http://127.0.0.1:5500',
  'https://msme.qwegle.info',
  'https://msme-odisha.flutterflow.app'
];

app.use(cors({
  origin: function (origin, callback) {
    if (!origin) return callback(null, true);
    if (allowedOrigins.includes(origin)) {
      return callback(null, true);
    } else {
      return callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true,
}));
app.use(json());
app.use(hpp());
app.use(compression());

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


const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: 'Too many requests from this IP, please try again later.',
});
app.use('/api', limiter);
app.use('/uploads', express.static(join(__dirname, 'uploads')));
app.use('/api', routes);
app.use((err, req, res, next) => {
  if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
    return res.status(400).json({
      status: 'fail',
      message: 'Malformed JSON payload',
    });
  }
  next(err);
});
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

