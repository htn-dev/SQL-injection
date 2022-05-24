--Visit the front page of the shop, and use Burp Suite to intercept and modify the request containing the TrackingId cookie.
--Modify the TrackingId cookie, changing it to:

TrackingId=x'||pg_sleep(10)--

--Submit the request and observe that the application takes 10 seconds to respond.
