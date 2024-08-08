SELECT username, COUNT(*)
FROM users
JOIN (
    SELECT user_id FROM photo_tags
    UNION ALL
    SELECT user_id FROM caption_tags
) AS tags ON tags.user_id = users.id
GROUP BY username
ORDER BY count(*) DESC;

-- USING VIEW

/*
 "fake table" that has rows from other tables
 doesn't store data, just a query
 */

CREATE VIEW tags AS (
    SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
    UNION ALL
    SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
);

SELECT * FROM tags;

SELECT username, COUNT(*)
FROM users
JOIN tags ON tags.user_id = users.id
GROUP BY username
ORDER BY count(*) DESC;


CREATE VIEW recent_posts AS (
    SELECT * FROM posts
    ORDER BY created_at DESC
    LIMIT 10
);

SELECT * FROM recent_posts;

SELECT username
FROM recent_posts
JOIN users ON users.id = recent_posts.user_id;

CREATE OR REPLACE VIEW recent_posts AS (
    SELECT * FROM posts
    ORDER BY created_at DESC
    LIMIT 20
);

DROP VIEW recent_posts;