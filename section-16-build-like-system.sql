/*

- each user can like a specific post only once
- a user should be able to unlike a post
- need to be able to figure out how many likes a post has
- need to be able to list all the users who liked a post
- something besides a like should be able to be liked
- we might want to think about how to implement a dislike

-- HOW NOT TO DO IT

- add a 'likes' column to the posts table
    - this is a bad idea because it's not normalized
    - no way to make sure a user can only like a post once
    - no way to make sure a user can unlike a post
    - no way to figure out which user liked a particular post
    - no way to remove a like if a user get deleted 

*/

-- HOW TO DO IT

-- create a new table called 'likes'
-- this table will have a foreign key to the user and the post

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id)
    UNIQUE(user_id, post_id)
);

-- now we can figure out how many likes a post has
-- by counting the number of rows in the likes table
-- where the post_id is the post we are interested in

SELECT COUNT(*) FROM likes WHERE post_id = 1;

-- now we can list all the users who liked a post
SELECT users.* FROM users
JOIN likes ON likes.user_id = users.id
WHERE likes.post_id = 1;

-- now we can remove a like if a user gets deleted
DELETE FROM likes WHERE user_id = 1;

-- now we can make sure a user can only like a post once
INSERT INTO likes (user_id, post_id) VALUES (1, 1);
INSERT INTO likes (user_id, post_id) VALUES (1, 1);
-- ERROR: duplicate key value violates unique constraint "likes_user_id_post_id_key"

-- now we can make sure a user can unlike a post
DELETE FROM likes WHERE user_id = 1 AND post_id = 1;

-- now we can make sure a user can like something besides a post



-- POLYMORPHIC ASSOCIATIONS

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    liked_id INTEGER,
    liked_type VARCHAR(30) -- 'Post', 'Comment' etc.
);

-- requires your app to figure out what the liked_type is
-- can't use foreign key columns (liked_id is not a foreign key and just a plain integer)
-- not recommended

-- POLYMORPHIC ASSOCIATIONS WITH FOREIGN KEYS

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id),
    comment_id INTEGER REFERENCES comments(id)
);

ADD CHECK (post_id IS NOT NULL OR comment_id IS NOT NULL);


-- SIMPLEST ALTERNATIVE

CREATE TABLE posts_likes (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id)
);

CREATE TABLE comments_likes (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    comment_id INTEGER REFERENCES comments(id)
);

/*

Table users {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  username VARCHAR(30)
}

Table posts {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  url VARCHAR(200)
  user_id INTEGER [ref: > users.id]
}

Table comments {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  contents VARCHAR(240)
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
}

TABLE likes {
  id SERIAL [pk,increment]
  created_at TIMESTAMP
  user_id INTEGER [ref: > users.id]
  comment_id INTEGER [ref: > comments.id]
  post_id INTEGER [ref: > posts.id]
}

*/