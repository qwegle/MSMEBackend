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
- **OKVI**: Odisha Khadi and Village Industries - Rebate Management System
- **OSFC**: Loans, certificates, acknowledgments, settlements
- **OSIC**: Tenders, bidders, supply orders

## OKVI Module - Complete API Reference

### Authentication APIs
| Endpoint | Method | Auth | Description |
|----------|--------|------|-------------|
| `/api/okvi/auth/login` | POST | No | User login |
| `/api/okvi/auth/registerAdmin` | POST | No | Admin registration (requires DEV_PASS) |
| `/api/okvi/auth/sendotp` | POST | No | Send OTP for registration |
| `/api/okvi/auth/verifyotp` | POST | No | Verify OTP |
| `/api/okvi/auth/registerUserDetails` | POST | No | Complete user registration |
| `/api/okvi/auth/logout` | POST | Yes | Logout user |
| `/api/okvi/auth/dashboard` | GET | Yes | Get user dashboard |
| `/api/okvi/auth/forgot-password/send-otp` | POST | No | Send OTP for password reset |
| `/api/okvi/auth/forgot-password/verify-otp` | POST | No | Verify password reset OTP |
| `/api/okvi/auth/forgot-password/reset` | POST | No | Reset password with verified OTP |
| `/api/okvi/auth/change-password` | POST | Yes | Change password for logged-in user |

### Claim Documents APIs
| Endpoint | Method | Auth | Description |
|----------|--------|------|-------------|
| `/api/okvi/claim-documents/form-i` | POST | Yes | Create Form I |
| `/api/okvi/claim-documents/form-v` | POST | Yes | Create Form V |
| `/api/okvi/claim-documents/form-vi` | POST | Yes | Create Form VI |
| `/api/okvi/claim-documents/declaration-certificate` | POST | Yes | Create Declaration Certificate |
| `/api/okvi/claim-documents/upload-audit-certificate` | POST | Yes | Upload Audit Certificate |
| `/api/okvi/claim-documents/upload-bank-deposit-proof` | POST | Yes | Upload Bank Deposit Proof |
| `/api/okvi/claim-documents/final-submit` | POST | Yes | Final submit claim |
| `/api/okvi/claim-documents/submitted-claim-document` | POST | Yes | Get submitted claim with all form statuses |
| `/api/okvi/claim-documents/claim-summary` | POST | Yes | Get claim summary with totals |
| `/api/okvi/claim-documents/getClaimData` | POST | Yes | Get filtered claim data |

### Admin APIs (GMDIC/DI/Addl. Director)
| Endpoint | Method | Auth | Role | Description |
|----------|--------|------|------|-------------|
| `/api/okvi/admin/dashboard` | GET | Yes | 0,1,2 | Get admin dashboard |
| `/api/okvi/admin/claims/pending` | GET | Yes | 0,1,2 | Get pending claims |
| `/api/okvi/admin/claims/:id` | GET | Yes | 0,1,2 | Get claim by ID |
| `/api/okvi/admin/claims/:id/forms` | GET | Yes | 0,1,2 | Get claim with all form statuses |
| `/api/okvi/admin/claims/approve` | POST | Yes | 0,1,2 | Approve entire claim |
| `/api/okvi/admin/claims/reject` | POST | Yes | 0,1,2 | Reject entire claim |
| `/api/okvi/admin/forms/approve` | POST | Yes | 0,1,2 | Approve individual form |
| `/api/okvi/admin/forms/reject` | POST | Yes | 0,1,2 | Reject individual form |
| `/api/okvi/admin/claims/approve-and-move` | POST | Yes | 0,1,2 | Approve all forms and move to next level |

### User Roles
| Role | Value | Permissions |
|------|-------|-------------|
| GMDIC | 0 | First-level approval, Master data CRUD |
| DI | 1 | Second-level approval |
| Addl. Director | 2 | Final approval, Sanction calculation |
| Regular User | 3 | Submit claims, View own data |

### Approval Flow
1. User submits claim (status: submitted, approval_level: 0)
2. GMDIC reviews each form individually, approves all forms
3. GMDIC moves claim to DI (status: gmdic_approved, approval_level: 1)
4. DI reviews and approves each form
5. DI moves claim to Addl. Director (status: di_approved, approval_level: 2)
6. Addl. Director reviews, approves, calculates sanction (status: sanctioned)
7. User uploads sanction order (status: sanction_order_uploaded)
8. Final disbursement (status: disbursed)

## Environment Variables Required
- `MONGO_URI`: MongoDB connection string
- `JWT_SECRET`: Secret key for JWT authentication
- `JWT_EXPIRES_IN`: Token expiration time (default: 30m)
- `CLOUDINARY_*`: Cloudinary configuration for file uploads
- `EMAIL_*`: Email service configuration

## Development Setup
The app runs on port 5000 and serves both the API (`/api/*`) and the Flutter frontend.

## Database
This project uses MongoDB. Connection status is verified at startup.

## Recent Changes (Dec 2024)
- Added individual form approval tracking (approvedBy, approvedAt, rejectionReason, reviewedByRole)
- Implemented Forgot Password API with OTP-based verification
- Implemented Change Password API for authenticated users
- Added individual form approval/rejection APIs for admins
- Added getSubmittedClaimDocument API for "View Submitted Claim Document" page
- Added getClaimSummary API for totals and form status summary
- Updated approval flow to check all forms approved before moving to next level
