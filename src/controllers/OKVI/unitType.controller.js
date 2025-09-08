import UnitType from '../../models/OKVI/unitType.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import mongoose from 'mongoose';

export const createUnitType = catchAsync(async (req, res, next) => {
  const { name, description } = req.body;
  
  if (!name || !name.trim()) {
    return next(new AppError('Unit type name is required', 400));
  }

  try {
    const unitType = await UnitType.create({
      name: name.trim(),
      description: description?.trim() || '',
      createdBy: req.user.id
    });

    res.status(201).json({
      status: 'success',
      data: unitType
    });
  } catch (err) {
    if (err.code === 11000) {
      return next(new AppError('Unit type with this name already exists', 400));
    }
    return next(err);
  }
});

export const getUnitTypes = catchAsync(async (req, res) => {
  const { isActive } = req.query;
  
  const filter = {};
  if (isActive !== undefined) {
    filter.isActive = isActive === 'true';
  }

  const unitTypes = await UnitType.find(filter)
    .populate('createdBy', 'name email')
    .sort({ name: 1 });

  res.status(200).json({
    status: 'success',
    results: unitTypes.length,
    data: unitTypes
  });
});

export const updateUnitType = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const { name, description, isActive } = req.body;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid unit type ID', 400));
  }

  const updateData = {};
  if (name !== undefined) updateData.name = name.trim();
  if (description !== undefined) updateData.description = description.trim();
  if (isActive !== undefined) updateData.isActive = isActive;

  try {
    const unitType = await UnitType.findByIdAndUpdate(
      id,
      updateData,
      {
        new: true,
        runValidators: true
      }
    );

    if (!unitType) {
      return next(new AppError('Unit type not found', 404));
    }

    res.status(200).json({
      status: 'success',
      data: unitType
    });
  } catch (err) {
    if (err.code === 11000) {
      return next(new AppError('Unit type with this name already exists', 400));
    }
    return next(err);
  }
});

export const deleteUnitType = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid unit type ID', 400));
  }

  const unitType = await UnitType.findByIdAndDelete(id);

  if (!unitType) {
    return next(new AppError('Unit type not found', 404));
  }

  res.status(204).json({
    status: 'success',
    data: null
  });
});

export const getUnitTypeById = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid unit type ID', 400));
  }

  const unitType = await UnitType.findById(id).populate('createdBy', 'name email');

  if (!unitType) {
    return next(new AppError('Unit type not found', 404));
  }

  res.status(200).json({
    status: 'success',
    data: unitType
  });
});
