SELECT
    *
FROM
    city
WHERE
    city.CountryCode IN (
        SELECT
            Code
        FROM
            country
        WHERE
            country.name = "Afghanistan"
    );