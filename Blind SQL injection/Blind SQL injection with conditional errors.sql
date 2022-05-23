-- Modify the TrackingId cookie, appending a single quotation mark to it:--
TrackingId=xyz'

-- Verify that an error message is received.
-- Now change it to two quotation marks:
TrackingId=xyz''
Verify that the error disappears. This suggests that a syntax error (in this case, the unclosed quotation mark) is having a detectable effect on the response.

You now need to confirm that the server is interpreting the injection as a SQL query i.e. that the error is a SQL syntax error as opposed to any other kind of error. To do this, you first need to construct a subquery using valid SQL syntax. Try submitting:
TrackingId=xyz'||(SELECT '')||'
