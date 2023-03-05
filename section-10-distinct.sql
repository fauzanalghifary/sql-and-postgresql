# ------------------------------------------------------ DISTINCT


SELECT DISTINCT department
FROM products;

SELECT COUNT(DISTINCT department)
FROM products;

# group by bisa menggantikan distinct, tapi tidak sebaliknya.

SELECT DISTINCT department, name
FROM  products;