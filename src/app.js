require('dotenv').config();
const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const connectDB = require('./config/db');
const routes = require('./routes');
const errorHandler = require('./middlewares/errorHandler');

const app = express();

app.use(helmet());
app.use(cors());
app.use(express.json());

// Serve uploaded files
app.use('/uploads', express.static('uploads'));

app.use('/api', routes);
app.use(errorHandler);

const PORT = process.env.PORT || 3000;

(async () => {
    try {
        await connectDB();
        app.listen(PORT, () => {
            console.log(`Server running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Failed to connect to database:', error);
        process.exit(1);
    }
})();

module.exports = app;
