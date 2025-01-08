create schema if not exists sales_data_mart;

set search_path to sales_data_mart;

-- dim table store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15)
);

-- dim table customer
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- dim table employee

CREATE TABLE dim_employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    post VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);


-- fact table sales
CREATE TABLE fact_sales (
    sale_id SERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES dim_employee(employee_id)
);




