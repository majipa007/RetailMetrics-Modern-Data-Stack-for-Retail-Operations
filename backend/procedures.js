import pkg from "pg";
const { Pool } = pkg;

// PostgreSQL connection setup
const pool = new Pool({
    user: 'database', // replace with your actual username
    host: 'localhost',
    database: 'database', // replace with your actual database name
    password: 'secret', // replace with your actual password
    port: 5000, // Default PostgreSQL port, change if necessary
});

const recordSale = async (store_id, customer_id, employee_id, product_list) => {
    try {
        // Call the stored procedure
        await pool.query('set search_path to retail_shop');
        await pool.query(
            'CALL record_sale($1, $2, $3, $4)',
            [store_id, customer_id, employee_id, JSON.stringify(product_list)]
        );

        return { message: 'Sale recorded successfully' }; // Custom success message
    } catch (err) {
        console.error('Error recording sale:', err);
        throw err; // Re-throw error to handle it in index.js
    }
};

const recordInventory = async (store_id, product_id, quantity)=>{
    try {
        await pool.query('set search_path to retail_shop');
        await pool.query(
            'CALL add_to_inventory($1, $2, $3)',
            [store_id, product_id, quantity]
        );
        return {message: 'Product added to inventory successfully'};

    } catch (error) {
        console.error('Error recording sale:', err);
        throw err;
    }
}

export {pool, recordSale, recordInventory};

