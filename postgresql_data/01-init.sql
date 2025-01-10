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
-- Andhra Fresh (store_id = 1)
('Aarav', 'Sharma', '2022-01-15', 'Manager', 'aarav.sharma@andhrafresh.com', '0866-555-0011', 1),
('Ananya', 'Verma', '2023-03-12', 'Cashier', 'ananya.verma@andhrafresh.com', '0866-555-0012', 1),
-- Itanagar Mart (store_id = 2)
('Vihaan', 'Patel', '2021-06-20', 'Manager', 'vihaan.patel@itanagarmart.com', '0360-555-0013', 2),
('Isha', 'Reddy', '2022-10-01', 'Cashier', 'isha.reddy@itanagarmart.com', '0360-555-0014', 2),
-- Assam Grocers (store_id = 3)
('Arjun', 'Chopra', '2020-11-10', 'Manager', 'arjun.chopra@assamgrocers.com', '0361-555-0015', 3),
('Sanya', 'Desai', '2022-09-05', 'Cashier', 'sanya.desai@assamgrocers.com', '0361-555-0016', 3),
-- Patna Bazaar (store_id = 4)
('Rohan', 'Mehta', '2021-04-22', 'Manager', 'rohan.mehta@patnabazaar.com', '0612-555-0017', 4),
('Diya', 'Singh', '2023-01-30', 'Cashier', 'diya.singh@patnabazaar.com', '0612-555-0018', 4),
-- Raipur Essentials (store_id = 5)
('Karan', 'Jain', '2022-07-18', 'Manager', 'karan.jain@raipuressentials.com', '0771-555-0019', 5),
('Myra', 'Malhotra', '2023-05-08', 'Cashier', 'myra.malhotra@raipuressentials.com', '0771-555-0020', 5),
-- Panaji Plaza (store_id = 6)
('Aditya', 'Kapoor', '2021-02-15', 'Manager', 'aditya.kapoor@panajiplaza.com', '0832-555-0021', 6),
('Neha', 'Joshi', '2023-06-10', 'Cashier', 'neha.joshi@panajiplaza.com', '0832-555-0022', 6),
-- Ahmedabad Market (store_id = 7)
('Rahul', 'Kumar', '2020-09-25', 'Manager', 'rahul.kumar@ahmedabadmarket.com', '079-555-0023', 7),
('Simran', 'Kaur', '2022-12-19', 'Cashier', 'simran.kaur@ahmedabadmarket.com', '079-555-0024', 7),
-- Chandigarh Mart (store_id = 8)
('Kabir', 'Singh', '2020-03-15', 'Manager', 'kabir.singh@chandigarhmart.com', '0172-555-0025', 8),
('Aisha', 'Khan', '2021-08-09', 'Cashier', 'aisha.khan@chandigarhmart.com', '0172-555-0026', 8),
-- Healthy Himachal (store_id = 9)
('Manish', 'Gupta', '2022-05-25', 'Manager', 'manish.gupta@healthyhimachal.com', '0177-555-0027', 9),
('Priya', 'Rai', '2023-02-15', 'Cashier', 'priya.rai@healthyhimachal.com', '0177-555-0028', 9),
-- Jammu Bazaar (store_id = 10)
('Nikhil', 'Shah', '2021-11-12', 'Manager', 'nikhil.shah@jammubazaar.com', '0191-555-0029', 10),
('Ishita', 'Roy', '2023-07-20', 'Cashier', 'ishita.roy@jammubazaar.com', '0191-555-0030', 10),
-- Ranchi Grocers (store_id = 11)
('Siddharth', 'Mehra', '2021-01-22', 'Manager', 'siddharth.mehra@ranchigrocers.com', '0651-555-0031', 11),
('Tanya', 'Bose', '2022-03-17', 'Cashier', 'tanya.bose@ranchigrocers.com', '0651-555-0032', 11),
-- Bengaluru Organics (store_id = 12)
('Ashwin', 'Nair', '2020-07-01', 'Manager', 'ashwin.nair@bengaluruorganics.com', '080-555-0033', 12),
('Sneha', 'Menon', '2022-06-11', 'Cashier', 'sneha.menon@bengaluruorganics.com', '080-555-0034', 12),
-- Thiruvananthapuram Fresh (store_id = 13)
('Harsh', 'Aggarwal', '2020-04-14', 'Manager', 'harsh.aggarwal@thiruvananthapuramfresh.com', '0471-555-0035', 13),
('Nidhi', 'Sharma', '2021-09-30', 'Cashier', 'nidhi.sharma@thiruvananthapuramfresh.com', '0471-555-0036', 13),
-- Bhopal Bazaar (store_id = 14)
('Vikas', 'Singh', '2021-03-10', 'Manager', 'vikas.singh@bhopalbazaar.com', '0755-555-0037', 14),
('Riya', 'Pandey', '2023-01-05', 'Cashier', 'riya.pandey@bhopalbazaar.com', '0755-555-0038', 14),
-- Mumbai Market (store_id = 15)
('Soham', 'Kulkarni', '2020-06-22', 'Manager', 'soham.kulkarni@mumbaimarket.com', '022-555-0039', 15),
('Amrita', 'Naik', '2022-08-13', 'Cashier', 'amrita.naik@mumbaimarket.com', '022-555-0040', 15),
-- Imphal Fresh (store_id = 16)
('Rohan', 'Das', '2021-02-14', 'Manager', 'rohan.das@imphalfresh.com', '0385-555-0041', 16),
('Sneha', 'Sarkar', '2023-04-18', 'Cashier', 'sneha.sarkar@imphalfresh.com', '0385-555-0042', 16),
-- Shillong Mart (store_id = 17)
('Aakash', 'Roy', '2020-11-01', 'Manager', 'aakash.roy@shillongmart.com', '0364-555-0043', 17),
('Meera', 'Chowdhury', '2022-03-23', 'Cashier', 'meera.chowdhury@shillongmart.com', '0364-555-0044', 17),
-- Aizawl Essentials (store_id = 18)
('Abhinav', 'Verma', '2021-09-09', 'Manager', 'abhinav.verma@aizawlessentials.com', '0389-555-0045', 18),
('Pooja', 'Malik', '2023-05-25', 'Cashier', 'pooja.malik@aizawlessentials.com', '0389-555-0046', 18),
-- Dimapur Grocers (store_id = 19)
('Aman', 'Khan', '2020-05-15', 'Manager', 'aman.khan@dimapurgrocers.com', '03862-555-0047', 19),
('Priyanka', 'Basu', '2022-06-30', 'Cashier', 'priyanka.basu@dimapurgrocers.com', '03862-555-0048', 19),
-- Bhubaneswar Mart (store_id = 20)
('Siddharth', 'Mishra', '2021-04-12', 'Manager', 'siddharth.mishra@bhubaneswarmart.com', '0674-555-0049', 20),
('Ankita', 'Mohanty', '2023-02-18', 'Cashier', 'ankita.mohanty@bhubaneswarmart.com', '0674-555-0050', 20),
-- Jaipur Organics (store_id = 21)
('Nikhil', 'Sharma', '2020-10-18', 'Manager', 'nikhil.sharma@jaipurorganics.com', '0141-555-0051', 21),
('Divya', 'Kapoor', '2022-11-05', 'Cashier', 'divya.kapoor@jaipurorganics.com', '0141-555-0052', 21),
-- Gangtok Bazaar (store_id = 22)
('Rajesh', 'Singhania', '2021-08-07', 'Manager', 'rajesh.singhania@gangtokbazaar.com', '03592-555-0053', 22),
('Swati', 'Prasad', '2023-01-27', 'Cashier', 'swati.prasad@gangtokbazaar.com', '03592-555-0054', 22),
-- Chennai Market (store_id = 23)
('Arvind', 'Rao', '2020-03-19', 'Manager', 'arvind.rao@chennaimarket.com', '044-555-0055', 23),
('Sandhya', 'Menon', '2022-05-15', 'Cashier', 'sandhya.menon@chennaimarket.com', '044-555-0056', 23),
-- Hyderabad Mart (store_id = 24)
('Manoj', 'Iyer', '2020-07-12', 'Manager', 'manoj.iyer@hyderabadmart.com', '040-555-0057', 24),
('Lakshmi', 'Nair', '2023-03-10', 'Cashier', 'lakshmi.nair@hyderabadmart.com', '040-555-0058', 24),
-- Agartala Bazaar (store_id = 25)
('Ashok', 'Dey', '2021-09-05', 'Manager', 'ashok.dey@agartalabazaar.com', '0381-555-0059', 25),
('Ritu', 'Sen', '2023-02-20', 'Cashier', 'ritu.sen@agartalabazaar.com', '0381-555-0060', 25),
-- Dehradun Grocers (store_id = 26)
('Ramesh', 'Joshi', '2020-12-22', 'Manager', 'ramesh.joshi@dehradungrocers.com', '0135-555-0061', 26),
('Shweta', 'Sharma', '2022-07-30', 'Cashier', 'shweta.sharma@dehradungrocers.com', '0135-555-0062', 26),
-- Lucknow Market (store_id = 27)
('Anil', 'Kumar', '2021-03-09', 'Manager', 'anil.kumar@lucknowmarket.com', '0522-555-0063', 27),
('Neeta', 'Bajaj', '2023-01-12', 'Cashier', 'neeta.bajaj@lucknowmarket.com', '0522-555-0064', 27),
-- Kolkata Essentials (store_id = 28)
('Deepak', 'Das', '2020-10-25', 'Manager', 'deepak.das@kolkataessentials.com', '033-555-0065', 28),
('Priyanka', 'Banerjee', '2022-09-19', 'Cashier', 'priyanka.banerjee@kolkataessentials.com', '033-555-0066', 28),
-- Port Blair Bazaar (store_id = 29)
('Vivek', 'Rana', '2021-04-20', 'Manager', 'vivek.rana@portblairbazaar.com', '03192-555-0067', 29),
('Meghna', 'Paul', '2023-05-11', 'Cashier', 'meghna.paul@portblairbazaar.com', '03192-555-0068', 29),
-- Daman Mart (store_id = 30)
('Abhay', 'Desai', '2021-08-03', 'Manager', 'abhay.desai@damanmart.com', '0260-555-0069', 30),
('Poonam', 'Joshi', '2023-01-22', 'Cashier', 'poonam.joshi@damanmart.com', '0260-555-0070', 30),
-- Silvassa Essentials (store_id = 31)
('Naveen', 'Patel', '2020-05-14', 'Manager', 'naveen.patel@silvassaessentials.com', '0260-555-0071', 31),
('Komal', 'Saxena', '2022-11-25', 'Cashier', 'komal.saxena@silvassaessentials.com', '0260-555-0072', 31),
-- Delhi Grocers (store_id = 32)
('Rajat', 'Gupta', '2021-12-19', 'Manager', 'rajat.gupta@delhigrocers.com', '011-555-0073', 32),
('Anjali', 'Agarwal', '2023-02-10', 'Cashier', 'anjali.agarwal@delhigrocers.com', '011-555-0074', 32),
-- Leh Bazaar (store_id = 33)
('Kunal', 'Chauhan', '2020-07-18', 'Manager', 'kunal.chauhan@lehbazaar.com', '01982-555-0075', 33),
('Divya', 'Rawat', '2022-08-30', 'Cashier', 'divya.rawat@lehbazaar.com', '01982-555-0076', 33),
-- Kavaratti Mart (store_id = 34)
('Sameer', 'Malik', '2021-11-23', 'Manager', 'sameer.malik@kavarattimart.com', '04896-555-0077', 34),
('Alisha', 'Khan', '2023-03-14', 'Cashier', 'alisha.khan@kavarattimart.com', '04896-555-0078', 34),
-- Puducherry Market (store_id = 36)
('Ishaan', 'Rathore', '2021-12-22', 'Manager', 'ishaan.rathore@puducherrymarket.com', '0413-555-0081', 35),
('Esha', 'Mishra', '2022-05-19', 'Cashier', 'esha.mishra@puducherrymarket.com', '0413-555-0082', 35);




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
('Home Goods', 1),
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
total_amount decimal(15, 2),
constraint store_processes_sales
foreign key (store_id) references store(store_id),
constraint employee_handles_sales
foreign key (employee_id) references employee(employee_id),
constraint customer_makes_sales
foreign key (customer_id) references customer(customer_id)
);

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

