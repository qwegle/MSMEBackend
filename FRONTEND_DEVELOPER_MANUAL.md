# 📱 OKVI FlutterFlow Developer Manual

## 📋 Overview
This manual provides a comprehensive guide for FlutterFlow developers to build the OKVI (Odisha Khadi & Village Industries) mobile application. The system manages government rebate claims for traditional handicraft businesses with a 3-tier approval workflow.

**Backend API Base URL:** `https://msmebackend.onrender.com/api/okvi`

---

## 🏗️ System Architecture

### **User Roles & Access Levels**
- **Role 0 (GMDIC)**: Master data management, first-level approval
- **Role 1 (DI)**: Second-level approval, technical verification
- **Role 2 (Addl. Director)**: Final approval, sanction calculation
- **Role 3 (Regular User)**: Claim submission, document upload

### **Application Flow**
```
Registration → Login → Stock Management → Claim Submission → Approval Workflow → Sanction
```

---

## 📱 Required Pages & Components

### 🔐 **Authentication Pages**

#### **1. Login Page** (`/login`)
**Purpose:** User authentication for all roles
**API Endpoint:** `POST /auth/login`

**Form Fields:**
- Email (required, email validation)
- Password (required, min 8 characters)
- Remember Me (optional checkbox)

**UI Elements:**
- Login form with validation
- "Forgot Password" link
- "Register" link for new users
- Role-based redirect after login

**Success Flow:**
```
Login → Store JWT token → Redirect based on role:
- GMDIC/DI/Addl. Director → Admin Dashboard
- Regular User → User Dashboard
```

#### **2. Registration Page** (`/register`)
**Purpose:** New user registration
**API Endpoint:** `POST /auth/registerUser`

**Form Fields:**
- Full Name (required, 3-50 characters)
- Email (required, unique validation)
- Password (required, min 8 characters, confirmation)
- Role (hidden, default to 3 for regular users)

**UI Elements:**
- Multi-step registration form
- Email verification flow
- Terms & conditions acceptance
- Success message with login redirect

#### **3. OTP Verification Page** (`/verify-otp`)
**Purpose:** Email verification
**API Endpoints:** 
- `POST /auth/sendotp`
- `POST /auth/verifyotp`

**Form Fields:**
- 6-digit OTP input
- Resend OTP button (with countdown timer)

---

### 👤 **User Dashboard Pages**

#### **4. User Dashboard** (`/dashboard`)
**Purpose:** Main landing page for regular users
**API Endpoint:** `GET /claim-documents/my-claims`

**Components:**
- Welcome message with user name
- Quick stats cards:
  - Total Claims Submitted
  - Pending Approvals
  - Approved Claims
  - Total Sanction Amount
- Recent claims table
- Quick action buttons:
  - "New Claim"
  - "View All Claims"
  - "Stock Management"

#### **5. Stock Management Page** (`/stocks`)
**Purpose:** Manage opening and closing stock
**API Endpoints:**
- `GET /opening-stock/`
- `POST /opening-stock/create`
- `GET /closing-stock/`
- `POST /closing-stock/create`

**Sections:**
1. **Festival Selection Dropdown**
2. **Opening Stock Tab:**
   - Festival selection
   - Head type selection
   - Sub-head details table (Name, Unit Type, Unit Price, Quantity, Total)
   - Add/Remove rows functionality
   - Save button
3. **Closing Stock Tab:**
   - Same structure as opening stock
   - Only available after opening stock is submitted
   - 7-day submission window validation

**UI Features:**
- Dynamic table rows
- Auto-calculation of totals
- Form validation
- Success/error notifications

#### **6. New Claim Page** (`/claims/new`)
**Purpose:** Multi-step claim submission
**API Endpoints:** Multiple form submissions

**Step 1: Form I - Retail Sales**
- API: `POST /claim-documents/form-i`
- Festival selection
- Retail sales entries table
- Bill details (Number, Date, Quantity, Rate, Amount)

**Step 2: Form V - Rebate Calculation**
- API: `POST /claim-documents/form-v`
- Auto-calculated from Form I
- Display rebate rate and amount
- Read-only fields

**Step 3: Form VI - Center-wise Breakdown**
- API: `POST /claim-documents/form-vi`
- Center-wise sales breakdown
- Auto-populated from Form I data

**Step 4: Declaration Certificate**
- API: `POST /claim-documents/declaration-certificate`
- Festival spell dates
- Declaration statements
- Digital signature/checkbox

