--1.update data in furniture table
 SELECT * from furniture;
update furniture set FURNITURE_NAME='Table' where brand like 'ABC%';
 SELECT * from furniture;

--- 2.delete a furniture 

 SELECT * from customer;
 delete from  CUSTOMER where  order_id=10;
  SELECT * from customer;

--3.Range search from furniture table

select FURNITURE_NAME, brand
from FURNITURE
where price between 3000 and 8000;

--4 

select customer_id, first_name, SUR_NAME 
from customer
where customer_id not between 5 and 8 ;
--5 search by address
select customer_id, first_name, SUR_NAME  
from customer
where CURRENT_ADDRESS in ('Dhaka');