-- Inner join using the actor and film_actor tables

SELECT ac.actor_id, CONCAT(first_name, ' ', last_name), film_id
FROM film_actor
INNER JOIN actor as ac
ON ac.actor_id = film_actor.actor_id;

-- Outer join: also known as a full join
-- join together product information from our customer table where that customer is located in
-- The country of Angola
SELECT CONCAT(cu.first_name, ' ', cu.last_name) as full_name, cu.email, country
FROM customer as cu
FULL JOIN address
ON cu.address_id = address.address_id
FULL JOIN city
on address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'United States';

-- Left join on the actor and film_actor tables
SELECT ac.actor_id, CONCAT(first_name, ' ', last_name), film_id
FROM film_actor
LEFT JOIN actor as ac
ON ac.actor_id = film_actor.actor_id;

-- Subqueries are queries within a query
-- Two queries that are split apart

-- Find a customer_id that has an amount greater than 175 in total payments
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

-- Find all customer info
SELECT *
FROM customer

-- We want to find the customers that have a total amount of payments greater than 175
SELECT store_id, CONCAT(first_name, last_name) as full_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id, full_name

-- Really basic subquery
SELECT * 
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
);

-- 
SELECT store_id, CONCAT(first_name, ' ', last_name), address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'United States' AND customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);