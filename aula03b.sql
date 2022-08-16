USE sakila;

SET @ID_COSTUMER_SELECTED = (SELECT customer.customer_id FROM customer WHERE customer.email = 'KIM.CRUZ@sakilacustomer.org');

SELECT
    rental.customer_id, inventory.film_id, film.title
FROM
    rental
INNER JOIN
    inventory
INNER JOIN
    film
ON
    rental.inventory_id = inventory.inventory_id
AND
    inventory.film_id = film.film_id
WHERE
    rental.customer_id = @ID_COSTUMER_SELECTED;
