-- Modify the TrackingId cookie, appending a single quotation mark to it:--

TrackingId=xyz'

'--Verify that an error message is received.--
-- Now change it to two quotation marks:--

TrackingId=xyz''

--Verify that the error disappears. This suggests that a syntax error (in this case, the unclosed quotation mark) is having a detectable effect on the response.--
--You now need to confirm that the server is interpreting the injection as a SQL query i.e. that the error is a SQL syntax error as opposed to any other kind of error. To do this, you first need to construct a subquery using valid SQL syntax. Try submitting:

TrackingId=xyz'||(SELECT '')||'

--In this case, notice that the query still appears to be invalid. This may be due to the database type - try specifying a predictable table name in the query:

TrackingId=xyz'||(SELECT '' FROM dual)||'

--As you no longer receive an error, this indicates that the target is probably using an Oracle database, which requires all SELECT statements to explicitly specify a table name.
--Now that you've crafted what appears to be a valid query, try submitting an invalid query while still preserving valid SQL syntax. For example, try querying a non-existent table name:

TrackingId=xyz'||(SELECT '' FROM not-a-real-table)||'

--This time, an error is returned. This behavior strongly suggests that your injection is being processed as a SQL query by the back-end. 

--As long as you make sure to always inject syntactically valid SQL queries, you can use this error response to infer key information about the database. For example, in order to verify that the users table exists, send the following query:
TrackingId=xyz'||(SELECT '' FROM users WHERE ROWNUM = 1)||'

--As this query does not return an error, you can infer that this table does exist. Note that the WHERE ROWNUM = 1 condition is important here to prevent the query from returning more than one row, which would break our concatenation.

--You can also exploit this behavior to test conditions. First, submit the following query:
TrackingId=xyz'||(SELECT CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM dual)||'

--Verify that an error message is received.

--Now change it to:
TrackingId=xyz'||(SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE '' END FROM dual)||'

--Verify that the error disappears. This demonstrates that you can trigger an error conditionally on the truth of a specific condition. The CASE statement tests a condition and evaluates to one expression if the condition is true, and another expression if the condition is false. 
--The former expression contains a divide-by-zero, which causes an error. In this case, the two payloads test the conditions 1=1 and 1=2, and an error is received when the condition is true.

