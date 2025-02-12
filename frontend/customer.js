document.getElementById('customerForm').addEventListener('submit', async function(e) {
    e.preventDefault();

    const customerData = {
        first_name: document.getElementById('first_name').value,
        last_name: document.getElementById('last_name').value,
        email: document.getElementById('email').value,
        phone: document.getElementById('phone').value,
        address: document.getElementById('address').value
    };

    try {
        const response = await fetch('http://localhost:3000/customers', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(customerData)
        });

        const result = await response.json();

        if (response.ok) {
            document.getElementById('customerResponse').textContent = 'Customer added successfully!';
            document.getElementById('customerResponse').style.color = 'green';
            document.getElementById('customerForm').reset();
        } else {
            document.getElementById('customerResponse').textContent = `Error: ${result.error}`;
            document.getElementById('customerResponse').style.color = 'red';
        }
    } catch (error) {
        document.getElementById('customerResponse').textContent = `Error: ${error.message}`;
        document.getElementById('customerResponse').style.color = 'red';
    }
});