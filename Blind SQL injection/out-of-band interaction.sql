--The application uses a tracking cookie for analytics, and performs an SQL query containing the value of the submitted cookie.
--The SQL query is executed asynchronously and has no effect on the application's response. However, you can trigger out-of-band interactions with an external domain. 

--exploit the SQL injection vulnerability to cause a DNS lookup to Burp Collaborator.
