document.getElementById('inventoryForm').addEventListener('submit', async function(e) {
    e.preventDefault();

    const store_id = document.getElementById('store_id').value;
    const product_id = document.getElementById('product_id').value;
    const quantity = document.getElementById('quantity').value;

    const data = {
        store_id: parseInt(store_id),
        product_id: parseInt(product_id),
        quantity: parseInt(quantity)
    };

    try {
        const response = await fetch('http://localhost:3000/inventory', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        const result = await response.json();

        if (response.ok) {
            document.getElementById('response').textContent = 'Inventory updated successfully!';
            document.getElementById('response').style.color = 'green';
        } else {
            document.getElementById('response').textContent = `Error: ${result.error}`;
            document.getElementById('response').style.color = 'red';
        }
    } catch (error) {
        document.getElementById('response').textContent = `Error: ${error.message}`;
        document.getElementById('response').style.color = 'red';
    }
});

