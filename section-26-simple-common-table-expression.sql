SELECT users.username, tags.created_at
FROM users
JOIN (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
) AS tags ON users.id = tags.user_id
WHERE tags.created_at < ' 2010-01-07';


-- Simple Common Table Expression
WITH tags AS (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
)
SELECT users.username, tags.created_at
FROM users
JOIN tags ON users.id = tags.user_id
WHERE tags.created_at < ' 2010-01-07';