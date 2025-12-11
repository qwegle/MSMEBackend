require('dotenv').config();
const mongoose = require('mongoose');

const MONGO_URI = process.env.MONGO_URI;

const HeadTypeSchema = new mongoose.Schema({
  name: { type: String, required: true },
  code: { type: String },
  isActive: { type: Boolean, default: true },
}, { timestamps: true });

const UnitTypeSchema = new mongoose.Schema({
  name: { type: String, required: true },
  code: { type: String },
  isActive: { type: Boolean, default: true },
}, { timestamps: true });

const HolidaySchema = new mongoose.Schema({
  name: { type: String, required: true },
  nameOdia: { type: String },
  spellStartDate: { type: Date, required: true },
  spellEndDate: { type: Date, required: true },
  claimLastDate: { type: Date },
  year: { type: Number, required: true },
  isActive: { type: Boolean, default: true },
}, { timestamps: true });

const HeadType = mongoose.model('HeadType', HeadTypeSchema);
const UnitType = mongoose.model('UnitType', UnitTypeSchema);
const Holiday = mongoose.model('Holiday', HolidaySchema);

const headTypes = [
  { name: 'Khadi Cloth', code: 'KC' },
  { name: 'Khadi Readymade', code: 'KR' },
  { name: 'Village Industries Product', code: 'VIP' },
  { name: 'Handloom Products', code: 'HP' },
  { name: 'Handicrafts', code: 'HC' },
];

const unitTypes = [
  { name: 'Pieces', code: 'PCS' },
  { name: 'Meters', code: 'MTR' },
  { name: 'Kilograms', code: 'KG' },
  { name: 'Liters', code: 'LTR' },
  { name: 'Numbers', code: 'NOS' },
];

const holidays = [
  {
    name: 'Makar Sankranti',
    nameOdia: 'ମକର ସଂକ୍ରାନ୍ତି',
    spellStartDate: new Date('2025-01-10'),
    spellEndDate: new Date('2025-01-16'),
    claimLastDate: new Date('2025-01-31'),
    year: 2025,
  },
  {
    name: 'Saraswati Puja',
    nameOdia: 'ସରସ୍ୱତୀ ପୂଜା',
    spellStartDate: new Date('2025-02-01'),
    spellEndDate: new Date('2025-02-05'),
    claimLastDate: new Date('2025-02-20'),
    year: 2025,
  },
  {
    name: 'Holi',
    nameOdia: 'ହୋଲି',
    spellStartDate: new Date('2025-03-12'),
    spellEndDate: new Date('2025-03-18'),
    claimLastDate: new Date('2025-04-02'),
    year: 2025,
  },
  {
    name: 'Pana Sankranti',
    nameOdia: 'ପଣା ସଂକ୍ରାନ୍ତି',
    spellStartDate: new Date('2025-04-12'),
    spellEndDate: new Date('2025-04-18'),
    claimLastDate: new Date('2025-05-03'),
    year: 2025,
  },
  {
    name: 'Raja Festival',
    nameOdia: 'ରଜ ପର୍ବ',
    spellStartDate: new Date('2025-06-13'),
    spellEndDate: new Date('2025-06-17'),
    claimLastDate: new Date('2025-07-02'),
    year: 2025,
  },
  {
    name: 'Ganesh Chaturthi',
    nameOdia: 'ଗଣେଶ ଚତୁର୍ଥୀ',
    spellStartDate: new Date('2025-08-25'),
    spellEndDate: new Date('2025-09-03'),
    claimLastDate: new Date('2025-09-18'),
    year: 2025,
  },
  {
    name: 'Durga Puja',
    nameOdia: 'ଦୁର୍ଗା ପୂଜା',
    spellStartDate: new Date('2025-09-28'),
    spellEndDate: new Date('2025-10-07'),
    claimLastDate: new Date('2025-10-22'),
    year: 2025,
  },
  {
    name: 'Diwali',
    nameOdia: 'ଦୀପାବଳି',
    spellStartDate: new Date('2025-10-18'),
    spellEndDate: new Date('2025-10-25'),
    claimLastDate: new Date('2025-11-09'),
    year: 2025,
  },
  {
    name: 'Kartik Purnima',
    nameOdia: 'କାର୍ତ୍ତିକ ପୂର୍ଣ୍ଣିମା',
    spellStartDate: new Date('2025-11-03'),
    spellEndDate: new Date('2025-11-08'),
    claimLastDate: new Date('2025-11-23'),
    year: 2025,
  },
  {
    name: 'Christmas Festival',
    nameOdia: 'ବଡ଼ଦିନ',
    spellStartDate: new Date('2025-12-20'),
    spellEndDate: new Date('2025-12-28'),
    claimLastDate: new Date('2026-01-12'),
    year: 2025,
  },
];

async function seedData() {
  try {
    await mongoose.connect(MONGO_URI);
    console.log('Connected to MongoDB');

    console.log('Seeding Head Types...');
    for (const ht of headTypes) {
      try {
        const existing = await HeadType.findOne({ name: ht.name });
        if (!existing) {
          await HeadType.create(ht);
          console.log(`  Created: ${ht.name}`);
        } else {
          console.log(`  Exists: ${ht.name}`);
        }
      } catch (e) {
        console.log(`  Skipped (duplicate): ${ht.name}`);
      }
    }
    console.log('Head Types seeded successfully!');

    console.log('Seeding Unit Types...');
    for (const ut of unitTypes) {
      try {
        const existing = await UnitType.findOne({ name: ut.name });
        if (!existing) {
          await UnitType.create(ut);
          console.log(`  Created: ${ut.name}`);
        } else {
          console.log(`  Exists: ${ut.name}`);
        }
      } catch (e) {
        console.log(`  Skipped (duplicate): ${ut.name}`);
      }
    }
    console.log('Unit Types seeded successfully!');

    console.log('Seeding Holidays/Festivals...');
    for (const holiday of holidays) {
      try {
        const existing = await Holiday.findOne({ name: holiday.name, year: holiday.year });
        if (!existing) {
          await Holiday.create(holiday);
          console.log(`  Created: ${holiday.name}`);
        } else {
          console.log(`  Exists: ${holiday.name}`);
        }
      } catch (e) {
        console.log(`  Skipped (duplicate): ${holiday.name}`);
      }
    }
    console.log('Holidays seeded successfully!');

    console.log('\n=== DUMMY DATA SEEDED SUCCESSFULLY ===\n');
    console.log('Test the application with these credentials:');
    console.log('----------------------------------------');
    console.log('GMDIC Admin:    gmdic@okvi.gov.in / Gmdic@123');
    console.log('DI Admin:       di@okvi.gov.in / Di@123456');
    console.log('Addl Director:  addl.director@okvi.gov.in / Addl@1234');
    console.log('Regular User:   user@okvi.gov.in / User@1234');
    console.log('----------------------------------------\n');
    console.log('TESTING FLOW:');
    console.log('1. Login with user@okvi.gov.in');
    console.log('2. Go to Dashboard - see festival calendar');
    console.log('3. Go to Opening Stock Entry - submit stock for a festival');
    console.log('4. Go to Closing Stock Entry - submit closing stock');
    console.log('5. Go to Claim Documents - submit claim forms');
    console.log('6. Go to Submitted Claims - track claim status');
    console.log('7. Login as gmdic@okvi.gov.in to approve claims');
    console.log('----------------------------------------\n');

    await mongoose.disconnect();
    console.log('Disconnected from MongoDB');
    process.exit(0);
  } catch (error) {
    console.error('Error seeding data:', error.message);
    process.exit(1);
  }
}

seedData();
