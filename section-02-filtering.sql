---- FILTERING ROWS WITH 'WHERE'

SELECT name, area FROM cities WHERE area > 4000;

SELECT name, area FROM cities WHERE area = 8223;

SELECT name, area FROM cities WHERE area != 8223;

SELECT name, area FROM cities WHERE area <> 8223;

SELECT name, area FROM cities WHERE area BETWEEN 1000 AND 4000;

SELECT name, area FROM cities WHERE name IN ('Delhi', 'Shanghai');

SELECT name, area FROM cities WHERE name NOT IN ('Delhi', 'Shanghai');

SELECT 
	name, area 
FROM
	cities 
WHERE 
	area IN (3043, 8223) 
	AND name = 'Sao Paulo';

---- CALCULATION IN 'WHERE'

SELECT name, population/area AS population_density
FROM cities
WHERE population/area < 6000;

---- UPDATING ROWS

UPDATE cities
SET population = 39505000
WHERE name = 'Tokyo';

---- DELETING ROWS

DELETE FROM cities
WHERE name = 'Tokyo';