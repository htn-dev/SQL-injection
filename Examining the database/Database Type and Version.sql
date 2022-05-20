-- The queries to determine the database version for some popular database types are as follows: --

-- Microsoft, MySQL --
SELECT @@version 

-- Oracle --
SELECT * FROM v$version 

--PostgreSQL --
SELECT version() 
