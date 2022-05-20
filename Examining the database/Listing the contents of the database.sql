-- Most database types (with the notable exception of Oracle) have a set of views called the information schema which provide information about the database. --

-- You can query information_schema.tables to list the tables in the database: --

SELECT * FROM information_schema.tables
