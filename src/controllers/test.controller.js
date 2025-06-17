export const getPaginatedUsers = async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;

    const dummyData = Array.from({ length: 200 }, (_, i) => ({
      id: i + 1,
      name: `User ${i + 1}`,
      email: `user${i + 1}@example.com`,
      role: i % 2 === 0 ? 'Admin' : 'Customer',
    }));

    const startIndex = (page - 1) * limit;
    const endIndex = page * limit;

    const paginatedData = dummyData.slice(startIndex, endIndex);

    res.status(200).json({
      data: paginatedData,
      page,
      limit,
      totalItems: dummyData.length,
      totalPages: Math.ceil(dummyData.length / limit),
    });
  } catch (error) {
    res.status(500).json({ message: 'Server Error', error: error.message });
  }
};
