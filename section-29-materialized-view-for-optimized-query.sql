/*

- VIEW -> query that get executed every time you refer it.
- MATERIALIZED VIEW -> query that get executed once and store the result in a table.

*/

SELECT
    date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
    count(posts.id) AS num_likes_for_posts,
    count(comments.id) AS num_likes_for_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

-- using materialized view
CREATE MATERIALIZED VIEW weekly_likes AS
(
SELECT date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
       count(posts.id)                                                     AS num_likes_for_posts,
       count(comments.id)                                                  AS num_likes_for_comments
FROM likes
         LEFT JOIN posts ON posts.id = likes.post_id
         LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week
) WITH DATA;

SELECT * FROM weekly_likes;

-- DELETE FROM posts
-- WHERE created_at < '2010-02-01'

REFRESH MATERIALIZED VIEW weekly_likes;