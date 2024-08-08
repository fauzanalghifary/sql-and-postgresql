-- parser -> rewrite -> planner -> executor

-- EXPLAIN -> build a query plan and display it
-- EXPLAIN ANALYZE -> build a query plan, execute it and display the execution time

EXPLAIN ANALYZE
SELECT username, contents
FROM users
JOIN comments ON users.id = comments.user_id
WHERE username = 'Alyson14';

/*

Hash Join  (cost=8.31..1756.11 rows=11 width=81) (actual time=0.360..18.123 rows=7 loops=1)

cost -> amount of processing power required for the step (first_row_emitted..all_row)
rows -> a guess at how many rows will be returned
width -> a guess at the average number of bytes per row

COST FLOW UP!
*/

 SELECT *
 FROM pg_stats
 WHERE tablename = 'users';


/*
 cost -> amount of time to execute the step

 IF USING INDEX
- Find the ID'S of the users with the username 'Alyson14'
   - Get the root node
   - Jump to some random child page
   - Process the values in that node
- Open users heap file
- Jump to each block that has the users we are looking for

 IF NOT USING INDEX
- Open users heap file
- Load all users from the first block
- Process each user, see if it matches the username
- Repeat the process for the next block

 THE CAVEAT => loading data from random spots off a hard drive is slower than loading data from sequential spots

 */

EXPLAIN
 SELECT *
 FROM likes
 WHERE created_at < '2013-01-01';

EXPLAIN
SELECT *
FROM likes
WHERE created_at > '2013-01-01'; -- seq scan 😱


CREATE INDEX likes_created_at_idx ON likes (created_at);