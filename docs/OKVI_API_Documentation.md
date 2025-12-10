# OKVI API Documentation

## Overview
OKVI (Odisha Khadi and Village Industries) Online Rebate Management System API.

**Base URL:** `http://localhost:3000/api/okvi`

---

## Authentication APIs

### 1. Get Captcha
Generate a captcha for login/registration.

**Endpoint:** `GET /auth/get-captcha`

**Response:**
```json
{
  "status": "success",
  "captchaQuestion": "7 + 3",
  "captchaToken": "encrypted_token_here"
}
```

---

### 2. User Login
Authenticate user with email, password, and captcha.

**Endpoint:** `POST /auth/login`

**Request Body:**
```json
{
  "email": "user@okvi.gov.in",
  "password": "User@1234",
  "captchaAnswer": "10",
  "captchaToken": "token_from_get_captcha"
}
```

**Response:**
```json
{
  "status": "success",
  "token": "jwt_token_here",
  "user": {
    "id": "user_id",
    "email": "user@okvi.gov.in",
    "role": 3,
    "institutionName": "Institution Name"
  }
}
```

---

### 3. Send OTP (Registration)
Send OTP to email for new user registration.

**Endpoint:** `POST /auth/sendotp`

**Request Body:**
```json
{
  "email": "newuser@example.com"
}
```

**Response:**
```json
{
  "status": "success",
  "message": "OTP sent successfully"
}
```

---

### 4. Verify OTP
Verify the OTP sent to email.

**Endpoint:** `POST /auth/verifyotp`

**Request Body:**
```json
{
  "email": "newuser@example.com",
  "otp": "123456"
}
```

**Response:**
```json
{
  "status": "success",
  "message": "OTP verified successfully",
  "verificationToken": "verification_token"
}
```

---

### 5. Complete Registration
Submit full user registration details.

**Endpoint:** `POST /auth/registerUserDetails`

**Request Body:**
```json
{
  "verificationToken": "token_from_verify_otp",
  "email": "newuser@example.com",
  "password": "SecurePass@123",
  "institutionDetails": {
    "name": "Khadi Institution",
    "type": "Society",
    "registrationNumber": "REG123456",
    "address": "Bhubaneswar, Odisha",
    "district": "Khordha",
    "pincode": "751001"
  },
  "bankDetails": {
    "bankName": "State Bank of India",
    "branchName": "Main Branch",
    "accountNumber": "1234567890",
    "ifscCode": "SBIN0001234"
  },
  "secretaryDetails": {
    "name": "Secretary Name",
    "phone": "9876543210",
    "email": "secretary@example.com"
  },
  "presidentDetails": {
    "name": "President Name",
    "phone": "9876543211"
  }
}
```

---

### 6. Forgot Password - Send OTP
Send OTP for password reset.

**Endpoint:** `POST /auth/forgot-password/send-otp`

**Request Body:**
```json
{
  "email": "user@okvi.gov.in"
}
```

---

### 7. Forgot Password - Verify OTP
Verify OTP for password reset.

**Endpoint:** `POST /auth/forgot-password/verify-otp`

**Request Body:**
```json
{
  "email": "user@okvi.gov.in",
  "otp": "123456"
}
```

---

### 8. Forgot Password - Reset
Reset password with verified token.

**Endpoint:** `POST /auth/forgot-password/reset`

**Request Body:**
```json
{
  "email": "user@okvi.gov.in",
  "resetToken": "token_from_verify",
  "newPassword": "NewSecure@123"
}
```

---

### 9. Change Password (Authenticated)
Change password for logged-in user.

**Endpoint:** `POST /auth/change-password`

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Request Body:**
```json
{
  "currentPassword": "OldPass@123",
  "newPassword": "NewPass@123"
}
```

---

### 10. Get Dashboard
Get user dashboard data.

**Endpoint:** `GET /auth/dashboard`

**Headers:**
```
Authorization: Bearer <jwt_token>
```

---

### 11. Logout
Logout user.

**Endpoint:** `POST /auth/logout`

**Headers:**
```
Authorization: Bearer <jwt_token>
```

---

## User Roles

| Role | Value | Description |
|------|-------|-------------|
| GMDIC | 0 | First-level approver, Master data CRUD |
| DI | 1 | Second-level approver |
| Addl. Director | 2 | Final approver, Sanction calculation |
| Regular User | 3 | Submit claims, View own data |

---

## Test Credentials

| Role | Email | Password |
|------|-------|----------|
| GMDIC | gmdic@okvi.gov.in | Gmdic@123 |
| DI | di@okvi.gov.in | Di@123456 |
| Addl. Director | addl.director@okvi.gov.in | Addl@1234 |
| Regular User | user@okvi.gov.in | User@1234 |

---

## Error Responses

All errors follow this format:

```json
{
  "status": "error",
  "message": "Error description here"
}
```

### Common HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request (validation error) |
| 401 | Unauthorized (invalid/missing token) |
| 403 | Forbidden (insufficient permissions) |
| 404 | Not Found |
| 500 | Internal Server Error |

---

## Approval Workflow

1. **User submits claim** → status: `submitted`, approval_level: 0
2. **GMDIC reviews** → approves all forms → status: `gmdic_approved`, approval_level: 1
3. **DI reviews** → approves all forms → status: `di_approved`, approval_level: 2
4. **Addl. Director reviews** → calculates sanction → status: `sanctioned`
5. **User uploads sanction order** → status: `sanction_order_uploaded`
6. **Final disbursement** → status: `disbursed`
