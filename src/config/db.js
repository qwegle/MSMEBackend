import dotenv from 'dotenv';
dotenv.config();
import { connect } from 'mongoose';

const connectDB = async () => {
    if (process.env.SKIP_DB === 'true') {
        console.log('Database connection skipped (SKIP_DB=true)');
        return;
    }
    
    try {
        const uri = process.env.MONGO_URI;
        if (!uri) {
            throw new Error('MONGO_URI is not defined in environment variables');
        }

        await connect(uri);
        console.log('MongoDB Connected');
    } catch (error) {
        if (error.code === 'ENOTFOUND' || error.message?.includes('ENOTFOUND')) {
            console.error('Database Connection Failed: Could not resolve MongoDB hostname.');
            console.error('Please verify your MONGO_URI connection string is correct and the cluster exists.');
        } else {
            console.error('Database Connection Failed:', error.message);
        }
        
        if (process.env.ALLOW_DB_FAILURE === 'true') {
            console.log('Continuing without database (ALLOW_DB_FAILURE=true)');
            return;
        }
        process.exit(1);
    }
};

export default connectDB;
