--dropping all the existing tables
drop table Order_Details;
drop table furniture;
drop table Category;
drop table Payment;
drop table Customer;
drop table Customer_Order;



create table customer_order(
    order_id INTEGER not null,
    amount NUMBER(8) check(amount >= 0 and amount <=100000),
    order_date DATE,
    PRIMARY KEY(order_id)

);



create table customer(
    customer_id INTEGER not null,
    first_name varchar(40),
    Sur_name varchar(40),
    current_address varchar(40),
    email varchar(40),
    password varchar(40),
    phone varchar(40),
    order_id integer,
    primary key(customer_id),
    foreign key(order_id) references customer_order(order_id) on delete cascade
);

create table payment(
 payment_id integer not null,
 customer_id integer,
 order_id integer,
 payment_date date,
 amount number(8) check(amount >= 0 and amount <=100000),
 payment_method varchar(10),
 primary key(payment_id),
 foreign key(customer_id) references customer(customer_id) on delete cascade,
 foreign key(order_id) references customer_order(order_id) on delete cascade
);

create table category(
  category_id integer not null,
  category_name varchar(40),
  category_description varchar(30),
  primary key(category_id)

);

create table furniture(
    furniture_id integer not null,
    furniture_name varchar(30),
    category_id integer,
    brand varchar(20),
    price number(8) check (price >= 0 and price <= 1000000 ),
    primary key (furniture_id),
    foreign key(category_id) references category(category_id) on delete cascade

);

create table Order_Details (
    product_id integer not null,
    quantity integer default 1,
    order_id integer
    -- ,

    -- primary key(product_id),
    -- foreign key(product_id) references Product(product_id) on delete cascade,
    -- foreign key(order_id) references Customer_Order(order_id) on delete cascade
);






desc Order_Details;
desc furniture;
desc Category;
desc Payment;
desc Customer;
desc Customer_Order;




-- alter 

alter table furniture add discount varchar(20);
desc FURNITURE;
alter table furniture modify discount integer;
desc FURNITURE;
alter table furniture rename column discount to discountproduct;
desc FURNITURE;
alter table furniture drop column discountproduct;
desc FURNITURE;



-- show  all table details
select * from Order_Details;
SELECT * from furniture;
SELECT * from Category;
SELECT * from Payment;
SELECT * from Customer;
SELECT * from Customer_Order;