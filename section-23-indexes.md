## Full Table Scan

- A full table scan is a scan of the entire table. 
- This is the slowest type of scan, and should be avoided if possible. 
- PG has to load many (or all) rows from the heap file to memory.
- A full table scan is performed when no index is available to use, or when the optimizer decides that it is more efficient to perform a full table scan than to use an index.
- Every time there is a full table scan, it warrants an investigation.

## What is an Index?

- An index is a data structure that improves the speed of data retrieval operations on a table at the cost of additional writes and storage space to maintain the index data structure.
- Indexes are used to quickly locate data without having to search every row in a database table every time a database table is accessed.

## How do Indexes Work?

- Data structure that efficiently tells us what block/index a record is stored at.
- Store only the property that we want to do fast lookups by and the block/index for each.
- Sorted in some meaningful way.
- Organized into a tree data structure.

- An index is a data structure that contains one or more columns from a table. 
- The index is stored in a self-balancing tree structure, which allows the index to be quickly searched and sorted.
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

EXPLAIN ANALYZE
SELECT *
FROM users
WHERE username = 'Emil30';

## Downside of Indexes

- Can be large! Stores data from at least one column of the real table.
- Slows down data modification operations (INSERT, UPDATE, DELETE), because the index must also be updated whenever the table is modified.
- Index might not be actually used by a query, even if it exists. The query optimizer might decide that it is more efficient to perform a full table scan than to use an index.

## Index Types

- B-Tree => general purpose index, 99% of the time you will use this.
- Hash
- GiST
- SP-GiST
- GIN
- BRIN

## Automaticaly Generated Indexes

- Primary key columns are automatically indexed.
- Unique columns are automatically indexed.