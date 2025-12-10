# MSME APIs - Project Documentation

## Overview
This is an MSME (Micro, Small, and Medium Enterprises) management system for Odisha, India.
- **Backend**: Node.js/Express API with MongoDB database (port 3000)
- **Frontend**: React 19 + Vite + Tailwind CSS v4 (port 5000)

## Project Structure
```
├── src/                      # Backend API source
│   ├── app.js                # Main Express application
│   ├── config/               # Database and Cloudinary configuration
│   ├── controllers/          # API controllers (OKVI, OSFC, OSIC modules)
│   ├── middlewares/          # Authentication, validation, error handling
│   ├── models/               # Mongoose models
│   ├── routes/               # API routes
│   ├── services/             # Business logic services
│   ├── utils/                # Utility functions (email, encryption, etc.)
│   └── validations/          # Input validation schemas
├── okvi-frontend/            # React frontend for OKVI module
│   ├── src/
│   │   ├── components/       # Reusable UI components
│   │   │   ├── layout/       # GovHeader, Sidebar, Layout, AuthLayout
│   │   │   └── ui/           # Button, Input, Select, Card, Modal, Table
│   │   ├── features/         # Feature modules
│   │   │   ├── auth/         # Login, Register, ForgotPassword
│   │   │   ├── dashboard/    # Dashboard with festival calendar
│   │   │   ├── stock/        # Opening/Closing stock entry and list
│   │   │   ├── claims/       # Claim documents (6 forms)
│   │   │   ├── sanction/     # Sanction order upload
│   │   │   └── profile/      # Change password
│   │   ├── locales/          # i18n translations (en, or)
│   │   ├── services/api/     # Axios API services
│   │   ├── store/            # Zustand stores (auth, language)
│   │   └── routes/           # Protected route component
│   └── public/assets/        # Static assets (logos, placeholders)
└── package.json
```

## Key Modules
- **OKVI**: Odisha Khadi and Village Industries - Rebate Management System
- **OSFC**: Loans, certificates, acknowledgments, settlements
- **OSIC**: Tenders, bidders, supply orders

## OKVI Frontend Features

### Design System
- **Government of Odisha official styling** with tricolor band (saffron, white, green)
- **CM Mohan Majhi** photo placeholder in header
- **Bilingual support**: English and Odia (ଓଡ଼ିଆ) with language toggle
- **Color palette**: Government blue (#003366), saffron (#FF9933), green (#138808)
- **Typography**: Inter for English, Noto Sans Oriya for Odia text

### Pages Implemented
1. **Login** - Email/password with captcha verification
2. **Register** - 8-step wizard (Email OTP → Institution → Registration → Bank → Secretary → President → Committee → Password)
3. **Forgot Password** - OTP-based password reset
4. **Dashboard** - Festival calendar with stock/claim status
5. **Opening Stock** - Entry form and list view
6. **Closing Stock** - Entry form and list view
7. **Claim Documents** - 6 mandatory forms (Form I, V, VI, Declaration, Audit Certificate, Bank Deposit Proof)
8. **Submitted Claims** - View claims with approval history
9. **Sanction Order** - Upload documents for sanctioned claims
10. **Change Password** - Update account password

### Tech Stack
- React 19 with Vite 7
- Tailwind CSS v4 with custom @theme configuration
- React Router v7 for navigation
- React Query v5 for data fetching
- Zustand v5 for state management
- i18next for internationalization
- React Hook Form for form handling
- Lucide React for icons

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

### Backend (port 3000)
```bash
npm run dev
```

### Frontend (port 5000)
```bash
cd okvi-frontend && npm run dev
```

The frontend proxies API calls to `http://localhost:3000`.

## Database
This project uses MongoDB. Connection status is verified at startup.

## CURRENT FOCUS: OKVI MODULE ONLY
**DO NOT modify OSFC or OSIC modules - work on OKVI only!**

### Key Design Choice
OKVI uses plain JSON for API calls (no encryption), unlike OSFC which uses EncDecInterceptor

## Recent Changes (Dec 2024)
- Created complete React frontend for OKVI module with Government of Odisha styling
- Implemented bilingual support (English/Odia) with i18next
- Built all user-facing pages: Login, Register, Dashboard, Stock, Claims, Sanction
- Configured Tailwind CSS v4 with custom government color theme
- Set up React Router with protected routes
- Integrated Zustand for auth and language state management
