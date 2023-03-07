CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id),
    x INTEGER,
    y INTEGER,
);

-- x and y are the coordinates of the tag on the image
-- x and y nulls means the tag is on the caption

-- SOLUTION 2

CREATE TABLE photo_tags (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id),
    x INTEGER,
    y INTEGER,
);

CREATE TABLE caption_tags (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id),
);

/*

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

====

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

*/