**Step 5: File Uploads**
- API: `POST /claim-documents/upload-audit-certificate`
- API: `POST /claim-documents/upload-bank-deposit-proof`
- PDF file upload components
- File validation (PDF only, max 10MB)
- Upload progress indicators

**Step 6: Review & Submit**
- API: `POST /claim-documents/final-submit`
- Summary of all submitted data
- Final submission confirmation
- Success page with claim ID

#### **7. Claims List Page** (`/claims`)
**Purpose:** View all user claims
**API Endpoint:** `GET /claim-documents/my-claims`

**Features:**
- Paginated claims table
- Status filters (Draft, Submitted, Approved, Rejected)
- Search by festival name
- Claim details modal/page
- Status badges with colors
- Action buttons (View, Edit Draft, Upload Sanction Order)

#### **8. Claim Details Page** (`/claims/:id`)
**Purpose:** Detailed view of specific claim
**API Endpoint:** `GET /claim-documents/claims/:id`

**Sections:**
- Claim summary card
- Status timeline with approval history
- All submitted forms in tabs
- Uploaded documents gallery
- Sanction order upload (if approved)
- Comments from approvers

---

### 🏛️ **Admin Dashboard Pages**

#### **9. Admin Dashboard** (`/admin`)
**Purpose:** Administrative overview
**API Endpoint:** `GET /admin/dashboard`

**Components:**
- Statistics cards (role-based)
- Pending claims counter
- Recent activities feed
- Quick action buttons
- Charts/graphs for claim trends

#### **10. Pending Claims Page** (`/admin/claims/pending`)
**Purpose:** Claims awaiting approval
**API Endpoint:** `GET /admin/claims/pending`

**Features:**
- Role-based claim filtering
- Priority sorting
- Bulk actions
- Quick approve/reject buttons
- Claim preview cards

#### **11. Claim Review Page** (`/admin/claims/:id/review`)
**Purpose:** Detailed claim review for approval
**API Endpoints:**
- `GET /admin/claims/:id`
- `POST /admin/claims/:id/approve`
- `POST /admin/claims/:id/reject`

**Sections:**
- Applicant information
- All submitted documents viewer
- Stock verification section
- Sanction calculation preview (for Addl. Director)
- Approval/rejection form with comments
- Action buttons

#### **12. Master Data Management** (`/admin/master-data`)
**Purpose:** Manage system master data (GMDIC only)
**API Endpoints:**
- `GET/POST/PUT/DELETE /holidays/*`
- `GET/POST/PUT/DELETE /head-types/*`
- `GET/POST/PUT/DELETE /unit-types/*`

**Tabs:**
1. **Holidays/Festivals Management**
2. **Head Types Management**
3. **Unit Types Management**

Each tab with CRUD operations and data tables.

---

## 🎨 UI/UX Guidelines

