CREATE INDEX ON users (username);

DROP INDEX users_username_idx;

EXPLAIN ANALYZE
SELECT *
FROM users
WHERE username = 'Emil30';
-- with index = 0.04ms
-- without index = 0.7ms

SELECT pg_size_pretty(pg_relation_size('users'));
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));

SELECT relname, relkind
FROM pg_class
WHERE relkind= 'i'


CREATE EXTENSION pageinspect;

SELECT *
FROM bt_metap('users_username_idx');