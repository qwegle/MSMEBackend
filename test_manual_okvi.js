import mongoose from 'mongoose';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config();

// Import models
import OkviAuth from './src/models/OKVI/okviauth.js';
import Holiday from './src/models/OKVI/hoildayFestival.js';
import HeadType from './src/models/OKVI/headType.js';
import UnitType from './src/models/OKVI/unitType.js';

async function testOKVIFlow() {
  try {
    // Connect to MongoDB
    await mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost:27017/msme_okvi');
    console.log('✅ Connected to MongoDB');

    // 1. Create test admin users
    console.log('\n🔧 Creating test admin users...');
    
    const adminUsers = [
      {
        name: 'GMDIC Admin',
        email: 'gmdic@okvi.gov.in',
        password: 'admin123',
        role: 0,
        isVerified: true
      },
      {
        name: 'DI Admin', 
        email: 'di@okvi.gov.in',
        password: 'admin123',
        role: 1,
        isVerified: true
      },
      {
        name: 'Addl Director',
        email: 'addl.director@okvi.gov.in', 
        password: 'admin123',
        role: 2,
        isVerified: true
      },
      {
        name: 'Test User',
        email: 'user@okvi.gov.in',
        password: 'user123', 
        role: 3,
        isVerified: true
      }
    ];

    for (const userData of adminUsers) {
      const existingUser = await OkviAuth.findOne({ email: userData.email });
      if (!existingUser) {
        const user = new OkviAuth(userData);
        await user.save();
        console.log(`  ✅ Created ${userData.name} (${userData.email})`);
      } else {
        console.log(`  ⚠️ User ${userData.email} already exists`);
      }
    }

    // 2. Create test holiday
    console.log('\n🎉 Creating test holiday...');
    
    const holidayData = {
      name: 'Test Diwali 2024',
      year: 2024,
      startDate: new Date('2024-11-01'),
      endDate: new Date('2024-11-05'),
      type: 'Festival',
      createdBy: (await OkviAuth.findOne({ role: 0 }))._id
    };

    const existingHoliday = await Holiday.findOne({ name: holidayData.name });
    if (!existingHoliday) {
      const holiday = new Holiday(holidayData);
      await holiday.save();
      console.log(`  ✅ Created holiday: ${holidayData.name}`);
    } else {
      console.log(`  ⚠️ Holiday ${holidayData.name} already exists`);
    }

    // 3. Create test head types
    console.log('\n📋 Creating test head types...');
    
    const headTypes = [
      { name: 'Raw Materials', description: 'Raw materials for production' },
      { name: 'Finished Goods', description: 'Completed products ready for sale' },
      { name: 'Work in Progress', description: 'Items currently being manufactured' }
    ];

    const gmdcUser = await OkviAuth.findOne({ role: 0 });
    
    for (const headTypeData of headTypes) {
      const existing = await HeadType.findOne({ name: headTypeData.name });
      if (!existing) {
        const headType = new HeadType({
          ...headTypeData,
          createdBy: gmdcUser._id
        });
        await headType.save();
        console.log(`  ✅ Created head type: ${headTypeData.name}`);
      } else {
        console.log(`  ⚠️ Head type ${headTypeData.name} already exists`);
      }
    }

    // 4. Create test unit types
    console.log('\n🏭 Creating test unit types...');
    
    const unitTypes = [
      { name: 'Handloom Unit', description: 'Traditional handloom weaving unit' },
      { name: 'Handicraft Unit', description: 'Traditional handicraft production unit' },
      { name: 'Khadi Unit', description: 'Khadi spinning and weaving unit' }
    ];

    for (const unitTypeData of unitTypes) {
      const existing = await UnitType.findOne({ name: unitTypeData.name });
      if (!existing) {
        const unitType = new UnitType({
          ...unitTypeData,
          createdBy: gmdcUser._id
        });
        await unitType.save();
        console.log(`  ✅ Created unit type: ${unitTypeData.name}`);
      } else {
        console.log(`  ⚠️ Unit type ${unitTypeData.name} already exists`);
      }
    }

    console.log('\n✅ Test data setup completed successfully!');
    console.log('\n📊 Summary:');
    console.log(`  Admin Users: ${await OkviAuth.countDocuments()}`);
    console.log(`  Holidays: ${await Holiday.countDocuments()}`);
    console.log(`  Head Types: ${await HeadType.countDocuments()}`);
    console.log(`  Unit Types: ${await UnitType.countDocuments()}`);

    console.log('\n🔗 Test Credentials:');
    console.log('  GMDIC: gmdic@okvi.gov.in / admin123');
    console.log('  DI: di@okvi.gov.in / admin123');
    console.log('  Addl Director: addl.director@okvi.gov.in / admin123');
    console.log('  User: user@okvi.gov.in / user123');

    console.log('\n🌐 Server is running at: http://localhost:3000');
    console.log('📖 API Documentation: Check FRONTEND.md for complete API details');

  } catch (error) {
    console.error('❌ Error during test setup:', error);
  } finally {
    await mongoose.connection.close();
    console.log('\n🔌 Database connection closed');
  }
}

// Run the test
testOKVIFlow();
