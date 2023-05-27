-- aggregate function for calculating the total payment DELETE
-- 6. count total paid orders 
SELECT count(amount) as Total_order_paid FROM PAYMENT;
-- 7.average payment by each order id
 SELECT avg (amount) as average_order_bill FROM PAYMENT;

--8.group by ..print the total amount paid by bkash,nagad,upay
SELECT PAYMENT_METHOD, sum(amount) FROM payment
 GROUP BY
  PAYMENT_METHOD ;

--9.group by payment method  + having average payment >1200

select PAYMENT_METHOD, sum(amount) as Payment from payment
 GROUP BY
  PAYMENT_METHOD having sum(amount)>1200  ;


--10.Union : Retrieve a table of customer name who paid by bkash and Rocket

select amount , payment_method from payment
WHERE
PAYMENT_METHOD='Bkash' 
union 
select amount , payment_method from payment
WHERE
PAYMENT_METHOD='Upay';

--11.Intersection : Retrieve a table of customer name who paid by bkash and Rocket

select amount , payment_method from payment
WHERE
AMOUNT<700
INTERSECT
select amount , payment_method from payment
WHERE
AMOUNT>300;

--12.except : Retrieve a table of customer name who paid by bkash and Rocket

select amount , payment_method from payment
WHERE
AMOUNT<700
EXCEPT
select amount , payment_method from payment
WHERE
PAYMENT_METHOD='Bkash';

--13 with::: Query to find the top three highest-priced furniture items:

WITH TopFurniture AS (
  SELECT furniture_name, price, ROW_NUMBER() OVER (ORDER BY price DESC) AS rank
  FROM furniture
)
SELECT furniture_name, price
FROM TopFurniture
WHERE rank <= 3;

--14 nested :::print the name of the buyer who has max order (quantity)

select c.first_name from CUSTOMER c where CUSTOMER_ID in
(
  select CUSTOMER_ID from PAYMENT where ORDER_ID in
  (
    select ORDER_ID from ORDER_DETAILS 
    where 
    QUANTITY=
    (
      select max(QUANTITY) from ORDER_DETAILS
    )
  )
);

--15 nested:: retrive the second highest expensive furniture

SELECT FURNITURE_ID, FURNITURE_NAME
FROM FURNITURE
WHERE price = (
  SELECT MAX(price)
  FROM FURNITURE
  WHERE price < (SELECT MAX(price) FROM FURNITURE)
);

--17  in::Retrieve all products in the 'RFL' brand:
SELECT *
FROM furniture
WHERE category_id IN (
  SELECT category_id
  FROM category
  WHERE category_name = 'Outdoor'
);

--18.not in::Retrieve customers who have made a payment and have not placed an order:
SELECT *
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
) AND customer_id NOT IN (
  SELECT customer_id
  FROM customer_order
);

--19. not in::Retrieve all customers who haven't bought product  more than price value 600 :
SELECT *
FROM customer
WHERE customer_id NOT IN (
  SELECT  customer_id
  FROM payment  where AMOUNT<600
);


--20.exists::Retrieve all furniture items that belong to the category 'Living Room' and have at least one customer order:
SELECT *
FROM furniture f
WHERE category_id = (
  SELECT category_id
  FROM category
  WHERE category_name = 'Living Room'
) AND EXISTS (
  SELECT *
  FROM Order_Details od
  WHERE od.product_id = f.furniture_id
);
--21.not exist::Retrieve all furniture items that have not been ordered by any customer:
SELECT *
FROM furniture f
WHERE NOT EXISTS (
  SELECT *
  FROM Order_Details od
  WHERE od.product_id = f.furniture_id
);

--22. some ::

SELECT * FROM furniture 
WHERE
  price > SOME
(SELECT price  FROM furniture WHERE price >= 300 );

--23. all:: keyword Retrieve all furniture items with prices that are higher than all furniture items in the 'Office' category:


SELECT * FROM furniture WHERE price >
ALL
(SELECT price FROM furniture WHERE brand='OTOBI'); 

-- string operation 

--24.Retrieve customers whose first names start with the letter 'A':
SELECT *
FROM customer
WHERE first_name LIKE 'A%';


--25.Retrieve customers whose email addresses contain the domain 'gmail.com':

SELECT *
FROM customer
WHERE email LIKE '%gmail.com%';


--26.Retrieve customers whose last names end with the letter 'son':

SELECT *
FROM customer
WHERE sur_name LIKE '%son';
--27.Retrieve customers whose first names have exactly 5 characters:

SELECT *
FROM customer
WHERE LENGTH(first_name) = 5;
--28.Retrieve customers whose first names start with 'J' and have a length of at least 6 characters:

SELECT *
FROM customer
WHERE first_name LIKE 'S%' AND LENGTH(first_name) >= 2;

--29 distinct 

SELECT distinct CURRENT_ADDRESS from CUSTOMER;

