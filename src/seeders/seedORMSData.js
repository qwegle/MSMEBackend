import mongoose from 'mongoose';
import dotenv from 'dotenv';
import Holiday from '../models/OKVI/holidayFestival.js';
import HeadType from '../models/OKVI/headType.js';
import UnitType from '../models/OKVI/unitType.js';
dotenv.config();
const { MONGO_URI, DB_NAME } = process.env;
const seedData = async () => {
  try {
    await mongoose.connect(MONGO_URI, {
      dbName: DB_NAME,
      useNewUrlParser: true,
      useUnifiedTopology: true
    });
    console.log('✅ Connected to MongoDB:', DB_NAME);
    await Holiday.deleteMany({});
    await HeadType.deleteMany({});
    await UnitType.deleteMany({});
    console.log('🗑️ Old data cleared');
    const holidays = [
      {
        name: 'Raja Festival',
        year: 2025,
        slug: 'raja-festival-2025',
        startDate: new Date('2025-06-14'),
        endDate: new Date('2025-06-16'),
        type: 'Festival',
        createdBy: '64f1a7c0a1a2b9d3e6f10001'
      },
      {
        name: 'Durga Puja',
        year: 2025,
        slug: 'durga-puja-2025',
        startDate: new Date('2025-10-01'),
        endDate: new Date('2025-10-06'),
        type: 'Festival',
        createdBy: '64f1a7c0a1a2b9d3e6f10002'
      },
      {
        name: 'Makar Sankranti',
        year: 2025,
        slug: 'makar-sankranti-2025',
        startDate: new Date('2025-01-14'),
        endDate: new Date('2025-01-14'),
        type: 'Holiday',
        createdBy: '64f1a7c0a1a2b9d3e6f10003'
      },
      {
        name: 'Kartika Purnima',
        year: 2025,
        slug: 'kartika-purnima-2025',
        startDate: new Date('2025-11-07'),
        endDate: new Date('2025-11-07'),
        type: 'Festival',
        createdBy: '64f1a7c0a1a2b9d3e6f10001'
      }
    ];
    const headTypes = [
      {
        name: 'Handloom Fabrics',
        description: 'Rebate head for sales of handloom cloth and garments during festivals.',
        isActive: true,
        createdBy: '64f1a7c0a1a2b9d3e6f10001'
      },
      {
        name: 'Handicrafts',
        description: 'Rebate head for traditional handicraft items sold during exhibitions and fairs.',
        isActive: true,
        createdBy: '64f1a7c0a1a2b9d3e6f10002'
      },
      {
        name: 'Coir Products',
        description: 'Rebate head covering mats, ropes and coir-based utility items.',
        isActive: true,
        createdBy: '64f1a7c0a1a2b9d3e6f10003'
      }
    ];
    const unitTypes = [
      {
        name: 'Meter',
        description: 'Measurement unit for handloom fabrics (cloth length).',
        isActive: true,
        createdBy: '64f1a7c0a1a2b9d3e6f10001'
      },
      {
        name: 'Piece',
        description: 'Used for handicraft items and finished garments.',
        isActive: true,
        createdBy: '64f1a7c0a1a2b9d3e6f10002'
      },
      {
        name: 'Kg',
        description: 'Unit for coir ropes, raw cotton, and bulk materials.',
        isActive: true,
        createdBy: '64f1a7c0a1a2b9d3e6f10003'
      }
    ];

    await Holiday.insertMany(holidays);
    await HeadType.insertMany(headTypes);
    await UnitType.insertMany(unitTypes);
    console.log('🌱 Demo data seeded successfully');
    process.exit(0);
  } catch (err) {
    console.error('❌ Error seeding data:', err);
    process.exit(1);
  }
};

seedData();
