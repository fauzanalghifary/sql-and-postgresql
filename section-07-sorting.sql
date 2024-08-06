---- BASIC OF SORTING

SELECT name, price
FROM products
ORDER BY price; -- ascending

SELECT name, price
FROM products
ORDER BY price DESC; --descending

---- TWO VARIATIONS OF SORTING

SELECT name, price
FROM products
ORDER BY price DESC, name;

---- OFFSET AND LIMIT

-- OFFSET => skip n first
-- LIMIT => only show n first

SELECT name
FROM products
OFFSET 3;

SELECT name
FROM products
ORDER BY name
LIMIT 3;