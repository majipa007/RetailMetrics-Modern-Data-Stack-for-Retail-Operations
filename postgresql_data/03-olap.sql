-- Staging area
create schema if not exists staging_schema;

---- staging table store
--CREATE TABLE staging_schema.staging_store (
--    store_id INT PRIMARY KEY,
--    store_name VARCHAR(50),
--    address VARCHAR(100),
--    phone VARCHAR(15)
--);
--
---- staging table customer
--CREATE TABLE staging_schema.staging_customer (
--    customer_id INT PRIMARY KEY,
--    first_name VARCHAR(50),
--    last_name VARCHAR(50),
--    email VARCHAR(100),
--    phone VARCHAR(15)
--);
--
---- dim table employee
--CREATE TABLE staging_schema.staging_employee (
--    employee_id INT PRIMARY KEY,
--    first_name VARCHAR(50),
--    last_name VARCHAR(50),
--    hire_date DATE,
--    post VARCHAR(50),
--    email VARCHAR(100),
--    phone VARCHAR(15),
--    store_id INT,
--    FOREIGN KEY (store_id) REFERENCES staging_schema.staging_store(store_id)
--);
--
---- fact table sales
--CREATE TABLE staging_schema.staging_sales (
--    sale_id SERIAL PRIMARY KEY,
--    store_id INT NOT NULL,
--    customer_id INT NOT NULL,
--    employee_id INT NOT NULL,
--    sale_date DATE NOT NULL,
--    total_amount NUMERIC(15, 2) NOT NULL,
--    FOREIGN KEY (store_id) REFERENCES staging_schema.staging_store(store_id),
--    FOREIGN KEY (customer_id) REFERENCES staging_schema.staging_customer(customer_id),
--    FOREIGN KEY (employee_id) REFERENCES staging_schema.staging_employee(employee_id)
--);


-- Data mart
create schema if not exists sales_data_mart;


---- dim table store
--CREATE TABLE sales_data_mart.dim_store (
--    store_id INT PRIMARY KEY,
--    store_name VARCHAR(50),
--    address VARCHAR(100),
--    phone VARCHAR(15)
--);
--
---- dim table customer
--CREATE TABLE sales_data_mart.dim_customer (
--    customer_id INT PRIMARY KEY,
--    first_name VARCHAR(50),
--    last_name VARCHAR(50),
--    email VARCHAR(100),
--    phone VARCHAR(15)
--);
--
---- dim table employee
--CREATE TABLE sales_data_mart.dim_employee (
--    employee_id INT PRIMARY KEY,
--    first_name VARCHAR(50),
--    last_name VARCHAR(50),
--    hire_date DATE,
--    post VARCHAR(50),
--    email VARCHAR(100),
--    phone VARCHAR(15),
--    store_id INT,
--    FOREIGN KEY (store_id) REFERENCES sales_data_mart.dim_store(store_id)
--);
--
---- dim table date
--CREATE TABLE sales_data_mart.dim_date (
--    date_key INT PRIMARY KEY,
--    full_date DATE NOT NULL,
--    month_number INT NOT NULL,
--    UNIQUE (full_date)
--);


---- fact table sales
--CREATE TABLE sales_data_mart.fact_sales (
--    sale_id SERIAL PRIMARY KEY,
--    store_id INT NOT NULL,
--    customer_id INT NOT NULL,
--    employee_id INT NOT NULL,
--    date_id INT NOT NULL,
--    total_amount NUMERIC(15, 2) NOT NULL,
--    FOREIGN KEY (date_id) REFERENCES sales_data_mart.dim_date(date_key),
--    FOREIGN KEY (store_id) REFERENCES sales_data_mart.dim_store(store_id),
--    FOREIGN KEY (customer_id) REFERENCES sales_data_mart.dim_customer(customer_id),
--    FOREIGN KEY (employee_id) REFERENCES sales_data_mart.dim_employee(employee_id)
--);




