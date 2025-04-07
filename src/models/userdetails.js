const mongoose = require('mongoose');

const userDetailsSchema = new mongoose.Schema({
    userId: { 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'User', 
        required: true, 
        unique: true // Ensures one-to-one relation with User
    },
    email: { 
        type: String, 
        required: true 
    },
    user_type: { 
        type: Number, 
        required: true, 
        default: 0 // 0 - citizen, 1 - ofsc, 2 - okvi, 3 - osic
    },
    user_role: { 
        type: Number, 
        required: true, 
        default: 2 // 0 - admin, 1 - district admin, 2 - user
    },
    user_branch: { 
        type: String, 
        required: true 
    },
    no_of_OTS_form_filed: { 
        type: Number, 
        required: true, 
        default: 0 
    },
    no_of_OTS_form_accepted: { 
        type: Number, 
        required: true, 
        default: 0 
    },
    no_of_OTS_form_rejected: { 
        type: Number, 
        required: true, 
        default: 0 
    },
    no_of_OTS_form_pending: { 
        type: Number, 
        required: true, 
        default: 0 
    }
}, { timestamps: true });

const UserDetails = mongoose.model('UserDetails', userDetailsSchema);

module.exports = UserDetails;
