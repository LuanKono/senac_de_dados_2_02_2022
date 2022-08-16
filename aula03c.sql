USE sakila;

SET @ID_COSTUMER_SELECTED = (SELECT customer.customer_id FROM customer WHERE customer.email = 'KIM.CRUZ@sakilacustomer.org');

SELECT @ID_COSTUMER_SELECTED;

SELECT CONCAT(actor_info.first_name, " ", actor_info.last_name) AS Actor_Name FROM actor_info WHERE actor_info.actor_id IN (
    SELECT
        actor_id
    FROM
        film_actor
    WHERE film_actor.film_id IN (
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
                rental.customer_id = @ID_COSTUMER_SELECTED
        )
    )
);