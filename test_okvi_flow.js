import axios from 'axios';
import fs from 'fs';

const BASE_URL = 'http://localhost:3000/api';
let tokens = {};
let testData = {};

// Test configuration
const testConfig = {
  users: {
    gmdic: { email: 'gmdic@okvi.gov.in', password: 'admin123', role: 0 },
    di: { email: 'di@okvi.gov.in', password: 'admin123', role: 1 },
    addl_director: { email: 'addl.director@okvi.gov.in', password: 'admin123', role: 2 },
    user: { email: 'user@okvi.gov.in', password: 'user123', role: 3 }
  }
};

// Helper function for API calls
async function apiCall(method, endpoint, data = null, token = null) {
  try {
    const config = {
      method,
      url: `${BASE_URL}${endpoint}`,
      headers: {
        'Content-Type': 'application/json',
        ...(token && { 'Authorization': `Bearer ${token}` })
      }
    };
    
    if (data) config.data = data;
    
    const response = await axios(config);
    return { success: true, data: response.data };
  } catch (error) {
    return { 
      success: false, 
      error: error.response?.data?.message || error.message,
      status: error.response?.status 
    };
  }
}

// Test functions
async function testAuthentication() {
  console.log('\n🔐 Testing Authentication...');
  
  for (const [role, userData] of Object.entries(testConfig.users)) {
    console.log(`\n  Testing ${role.toUpperCase()} login...`);
    
    const result = await apiCall('POST', '/okvi/auth/login', {
      email: userData.email,
      password: userData.password
    });
    
    if (result.success) {
      tokens[role] = result.data.token;
      console.log(`  ✅ ${role.toUpperCase()} login successful`);
    } else {
      console.log(`  ❌ ${role.toUpperCase()} login failed: ${result.error}`);
    }
  }
}

async function testMasterDataManagement() {
  console.log('\n🗂️ Testing Master Data Management (GMDIC only)...');
  
  if (!tokens.gmdic) {
    console.log('  ❌ GMDIC token not available');
    return;
  }

  // Test Holidays
  console.log('\n  Testing Holidays Management...');
  
  // Create holiday
  const holidayData = {
    name: 'Test Diwali 2024',
    startDate: '2024-11-01',
    endDate: '2024-11-05',
    type: 'Festival'
  };
  
  const createHoliday = await apiCall('POST', '/okvi/holidays/createHoliday', holidayData, tokens.gmdic);
  if (createHoliday.success) {
    testData.holidayId = createHoliday.data.data._id;
    console.log('  ✅ Holiday created successfully');
  } else {
    console.log(`  ❌ Holiday creation failed: ${createHoliday.error}`);
  }

  // Get all holidays
  const getHolidays = await apiCall('GET', '/okvi/holidays/getAllHolidays', null, tokens.gmdic);
  if (getHolidays.success) {
    console.log(`  ✅ Retrieved ${getHolidays.data.data.length} holidays`);
  } else {
    console.log(`  ❌ Get holidays failed: ${getHolidays.error}`);
  }

  // Test Head Types
  console.log('\n  Testing Head Types Management...');
  
  const headTypeData = {
    name: 'Test Raw Materials',
    description: 'Raw materials for testing'
  };
  
  const createHeadType = await apiCall('POST', '/okvi/head-types/', headTypeData, tokens.gmdic);
  if (createHeadType.success) {
    testData.headTypeId = createHeadType.data.data._id;
    console.log('  ✅ Head Type created successfully');
  } else {
    console.log(`  ❌ Head Type creation failed: ${createHeadType.error}`);
  }

  // Test Unit Types
  console.log('\n  Testing Unit Types Management...');
  
  const unitTypeData = {
    name: 'Test Handloom Unit',
    description: 'Handloom unit for testing'
  };
  
  const createUnitType = await apiCall('POST', '/okvi/unit-types/', unitTypeData, tokens.gmdic);
  if (createUnitType.success) {
    testData.unitTypeId = createUnitType.data.data._id;
    console.log('  ✅ Unit Type created successfully');
  } else {
    console.log(`  ❌ Unit Type creation failed: ${createUnitType.error}`);
  }
}

