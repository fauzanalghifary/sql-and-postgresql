---- ONE-TO-MANY or MANY-TO-ONE relationship

--  a user HAS MANY photos (one-to-many)
--  a photo HAS ONE user (many-to-one)

---- ONE-TO-ONE and MANY-TO-MANY relationship

--  o-t-o country-capital
--  m-t-m students-classes, movies-actors

---- PRIMARY KEYS AND FOREIGN KEYS

--  the MANY side get the FOREIGN KEY COLUMN

---- AUTO GENERATED ID

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

INSERT INTO users (username)
VALUES
    ('monahan93'),
    ('pferrer'),
    ('si930nis'),
    ('99stroman');

SELECT * FROM users;

DROP TABLE users;

---- CREATE FOREIGN KEY

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos (url, user_id)
VALUES
    ('http://one.jpg', 4);
    
SELECT * FROM photos;

---- RUNNING QUERIES ON ASSOCIATED DATA

INSERT INTO photos(url, user_id)
VALUES
    ('http://two.jpg', 1),
    ('http://25.jpg', 1),
    ('http://36.jpg', 1),
    ('http://754.jpg', 2),
    ('http://35.jpg', 3),
    ('http://257.jpg', 4);

SELECT * FROM photos
WHERE user_id = 4;

SELECT * FROM photos
JOIN users ON users.id = photos.user_id;

SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;

---- FOREIGN KEY CONSTRAINT AROUND INSERTION (DATA CONSISTENCY)

SELECT * FROM users;
SELECT * FROM photos;

INSERT INTO photos (url, user_id)
VALUES ('http://a.jpg', 999);

INSERT INTO photos (url, user_id)
VALUES ('http://b.jpg', null);

ALTER TABLE photos ALTER COLUMN user_id DROP NOT NULL; -- drop not null constraint

---- CONSTRAINTS AROUND DELETION

-- ON DELETE RESTRICT (DEFAULT).
DELETE FROM users
WHERE id = 3;

-- ON DELETE RESTRICT => thrown an error
-- ON DELETE CASCADE => all photos with user_id = 3 will be deleted
-- ON DELETE SET NULL => all user_id in photos with user_id = 3 will be set to null
-- ON DELETE SET DEFAULT => all user_id in photos with user_id = 3 will be set to default value (if there is a default value)
-- ON DELETE NO ACTION

---- TESTING DELETE CONSTRAINTS

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id)
);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);


CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER DEFAULT(2) REFERENCES users(id) on DELETE SET DEFAULT
);
 
INSERT INTO photos (url, user_id)
VALUES
    ('http:/one.jpg', 4),
    ('http:/two.jpg', 1),
    ('http:/25.jpg', 1),
    ('http:/36.jpg', 1),
    ('http:/754.jpg', 2),
    ('http:/35.jpg', 3),
    ('http:/256.jpg', 4);


DROP TABLE photos;

SELECT * FROM photos;

DELETE FROM users
WHERE id = 1;

---- ADDING SOME COMPLEXITY

