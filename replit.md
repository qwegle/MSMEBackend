# MSME APIs - Project Documentation

## Overview
This is an MSME (Micro, Small, and Medium Enterprises) management system for Odisha, India. It consists of:
- **Backend**: Node.js/Express API with MongoDB database
- **Frontend**: Pre-built Flutter web application

## Project Structure
```
├── frontend/           # Pre-built Flutter web app (static files)
├── src/
│   ├── app.js         # Main Express application
│   ├── config/        # Database and Cloudinary configuration
│   ├── controllers/   # API controllers (OKVI, OSFC, OSIC modules)
│   ├── middlewares/   # Authentication, validation, error handling
│   ├── models/        # Mongoose models
│   ├── routes/        # API routes
│   ├── services/      # Business logic services
│   ├── utils/         # Utility functions (email, encryption, etc.)
│   └── validations/   # Input validation schemas
└── package.json
```

## Key Modules
- **OKVI**: Opening/Closing stock management, claims, holidays
- **OSFC**: Loans, certificates, acknowledgments, settlements
- **OSIC**: Tenders, bidders, supply orders

## Environment Variables Required
- `MONGO_URI`: MongoDB connection string
- `JWT_SECRET`: Secret key for JWT authentication
- `JWT_EXPIRES_IN`: Token expiration time (default: 30m)
- `CLOUDINARY_*`: Cloudinary configuration for file uploads
- `EMAIL_*`: Email service configuration

## Development Setup
The app runs on port 5000 and serves both the API (`/api/*`) and the Flutter frontend.

## Database
This project uses MongoDB (not PostgreSQL). You need a valid MongoDB Atlas connection string.

## Current Status
- Frontend: Working (Flutter web app loads correctly)
- Backend API: Working (requires valid MongoDB connection for full functionality)

## Notes
- ALLOW_DB_FAILURE is set to allow the app to start even if MongoDB is unavailable
- The app was imported from a GitHub repository and adapted for Replit
