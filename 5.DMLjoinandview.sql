--join


-- 30.Find customer info where payment method is 'Bkash'.
select c.first_name, c.sur_name, p.payment_method
from customer c, payment p
where c.customer_id = p.customer_id and payment_method = 'Bkash';

-- 31.Same query as above using ON.
select c.FIRST_NAME,c.SUR_NAME,p.PAYMENT_METHOD
from CUSTOMER c join PAYMENT p 
on c.CUSTOMER_ID=p.PAYMENT_ID and p.PAYMENT_METHOD='Bkash';

-- 32.Same query as above.
select c.first_name, c.sur_name, p.payment_method
from customer c JOIN payment p
using(customer_id)
where payment_method = 'Bkash';

-- 33.Join using multiple columns.
select c.first_name, c.sur_name
from customer c join payment p
using(customer_id, order_id)
where payment_id < 5;

--also this 
select c.FIRST_NAME,c.SUR_NAME
from customer c join PAYMENT P
on c.CUSTOMER_ID=p.ORDER_ID where P.PAYMENT_ID<5;

-- 34.Natural Join(customer_id, order_id):(common)The NATURAL JOIN combines the rows from both
-- tables where the values in the columns with the same name match.
select c.first_name, c.sur_name
from customer c natural join payment p
where payment_id < 13;

-- 35.Cross Join:: Cartesian product.
SELECT *
FROM customer
CROSS JOIN PAYMENT p where p.AMOUNT=900;

--Inner Join: Retrieves records that have matching values in both tables.

SELECT *
FROM customer
INNER JOIN customer_order ON customer.order_id = customer_order.order_id;

-- 37.Left Outer Join::A left outer join returns all records from the left table (customer) 
--and the matching records from the right table (payment)
select customer_id, c.first_name, c.sur_name, p.payment_method
from customer c left outer join payment p
using(customer_id)
where customer_id < 12;


select customer_id, c.first_name
from payment p left outer join customer c
using(customer_id)
where customer_id < 12;

-- 38.Right Outer Join::A right outer join returns all records from the right table (payment) 
--and the matching records from the left table (customer). 
--If there is no match, null values are included for the columns from the left table.
select c.first_name, c.sur_name,p.payment_method, customer_id 
from payment p right outer join customer c
using(customer_id)
where customer_id < 12;

select p.payment_method, customer_id, c.first_name, c.sur_name
from customer c right outer join payment p
using(customer_id)
where customer_id < 12;

-- 39.Full Outer Join::A full outer join returns all 
--records from both the left table (customer) and the right table (payment).
select customer_id, c.first_name, c.sur_name, p.payment_method
from customer c left outer join payment p
using(customer_id)
where customer_id < 5;

-- 40.Non-Equi Join::A non-equi join is performed 
--by specifying a condition that is not based on equality
select c.first_name, c.sur_name
from customer c join payment p
on c.order_id between 3 and 8;

-- 41.Self Join: Find customers who have same customer_id and order_id.
select first_name, SUR_NAME
from customer
where customer_id in (
    select p.customer_id
    from payment p join payment q
    on p.customer_id = q.order_id
);

--42.find top three customer name and amount
select c.first_name, p.total_amount
from (
  select customer_id, SUM(amount) as total_amount,
    ROW_NUMBER() OVER (order by SUM(amount) desc) as rank
  from payment
  group by customer_id
) p
join customer c on p.customer_id = c.customer_id 
WHERE 
rank <=3;

--43.view ::Create a view that shows the total payment for each payment_method :
drop view total_payment_view1;
CREATE VIEW total_payment_view1 AS
SELECT c.first_name as , payment_method, SUM(amount) AS total_payment
FROM payment
JOIN customer c ON payment.customer_id = c.customer_id
GROUP BY c.first_name, payment_method;

SELECT max(total_payment) AS total_payment
FROM total_payment_view1;
select * from total_payment_view1;