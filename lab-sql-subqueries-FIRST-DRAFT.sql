##Question 1
##Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
USE sakila;
SELECT film.film_id, film.title, COUNT(inventory.film_id) AS numbercopies 
FROM inventory
JOIN film ON inventory.film_id = film.film_id
WHERE film.title = "Hunchback Impossible" 
GROUP BY inventory.film_id;

##Question 2
##List all films whose length is longer than the average length of all the films in the Sakila database
SELECT *
FROM sakila.film
WHERE length > (SELECT AVG(length)
                FROM sakila.film);
                
## Question 3
##Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor_id, CONCAT_WS(" ", `first_name`, `last_name`) AS Full_Name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE title = 'Alone Trip'
    )
);
##BONUS
## Question 4
##Sales have been lagging among young families, and you want to target family movies for a promotion. 
##Identify all movies categorized as family films.

SELECT film_id,title  
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_category
    WHERE category_id = (
        SELECT category_id
        FROM category
        WHERE name = 'family'
    )
);


