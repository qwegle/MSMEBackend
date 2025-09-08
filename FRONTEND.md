# OKVI Frontend Developer Guide

## Overview
Complete API documentation for OKVI (Odisha Khadi & Village Industries) system with multi-level approval workflow.

**Base URL:** `https://msmebackend.onrender.com/api/okvi`

## Authentication

### Login
```http
POST https://msmebackend.onrender.com/api/okvi/auth/login
Content-Type: application/json

{
  "email": "user@okvi.gov.in",
  "password": "password123"
}
```

**Response:**
```json
{
  "status": "success",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "user_id",
    "name": "User Name",
    "email": "user@okvi.gov.in",
    "role": 0
  }
}
```

**Role Values:**
- `0`: GMDIC (Full admin + master data)
- `1`: DI (Second level approval)
- `2`: Addl. Director (Final approval)
- `3`: Regular User

### Headers for Authenticated Requests
```
Authorization: Bearer <token>
Content-Type: application/json
```

## Master Data APIs (GMDIC Only)

### Holidays Management

#### Get All Holidays
```http
GET https://msmebackend.onrender.com/api/okvi/holidays/getAllHolidays
```

**Response:**
```json
{
  "status": "success",
  "data": [
    {
      "_id": "holiday_id",
      "name": "Diwali",
      "year": 2024,
      "startDate": "2024-11-01T00:00:00.000Z",
      "endDate": "2024-11-05T00:00:00.000Z",
      "type": "Festival",
      "createdBy": "gmdic_user_id"
    }
  ]
}
```

#### Create Holiday
```http
POST https://msmebackend.onrender.com/api/okvi/holidays/createHoliday
Content-Type: application/json

{
  "name": "Diwali",
  "startDate": "2024-11-01",
  "endDate": "2024-11-05",
  "type": "Festival"
}
```

#### Update Holiday
```http
PUT https://msmebackend.onrender.com/api/okvi/holidays/updateHoliday
Content-Type: application/json

{
  "id": "holiday_id",
  "name": "Updated Name",
  "startDate": "2024-11-01",
  "endDate": "2024-11-05",
  "type": "Festival"
}
```

#### Delete Holiday
```http
DELETE https://msmebackend.onrender.com/api/okvi/holidays/deleteHoliday?id=holiday_id
```

### Head Types Management

#### Get All Head Types
```http
GET https://msmebackend.onrender.com/api/okvi/head-types/
```

**Response:**
```json
{
  "status": "success",
  "results": 4,
  "data": [
    {
      "_id": "head_type_id",
      "name": "Raw Materials",
      "description": "Raw materials for production",
      "isActive": true,
      "createdBy": {
        "_id": "gmdic_id",
        "name": "GMDIC Admin",
        "email": "gmdic@okvi.gov.in"
      }
    }
  ]
}
```

#### Create Head Type
```http
POST https://msmebackend.onrender.com/api/okvi/head-types/
Content-Type: application/json

{
  "name": "Raw Materials",
  "description": "Raw materials for production"
}
```

#### Update Head Type
```http
PUT https://msmebackend.onrender.com/api/okvi/head-types/:id
Content-Type: application/json

{
  "name": "Updated Name",
  "description": "Updated description",
  "isActive": true
}
```

#### Delete Head Type
```http
DELETE https://msmebackend.onrender.com/api/okvi/head-types/:id
```

### Unit Types Management

#### Get All Unit Types
```http
GET https://msmebackend.onrender.com/api/okvi/unit-types/
```

#### Create Unit Type
```http
POST https://msmebackend.onrender.com/api/okvi/unit-types/
Content-Type: application/json

{
  "name": "Handloom Unit",
  "description": "Traditional handloom weaving unit"
}
```

#### Update Unit Type
```http
PUT https://msmebackend.onrender.com/api/okvi/unit-types/:id
Content-Type: application/json

{
  "name": "Updated Name",
  "description": "Updated description"
}
```

#### Delete Unit Type
```http
DELETE https://msmebackend.onrender.com/api/okvi/unit-types/:id
```

## Stock Management APIs

### Opening Stock

#### Create Opening Stock
```http
POST https://msmebackend.onrender.com/api/okvi/opening-stock/create
Content-Type: application/json

{
  "festivalId": "festival_id",
  "items": [
    {
      "headType": "Raw Materials",
      "subHeadName": "Cotton Yarn",
      "quantity": 500,
      "amount": 75000
    }
  ]
}
```

