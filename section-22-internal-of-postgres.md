## Where does Postgres store its data?

Postgres stores its data in a directory called `PGDATA`. This is usually
`/var/lib/postgresql/9.3/main` on Debian/Ubuntu, and
`/var/lib/pgsql/9.3/data` on RedHat/CentOS.

The `PGDATA` directory contains a number of files and directories.

## Heaps, Blocks, and Tuples
