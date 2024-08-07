/*

## Row Level Validation

- is given value definied?
- is a value unique in its column
- is a value >, <, =, >=, <=, <> another value

*/ 


CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR (40) NOT NULL,
	departement VARCHAR(40) NOT NULL,
	price INTEGER,
	weight INTEGER
);

INSERT INTO products (name, departement, price, weight) VALUES ('Shirt', 'Clothes', 20, 1);

-- Not Null

INSERT INTO products (name, departement, weight) VALUES ('Pants', 'Clothes', 2);

ALTER TABLE products
ALTER COLUMN price 
SET NOT NULL;

UPDATE products
SET price = 10
WHERE price IS NULL;

-- Default Values

ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 0;

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR (40) NOT NULL,
	departement VARCHAR(40) NOT NULL,
	price INTEGER DEFAULT 999,
	weight INTEGER
);

-- Unique Values

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR (40) NOT NULL UNIQUE,
    departement VARCHAR(40) NOT NULL,
    price INTEGER DEFAULT 999,
    weight INTEGER
);

ALTER TABLE products
ADD UNIQUE (departement);

ALTER TABLE products
DROP CONSTRAINT products_departement_key;

-- Multi-Column Unique Values

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR (40) NOT NULL,
    departement VARCHAR(40) NOT NULL,
    price INTEGER DEFAULT 999,
    weight INTEGER,
    UNIQUE (name, departement)
);

-- Check Constraints

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR (40) NOT NULL,
    departement VARCHAR(40) NOT NULL,
    price INTEGER DEFAULT 999,
    weight INTEGER,
    UNIQUE (name, departement),
    CHECK (price > 0)
);

-- Check Multiple Columns

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR (40) NOT NULL,
    departement VARCHAR(40) NOT NULL,
    price INTEGER DEFAULT 999,
    weight INTEGER,
    UNIQUE (name, departement),
    CHECK (price > 0 AND weight > 0)
);

-- Where are we applying validation?

/*

- Database
    - still applied even if you connect with a different client
    - guarantees that validation is always applied
    - can only apply validation to data that is being inserted or updated
- Application / Server
    - easier to express more complex validation
    - far easier to apply new validation rules
    - many libraries to handle validation automatically
- Client


*/