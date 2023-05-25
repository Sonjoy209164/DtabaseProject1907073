--update and  delete

update customer 
set password='roy' where 
CUSTOMER_ID=5;

delete from customer_order 
where order_id=10;

select *from customer;
select *from CUSTOMER_ORDER;