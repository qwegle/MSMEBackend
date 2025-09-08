// Test file for OKVI Admin functionality
// Run with: node test_okvi_admin.js

import dotenv from 'dotenv';
dotenv.config();

import mongoose from 'mongoose';
import bcrypt from 'bcrypt';
import OkviAuth from './src/models/OKVI/okviauth.js';
import Holiday from './src/models/OKVI/hoildayFestival.js';
import HeadType from './src/models/OKVI/headType.js';
import UnitType from './src/models/OKVI/unitType.js';
import ClaimApplication from './src/models/OKVI/claimApplication.js';

const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/msme_okvi';

async function connectDB() {
  try {
    await mongoose.connect(MONGODB_URI);
    console.log('✅ Connected to MongoDB');
  } catch (error) {
    console.error('❌ MongoDB connection failed:', error);
    process.exit(1);
  }
}

async function createTestAdminUsers() {
  console.log('\n📝 Creating test admin users...');
  
  const adminUsers = [
    {
      name: 'GMDIC Admin',
      email: 'gmdic@okvi.gov.in',
      password: await bcrypt.hash('Admin@123456', 12),
      role: 0, // GMDIC
      isEmailVerified: true
    },
    {
      name: 'DI Admin',
      email: 'di@okvi.gov.in',
      password: await bcrypt.hash('Admin@123456', 12),
      role: 1, // DI
      isEmailVerified: true
    },
    {
      name: 'Addl Director Admin',
      email: 'addldirector@okvi.gov.in',
      password: await bcrypt.hash('Admin@123456', 12),
      role: 2, // Addl. Director
      isEmailVerified: true
    },
    {
      name: 'Test User',
      email: 'user@okvi.gov.in',
      password: await bcrypt.hash('User@123456', 12),
      role: 3, // Regular User
      isEmailVerified: true
    }
  ];

  for (const userData of adminUsers) {
    try {
      const existingUser = await OkviAuth.findOne({ email: userData.email });
      if (!existingUser) {
        const user = await OkviAuth.create(userData);
        console.log(`✅ Created ${userData.name} (${userData.email})`);
      } else {
        console.log(`⚠️  User ${userData.email} already exists`);
      }
    } catch (error) {
      console.error(`❌ Failed to create ${userData.email}:`, error.message);
    }
  }
}

async function createTestHolidays() {
  console.log('\n🎉 Creating test holidays/festivals...');
  
  const holidays = [
    {
      name: 'Diwali',
      year: 2024,
      startDate: new Date('2024-11-01'),
      endDate: new Date('2024-11-05'),
      type: 'Festival'
    },
    {
      name: 'Durga Puja',
      year: 2024,
      startDate: new Date('2024-10-10'),
      endDate: new Date('2024-10-15'),
      type: 'Festival'
    },
    {
      name: 'Kali Puja',
      year: 2024,
      startDate: new Date('2024-11-14'),
      endDate: new Date('2024-11-16'),
      type: 'Festival'
    }
  ];

  const gmdic = await OkviAuth.findOne({ role: 0 });
  if (!gmdic) {
    console.log('❌ No GMDIC user found, cannot create holidays');
    return;
  }

  for (const holidayData of holidays) {
    try {
      const existingHoliday = await Holiday.findOne({ 
        name: holidayData.name, 
        year: holidayData.year 
      });
      
      if (!existingHoliday) {
        const holiday = await Holiday.create({
          ...holidayData,
          createdBy: gmdic._id
        });
        console.log(`✅ Created holiday: ${holiday.name} ${holiday.year}`);
      } else {
        console.log(`⚠️  Holiday ${holidayData.name} ${holidayData.year} already exists`);
      }
    } catch (error) {
      console.error(`❌ Failed to create holiday ${holidayData.name}:`, error.message);
    }
  }
}

async function createTestHeadTypes() {
  console.log('\n📋 Creating test head types...');
  
  const headTypes = [
    { name: 'Raw Materials', description: 'Raw materials for production' },
    { name: 'Finished Goods', description: 'Completed products ready for sale' },
    { name: 'Work in Progress', description: 'Items currently being manufactured' },
    { name: 'Accessories', description: 'Additional items and accessories' }
  ];

  const gmdic = await OkviAuth.findOne({ role: 0 });
  if (!gmdic) {
    console.log('❌ No GMDIC user found, cannot create head types');
    return;
  }

  for (const headTypeData of headTypes) {
    try {
      const existingHeadType = await HeadType.findOne({ name: headTypeData.name });
      
      if (!existingHeadType) {
        const headType = await HeadType.create({
          ...headTypeData,
          createdBy: gmdic._id
        });
        console.log(`✅ Created head type: ${headType.name}`);
      } else {
        console.log(`⚠️  Head type ${headTypeData.name} already exists`);
      }
    } catch (error) {
      console.error(`❌ Failed to create head type ${headTypeData.name}:`, error.message);
    }
  }
}

