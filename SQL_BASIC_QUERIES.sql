USE sakila;

-- Show all tables.
SHOW TABLES;

-- Retrieve all the data from the tables actor, film and customer.
SELECT *
FROM actor;
SELECT *
FROM film;
SELECT *
FROM customer;

-- Retrieve the following columns from their respective tables:

-- 3.1 Titles of all films from the film table
SELECT title
FROM film;

-- 3.2. List of languages used in films, with the column aliased as language from the language table
SELECT name as Language
FROM language;

SELECT film.title, language.name 
FROM film, language 
WHERE film.language_id = language.language_id;


-- Retrieve unique release years.
SELECT DISTINCT release_year
FROM film;


-- Counting records for database insights:

-- 5.1 Determine the number of stores that the company has.
SELECT COUNT(DISTINCT store_id)
FROM store;

-- 5.2 Determine the number of employees that the company has.
SELECT COUNT(DISTINCT staff_id)
FROM staff;


-- 5.3 Determine how many films are available for rent and how many have been rented.
-- Number of physical movies that are available for rent: And distinct film titles for rent
SELECT COUNT(inventory_id) AS Number_of_Copies, COUNT(DISTINCT(film_id)) AS Number_of_Titles
FROM sakila.inventory;

-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name)
FROM sakila.actor;

-- Retrieve the 10 longest films.
SELECT title, length 
FROM film
ORDER BY length DESC
LIMIT 10;


-- Use filtering techniques in order to:

-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT *
FROM actor
WHERE first_name ='Scarlett';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title, length
FROM film
WHERE title LIKE ('%ARMAGEDDON%') AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(*) 
FROM film
WHERE special_features LIKE ('%Behind the Scenes%');



