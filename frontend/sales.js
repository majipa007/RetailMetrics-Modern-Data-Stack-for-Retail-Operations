document.addEventListener('DOMContentLoaded', () => {
    loadDropdown('stores', 'store_id', 'store_id', 'store_name');
    loadDropdown('customers', 'customer_id', 'customer_id', 'customer_name');
    loadDropdown('employees', 'employee_id', 'employee_id', 'employee_name');
    loadDropdown('products', 'product', 'product_id', 'product_name');

    document.getElementById('saleForm').addEventListener('submit', submitSale);
    document.getElementById('addProduct').addEventListener('click', addProduct);
});

let selectedProducts = [];

// Function to load dropdown options from API
async function loadDropdown(endpoint, dropdownId, valueKey, textKey) {
    try {
        const response = await fetch(`http://localhost:3000/${endpoint}`);
        if (!response.ok) throw new Error(`Failed to fetch ${endpoint}`);

        const data = await response.json();
        const dropdown = document.getElementById(dropdownId);

        // Clear existing options
        dropdown.innerHTML = '<option value="">Select an option</option>';

        // Populate dropdown with data
        data.forEach(item => {
            const option = document.createElement('option');
            option.value = item[valueKey];
            option.textContent = item[textKey];
            dropdown.appendChild(option);
        });
    } catch (error) {
        console.error(`Error loading ${endpoint}:`, error);
    }
}

// Function to add product to selected list
function addProduct() {
    const productDropdown = document.getElementById('product');
    const productId = productDropdown.value;
    const productName = productDropdown.options[productDropdown.selectedIndex].text;
    const quantity = document.getElementById('quantity').value;

    if (!productId || quantity <= 0) {
        alert("Please select a valid product and quantity.");
        return;
    }

    // Add to selected products list
    selectedProducts.push({ product_id: parseInt(productId), quantity: parseInt(quantity) });

    // Update UI
    const productList = document.getElementById('productList');
    const listItem = document.createElement('li');
    listItem.textContent = `${productName} - Quantity: ${quantity}`;
    productList.appendChild(listItem);

    // Update hidden input field with JSON string
    document.getElementById('product_list').value = JSON.stringify(selectedProducts);
}

// Function to handle form submission
async function submitSale(event) {
    event.preventDefault();

    const store_id = document.getElementById('store_id').value;
    const customer_id = document.getElementById('customer_id').value;
    const employee_id = document.getElementById('employee_id').value;
    const product_list = document.getElementById('product_list').value;

    if (!store_id || !customer_id || !employee_id || selectedProducts.length === 0) {
        document.getElementById('responseMessage').innerHTML = "Please fill in all fields and add at least one product.";
        return;
    }

    const saleData = {
        store_id: parseInt(store_id),
        customer_id: parseInt(customer_id),
        employee_id: parseInt(employee_id),
        product_list: JSON.parse(product_list)
    };

    try {
        const response = await fetch('http://localhost:3000/sales', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(saleData)
        });

        const result = await response.json();

        // Display success or error message
        document.getElementById('responseMessage').innerHTML = response.ok
            ? result.message
            : `Error: ${result.error}`;

        if (response.ok) {
            // Clear form after submission
            document.getElementById('saleForm').reset();
            document.getElementById('productList').innerHTML = '';
            selectedProducts = [];
        }
    } catch (error) {
        console.error('Error:', error);
        document.getElementById('responseMessage').innerHTML = 'Failed to record sale. Please try again later.';
    }
}
