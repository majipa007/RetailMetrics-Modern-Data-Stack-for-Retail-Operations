import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors'; // Import CORS middleware
import { pool, recordSale } from './procedures.js';

const app = express();
const port = 3000;

// Enable CORS for all routes (You can restrict this later to specific origins if necessary)
app.use(cors());

// Parse incoming requests with JSON payloads
app.use(bodyParser.json());

// POST route for recording sales
app.post('/sales', async (req, res) => {
    const { store_id, customer_id, employee_id, product_list } = req.body;
    try {
        const result = await recordSale(store_id, customer_id, employee_id, product_list);
        res.status(200).json({ message: 'Sale recorded successfully', result });
    } catch (err) {
        console.error('Failed to record sale:', err);
        res.status(500).json({ error: 'Failed to record sale', details: err.message });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});