async function testStockManagement() {
  console.log('\n📦 Testing Stock Management (User)...');
  
  if (!tokens.user || !testData.holidayId) {
    console.log('  ❌ User token or holiday ID not available');
    return;
  }

  // Test Opening Stock
  console.log('\n  Testing Opening Stock Creation...');
  
  const openingStockData = {
    festivalId: testData.holidayId,
    items: [
      {
        headType: 'Raw Materials',
        subHeadName: 'Cotton Yarn',
        quantity: 500,
        amount: 75000
      }
    ]
  };
  
  const createOpeningStock = await apiCall('POST', '/okvi/opening-stock/create', openingStockData, tokens.user);
  if (createOpeningStock.success) {
    testData.openingStockId = createOpeningStock.data.data._id;
    console.log('  ✅ Opening Stock created successfully');
  } else {
    console.log(`  ❌ Opening Stock creation failed: ${createOpeningStock.error}`);
  }

  // Test Closing Stock (should fail due to 7-day window)
  console.log('\n  Testing Closing Stock Creation...');
  
  const closingStockData = {
    festivalId: testData.holidayId,
    head: 'Finished Goods',
    subhead: [
      {
        subHeadName: 'Completed Sarees',
        quantity: 45,
        amount: 90000
      }
    ]
  };
  
  const createClosingStock = await apiCall('POST', '/okvi/closing-stock/create', closingStockData, tokens.user);
  if (createClosingStock.success) {
    testData.closingStockId = createClosingStock.data.data._id;
    console.log('  ✅ Closing Stock created successfully');
  } else {
    console.log(`  ⚠️ Closing Stock creation failed (expected): ${createClosingStock.error}`);
  }
}

async function testClaimDocuments() {
  console.log('\n📋 Testing Claim Documents Workflow (User)...');
  
  if (!tokens.user || !testData.holidayId) {
    console.log('  ❌ User token or holiday ID not available');
    return;
  }

  // Test Form I - Retail Sales
  console.log('\n  Testing Form I Submission...');
  
  const formIData = {
    festivalName: 'Test Diwali 2024',
    retailSales: [
      {
        headType: 'Finished Goods',
        subCenterName: 'Test Showroom',
        subCenterAddress: 'Test Address',
        billNo: 'TEST-001',
        billDate: '2024-11-03',
        item: 'Test Handwoven Saree',
        quantity: 10,
        rate: 2500,
        totalAmount: 25000
      }
    ]
  };
  
  const submitFormI = await apiCall('POST', '/okvi/claim-documents/form-i', formIData, tokens.user);
  if (submitFormI.success) {
    testData.formIId = submitFormI.data.data._id;
    console.log('  ✅ Form I submitted successfully');
  } else {
    console.log(`  ❌ Form I submission failed: ${submitFormI.error}`);
  }

  // Test Form V - Rebate Calculation
  console.log('\n  Testing Form V Submission...');
  
  const formVData = {
    festivalName: 'Test Diwali 2024',
    rebateRate: 15
  };
  
  const submitFormV = await apiCall('POST', '/okvi/claim-documents/form-v', formVData, tokens.user);
  if (submitFormV.success) {
    testData.formVId = submitFormV.data.data._id;
    console.log('  ✅ Form V submitted successfully');
    console.log(`    Total Rebate Amount: ₹${submitFormV.data.data.totalRebateAmt}`);
  } else {
    console.log(`  ❌ Form V submission failed: ${submitFormV.error}`);
  }

  // Test Form VI
  console.log('\n  Testing Form VI Submission...');
  
  const formVIData = {
    festivalName: 'Test Diwali 2024',
    rebateRate: 15
  };
  
  const submitFormVI = await apiCall('POST', '/okvi/claim-documents/form-vi', formVIData, tokens.user);
  if (submitFormVI.success) {
    testData.formVIId = submitFormVI.data.data._id;
    console.log('  ✅ Form VI submitted successfully');
  } else {
    console.log(`  ❌ Form VI submission failed: ${submitFormVI.error}`);
  }

  // Test Declaration Certificate
  console.log('\n  Testing Declaration Certificate...');
  
  const declarationData = {
    festivalId: testData.holidayId,
    spellStartDate: '2024-11-01',
    spellEndDate: '2024-11-05'
  };
  
  const submitDeclaration = await apiCall('POST', '/okvi/claim-documents/declaration-certificate', declarationData, tokens.user);
  if (submitDeclaration.success) {
    testData.declarationId = submitDeclaration.data.data._id;
    console.log('  ✅ Declaration Certificate submitted successfully');
  } else {
    console.log(`  ❌ Declaration Certificate submission failed: ${submitDeclaration.error}`);
  }

  // Test Final Submission
  console.log('\n  Testing Final Claim Submission...');
  
  const finalSubmitData = {
    festivalName: 'Test Diwali 2024'
  };
  
  const finalSubmit = await apiCall('POST', '/okvi/claim-documents/final-submit', finalSubmitData, tokens.user);
  if (finalSubmit.success) {
    testData.claimId = finalSubmit.data.data._id;
    console.log('  ✅ Final claim submission successful');
    console.log(`    Claim ID: ${testData.claimId}`);
    console.log(`    Status: ${finalSubmit.data.data.status}`);
  } else {
    console.log(`  ❌ Final claim submission failed: ${finalSubmit.error}`);
  }
}