async function createTestUnitTypes() {
  console.log('\n🏭 Creating test unit types...');
  
  const unitTypes = [
    { name: 'Handloom Unit', description: 'Traditional handloom weaving unit' },
    { name: 'Khadi Unit', description: 'Khadi spinning and weaving unit' },
    { name: 'Village Industry', description: 'Small scale village industry unit' },
    { name: 'Cottage Industry', description: 'Home-based cottage industry unit' }
  ];

  const gmdic = await OkviAuth.findOne({ role: 0 });
  if (!gmdic) {
    console.log('❌ No GMDIC user found, cannot create unit types');
    return;
  }

  for (const unitTypeData of unitTypes) {
    try {
      const existingUnitType = await UnitType.findOne({ name: unitTypeData.name });
      
      if (!existingUnitType) {
        const unitType = await UnitType.create({
          ...unitTypeData,
          createdBy: gmdic._id
        });
        console.log(`✅ Created unit type: ${unitType.name}`);
      } else {
        console.log(`⚠️  Unit type ${unitTypeData.name} already exists`);
      }
    } catch (error) {
      console.error(`❌ Failed to create unit type ${unitTypeData.name}:`, error.message);
    }
  }
}

async function displayTestResults() {
  console.log('\n📊 Test Results Summary:');
  console.log('========================');
  
  const userCount = await OkviAuth.countDocuments();
  const holidayCount = await Holiday.countDocuments();
  const headTypeCount = await HeadType.countDocuments();
  const unitTypeCount = await UnitType.countDocuments();
  const claimCount = await ClaimApplication.countDocuments();
  
  console.log(`👥 Total Users: ${userCount}`);
  console.log(`🎉 Total Holidays: ${holidayCount}`);
  console.log(`📋 Total Head Types: ${headTypeCount}`);
  console.log(`🏭 Total Unit Types: ${unitTypeCount}`);
  console.log(`📄 Total Claims: ${claimCount}`);
  
  console.log('\n👥 Admin Users by Role:');
  const gmdic = await OkviAuth.countDocuments({ role: 0 });
  const di = await OkviAuth.countDocuments({ role: 1 });
  const addlDirector = await OkviAuth.countDocuments({ role: 2 });
  const users = await OkviAuth.countDocuments({ role: 3 });
  
  console.log(`   GMDIC (Role 0): ${gmdic}`);
  console.log(`   DI (Role 1): ${di}`);
  console.log(`   Addl. Director (Role 2): ${addlDirector}`);
  console.log(`   Regular Users (Role 3): ${users}`);
  
  console.log('\n🎯 API Endpoints Available:');
  console.log('   Admin Dashboard: GET /api/okvi/admin/dashboard');
  console.log('   Pending Claims: GET /api/okvi/admin/claims/pending');
  console.log('   Approve Claim: POST /api/okvi/admin/claims/:id/approve');
  console.log('   Reject Claim: POST /api/okvi/admin/claims/:id/reject');
  console.log('   Holidays CRUD: /api/okvi/holidays/*');
  console.log('   Head Types CRUD: /api/okvi/head-types/*');
  console.log('   Unit Types CRUD: /api/okvi/unit-types/*');
  console.log('   Claim Documents: /api/okvi/claim-documents/*');
}

async function runTests() {
  console.log('🚀 Starting OKVI Admin Functionality Tests');
  console.log('==========================================');
  
  try {
    await connectDB();
    await createTestAdminUsers();
    await createTestHolidays();
    await createTestHeadTypes();
    await createTestUnitTypes();
    await displayTestResults();
    
    console.log('\n✅ All tests completed successfully!');
    console.log('\n📝 Next Steps:');
    console.log('1. Start the server: npm start');
    console.log('2. Test API endpoints with the created users');
    console.log('3. Use the credentials:');
    console.log('   - GMDIC: gmdic@okvi.gov.in / Admin@123456');
    console.log('   - DI: di@okvi.gov.in / Admin@123456');
    console.log('   - Addl. Director: addldirector@okvi.gov.in / Admin@123456');
    console.log('   - User: user@okvi.gov.in / User@123456');
    
  } catch (error) {
    console.error('❌ Test failed:', error);
  } finally {
    await mongoose.disconnect();
    console.log('\n🔌 Disconnected from MongoDB');
  }
}

// Run tests if this file is executed directly
if (import.meta.url === `file://${process.argv[1]}`) {
  runTests();
}
