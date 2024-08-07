---- SUBQUERY

SELECT * FROM products;

SELECT name, price
FROM products
WHERE price > 876;

SELECT name, price
FROM products
WHERE price > (
    SELECT MAX(price)
    FROM products
    WHERE department = 'Toys'
);


---- SHAPE OF DATA

-- many rows, many columns
SELECT *
FROM orders;

-- many rows, one column
SELECT id
FROM orders;

-- single value
SELECT COUNT(*)
FROM orders;

---- SUBQUERIES IN SELECT

SELECT price, (
    SELECT MAX(price) FROM products
) AS the_max
FROM products
WHERE price > 867;

SELECT price, (
    SELECT price FROM products WHERE id = 3
) AS id_3_price
FROM products
WHERE price > 867;

SELECT price,
       price / (SELECT MAX(price) * 1.0
                FROM products) AS price_ratio
FROM products;

--- SUBQUERIES IN FROM

-- the subqueries MUST have an alias
-- the data shape must be compatible

SELECT name, price/weight AS price_weight_ratio
FROM products;

SELECT name, price_weight_ratio
FROM (
    SELECT name, price/weight AS price_weight_ratio
    FROM products
) AS p
WHERE price_weight_ratio > 5;

SELECT *
FROM (
    SELECT MAX(price)
    FROM products
) as p;


SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id;

SELECT AVG(count)
FROM (
    SELECT user_id, COUNT(*) AS count
    FROM orders
    GROUP BY user_id
) AS p;


---- SUBQUERIES IN JOIN

SELECT first_name
FROM usersB
JOIN (
    SELECT user_id
    FROM orders
    WHERE product_id = 3
) AS O
ON O.user_id = usersB.id;

SELECT first_name
FROM usersB
JOIN orders
ON orders.user_id = usersB.id
WHERE orders.product_id = 3;


---- SUBQUERIES IN WHERE

SELECT id
FROM orders
WHERE product_id IN (
    SELECT id
    FROM products
    WHERE price/weight > 350
);

-- using join
SELECT orders.id
FROM orders
JOIN products ON orders.product_id = products.id
WHERE products.price/products.weight > 350;

SELECT name, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);


SELECT name
FROM products
WHERE department NOT IN (
    SELECT department
    FROM products
    WHERE price < 100
);

---- SUBQUERIES IN WHERE (2)

SELECT name, department, price
FROM products
WHERE price > ALL (
    SELECT price
    FROM products
    WHERE department = 'Industrial'
);

SELECT name, department, price
FROM products
WHERE price > (
    SELECT MAX(price)
    FROM products
    WHERE department = 'Industrial'
);


SELECT name, department, price
FROM products
WHERE price > SOME (
    SELECT price
    FROM products
    WHERE department = 'Industrial'
);


---- CORRELATED SUBQUERIES

SELECT name, department, price
FROM products AS p1
WHERE p1.price = (
    SELECT max(price)
    FROM products AS p2
    WHERE p2.department = p1.department
)
ORDER BY p1.department;


select name, department, price
FROM products
WHERE (department, price) in
    (
        select department, max(price)
        FROM products
        group BY department
    );

SELECT p1.name, (
    SELECT COUNT(*)
    FROM orders AS o1
    WHERE o1.product_id = p1.id
) as num_orders
FROM products AS p1
ORDER BY num_orders;


SELECT p1.name, COUNT(*) as num_orders
FROM products AS p1
JOIN orders AS o1 ON o1.product_id = p1.id
GROUP BY p1.name
ORDER BY num_orders;


---- WITHOUT FROM

SELECT(
    SELECT MAX(price)
    FROM products
) AS max;


SELECT(
    SELECT MAX(price)
    FROM products
) AS max, (
    SELECT AVG(price)
    FROM products
) AS avg;