async function testAdminWorkflow() {
  console.log('\n👨‍💼 Testing Admin Approval Workflow...');
  
  if (!testData.claimId) {
    console.log('  ❌ No claim ID available for testing');
    return;
  }

  // Test GMDIC Dashboard
  console.log('\n  Testing GMDIC Dashboard...');
  
  const gmdcDashboard = await apiCall('GET', '/okvi/admin/dashboard', null, tokens.gmdic);
  if (gmdcDashboard.success) {
    console.log('  ✅ GMDIC Dashboard loaded successfully');
    console.log(`    Pending Claims: ${gmdcDashboard.data.data.statistics.pending}`);
  } else {
    console.log(`  ❌ GMDIC Dashboard failed: ${gmdcDashboard.error}`);
  }

  // Test GMDIC Approval
  console.log('\n  Testing GMDIC Approval...');
  
  const gmdcApproval = await apiCall('POST', `/okvi/admin/claims/${testData.claimId}/approve`, {
    comments: 'All documents verified by GMDIC. Approved for next level.'
  }, tokens.gmdic);
  
  if (gmdcApproval.success) {
    console.log('  ✅ GMDIC approval successful');
    console.log(`    New Status: ${gmdcApproval.data.data.status}`);
  } else {
    console.log(`  ❌ GMDIC approval failed: ${gmdcApproval.error}`);
  }

  // Test DI Approval
  console.log('\n  Testing DI Approval...');
  
  const diApproval = await apiCall('POST', `/okvi/admin/claims/${testData.claimId}/approve`, {
    comments: 'Reviewed and approved by DI. Forwarding to Addl. Director.'
  }, tokens.di);
  
  if (diApproval.success) {
    console.log('  ✅ DI approval successful');
    console.log(`    New Status: ${diApproval.data.data.status}`);
  } else {
    console.log(`  ❌ DI approval failed: ${diApproval.error}`);
  }

  // Test Addl. Director Final Approval with Auto-calculation
  console.log('\n  Testing Addl. Director Final Approval...');
  
  const addlDirectorApproval = await apiCall('POST', `/okvi/admin/claims/${testData.claimId}/approve`, {
    comments: 'Final approval granted. Sanction amount calculated automatically.'
  }, tokens.addl_director);
  
  if (addlDirectorApproval.success) {
    console.log('  ✅ Addl. Director approval successful');
    console.log(`    Final Status: ${addlDirectorApproval.data.data.status}`);
    console.log(`    Sanction Amount: ₹${addlDirectorApproval.data.data.finalSanctionAmount}`);
    
    if (addlDirectorApproval.data.calculationDetails) {
      const calc = addlDirectorApproval.data.calculationDetails;
      console.log('    Calculation Details:');
      console.log(`      Base Rebate Amount: ₹${calc.baseRebateAmount}`);
      console.log(`      Applied Percentage: ${calc.appliedPercentage * 100}%`);
      console.log(`      Processing Fee Deducted: ₹${calc.processingFeeDeducted}`);
      console.log(`      Final Calculated Amount: ₹${calc.calculatedAmount}`);
    }
  } else {
    console.log(`  ❌ Addl. Director approval failed: ${addlDirectorApproval.error}`);
  }
}