### **Design System**
- **Primary Colors:** Government theme (Blue #1976D2, White #FFFFFF, Orange #FF9800)
- **Typography:** FlutterFlow default fonts or Google Fonts (Roboto, Inter)
- **Components:** Material Design 3 components
- **Icons:** Material Icons or Cupertino Icons

### **Responsive Design**
- **Mobile-first approach** (FlutterFlow default)
- **Adaptive layouts** for different screen sizes
- **Touch-friendly buttons** (minimum 44px tap targets)
- **Scrollable content** with proper padding

### **User Experience**
- Progress indicators for multi-step forms
- Loading states for API calls
- Success/error notifications
- Breadcrumb navigation
- Contextual help tooltips

---

## 🔄 Application Flow Diagrams

### **User Registration & Onboarding**
```
Register → Email Verification → Login → Profile Setup → Dashboard
```

### **Claim Submission Flow**
```
Dashboard → Stock Management → New Claim → Multi-step Forms → File Uploads → Review → Submit → Tracking
```

### **Admin Approval Flow**
```
Login → Admin Dashboard → Pending Claims → Claim Review → Approve/Reject → Next Level/User Notification
```

---

## 🛠️ FlutterFlow Implementation

### **App State Management**
- **App State Variables** for global state (user info, auth token)
- **Page State Variables** for local component state
- **Firestore** for offline data caching (optional)
- **Shared Preferences** for JWT token persistence

### **Navigation & Routing**
- **FlutterFlow Navigation** with conditional routing
- **Role-based page access** using conditional visibility
- **Bottom Navigation Bar** for main sections
- **Drawer Navigation** for admin features

### **Form Handling**
- **Form Validation** using FlutterFlow built-in validators
- **Dynamic Lists** for adding/removing form fields
- **File Upload Widgets** for document uploads
- **Auto-save** using Page State and API calls

### **API Integration Setup**

#### **1. API Calls Configuration**
```
Base URL: https://msmebackend.onrender.com/api/okvi
Authentication: Bearer Token (stored in App State)
```

#### **2. Common API Call Structure**
```
Method: POST/GET/PUT/DELETE
Headers: 
  - Content-Type: application/json
  - Authorization: Bearer [auth_token]
Body: JSON (for POST/PUT requests)
```

#### **3. Authentication Flow**
```
Login API Call → Store JWT in App State → Set Global Auth Token → Navigate to Dashboard
```

#### **4. File Upload Configuration**
```
Method: POST
Content-Type: multipart/form-data
Body: FormData with file and additional fields
```

---

## 📋 FlutterFlow Development Checklist

### **Phase 1: Project Setup & Authentication**
- [ ] Create new FlutterFlow project
- [ ] Configure API base URL in project settings
- [ ] Create App State variables (authToken, userRole, userInfo)
- [ ] Build Login page with API integration
- [ ] Build Registration page with OTP flow
- [ ] Set up conditional navigation based on user role
- [ ] Create splash screen with auth check

### **Phase 2: User Dashboard & Core Features**
- [ ] Build User Dashboard with stats widgets
- [ ] Create Stock Management pages (Opening/Closing)
- [ ] Build multi-step Claim Form with PageView
- [ ] Implement file upload widgets for documents
- [ ] Create Claims List with filtering
- [ ] Build Claim Details page with status timeline

### **Phase 3: Admin Features**
- [ ] Build Admin Dashboard with role-based widgets
- [ ] Create Pending Claims list for admins
- [ ] Build Claim Review page with approve/reject
- [ ] Create Master Data management (GMDIC only)
- [ ] Implement approval workflow notifications

### **Phase 4: Polish & Testing**
- [ ] Add loading indicators for all API calls
- [ ] Implement error handling and user feedback
- [ ] Test on different device sizes
- [ ] Add offline capability (optional)
- [ ] Performance optimization and testing

---

## 🚀 FlutterFlow Deployment

### **Project Configuration**
```
API Base URL: https://msmebackend.onrender.com/api/okvi
App Name: OKVI Mobile
Bundle ID: com.odisha.okvi
Version: 1.0.0
```

### **Build Settings**
- **Android:** Generate APK/AAB for Play Store
- **iOS:** Generate IPA for App Store (requires Apple Developer account)
- **Web:** Deploy to FlutterFlow hosting or custom domain
- **Testing:** Use FlutterFlow Test Mode for development

### **Performance Optimization**
- Optimize images and assets
- Use lazy loading for large lists
- Implement proper state management
- Cache frequently used data

---

## 📞 Support & Resources

### **API Documentation**
- Complete API endpoints in `FRONTEND.md`
- Postman collection for testing
- Error code reference

### **FlutterFlow Specific Resources**
- FlutterFlow documentation and tutorials
- Material Design 3 component library
- Government of Odisha branding guidelines
- Mobile app design patterns

### **Testing Data**
- Sample user accounts for each role
- Test festival data
- Mock claim submissions
- FlutterFlow Test Mode configuration

### **FlutterFlow Project Structure**
```
OKVI Mobile App/
├── Pages/
│   ├── Auth/
│   │   ├── LoginPage
│   │   ├── RegisterPage
│   │   └── OTPVerificationPage
│   ├── User/
│   │   ├── UserDashboard
│   │   ├── StockManagement
│   │   ├── NewClaim
│   │   ├── ClaimsList
│   │   └── ClaimDetails
│   └── Admin/
│       ├── AdminDashboard
│       ├── PendingClaims
│       ├── ClaimReview
│       └── MasterData
├── Components/
│   ├── CustomAppBar
│   ├── StatsCard
│   ├── ClaimStatusBadge
│   └── FileUploadWidget
├── App State/
│   ├── authToken (String)
│   ├── userRole (Integer)
│   ├── userInfo (JSON)
│   └── currentClaim (JSON)
└── API Calls/
    ├── AuthAPI
    ├── ClaimsAPI
    ├── StockAPI
    └── AdminAPI
```

This manual provides the complete roadmap for building a professional, user-friendly OKVI mobile application using FlutterFlow that seamlessly integrates with the backend system.