---- Insert dummy data into the 'sale_item' table
--INSERT INTO sale_item (sale_id, product_id, quantity, price) VALUES
--(1, 1, 3, 2.99),
--(1, 2, 2, 3.50),
--(2, 3, 1, 2.99),
--(2, 4, 2, 7.99),
--(3, 5, 1, 5.50),
--(3, 6, 4, 3.99),
--(4, 7, 2, 4.25),
--(4, 8, 1, 8.99),
--(5, 9, 5, 1.99),
--(5, 10, 3, 3.25),
--(6, 11, 1, 6.99),
--(6, 12, 3, 4.50),
--(7, 13, 4, 2.50),
--(7, 14, 2, 2.75),
--(8, 15, 3, 5.00),
--(8, 16, 6, 3.99),
--(9, 17, 2, 5.25),
--(9, 18, 12, 1.50),
--(10, 19, 3, 2.99),
--(10, 20, 1, 4.99),
--(11, 1, 5, 2.99),
--(11, 3, 2, 2.99),
--(12, 5, 3, 5.50),
--(12, 7, 4, 4.25),
--(13, 9, 6, 1.99),
--(13, 10, 2, 3.25),
--(14, 11, 1, 6.99),
--(14, 12, 2, 4.50),
--(15, 13, 5, 2.50),
--(15, 15, 4, 5.00);





