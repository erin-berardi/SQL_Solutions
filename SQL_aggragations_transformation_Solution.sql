USE sakila;

-- Challenge 1
-- Practice using built-in functions: max, min, floor, avg, round

-- 1. Using more Built-In functions.
-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;

-- 1.2 Express the average movie duration in hours and minutes. Don't use decimals. Hint: look for floor and round functions.
SELECT FLOOR(AVG(length) / 60) AS hours, ROUND(AVG(length) % 60) AS minutes
FROM film;

-- 2. Working with dates
-- 2.1 Calculate the number of days that the company has been operating. Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS active_days
FROM rental;

-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT *, DATE_FORMAT(rental_date, '%M') AS MONTH, DATE_FORMAT(rental_date, '%W') AS WEEKDAY
FROM rental
LIMIT 20;

-- 2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week. Hint: use a conditional expression.
SELECT *, CASE WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday', 'Sunday')
THEN 'weekend'
ELSE 'workday' END AS day_type
FROM rental;

-- 3 Retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results by the film title in ascending order. Please note that even if there are currently no null values in the rental duration column, the query should still be written to handle such cases in the future.
SELECT title, IFNULL(rental_duration, 'Not Available') as rental_duration
FROM film
ORDER BY title ASC;


-- 4. Retrieve the concatenated first and last name of customers (with a space between them) and the first 3 characters of their email address, ordered by their last name in ascending order.
SELECT CONCAT(first_name, ' ', last_name) as full_name, SUBSTRING(email, 1, 3) as email_prefix
FROM customer
ORDER BY last_name ASC;

-- Challenge 2
-- Practice group by and having clauses, mixed with everything else seen before

-- 1. Using the film table, determine the total number of films that have been released.
SELECT COUNT(*) AS 'num_films' FROM film;

-- 1.2. Using the film table, determine the number of films for each rating.
SELECT rating, COUNT(*) AS 'Number of films' FROM film
GROUP BY rating;

-- 1.3 Using the film table, determine the number of films for each rating, and sort the results in descending order of the number of films.
SELECT rating, COUNT(*) AS 'num_films' FROM film
GROUP BY rating
ORDER BY num_films DESC;

-- 2. Using the rental table, determine the number of rentals processed by each employee.
SELECT staff_id, COUNT(*) AS 'Employee Processed Rentals'
FROM rental
GROUP BY staff_id;

-- 3. Using the film table, determine the mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places.
SELECT rating, ROUND(AVG(length),2) AS avg_length FROM film
GROUP BY rating
ORDER BY avg_length DESC;

-- 3.2 Determine the ratings that have a mean duration of more than two hours.
SELECT rating, ROUND(AVG(length),2) AS 'avg. duration' FROM film
GROUP BY rating
HAVING avg_duration > 120
ORDER BY avg_duration DESC;

-- 4. Determine which last names are not repeated in the table actor.
SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;



