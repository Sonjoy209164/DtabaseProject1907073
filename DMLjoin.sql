--join

--find top three customer name and amount
SELECT c.first_name, p.total_amount
FROM (
  SELECT customer_id, SUM(amount) AS total_amount,
    ROW_NUMBER() OVER (ORDER BY SUM(amount) DESC) AS rank
  FROM payment
  GROUP BY customer_id
) p
JOIN customer c ON p.customer_id = c.customer_id 
where 
rank <=3;