async function testSanctionCalculator() {
  console.log('\n🧮 Testing Sanction Calculator APIs...');
  
  if (!tokens.gmdic) {
    console.log('  ❌ GMDIC token not available');
    return;
  }

  // Test Configuration
  console.log('\n  Testing Sanction Calculator Configuration...');
  
  const getConfig = await apiCall('GET', '/okvi/sanction-calculator/config', null, tokens.gmdic);
  if (getConfig.success) {
    console.log('  ✅ Configuration retrieved successfully');
    console.log(`    Max Limit: ₹${getConfig.data.data.config.MAX_SANCTION_LIMIT}`);
    console.log(`    Min Amount: ₹${getConfig.data.data.config.MIN_SANCTION_AMOUNT}`);
    console.log(`    Processing Fee: ₹${getConfig.data.data.config.PROCESSING_FEE_DEDUCTION}`);
  } else {
    console.log(`  ❌ Configuration retrieval failed: ${getConfig.error}`);
  }

  // Test Individual Calculation
  if (testData.claimId) {
    console.log('\n  Testing Individual Claim Calculation...');
    
    const calculateClaim = await apiCall('GET', `/okvi/sanction-calculator/calculate/${testData.claimId}`, null, tokens.gmdic);
    if (calculateClaim.success) {
      console.log('  ✅ Individual calculation successful');
      const calc = calculateClaim.data.data;
      console.log(`    Applicant: ${calc.applicantName}`);
      console.log(`    Base Rebate: ₹${calc.baseRebateAmount}`);
      console.log(`    Final Sanction: ₹${calc.finalSanctionAmount}`);
    } else {
      console.log(`  ❌ Individual calculation failed: ${calculateClaim.error}`);
    }
  }
}

async function testUserClaimTracking() {
  console.log('\n👤 Testing User Claim Tracking...');
  
  if (!tokens.user) {
    console.log('  ❌ User token not available');
    return;
  }

  const getMyClaims = await apiCall('GET', '/okvi/claim-documents/my-claims', null, tokens.user);
  if (getMyClaims.success) {
    console.log('  ✅ User claims retrieved successfully');
    console.log(`    Total Claims: ${getMyClaims.data.total}`);
    
    if (getMyClaims.data.data.length > 0) {
      const claim = getMyClaims.data.data[0];
      console.log(`    Latest Claim Status: ${claim.status}`);
      console.log(`    Festival: ${claim.festivalId.name}`);
    }
  } else {
    console.log(`  ❌ User claims retrieval failed: ${getMyClaims.error}`);
  }
}

// Main test execution
async function runCompleteTest() {
  console.log('🚀 Starting Complete OKVI Application Flow Test');
  console.log('=' .repeat(60));

  try {
    await testAuthentication();
    await testMasterDataManagement();
    await testStockManagement();
    await testClaimDocuments();
    await testAdminWorkflow();
    await testSanctionCalculator();
    await testUserClaimTracking();

    console.log('\n' + '=' .repeat(60));
    console.log('✅ Complete OKVI Application Flow Test Completed');
    console.log('\n📊 Test Summary:');
    console.log(`  Tokens Generated: ${Object.keys(tokens).length}`);
    console.log(`  Test Data Created: ${Object.keys(testData).length} items`);
    console.log('\n🔍 Test Data IDs:');
    Object.entries(testData).forEach(([key, value]) => {
      console.log(`    ${key}: ${value}`);
    });

  } catch (error) {
    console.error('\n❌ Test execution failed:', error.message);
  }
}

// Run the test
runCompleteTest();
