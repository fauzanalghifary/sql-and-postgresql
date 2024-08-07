---- GREATEST VALUE

SELECT GREATEST (20,10,30);

SELECT name, weight, GREATEST (30, 2 * weight)
FROM products;

---- LEAST VALUE

SELECT LEAST (1, 20, 5);

SELECT price, LEAST (price * 0.5, 400)
FROM products;

---- CASE

SELECT 
    price,
    CASE
        WHEN price > 600 THEN 'high'
        ELSE 'cheap'
    END
FROM products;