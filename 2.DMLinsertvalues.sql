-- Inserting values into customer_order table

insert into customer_order(order_id, amount, order_date) values(1,100,to_date(TO_DATE('23/05/01', 'YY/MM/DD')));
insert into customer_order(order_id, amount, order_date) VALUES (2, 750, TO_DATE('23/05/02', 'YY/MM/DD'));
insert into customer_order(order_id, amount, order_date) VALUES (3, 900, to_date('23/05/02','yy/mm/dd'));
insert into customer_order(order_id, amount, order_date) VALUES(4, 350, TO_DATE('23/05/04', 'YY/MM/DD'));
insert into customer_order(order_id, amount, order_date) VALUES(5, 600, TO_DATE('23/05/05', 'YY/MM/DD'));
insert into customer_order(order_id, amount, order_date) VALUES(6, 800, TO_DATE('23/05/06', 'YY/MM/DD'));
insert into customer_order(order_id, amount, order_date) VALUES(7, 450, TO_DATE('23/05/07', 'YY/MM/DD'));
insert into customer_order(order_id, amount, order_date) VALUES(8, 700, TO_DATE('23/05/08', 'YY/MM/DD'));
insert into customer_order(order_id, amount, order_date) VALUES(9, 550, TO_DATE('23/05/09', 'YY/MM/DD'));
insert into customer_order(order_id, amount, order_date) VALUES(10, 950, TO_DATE('23/05/10', 'YY/MM/DD'));


select * from customer_order;

-- Inserting values into customer table
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (1, 'Safwan', 'Zaher', 'Dhaka', 'safwan@example.com', 'safwan', '01575284003', 1);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (2, 'Seikh', 'Nibir', 'Dhaka', 'nibir@example.com', 'nibir', '01575284004', 2);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (3, 'Ankon', 'Chowdhuri', 'Rajshahi', 'ankon@example.com', 'ankon', '01575284005', 3);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (4, 'Sonjoy', 'Roy', 'Dinajpur', 'sonjoy@example.com', 'sonjoy', '01575284006', 4);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (5, 'Doniel', 'Tripura', 'Khagrachari', 'doniel@example.com', 'doniel', '01575284007', 5);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (6, 'Talha', 'Nourin', 'Dhaka', 'talha@example.com', 'talha', '01575284008', 6);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (7, 'Mahmuda', 'Afrin', 'Rajshahi', 'mahmuda@example.com', 'mahmuda', '01575284001', 7);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (8, 'Kaiser', 'Kaushik', 'Dhaka', 'kaiser@example.com', 'kaiser', '01575284010', 8);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (9, 'Olivia', 'Anderson', 'Dinajpur', 'olivia@example.com', 'password8', '01575284002', 9);
INSERT INTO customer (customer_id, first_name, Sur_name, current_address, email, password, phone, order_id) VALUES (10, 'Ethan', 'Moore', 'Dinajpur', 'ethan@example.com', 'password10', '333-444-5555', 10);

select * from CUSTOMER;

-- Inserting values into payment table
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (1, 1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 500, 'Bkash');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (2, 2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 750, 'Rocket');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (3, 3, 3, TO_DATE('2023-05-03', 'YYYY-MM-DD'), 900, 'Nagad');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES  (4, 4, 4, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 350, 'Upay');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (5, 5, 5, TO_DATE('2023-05-05', 'YYYY-MM-DD'), 600, 'Cash');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES  (6, 6, 6, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 800, 'Bkash');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (7, 7, 7, TO_DATE('2023-05-07', 'YYYY-MM-DD'), 450, 'Rocket');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (8, 8, 8, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 700, 'Nagad');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (9, 9, 3, TO_DATE('2023-05-09', 'YYYY-MM-DD'), 550, 'Upay');
INSERT INTO payment (payment_id, customer_id, order_id, payment_date, amount, payment_method) VALUES (10, 10, 1, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 950, 'Cash');

select * FROM payment;


-- Inserting values into category table
INSERT INTO category (category_id, category_name, category_description) VALUES (1, 'Living Room', 'Furniture for the living room');
INSERT INTO category (category_id, category_name, category_description) VALUES (2, 'Bedroom', 'Furniture for the bedroom');
INSERT INTO category (category_id, category_name, category_description) VALUES (3, 'Kitchen', 'Furniture for the kitchen');
INSERT INTO category (category_id, category_name, category_description) VALUES (4, 'Office', 'Furniture for the office');
INSERT INTO category (category_id, category_name, category_description) VALUES (5, 'Outdoor', 'Outdoor furniture');

select * from CATEGORY;


-- Inserting values into furniture table
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (1, 'Sofa', 1, 'RFL', 1000);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (2, 'Bed', 2, 'RFL', 600);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (3, 'Dining Table', 3, 'PARTEX', 600);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (4, 'Desk', 4, 'OTOBI', 400);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (5, 'Patio Chair', 5, '', 400);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (6, 'Coffee Table', 1, 'RFL', 300);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (7, 'Wardrobe', 2, 'OTOBI', 500);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (8, 'Kitchen Cabinet', 3, 'RFL', 500);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (9, 'Office Chair', 4, 'OTOBI', 250);
INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (10, 'Outdoor Bench', 5, 'RFL', 150);

select * from furniture;

-- Inserting values into Order_Details table
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (1, 2, 1);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (2, 1, 2);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (3, 4, 3);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES  (4, 1, 4);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (4, 3, 5);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (6, 2, 6);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES  (4, 1, 7);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (2, 2, 8);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (7, 3, 9);
INSERT INTO Order_Details (product_id, quantity, order_id) VALUES (10, 1, 10);

select *from ORDER_DETAILS;


-- show  all table details
SELECT * from Order_Details;
SELECT * from furniture;
SELECT * from Category;
SELECT * from Payment;
SELECT * from Customer;
SELECT * from Customer_Order;

--update and  delete

update customer 
set password='roy' where 
CUSTOMER_ID=5;

delete from customer_order 
where order_id=10;

select *from customer;
select *from CUSTOMER_ORDER;