---- UNION
(
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 4
)
UNION 
(
SELECT name, price
FROM products
ORDER BY price/weight DESC
LIMIT 4
);


---- INTERSECT

(
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 4
)
INTERSECT
(
SELECT name, price
FROM products
ORDER BY price/weight DESC
LIMIT 4
);

---- EXCEPT

(
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 4
)
EXCEPT
(
SELECT name, price
FROM products
ORDER BY price/weight DESC
LIMIT 4
);