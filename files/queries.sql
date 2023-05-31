-- Selecting all records from the actors table
SELECT *
FROM actor;

-- What if I wanted to select specific columns instead of all columns?
-- Specifically, what if I needed the first name and last name columns from the actor table?
-- SELECT column1, column2 FROM table
SELECT first_name, last_name
FROM actor;

-- What if I wanted to grab the first and last names and have them in a single column?
-- I wanted that column to be named full_name.
-- CONCAT function works the same as in Python when we add strings together
SELECT CONCAT(first_name,' ', last_name) as full_name, last_update as lu
FROM actor;

-- as keyword allows us to alias columns and Tables! Therefore returning them as these specific names that we ask for
-- Just like aliasing our imports in Python

-- We can also query using a where clause
-- a where clause is just like a conditional statement. We are looking for where something matches another value
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- use the % operator to basically return information that sorta matches the variable that follows
-- It matches the first letter, and allows any other info to proceed it
-- The % operator can be used to find the first letter or first and anything that proceeds it,
-- or to look at the last letter or last set of letters and anything that preceeds it.

SELECT CONCAT(first_name, ' ', last_name), actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_names that start with K and have 2 letters after the K using the LIKE and WHERE clauses
-- This is accomplished using the underscore operand
SELECT CONCAT(first_name, ' ', last_name), actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query that looks at all first_names that start with K and end with a th
-- We will combine both the underscores AND the wildcard
SELECT CONCAT(first_name, ' ', last_name), actor_id
FROM actor
WHERE first_name LIKE 'K__%th';

-- Comparison operations in SQL are similar to Python
-- Equal sign (=), greater than(>), less than (<), same for each with the or equal to(>=, <=)
-- Biggest difference: Not equal to (<>)

-- Explore the new table
-- Limit limits the returns to a specific number, like head()
SELECT *
FROM payment
LIMIT 50;

-- Query into the table to show the customers who paid more than two dollars
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customer that paid an amount less than seven dollars and 99 cents
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Query into the table to show the customers who paid greater than or equal to two dollars
-- Order the query by the amount in an ascending order
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- What if I was look for the amount spent to be between two different values?
-- We could write two different where statements to filter out the data fully between both,
-- But SQL has a keyword called BETWEEN
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- What if I was look for the amount spent to be between two different values?
-- We could write two different where statements to filter out the data fully between both,
-- But SQL has a keyword called BETWEEN
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query info from customer that paid an amount NOT EQUAL TO 0.00
-- Order this in a descending order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- Query to display the sum of amounts that were paid, and greater than 5.99

SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the sum of amounts that were paid, and greater than 5.99

SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of unique amounts that were paid, and greater than 5.99
-- Utilizes the DISTINCT keyword to get the unique values out of the amount column, then counts the number
-- of unique values.
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to look over the minimum value in the amount column
SELECT MIN(amount) as min_payment
FROM payment
WHERE amount > 7.99;

-- SQL Aggregation Functions => SUM, AVG, COUNT, MIN, MAX.
-- We already covered over one: CONCAT

-- Query to look over the minimum value in the amount column
SELECT MAX(amount) as max_payment
FROM payment
WHERE amount > 7.99;

-- GROUP BY allows to group a dataset by a column. This works very similarly to how our group by in Python works
-- GROUP BY the amount and count them
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- Query info to display customer_ids with the summed amounts for each id
SELECT customer_id, SUM(customer_id)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to select and display customer_ids and the amount
SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

-- Query into the customer table
-- Explore data first
SELECT * FROM customer;

-- Query to show customer_ids that occur more than five times
-- Group by the customer's email

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;