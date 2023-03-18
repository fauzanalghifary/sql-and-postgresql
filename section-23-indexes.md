## Full Table Scan

A full table scan is a scan of the entire table. This is the slowest type of scan, and should be avoided if possible. A full table scan is performed when no index is available to use, or when the optimizer decides that it is more efficient to perform a full table scan than to use an index.

## What is an Index?

- An index is a data structure that improves the speed of data retrieval operations on a table at the cost of additional writes and storage space to maintain the index data structure.
- Indexes are used to quickly locate data without having to search every row in a database table every time a database table is accessed.

## How do Indexes Work?

- An index is a data structure that contains one or more columns from a table. The index is stored in a self-balancing tree structure, which allows the index to be quickly searched and sorted.
- When a table is created, indexes are not created by default. You must create them yourself.
- Indexes are created using one or more columns of a table. The index stores the value of the column or columns, as well as the address of the row in which the column or columns are found.

## Creating an Index

- To create an index, use the CREATE INDEX statement.
  CREATE INDEX ON users (username);
  or
  CREATE INDEX users_username_idx ON users (username);
- The name of the index is optional. If you do not specify a name, PostgreSQL will generate a name for the index.
- delete index
  DROP INDEX users_username_idx;

## Benchmarking Indexes

- To benchmark an index, you can use the EXPLAIN statement. The EXPLAIN statement will show you the query plan that PostgreSQL will use to execute a query.
- The EXPLAIN statement can be used to analyze the performance of a query before it is executed. This is useful for determining whether an index will improve the performance of a query.
- The EXPLAIN statement can also be used to analyze the performance of a query after it has been executed. This is useful for determining whether an index is being used by a query.

<!-- EXPLAIN SELECT * FROM users WHERE username = 'jdoe'; -->

## Downside of Indexes

- Indexes can slow down data modification operations (INSERT, UPDATE, DELETE) because the index must also be updated whenever the table is modified.
- Indexes can also take up a lot of disk space, especially if the table contains a lot of columns.
- Indexes might not actually get used by a query, even if they exist. This is because the query optimizer might decide that it is more efficient to perform a full table scan than to use an index.

## Index Types

- There are two types of indexes: B-tree indexes and Hash indexes.
- B-tree indexes are the default index type in PostgreSQL. B-tree indexes are generally faster than hash indexes, but take up more disk space.
- Hash indexes are faster than B-tree indexes, but take up more disk space. Hash indexes are only used for equality comparisons (WHERE column = value).

## Automaticaly Generated Indexes

- PostgreSQL automatically creates indexes on primary keys and unique constraints.
- PostgreSQL also automatically creates indexes on foreign keys if the referencing column is declared as NOT NULL.
- PostgreSQL does not automatically create indexes on foreign keys if the referencing column is declared as NULL.
- PostgreSQL automatically creates indexes on UNIQUE columns that are declared as NOT NULL.
