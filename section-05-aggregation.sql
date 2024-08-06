---- AGGREGATING AND GROUPING

-- AGGREGATING => reduces many values done to one
-- GROUPING => reduces many rows to fewer rows

---- GROUP BY

SELECT user_id
FROM comments
GROUP BY user_id;

-- errors because contents is not in the GROUP BY clause
SELECT contents
FROM comments
GROUP BY user_id;

---- AGGREGATE FUNCTION

SELECT MAX(id)
FROM comments;

SELECT AVG(id)
FROM comments;

---- COMBINING AGGREGATE AND GROUP BY

SELECT user_id, COUNT(id) AS total_comments
FROM comments
GROUP BY user_id;


---- COUNT

-- null is not counted
SELECT COUNT(user_id)
FROM photos;

-- null is counted (count num of rows)
SELECT COUNT(*)
FROM photos;

-- null is not counted
SELECT user_id, COUNT(*)
FROM photos
GROUP BY user_id;


SELECT * FROM photos;
SELECT * FROM comments;

SELECT photo_id, COUNT(*)
FROM comments
GROUP BY photo_id;


---- HAVING

-- FROM - JOIN - WHERE - GROUP BY - HAVING

-- HAVING => Filters the set of groups
-- HAVING ALWAYS COMES WITH GROUP BY

SELECT photo_id, COUNT(*)
FROM comments
WHERE photo_id >= 3
GROUP BY photo_id
HAVING COUNT(*) > 20; 


SELECT user_id, COUNT(*)
FROM comments
WHERE photo_id <= 50
GROUP BY user_id
HAVING COUNT(*) > 20;