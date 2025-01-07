create schema if not exists retail_shop;

set search_path to retail_shop;

-- Creating tables

-- Store

CREATE TABLE store(
store_id serial primary key,
store_name varchar(40),
address varchar(100),
phone varchar(15) unique not null
);

-- Insert dummy data into the 'store' table
INSERT INTO store (store_name, address, phone) VALUES
('Andhra Fresh', 'Andhra Pradesh', '0866-555-0123'),
('Itanagar Mart', 'Arunachal Pradesh', '0360-555-4567'),
('Assam Grocers', 'Assam', '0361-555-7890'),
('Patna Bazaar', 'Bihar', '0612-555-1010'),
('Raipur Essentials', 'Chhattisgarh', '0771-555-2020'),
('Panaji Plaza', 'Goa', '0832-555-3030'),
('Ahmedabad Market', 'Gujarat', '079-555-4040'),
('Chandigarh Mart', 'Chandigarh', '0172-555-5050'),
('Healthy Himachal', 'Himachal Pradesh', '0177-555-6060'),
('Jammu Bazaar', 'Jammu & Kashmir', '0191-555-7070'),
('Ranchi Grocers', 'Jharkhand', '0651-555-8080'),
('Bengaluru Organics', 'Karnataka', '080-555-9090'),
('Thiruvananthapuram Fresh', 'Kerala', '0471-555-1010'),
('Bhopal Bazaar', 'Madhya Pradesh', '0755-555-1111'),
('Mumbai Market', 'Maharashtra', '022-555-1212'),
('Imphal Fresh', 'Manipur', '0385-555-1313'),
('Shillong Mart', 'Meghalaya', '0364-555-1414'),
('Aizawl Essentials', 'Mizoram', '0389-555-1515'),
('Dimapur Grocers', 'Nagaland', '03862-555-1616'),
('Bhubaneswar Mart', 'Odisha', '0674-555-1717'),
('Jaipur Organics', 'Rajasthan', '0141-555-1818'),
('Gangtok Bazaar', 'Sikkim', '03592-555-1919'),
('Chennai Market', 'Tamil Nadu', '044-555-2020'),
('Hyderabad Mart', 'Telangana', '040-555-2121'),
('Agartala Bazaar', 'Tripura', '0381-555-2222'),
('Dehradun Grocers', 'Uttarakhand', '0135-555-2323'),
('Lucknow Market', 'Uttar Pradesh', '0522-555-2424'),
('Kolkata Essentials', 'West Bengal', '033-555-2525'),
('Port Blair Bazaar', 'Andaman & Nicobar Islands', '03192-555-2626'),
('Daman Mart', 'Daman & Diu', '0260-555-2727'),
('Silvassa Essentials', 'Dadra & Nagar Haveli', '0260-555-2828'),
('Delhi Grocers', 'Delhi', '011-555-2929'),
('Leh Bazaar', 'Ladakh', '01982-555-3030'),
('Kavaratti Mart', 'Lakshadweep', '04896-555-3131'),
('Puducherry Market', 'Puducherry', '0413-555-3232');


-- Customer

CREATE TABLE customer(
customer_id serial primary key, 
first_name varchar(20),
last_name varchar(20),
email varchar(100) unique not null, 
phone varchar(15) unique not null);

-- Insert dummy data into the 'customer' table
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Mukesh', 'Ambani', 'mukesh.ambani@example.in', '022-555-1111'),
('Nita', 'Ambani', 'nita.ambani@example.in', '022-555-2222'),
('Gautam', 'Adani', 'gautam.adani@example.in', '079-555-3333'),
('Roshni', 'Nadar', 'roshni.nadar@example.in', '011-555-4444'),
('Ratan', 'Tata', 'ratan.tata@example.in', '022-555-5555'),
('Kiran', 'Mazumdar-Shaw', 'kiran.mazumdar@example.in', '080-555-6666'),
('Anil', 'Agarwal', 'anil.agarwal@example.in', '011-555-7777'),
('Lakshmi', 'Mittal', 'lakshmi.mittal@example.in', '079-555-8888'),
('Shiv', 'Nadar', 'shiv.nadar@example.in', '044-555-9999'),
('Uday', 'Kotak', 'uday.kotak@example.in', '022-555-1010');


-- Supplier
CREATE TABLE supplier(
supplier_id serial primary key, 
first_name varchar(20),
last_name varchar(20),
email varchar(100) unique not null, 
phone varchar(15) unique not null);


