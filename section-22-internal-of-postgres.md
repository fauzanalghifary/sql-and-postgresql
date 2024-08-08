## Where does Postgres store its data?

Postgres stores its data in a directory called `PGDATA`. This is usually
`/var/lib/postgresql/9.3/main` on Debian/Ubuntu, and
`/var/lib/pgsql/9.3/data` on RedHat/CentOS.

The `PGDATA` directory contains a number of files and directories.

## Heaps, Blocks, and Tuples

- Heap file: file that contains all the data (rows) of our table
- Tuple (item): a single row of data
- Block (page): the heap file is divided into blocks of 8KB. Each block contains multiple tuples.
