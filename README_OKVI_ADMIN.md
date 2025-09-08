# OKVI Admin Functionality - Implementation Guide

## Overview
This document outlines the complete OKVI admin functionality implementation with multi-level approval workflow (GMDIC → DI → Addl. Director).

## Admin Role Hierarchy

### Role Definitions
- **GMDIC (Role: 0)**: General Manager - Can input holidays, head types, unit types, and perform initial approval
- **DI (Role: 1)**: Deputy Inspector - Second level approval authority
- **Addl. Director (Role: 2)**: Additional Director - Final approval authority

## API Endpoints

### Admin Management
```
GET    /api/okvi/admin/dashboard                    - Admin dashboard with statistics
GET    /api/okvi/admin/claims/pending              - Get pending claims for approval
GET    /api/okvi/admin/claims/:id                  - Get claim details by ID
POST   /api/okvi/admin/claims/:id/approve          - Approve claim
POST   /api/okvi/admin/claims/:id/reject           - Reject claim
```

### Master Data Management (GMDIC Only)
```
GET    /api/okvi/holidays/getAllHolidays           - Get all holidays
POST   /api/okvi/holidays/createHoliday            - Create holiday
PUT    /api/okvi/holidays/updateHoliday            - Update holiday
DELETE /api/okvi/holidays/deleteHoliday            - Delete holiday

GET    /api/okvi/head-types/                       - Get all head types
POST   /api/okvi/head-types/                       - Create head type
PUT    /api/okvi/head-types/:id                    - Update head type
DELETE /api/okvi/head-types/:id                    - Delete head type

GET    /api/okvi/unit-types/                       - Get all unit types
POST   /api/okvi/unit-types/                       - Create unit type
PUT    /api/okvi/unit-types/:id                    - Update unit type
DELETE /api/okvi/unit-types/:id                    - Delete unit type
```

### User Claim Management
```
POST   /api/okvi/claim-documents/form-i            - Submit Form I
POST   /api/okvi/claim-documents/form-v            - Submit Form V
POST   /api/okvi/claim-documents/form-vi           - Submit Form VI
POST   /api/okvi/claim-documents/declaration-certificate - Submit Declaration Certificate
POST   /api/okvi/claim-documents/upload-audit-certificate - Upload Audit Certificate
POST   /api/okvi/claim-documents/upload-bank-deposit-proof - Upload Bank Deposit Proof
POST   /api/okvi/claim-documents/final-submit      - Final submission for approval
POST   /api/okvi/claim-documents/upload-sanction-order - Upload sanction order (after approval)
GET    /api/okvi/claim-documents/my-claims         - Get user's claims
GET    /api/okvi/claim-documents/claims/:id        - Get claim details
```

## Approval Workflow

### Status Flow
1. **draft** → User is preparing documents
2. **submitted** → User has submitted for approval, assigned to GMDIC
3. **gmdic_review** → GMDIC is reviewing
4. **gmdic_approved** → GMDIC approved, forwarded to DI
5. **gmdic_rejected** → GMDIC rejected, process ends
6. **di_review** → DI is reviewing
7. **di_approved** → DI approved, forwarded to Addl. Director
8. **di_rejected** → DI rejected, process ends
9. **addl_director_review** → Addl. Director is reviewing
10. **addl_director_approved** → Addl. Director approved
11. **addl_director_rejected** → Addl. Director rejected, process ends
12. **sanctioned** → Final approval with sanction amount, email sent to user
13. **sanction_order_uploaded** → User uploaded sanction order document

### Email Notifications
- **After Final Approval**: User receives email with sanction amount and instructions to upload sanction order
- **After Each Approval**: User receives notification about approval status
- **After Rejection**: User receives rejection notification with reason

## Database Models

### ClaimApplication
- Tracks the complete claim lifecycle
- Stores approval history with approver details
- Manages document references and status transitions

### HeadType & UnitType
- Master data for dropdown selections
- Managed by GMDIC only

### Holiday/Festival
- Existing model for festival management
- Enhanced with proper validation

## Authentication & Authorization

### OKVI-Specific Middleware
- `authenticateOkviToken`: Validates OKVI user tokens
- `authorizeOkviRoles`: Checks role-based permissions

### Role-Based Access
- **GMDIC (0)**: Full admin access + master data management
- **DI (1)**: Approval workflow access
- **Addl. Director (2)**: Final approval access
- **Regular Users**: Claim submission and tracking

## Environment Variables Required

```env
# Email Configuration
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your-email@domain.com
EMAIL_PASS=your-app-password
EMAIL_FROM=noreply@okvi.gov.in

# JWT Configuration
JWT_SECRET=your-jwt-secret
```

## Key Features Implemented

1. ✅ **Multi-level Approval Workflow**: GMDIC → DI → Addl. Director
2. ✅ **Master Data Management**: Holidays, Head Types, Unit Types
3. ✅ **Email Notifications**: Approval/rejection notifications
4. ✅ **Document Upload**: Audit certificates, bank proofs, sanction orders
5. ✅ **Role-based Access Control**: Proper authorization for each role
6. ✅ **Final Submit Validation**: Ensures all documents are submitted
7. ✅ **Sanction Order Upload**: Post-approval document submission
8. ✅ **Admin Dashboard**: Statistics and pending claims overview

## Business Rules Enforced

- Opening stock must be entered from festival start date
- Closing stock must be entered within 7 days of festival end
- All forms (I, V, VI, Declaration, Audit, Bank Proof) required before final submit
- Sequential approval workflow - rejection at any level terminates the process
- Email notifications sent at each approval/rejection step
- Sanction amount required for final approval by Addl. Director

## Testing Checklist

- [ ] Create GMDIC, DI, and Addl. Director users
- [ ] Test holiday/head type/unit type CRUD operations
- [ ] Test complete claim submission workflow
- [ ] Test approval workflow at each level
- [ ] Test rejection workflow at each level
- [ ] Test email notifications
- [ ] Test sanction order upload
- [ ] Test role-based access restrictions

## Error Handling

All endpoints include proper error handling with:
- Input validation
- Authentication/authorization checks
- Business rule validation
- Database error handling
- User-friendly error messages