**Response:**
```json
{
  "status": "success",
  "data": {
    "_id": "opening_stock_id",
    "festivalId": "festival_id",
    "user": "user_id",
    "items": [...],
    "createdAt": "2024-11-01T00:00:00.000Z"
  }
}
```

### Closing Stock

#### Create Closing Stock
```http
POST https://msmebackend.onrender.com/api/okvi/closing-stock/create
Content-Type: application/json

{
  "festivalId": "festival_id",
  "openingStockId": "opening_stock_id",
  "items": [
    {
      "headType": "Finished Goods",
      "subHeadName": "Completed Sarees",
      "quantity": 45,
      "amount": 90000
    }
  ]
}
```

## Claim Documents APIs

### Form I - Retail Sales
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/form-i
Content-Type: application/json

{
  "festivalName": "Diwali",
  "retailSales": [
    {
      "headType": "Finished Goods",
      "subCenterName": "Bhubaneswar Showroom",
      "subCenterAddress": "Unit-3, Bhubaneswar",
      "billNo": "INV-001",
      "billDate": "2024-11-03",
      "item": "Handwoven Silk Saree",
      "quantity": 15,
      "rate": 2500,
      "totalAmount": 37500
    }
  ]
}
```

### Form V - Rebate Calculation
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/form-v
Content-Type: application/json

{
  "festivalName": "Diwali",
  "rebateRate": 15
}
```

**Response:**
```json
{
  "status": "success",
  "data": {
    "_id": "form_v_id",
    "formIId": "form_i_id",
    "totalSaleAmt": 73500,
    "totalRebateAmt": 11025
  }
}
```

### Form VI - Center-wise Breakdown
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/form-vi
Content-Type: application/json

{
  "festivalName": "Diwali",
  "rebateRate": 15
}
```

### Declaration Certificate
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/declaration-certificate
Content-Type: application/json

{
  "festivalId": "festival_id",
  "spellStartDate": "2024-11-01",
  "spellEndDate": "2024-11-05"
}
```

### File Uploads

#### Audit Certificate Upload
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/upload-audit-certificate
Content-Type: multipart/form-data

FormData:
- auditFile: [PDF file]
- festivalId: "festival_id"
```

#### Bank Deposit Proof Upload
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/upload-bank-deposit-proof
Content-Type: multipart/form-data

FormData:
- bankProofFile: [PDF file]
- festivalId: "festival_id"
```

### Final Submission
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/final-submit
Content-Type: application/json

{
  "festivalName": "Diwali"
}
```

**Response:**
```json
{
  "status": "success",
  "message": "Claim application submitted successfully for approval",
  "data": {
    "_id": "claim_application_id",
    "status": "submitted",
    "submittedAt": "2024-11-14T00:00:00.000Z",
    "currentApprover": "gmdic_user_id"
  }
}
```

### Get User Claims
```http
GET https://msmebackend.onrender.com/api/okvi/claim-documents/my-claims?page=1&limit=10&status=submitted
```

**Response:**
```json
{
  "status": "success",
  "results": 5,
  "total": 5,
  "page": 1,
  "totalPages": 1,
  "data": [
    {
      "_id": "claim_id",
      "status": "gmdic_approved",
      "festivalId": {
        "name": "Diwali",
        "startDate": "2024-11-01T00:00:00.000Z"
      },
      "submittedAt": "2024-11-14T00:00:00.000Z",
      "approvalHistory": [...]
    }
  ]
}
```

### Sanction Order Upload
```http
POST https://msmebackend.onrender.com/api/okvi/claim-documents/upload-sanction-order
Content-Type: multipart/form-data

FormData:
- sanctionOrderFile: [PDF file]
- claimId: "claim_application_id"
```

## Admin APIs

### Admin Dashboard
```http
GET https://msmebackend.onrender.com/api/okvi/admin/dashboard
```

**Response:**
```json
{
  "status": "success",
  "data": {
    "statistics": {
      "pending": 15,
      "approved": 45,
      "rejected": 5,
      "total": 65
    },
    "recentClaims": [...],
    "userRole": "GMDIC"
  }
}
```

### Get Pending Claims
```http
GET https://msmebackend.onrender.com/api/okvi/admin/claims/pending?page=1&limit=10&status=submitted
```

**Response:**
```json
{
  "status": "success",
  "results": 10,
  "total": 25,
  "data": [
    {
      "_id": "claim_id",
      "userId": {
        "name": "Rajesh Kumar",
        "email": "rajesh@example.com"
      },
      "festivalId": {
        "name": "Diwali"
      },
      "status": "submitted",
      "submittedAt": "2024-11-14T00:00:00.000Z"
    }
  ]
}
```

### Get Claim Details
```http
GET https://msmebackend.onrender.com/api/okvi/admin/claims/:claimId
```

### Approve Claim
```http
POST https://msmebackend.onrender.com/api/okvi/admin/claims/:claimId/approve
Content-Type: application/json