-- Insert dummy data into the 'supplier' table
INSERT INTO supplier (first_name, last_name, email, phone) VALUES
('Robert', 'Johnson', 'robert.johnson@example.com', '217-555-1111'),
('Emily', 'Davis', 'emily.davis@example.com', '708-555-2222'),
('Michael', 'Garcia', 'michael.garcia@example.com', '608-555-3333'),
('Sarah', 'Martinez', 'sarah.martinez@example.com', '312-555-4444'),
('Daniel', 'Hernandez', 'daniel.hernandez@example.com', '847-555-5555'),
('Olivia', 'Lopez', 'olivia.lopez@example.com', '414-555-6666'),
('James', 'Gonzalez', 'james.gonzalez@example.com', '630-555-7777'),
('Sophia', 'Wilson', 'sophia.wilson@example.com', '262-555-8888'),
('William', 'Anderson', 'william.anderson@example.com', '815-555-9999'),
('Ava', 'Thomas', 'ava.thomas@example.com', '309-555-1010');

-- Employee

CREATE TABLE employee(
employee_id serial primary key, 
first_name varchar(20),
last_name varchar(20),
hire_date date,
post varchar(20),
email varchar(100) unique not null, 
phone varchar(15) unique not null,
store_id int, 
constraint store_employs_employees foreign key (store_id) references store(store_id));

-- Insert dummy data into the 'employee' table
INSERT INTO employee (first_name, last_name, hire_date, post, email, phone, store_id) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.in', '022-555-1111'),
('Ananya', 'Verma', 'ananya.verma@example.in', '033-555-2222'),
('Vihaan', 'Patel', 'vihaan.patel@example.in', '079-555-3333'),
('Isha', 'Reddy', 'isha.reddy@example.in', '040-555-4444'),
('Arjun', 'Chopra', 'arjun.chopra@example.in', '011-555-5555'),
('Sanya', 'Desai', 'sanya.desai@example.in', '044-555-6666'),
('Rohan', 'Mehta', 'rohan.mehta@example.in', '080-555-7777'),
('Diya', 'Singh', 'diya.singh@example.in', '0172-555-8888'),
('Karan', 'Jain', 'karan.jain@example.in', '0522-555-9999'),
('Myra', 'Malhotra', 'myra.malhotra@example.in', '0471-555-1010');


-- Department

create table department(
department_id serial primary key,
department_name varchar(20),
store_id int, 
constraint store_has_department foreign key (store_id) references
store(store_id)
);

-- Insert dummy data into the 'department' table
INSERT INTO department (department_name, store_id) VALUES
('Groceries', 1),
'Home Goods', 1),
('Electronics', 1),

('Produce', 2),
('Bakery', 2),
('Dairy', 2),

('Health & Beauty', 3),
('Household', 3),

('Clothing', 4),
('Accessories', 4),

('Frozen Foods', 5),
('Bakery', 5),
('Meat & Seafood', 5),

('Pharmacy', 6),
('Health & Beauty', 6),
('Household', 6),

('Groceries', 7),
('Snacks', 7),
('Beverages', 7),

('Electronics', 8),
('Clothing', 8),

('Produce', 9),
('Meat & Seafood', 9),
('Dairy', 9),

('Household', 10),
('Health & Beauty', 10);

-- Sale
create table sale(
sale_id serial primary key, 
store_id int, 
customer_id int, 
employee_id int, 
sale_date date default current_date, 
total_amount decimal(5, 2),
constraint store_processes_sales
foreign key (store_id) references store(store_id),
constraint employee_handles_sales
foreign key (employee_id) references employee(employee_id),
constraint customer_makes_sales
foreign key (customer_id) references customer(customer_id)
);

-- Insert dummy data into the 'sale' table
INSERT INTO sale (store_id, customer_id, employee_id, total_amount) VALUES
(1, 1, 1, 120.50),
(1, 2, 2, 45.99),
(2, 3, 3, 89.00),
(2, 4, 4, 37.75),
(3, 5, 5, 78.20),
(3, 6, 6, 50.50),
(4, 7, 7, 150.00),
(4, 8, 8, 63.40),
(5, 9, 9, 90.75),
(5, 10, 10, 34.99),
(6, 1, 1, 25.50),
(6, 2, 2, 76.30),
(7, 3, 3, 135.00),
(7, 4, 4, 52.20),
(8, 5, 5, 92.99),
(8, 6, 6, 49.90),
(9, 7, 7, 120.70),
(9, 8, 8, 77.65),
(10, 9, 9, 68.45),
(10, 10, 10, 105.20);

-- Product

create table product(
product_id serial primary key, 
product_name varchar(40),
description varchar(200),
price decimal(4, 2),
supplier_id int, 
constraint supplier_supplies_product
foreign key (supplier_id) references supplier(supplier_id)
);

