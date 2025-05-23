const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/user');

const JWT_SECRET = process.env.JWT_SECRET;

exports.registerUser = async ({ username, email, password }) => {
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = new User({ username, email, password: hashedPassword, user_type:0, user_role:2 });
    await newUser.save();
    return { message: 'User registered successfully' };
};

exports.register_ofsc_superadmin = async({ username, email, password }) => {
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = new User({ username, email, password: hashedPassword, user_type: 1, user_role:0});
    await newUser.save();
    return { message: 'User registered Successfully' };
}

exports.register_ofsc_subadmin = async({ username, email, password }) => {
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = new User({ username, email, password: hashedPassword, user_type: 1, user_role:1});
    await newUser.save();
    return { message: 'User registered Successfully' };
}


exports.loginUser = async ({ email, password }) => {
    const user = await User.findOne({ email });
    if (!user || !(await bcrypt.compare(password, user.password))) {
        throw new Error('Invalid credentials');
    }
    
    const token = jwt.sign({ id: user._id }, JWT_SECRET, { expiresIn: '1h' });

    return { 
        token, 
        message: 'Login successful',
        user: {
            // id: user._id,
            username: user.username,
        //     email: user.email,
            user_type: user.user_type,
            user_role: user.user_role,
            branch: user.branch,
        //     user_branch: user.user_branch,
        //     no_of_OTS_form_filed: user.no_of_OTS_form_filed,
        //     no_of_OTS_form_accepted: user.no_of_OTS_form_accepted,
        //     no_of_OTS_form_rejected: user.no_of_OTS_form_rejected,
        //     no_of_OTS_form_pending: user.no_of_OTS_form_pending,
            createdAt: user.createdAt,
            updatedAt: user.updatedAt
        }
    };
};