{
  "comments": "All documents verified. Approved.",
  "sanctionAmount": 50000
}
```

**Response (Final Approval with Auto-calculation):**
```json
{
  "status": "success",
  "message": "Claim approved by Addl. Director",
  "data": {
    "_id": "claim_id",
    "status": "sanctioned",
    "finalSanctionAmount": 9974
  },
  "calculationDetails": {
    "calculatedAmount": 9974,
    "baseRebateAmount": 11025,
    "appliedPercentage": 0.95,
    "processingFeeDeducted": 500
  }
}
```

### Reject Claim
```http
POST https://msmebackend.onrender.com/api/okvi/admin/claims/:claimId/reject
Content-Type: application/json

{
  "comments": "Documents incomplete. Please resubmit."
}
```

## Sanction Calculator APIs

### Get Calculation Config
```http
GET https://msmebackend.onrender.com/api/okvi/sanction-calculator/config
```

**Response:**
```json
{
  "status": "success",
  "data": {
    "config": {
      "MAX_SANCTION_LIMIT": 500000,
      "MIN_SANCTION_AMOUNT": 1000,
      "SANCTION_CAP_PERCENTAGE": 0.95,
      "PROCESSING_FEE_DEDUCTION": 500
    },
    "formula": {
      "description": "Sanction Amount = (Rebate Amount × 95%) - Processing Fee",
      "steps": [
        "1. Get total rebate amount from Form V",
        "2. Apply 95% cap on rebate amount",
        "3. Deduct processing fee of ₹500",
        "4. Apply minimum limit of ₹1,000",
        "5. Apply maximum limit of ₹5,00,000",
        "6. Round to nearest rupee"
      ]
    }
  }
}
```

### Calculate Sanction for Claim
```http
GET https://msmebackend.onrender.com/api/okvi/sanction-calculator/calculate/:claimId
```

**Response:**
```json
{
  "status": "success",
  "data": {
    "claimId": "claim_id",
    "applicantName": "Rajesh Kumar",
    "baseRebateAmount": 11025,
    "appliedPercentage": 0.95,
    "processingFeeDeducted": 500,
    "calculatedBeforeLimits": 9974,
    "finalSanctionAmount": 9974,
    "limitApplied": {
      "minLimit": false,
      "maxLimit": false
    }
  }
}
```

## Status Flow

### Claim Status Progression
```
draft → submitted → gmdic_review → gmdic_approved → di_review → di_approved → addl_director_review → sanctioned → sanction_order_uploaded
```

### Rejection States
```
gmdic_rejected (from gmdic_review)
di_rejected (from di_review)  
addl_director_rejected (from addl_director_review)
```

## Error Handling

### Standard Error Response
```json
{
  "status": "fail",
  "message": "Error description"
}
```

### Common Error Codes
- `400`: Bad Request (validation errors)
- `401`: Unauthorized (invalid/missing token)
- `403`: Forbidden (insufficient permissions)
- `404`: Not Found
- `500`: Internal Server Error

## Frontend Implementation Tips

### 1. Role-based UI
```javascript
const userRole = user.role;
const canManageMasterData = userRole === 0; // GMDIC only
const canApprove = [0, 1, 2].includes(userRole); // All admin roles
```

### 2. Status-based Actions
```javascript
const canUploadSanctionOrder = claim.status === 'sanctioned';
const canEdit = claim.status === 'draft';
const showApprovalButtons = ['submitted', 'gmdic_review', 'di_review', 'addl_director_review'].includes(claim.status);
```

### 3. Date Validations
```javascript
// Opening stock: only on/after festival start
const canEnterOpeningStock = currentDate >= festival.startDate;

// Closing stock: within 7 days of festival end
const closingStockDeadline = new Date(festival.endDate);
closingStockDeadline.setDate(closingStockDeadline.getDate() + 7);
const canEnterClosingStock = currentDate <= closingStockDeadline;
```

### 4. File Upload Validation
```javascript
const allowedTypes = ['application/pdf'];
const maxSize = 2 * 1024 * 1024; // 2MB
```

### 5. Auto-refresh for Status Updates
```javascript
// Poll for status updates every 30 seconds on claim details page
setInterval(() => {
  if (claim.status !== 'sanctioned') {
    fetchClaimDetails();
  }
}, 30000);
```
