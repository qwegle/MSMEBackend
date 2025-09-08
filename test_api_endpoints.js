// Manual API Testing Script for OKVI System
// Run this after setting up test data with test_manual_okvi.js

console.log('🧪 OKVI API Testing Guide');
console.log('=' .repeat(50));

console.log('\n📋 Test Sequence:');
console.log('1. First run: node test_manual_okvi.js (to setup test data)');
console.log('2. Server should be running: node src/app.js');
console.log('3. Use the following API calls to test the complete flow');

console.log('\n🔐 Authentication Tests:');
console.log('POST http://localhost:3000/api/okvi/auth/login');
console.log('Body: {"email":"gmdic@okvi.gov.in","password":"admin123"}');
console.log('Expected: JWT token for GMDIC (role 0)');

console.log('\nPOST http://localhost:3000/api/okvi/auth/login');
console.log('Body: {"email":"user@okvi.gov.in","password":"user123"}');
console.log('Expected: JWT token for User (role 3)');

console.log('\n🗂️ Master Data Tests (GMDIC Token Required):');
console.log('GET http://localhost:3000/api/okvi/holidays/getAllHolidays');
console.log('Headers: Authorization: Bearer <gmdic_token>');
console.log('Expected: List of holidays including "Test Diwali 2024"');

console.log('\nGET http://localhost:3000/api/okvi/head-types/');
console.log('Headers: Authorization: Bearer <gmdic_token>');
console.log('Expected: List of head types (Raw Materials, Finished Goods, etc.)');

console.log('\nGET http://localhost:3000/api/okvi/unit-types/');
console.log('Headers: Authorization: Bearer <gmdic_token>');
console.log('Expected: List of unit types (Handloom Unit, Handicraft Unit, etc.)');

console.log('\n📦 Stock Management Tests (User Token Required):');
console.log('POST http://localhost:3000/api/okvi/opening-stock/create');
console.log('Headers: Authorization: Bearer <user_token>');
console.log('Body: {');
console.log('  "festivalId": "<holiday_id_from_holidays_api>",');
console.log('  "items": [{');
console.log('    "headType": "Raw Materials",');
console.log('    "subHeadName": "Cotton Yarn",');
console.log('    "quantity": 500,');
console.log('    "amount": 75000');
console.log('  }]');
console.log('}');
console.log('Expected: Opening stock created successfully');

console.log('\n📋 Claim Documents Tests (User Token Required):');
console.log('POST http://localhost:3000/api/okvi/claim-documents/form-i');
console.log('Headers: Authorization: Bearer <user_token>');
console.log('Body: {');
console.log('  "festivalName": "Test Diwali 2024",');
console.log('  "retailSales": [{');
console.log('    "headType": "Finished Goods",');
console.log('    "subCenterName": "Test Showroom",');
console.log('    "subCenterAddress": "Test Address",');
console.log('    "billNo": "TEST-001",');
console.log('    "billDate": "2024-11-03",');
console.log('    "item": "Test Handwoven Saree",');
console.log('    "quantity": 10,');
console.log('    "rate": 2500,');
console.log('    "totalAmount": 25000');
console.log('  }]');
console.log('}');
console.log('Expected: Form I submitted with total sale amount');

console.log('\nPOST http://localhost:3000/api/okvi/claim-documents/form-v');
console.log('Headers: Authorization: Bearer <user_token>');
console.log('Body: {');
console.log('  "festivalName": "Test Diwali 2024",');
console.log('  "rebateRate": 15');
console.log('}');
console.log('Expected: Form V with calculated rebate amount (15% of sales)');

console.log('\nPOST http://localhost:3000/api/okvi/claim-documents/form-vi');
console.log('Headers: Authorization: Bearer <user_token>');
console.log('Body: {');
console.log('  "festivalName": "Test Diwali 2024",');
console.log('  "rebateRate": 15');
console.log('}');
console.log('Expected: Form VI with center-wise breakdown');

