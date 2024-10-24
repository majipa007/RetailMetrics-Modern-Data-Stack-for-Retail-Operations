document.getElementById('saleForm').addEventListener('submit', async function (e) {
    e.preventDefault(); // Prevent default form submission

    const store_id = document.getElementById('store_id').value;
    const customer_id = document.getElementById('customer_id').value;
    const employee_id = document.getElementById('employee_id').value;
    const product_list = document.getElementById('product_list').value;

    const saleData = {
        store_id: parseInt(store_id),
        customer_id: parseInt(customer_id),
        employee_id: parseInt(employee_id),
        product_list: JSON.parse(product_list) // Parse the JSON string to an array
    };

    try {
        const response = await fetch('http://localhost:3000/sales', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(saleData) // Send the sale data as JSON
        });

        const result = await response.json();

        // Display the response message
        if (response.ok) {
            document.getElementById('responseMessage').innerHTML = result.message;
        } else {
            document.getElementById('responseMessage').innerHTML = `Error: ${result.error}`;
        }
    } catch (error) {
        console.error('Error:', error);
        document.getElementById('responseMessage').innerHTML = 'Failed to record sale. Please try again later.';
    }
});

