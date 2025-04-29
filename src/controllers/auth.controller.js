const { registerUser, loginUser, register_ofsc_superadmin, register_ofsc_subadmin } = require('../services/auth.service');
const { blacklistToken } = require('../utils/tokenBlacklist');

exports.register = async (req, res, next) => {
    try {
        const result = await registerUser(req.body);
        res.status(201).json(result);
    } catch (error) {
        next(error);
    }
};

exports.login = async (req, res, next) => {
    try {
        const result = await loginUser(req.body);
        res.json(result);
    } catch (error) {
        next(error);
    }
};

exports.register_OFSC_SuperAdmin = async (req, res, next) => {
    try{
        const result = await register_ofsc_superadmin(req.body);
        res.status(201).json(result);
    } catch (error) {
        next(error);
    }
};

exports.register_OFSC_SubAdmin = async (req, res, next) => {
    try{
        const result = await register_ofsc_subadmin(req.body);
        res.status(201).json(result);
    } catch (error) {
        next(error);
    }
};

exports.logout = (req, res) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader?.split(' ')[1];
    if (!token) return res.status(401).json({ message: 'Token required' });

    blacklistToken(token);
    res.json({ message: 'Logout successful' });
};

exports.protectedRoute = (req, res) => {
    res.json({ message: 'Access granted', user: req.user });
};
