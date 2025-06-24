module.exports = (schema, source = 'body') => {
  return (req, res, next) => {
    const data = req[source]; // 'body', 'query', or 'params'
    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
      return res.status(400).json({
        message: 'Validation error',
        details: error.details.map((detail) => detail.message),
      });
    }

    // ✅ Only merge if not body
    if (source === 'query') {
      Object.assign(req.query, value); // ✅ Safe merge
    } else {
      req[source] = value; // body or params are safe to overwrite
    }

    next();
  };
};
