mysql-ctl cli

SHOW DATABASES;
CREATE DATABASE city_app;
use city_app;

# ------------------------------------------------------ CREATE TABLE

CREATE TABLE cities (
    name VARCHAR(50), 
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);

# ------------------------------------------------------ INSERT DATA

INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES 
    ('Delhi', 'India', 28125000, 2240),
    ('Shanghai', 'China', 22125000, 4015),
    ('Sao Paulo', 'Brazil', 20935000, 3043);
    
# ------------------------------------------------------ RETRIEVE DATA

SELECT * FROM cities;

SELECT name, country FROM cities;


# ------------------------------------------------------ CALCULATED COLUMN

SELECT name, population/area AS population_density FROM cities;

# ------------------------------------------------------ STRINGS OPERATORS AND FUNCTION

SELECT name || ', ' || country AS location FROM cities;

SELECT CONCAT(name, ', ', country) AS location FROM cities;

SELECT
  CONCAT(UPPER(name), ', ', UPPER(country)) AS location
FROM
  cities;

SELECT
  UPPER(CONCAT(name, ', ', country)) AS location
FROM
  cities;
 
SELECT name, LENGTH(name) FROM cities;