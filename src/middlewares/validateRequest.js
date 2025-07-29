export default (schema, source = 'body') => {
  return (req, res, next) => {
    const data = req[source];
    const { error, value } = schema.validate(data, { abortEarly: false });
    if (error) {
      return res.status(400).json({
        message: 'Validation error',
        details: error.details.map((detail) => detail.message),
      });
    }
    if (source === 'query') {
      Object.assign(req.query, value);
    } else {
      req[source] = value;
    }
    next();
  };
};
