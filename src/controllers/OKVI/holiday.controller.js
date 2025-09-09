import Holiday from '../../models/OKVI/holidayFestival.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import mongoose from 'mongoose';
function handleDuplicateKey(err, next) {
  if (err.code === 11000) {
    return next(new AppError('A holiday with that name already exists for this year.', 400));
  }
  return next(err);
}
export const createHoliday = catchAsync(async (req, res, next) => {
  const { name, startDate, endDate, type } = req.body;
  if (!startDate || !endDate || new Date(endDate) < new Date(startDate)) {
    return next(new AppError('Invalid start or end date', 400));
  }
  const year = new Date(startDate).getFullYear();
  try {
    const holiday = await Holiday.create({
      name,
      year,
      startDate,
      endDate,
      type,
      createdBy: req.user.id,
    });
    res.status(201).json({ status: 'success', data: holiday });
  } catch (err) {
    return handleDuplicateKey(err, next);
  }
});
export const getHolidays = catchAsync(async (req, res) => {
  const holidays = await Holiday.find().sort({ startDate: 1 });
  const today = new Date();

  const holidaysWithStatus = holidays.map(holiday => {
    const start = new Date(holiday.startDate);
    const end = new Date(holiday.endDate);

    let status = 0; // pending by default
    if (today >= start && today <= end) {
      status = 1; // active
    } else if (today > end) {
      status = 2; // over
    }

    return {
      ...holiday.toObject(),
      status
    };
  });

  res.status(200).json({ status: 'success', data: holidaysWithStatus });
});
export const updateHoliday = catchAsync(async (req, res, next) => {
  const { id, name, startDate, endDate, type } = req.body;
  if (!startDate || !endDate || new Date(endDate) < new Date(startDate)) {
    return next(new AppError('Invalid start or end date', 400));
  }
  const year = new Date(startDate).getFullYear();
  try {
    const holiday = await Holiday.findByIdAndUpdate(
      id,
      { name, year, startDate, endDate, type },
      {
        new: true,
        runValidators: true,
        context: 'query',
      }
    );
    if (!holiday) {
      return next(new AppError('Holiday not found', 404));
    }
    res.status(200).json({ status: 'success', data: holiday });
  } catch (err) {
    return handleDuplicateKey(err, next);
  }
});
export const deleteHoliday = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid holiday ID', 400));
  }
  const holiday = await Holiday.findByIdAndDelete(id);
  if (!holiday) {
    return next(new AppError('Holiday not found', 404));
  }
  res.status(204).json({ status: 'success', data: null });
});

// Base list of Odia festivals/holidays (static names only)
const odiaBaseList = [
  "New Year's Day",
  "Guru Gobind Singh Jayanti",
  "Subhas Chandra Bose Jayanti",
  "Republic Day",
  "Vasant Panchami",
  "Guru Ravidas Jayanti",
  "Maha Shivaratri",
  "Panchayati Raj Divas",
  "Holi (Dola Purnima)",
  "Gudi Padwa",
  "Id-ul-Fitr",
  "Odisha Day (Utkal Divas)",
  "Babu Jagjivan Ram Jayanti",
  "Ram Navami",
  "Mahavir Jayanti",
  "Dr. Ambedkar Jayanti",
  "Maha Vishuba Sankranti",
  "Good Friday",
  "Maharshi Parasuram Jayanti",
  "Basava Jayanti",
  "May Day",
  "Buddha Purnima",
  "Sabitri Amavasya",
  "Id-ul-Zuha (Bakrid)",
  "Raja Sankranti",
  "Pahili Raja",
  "Ratha Yatra",
  "Karkidaka Vavu Bali",
  "Muharram",
  "Jhulan Purnima",
  "Independence Day",
  "Janmashtami",
  "Ganesh Chaturthi",
  "Nuakhai",
  "Eid-e-Milad (Birthday of Prophet Muhammad)",
  "Mahalaya Amavasya",
  "Maha Saptami",
  "Maha Ashtami",
  "Maha Navami",
  "Vijaya Dashami (Dussehra) / Gandhi Jayanti",
  "Kumar Purnima",
  "Lakshmi Puja",
  "Diwali",
  "Kartika Purnima / Rahas Purnima",
  "Christmas Day"
];

export const getOdiaHolidayDropdown = catchAsync(async (req, res) => {
  const currentYear = new Date().getFullYear();
  
  const labels = odiaBaseList.map(name => name /*+ ` ${currentYear}` */);

  res.status(200).json({
    status: 'success',
    year: currentYear,
    total: labels.length,
    data: labels
  });
});
