USE sakila;

SET @ID_COSTUMER_SELECTED = (SELECT customer.customer_id FROM customer WHERE customer.email = 'KIM.CRUZ@sakilacustomer.org');

SELECT @ID_COSTUMER_SELECTED AS 'ID_COSTUMER_SELECTED';

SELECT
    film.title, film.description
FROM
    film
WHERE film.film_id IN (
    SELECT
        inventory.film_id
    FROM
        inventory
    WHERE
    inventory.inventory_id IN (
        SELECT
            rental.inventory_id
        FROM
            rental
        WHERE
            rental.customer_id = @ID_COSTUMER_SELECTED));
