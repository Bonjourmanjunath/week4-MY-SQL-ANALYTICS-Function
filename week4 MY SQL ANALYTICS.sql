use sakila;
select * from payment;

SELECT 
    customer_id,
    payment_date,
    amount,
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS running_total
FROM 
    payment
ORDER BY 
    customer_id, payment_date desc;
    
    
    SELECT
    payment_date,
    amount, 
    Rank() over (PARTITION BY payment_date ORDER BY amount desc)  R,
    dense_rank () over (PARTITION BY payment_date ORDER BY amount desc)  DR
    FROM  
    payment
    Order BY 
    payment_date desc;
    
    #3. find the ranking of each film based on its rental rate, within its respective category. 
    
    SELECT * FROM film;
    Select * from film_category;
    Select * from category;
    
    SELECT
    
    
    SELECT
    f.film_id,
    f.title,
    f.rental_rate,
    c.category_id,
    c.name AS category_name
FROM
    film f
JOIN
    category c ON f.category_id = c.category_id;

    
    
    SELECT
    f.film_id,
    fc.category_id,
    name,
    rental_rate,
    dense_rank() over (partition by c.category_id  order by rental_rate desc)    
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id;
    
    #5. find the difference between the current and previous payment amount and the difference between the current and 
    # next payment amount, for each customer in the payment table
    
    SELECT * FROM payment;
    
   select *
, lag(amount) over (partition by customer_id order by payment_date) as previous_amount,
lead(amount) over (partition by customer_id order by customer_id) as following_amount,
-- select previous_amount - following_amount as difference
amount - lag(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS difference_previous
from payment;


-- lag(amount) - lead(amount) as difference
-- from payment
-- ;
   
   -- ;
    

    

