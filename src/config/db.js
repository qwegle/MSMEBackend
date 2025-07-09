import dotenv from 'dotenv';
dotenv.config();
import { connect } from 'mongoose';

const connectDB = async () => {
    try {
        const uri = process.env.MONGO_URI;
        if (!uri) {
            throw new Error('MONGO_URI is not defined in .env file');
        }

        await connect(uri);
        console.log(uri);
        console.log('MongoDB Connected');
    } catch (error) {
        console.error('Database Connection Failed:', error);
        process.exit(1);
    }
};

export default connectDB;
