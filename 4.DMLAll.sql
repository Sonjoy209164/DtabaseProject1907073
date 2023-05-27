-- aggregate function for calculating the total payment DELETE
-- 6. count total paid orders 
select count(amount) as Total_order_paid from PAYMENT;
-- 7.average payment by each order id
 select avg (amount) as average_order_bill from PAYMENT;

--8.group by ..print the total amount paid by bkash,nagad,upay
select PAYMENT_METHOD, sum(amount) from payment
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

--12.Intersection : Retrieve a table of customer name who paid by bkash and Rocket

select amount , payment_method from payment
WHERE
AMOUNT<700
EXCEPT
select amount , payment_method from payment
WHERE
PAYMENT_METHOD='Bkash';

--13 with Query to find the top three highest-priced furniture items:

WITH TopFurniture AS (
  SELECT furniture_name, price, ROW_NUMBER() OVER (ORDER BY price DESC) AS rank
  FROM furniture
)
SELECT furniture_name, price
FROM TopFurniture
WHERE rank <= 3;

--14

select c.first_name , p.amount 


--15 retrive the second highest expensive furniture

SELECT FURNITURE_ID, FURNITURE_NAME
FROM FURNITURE
WHERE price = (
  SELECT MAX(price)
  FROM FURNITURE
  WHERE price < (SELECT MAX(price) FROM FURNITURE)
);