console.log('\nPOST http://localhost:3000/api/okvi/claim-documents/declaration-certificate');
console.log('Headers: Authorization: Bearer <user_token>');
console.log('Body: {');
console.log('  "festivalId": "<holiday_id>",');
console.log('  "spellStartDate": "2024-11-01",');
console.log('  "spellEndDate": "2024-11-05"');
console.log('}');
console.log('Expected: Declaration certificate created');

console.log('\nPOST http://localhost:3000/api/okvi/claim-documents/final-submit');
console.log('Headers: Authorization: Bearer <user_token>');
console.log('Body: {"festivalName": "Test Diwali 2024"}');
console.log('Expected: Claim submitted for approval with status "submitted"');

console.log('\n👨‍💼 Admin Workflow Tests:');
console.log('GET http://localhost:3000/api/okvi/admin/dashboard');
console.log('Headers: Authorization: Bearer <gmdic_token>');
console.log('Expected: Dashboard with pending claims count');

console.log('\nGET http://localhost:3000/api/okvi/admin/claims/pending');
console.log('Headers: Authorization: Bearer <gmdic_token>');
console.log('Expected: List of pending claims for GMDIC approval');

console.log('\nPOST http://localhost:3000/api/okvi/admin/claims/<claim_id>/approve');
console.log('Headers: Authorization: Bearer <gmdic_token>');
console.log('Body: {"comments": "GMDIC approval - documents verified"}');
console.log('Expected: Claim status changed to "gmdic_approved"');

console.log('\nPOST http://localhost:3000/api/okvi/admin/claims/<claim_id>/approve');
console.log('Headers: Authorization: Bearer <di_token>');
console.log('Body: {"comments": "DI approval - forwarding to Addl. Director"}');
console.log('Expected: Claim status changed to "di_approved"');

console.log('\nPOST http://localhost:3000/api/okvi/admin/claims/<claim_id>/approve');
console.log('Headers: Authorization: Bearer <addl_director_token>');
console.log('Body: {"comments": "Final approval with auto-calculated sanction"}');
console.log('Expected: Claim status "sanctioned" with auto-calculated sanction amount');

console.log('\n🧮 Sanction Calculator Tests:');
console.log('GET http://localhost:3000/api/okvi/sanction-calculator/config');
console.log('Headers: Authorization: Bearer <admin_token>');
console.log('Expected: Configuration with limits and formula details');

console.log('\nGET http://localhost:3000/api/okvi/sanction-calculator/calculate/<claim_id>');
console.log('Headers: Authorization: Bearer <admin_token>');
console.log('Expected: Detailed calculation breakdown for specific claim');

console.log('\n👤 User Tracking Tests:');
console.log('GET http://localhost:3000/api/okvi/claim-documents/my-claims');
console.log('Headers: Authorization: Bearer <user_token>');
console.log('Expected: List of user\'s submitted claims with current status');

console.log('\n✅ Expected Flow Results:');
console.log('1. User submits complete claim (Forms I, V, VI, Declaration)');
console.log('2. GMDIC approves → status: "gmdic_approved"');
console.log('3. DI approves → status: "di_approved"');
console.log('4. Addl. Director approves → status: "sanctioned"');
console.log('5. Auto-calculation: (Rebate × 95%) - ₹500 processing fee');
console.log('6. Final sanction amount within ₹1,000 - ₹5,00,000 limits');

console.log('\n🔍 Key Test Points:');
console.log('• Role-based access control (different tokens for different roles)');
console.log('• Sequential approval workflow (cannot skip levels)');
console.log('• Automatic sanction calculation based on Form V rebate amount');
console.log('• Email notifications at each approval stage');
console.log('• Comprehensive audit trail in approval history');
console.log('• File upload validation (PDF only for certificates)');

console.log('\n📊 Success Indicators:');
console.log('• All API calls return status: "success"');
console.log('• Proper JWT authentication and role validation');
console.log('• Correct status transitions in approval workflow');
console.log('• Accurate sanction amount calculation');
console.log('• Complete claim tracking from submission to sanction');

console.log('\n🌐 Use Postman, curl, or browser dev tools to test these endpoints');
console.log('📖 Refer to FRONTEND.md for complete API documentation');