-- Insert dummy data into the 'product' table
INSERT INTO product (product_name, description, price, supplier_id) VALUES
('Organic Apples', 'Freshly picked organic apples, sweet and crisp.', 2.99, 1),
('Whole Wheat Bread', 'Whole grain bread, freshly baked and packed with nutrients.', 3.50, 2),
('Almond Milk', 'Unsweetened almond milk, perfect for lactose-intolerant individuals.', 2.99, 3),
('Ground Coffee', 'Rich and aromatic ground coffee beans, perfect for a morning brew.', 7.99, 4),
('Shampoo', 'Moisturizing shampoo for all hair types, with natural ingredients.', 5.50, 5),
('Hand Sanitizer', '70% alcohol hand sanitizer, kills 99.9% of germs.', 3.99, 6),
('Organic Eggs', 'Free-range organic eggs, rich in flavor and nutrients.', 4.25, 7),
('Laundry Detergent', 'Eco-friendly laundry detergent, gentle on fabrics.', 8.99, 8),
('Cereal Bars', 'Delicious oat and fruit cereal bars, perfect for a quick snack.', 1.99, 9),
('Toothpaste', 'Whitening toothpaste with fluoride for strong, healthy teeth.', 3.25, 10),
('Olive Oil', 'Extra virgin olive oil, cold-pressed and full of flavor.', 6.99, 1),
('Frozen Vegetables', 'Mixed frozen vegetables, a convenient and healthy choice.', 4.50, 2),
('Chocolate Bars', 'Dark chocolate bars with 70% cocoa, rich and intense.', 2.50, 3),
('Dish Soap', 'Lemon-scented dish soap, tough on grease and gentle on hands.', 2.75, 4),
('Face Mask', 'Reusable cotton face mask, washable and breathable.', 5.00, 5),
('Paper Towels', '2-ply absorbent paper towels, ideal for cleaning.', 3.99, 6),
('Cheddar Cheese', 'Sharp cheddar cheese, aged for a rich, bold flavor.', 5.25, 7),
('Soda', 'Sparkling soda, available in multiple flavors.', 1.50, 8),
('Canned Soup', 'Ready-to-eat canned soup, hearty and delicious.', 2.99, 9),
('Toilet Paper', 'Soft and strong toilet paper, 3-ply for extra comfort.', 4.99, 10);

-- Inventory
create table inventory(
inventory_id serial primary key, 
store_id int, 
product_id int, 
quantity int,
constraint store_stocks_inventory
foreign key (store_id) references store(store_id),
constraint product_included_id_inventory
foreign key (product_id) references product(product_id)
);

-- Insert dummy data into the 'inventory' table
INSERT INTO inventory (store_id, product_id, quantity) VALUES
(1, 1, 50),
(1, 2, 30),
(1, 3, 20),
(2, 4, 60),
(2, 5, 40),
(2, 6, 50),
(3, 7, 100),
(3, 8, 25),
(3, 9, 60),
(4, 10, 70),
(4, 11, 40),
(4, 12, 20),
(5, 13, 90),
(5, 14, 50),
(5, 15, 30),
(6, 16, 100),
(6, 17, 60),
(6, 18, 200),
(7, 19, 150),
(7, 20, 120),
(8, 1, 80),
(8, 2, 50),
(8, 4, 70),
(9, 5, 55),
(9, 6, 90),
(9, 7, 110),
(10, 8, 60),
(10, 9, 40),
(10, 10, 35);


-- Sale Item

create table sale_item(
sale_item_id serial primary key, 
sale_id int, 
product_id int, 
quantity int, 
price decimal(4, 2),
constraint sale_contains_sale_item
foreign key (sale_id) references sale(sale_id),
constraint product_sold_as_sale_item
foreign key (product_id) references product(product_id)
);

-- Insert dummy data into the 'sale_item' table
INSERT INTO sale_item (sale_id, product_id, quantity, price) VALUES
(1, 1, 3, 2.99),
(1, 2, 2, 3.50),
(2, 3, 1, 2.99),
(2, 4, 2, 7.99),
(3, 5, 1, 5.50),
(3, 6, 4, 3.99),
(4, 7, 2, 4.25),
(4, 8, 1, 8.99),
(5, 9, 5, 1.99),
(5, 10, 3, 3.25),
(6, 11, 1, 6.99),
(6, 12, 3, 4.50),
(7, 13, 4, 2.50),
(7, 14, 2, 2.75),
(8, 15, 3, 5.00),
(8, 16, 6, 3.99),
(9, 17, 2, 5.25),
(9, 18, 12, 1.50),
(10, 19, 3, 2.99),
(10, 20, 1, 4.99),
(11, 1, 5, 2.99),
(11, 3, 2, 2.99),
(12, 5, 3, 5.50),
(12, 7, 4, 4.25),
(13, 9, 6, 1.99),
(13, 10, 2, 3.25),
(14, 11, 1, 6.99),
(14, 12, 2, 4.50),
(15, 13, 5, 2.50),
(15, 15, 4, 5.00);





