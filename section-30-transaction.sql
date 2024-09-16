CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    balance INTEGER DEFAULT 0 NOT NULL
);

INSERT INTO accounts (name, balance) VALUES
    ('Gia', 1000),
    ('Alysia', 2000);

SELECT * FROM accounts;

BEGIN;

UPDATE accounts
SET balance = balance - 50
WHERE name = 'Alysia';

UPDATE accounts
SET balance = balance + 50
WHERE name = 'Gia';

COMMIT;

ROLLBACK;

-- TRANSACTION CLEANUP

BEGIN;

UPDATE accounts
SET balance = balance - 50
WHERE name = 'Alysia';
