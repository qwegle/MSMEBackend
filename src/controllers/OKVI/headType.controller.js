import HeadType from '../../models/OKVI/headType.js';
import catchAsync from '../../utils/catchAsync.js';
import AppError from '../../utils/AppError.js';
import mongoose from 'mongoose';

export const createHeadType = catchAsync(async (req, res, next) => {
  const { name, description } = req.body;
  
  if (!name || !name.trim()) {
    return next(new AppError('Head type name is required', 400));
  }

  try {
    const headType = await HeadType.create({
      name: name.trim(),
      description: description?.trim() || '',
      createdBy: req.user.id
    });

    res.status(201).json({
      status: 'success',
      data: headType
    });
  } catch (err) {
    if (err.code === 11000) {
      return next(new AppError('Head type with this name already exists', 400));
    }
    return next(err);
  }
});

export const getHeadTypes = catchAsync(async (req, res) => {
  const { isActive } = req.query;
  
  const filter = {};
  if (isActive !== undefined) {
    filter.isActive = isActive === 'true';
  }

  const headTypes = await HeadType.find(filter)
    .populate('createdBy', 'name email')
    .sort({ name: 1 });

  res.status(200).json({
    status: 'success',
    results: headTypes.length,
    data: headTypes
  });
});

export const updateHeadType = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const { name, description, isActive } = req.body;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid head type ID', 400));
  }

  const updateData = {};
  if (name !== undefined) updateData.name = name.trim();
  if (description !== undefined) updateData.description = description.trim();
  if (isActive !== undefined) updateData.isActive = isActive;

  try {
    const headType = await HeadType.findByIdAndUpdate(
      id,
      updateData,
      {
        new: true,
        runValidators: true
      }
    );

    if (!headType) {
      return next(new AppError('Head type not found', 404));
    }

    res.status(200).json({
      status: 'success',
      data: headType
    });
  } catch (err) {
    if (err.code === 11000) {
      return next(new AppError('Head type with this name already exists', 400));
    }
    return next(err);
  }
});

export const deleteHeadType = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid head type ID', 400));
  }

  const headType = await HeadType.findByIdAndDelete(id);

  if (!headType) {
    return next(new AppError('Head type not found', 404));
  }

  res.status(204).json({
    status: 'success',
    data: null
  });
});

export const getHeadTypeById = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.isValidObjectId(id)) {
    return next(new AppError('Invalid head type ID', 400));
  }

  const headType = await HeadType.findById(id).populate('createdBy', 'name email');

  if (!headType) {
    return next(new AppError('Head type not found', 404));
  }

  res.status(200).json({
    status: 'success',
    data: headType
  });
});
