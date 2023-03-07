CREATE TABLE hashtags (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    title VARCHAR(30)
);

CREATE TABLE hashtags_posts (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    hashtag_id INTEGER REFERENCES hashtags(id),
    post_id INTEGER REFERENCES posts(id)
);

-- WE DON'T REALLY NEED THIS TABLE BELOW

CREATE TABLE hashtags_users (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    title VARCHAR(30),
    user_id INTEGER REFERENCES users(id)
);

CREATE TABLE hashtags_comments (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    title VARCHAR(30),
    comment_id INTEGER REFERENCES comments(id)
);




/*

TABLE hashtags {
    id serial [pk, increment]
    created_at timestamp
    title varchar(30)
}

TABLE hashtags_posts {
    id serial [pk, increment]
    hashtag_id integer [ref: > hashtags.id]
    post_id integer [ref: > posts.id]
}

====

Table users {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  username VARCHAR(30)
  bio VARCHAR(400)
  avatar VARCHAR(200)
  phone VARCHAR(25)
  email VARCHAR(50)
  password VARCHAR(50)
  status VARCHAR(15)
}

Table posts {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  url VARCHAR(200)
  user_id INTEGER [ref: > users.id]
  caption VARCHAR(240)
  lat REAL
  lng REAL
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


TABLE photo_tags {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  x INTEGER
  y INTEGER
}

TABLE caption_tags {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
}


*/