SELECT
    'Specific select some data 00' AS 'INFO';

/*------------------------------------------*/
SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
LIMIT
    15;

/*------------------------------------------*/
SELECT
    'Specific select some data 01' AS 'INFO';

/*------------------------------------------*/
SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
WHERE
    customer.first_name = 'MARY'
    OR customer.first_name = 'PATRICIA'
LIMIT
    15;

/*------------------------------------------*/
SELECT
    'Specific select some data 02' AS 'INFO';

/*------------------------------------------*/
SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
WHERE
    customer.first_name = 'MARY'
    AND customer.first_name = 'PATRICIA'
LIMIT
    15;

/*------------------------------------------*/
SELECT
    'Specific select some data 03' AS 'INFO';

/*------------------------------------------*/
SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
WHERE
    customer.first_name = 'WADE'
    AND customer.email = 'WADE.DELVALLE@sakilacustomer.org'
LIMIT
    15;

/*------------------------------------------*/
SELECT
    'Specific select some data 04 with OR' AS 'INFO';

/*------------------------------------------*/
SELECT
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM
    film
WHERE
    (
        film.release_year > 2000
        AND film.release_year < 2010
    )
    AND (
        film.length > 70
        AND film.length < 80
    )
    AND (
        film.language_id = 1
        OR film.language_id = 5
    )
    AND (
        film.rating = 'R'
        OR film.rating = 'G'
        OR film.rating = 'NC-17'
    )
LIMIT
    40;

/*------------------------------------------*/
SELECT
    'Specific select some data 05 with IN' AS 'INFO';

/*------------------------------------------*/
SELECT
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM
    film
WHERE
    (
        film.release_year > 2000
        AND film.release_year < 2010
    )
    AND (
        film.length > 70
        AND film.length < 80
    )
    AND (film.language_id IN (1, 5))
    AND (film.rating IN ('R', 'G', 'NC-17'))
LIMIT
    40;

/*------------------------------------------*/
SELECT
    'Specific select some data 05 with IN' AS 'INFO';

/*------------------------------------------*/
SELECT
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM
    film
WHERE
    (
        film.release_year BETWEEN '2000'
        AND '2010'
    )
    AND (
        film.length BETWEEN '70'
        AND '80'
    )
    AND (film.language_id IN (1, 5))
    AND (film.rating IN ('R', 'G', 'NC-17'))
LIMIT
    40;

/*------------------------------------------*/
SELECT
    'Specific select some data 06 with a SUB SELECT' AS 'INFO';

/*------------------------------------------*/
SELECT
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM
    film
WHERE
    (
        film.release_year BETWEEN '2000'
        AND '2010'
    )
    AND (
        film.length BETWEEN '70'
        AND '80'
    )
    AND (
        film.language_id = (
            SELECT
                language_id
            FROM
                language
            WHERE
                name = 'English'
        )
    )
    AND (film.rating IN ('R', 'G', 'NC-17'))
LIMIT
    40;

/*------------------------------------------*/
SELECT
    'Specific select some data 07 with a SUB SELECT AND TWO SELECTS IN' AS 'INFO';

/*------------------------------------------*/
SELECT
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM
    film
WHERE
    (
        film.release_year BETWEEN '2000'
        AND '2010'
    )
    AND (
        film.length BETWEEN '70'
        AND '80'
    )
    AND (
        film.language_id IN (
            (
                SELECT
                    language_id
                FROM
                    language
                WHERE
                    name = 'French'
            ),
            (
                SELECT
                    language_id
                FROM
                    language
                WHERE
                    name = 'English'
            )
        )
    )
    AND (film.rating IN ('R', 'G', 'NC-17'))
LIMIT
    40;

/*------------------------------------------*/
SELECT
    'Specific select some data 08 with a SUB SELECT AND THREE SELECTS IN' AS 'INFO';

/*------------------------------------------*/
SELECT
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM
    film
WHERE
    (
        film.release_year BETWEEN '2000'
        AND '2010'
    )
    AND (
        film.length BETWEEN '70'
        AND '80'
    )
    AND (
        film.language_id IN (
            (
                SELECT
                    language_id
                FROM
                    language
                WHERE
                    name = 'French'
            ),
            (
                SELECT
                    language_id
                FROM
                    language
                WHERE
                    name = 'English'
            ),
            (
                SELECT
                    language_id
                FROM
                    language
                WHERE
                    name = 'Italian'
            )
        )
    )
    AND (film.rating IN ('R', 'G', 'NC-17'))
LIMIT
    40;

/*------------------------------------------*/
SELECT
    'Specific select some data 09 with a SUB QUERY IF VARIABLE' AS 'INFO';

/*------------------------------------------*/
SET
    @FRENCH_ID = (
        SELECT
            language_id
        FROM
            language
        WHERE
            name = 'French'
    );

SET
    @ENGLISH_ID = (
        SELECT
            language_id
        FROM
            language
        WHERE
            name = 'English'
    );

SET
    @ITALIAN_ID = (
        SELECT
            language_id
        FROM
            language
        WHERE
            name = 'Italian'
    );

SELECT
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM
    film
WHERE
    (
        film.release_year BETWEEN '2000'
        AND '2010'
    )
    AND (
        film.length BETWEEN '70'
        AND '80'
    )
    AND (
        film.language_id IN (
            @FRENCH_ID,
            @ENGLISH_ID,
            @ITALIAN_ID
        )
    )
    AND (film.rating IN ('R', 'G', 'NC-17'))
ORDER BY
    film.title DESC
LIMIT
    40;