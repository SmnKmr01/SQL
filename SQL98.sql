--Using AuditLogs(log_id, user_id, event_time, event_type, success_flag), write a query to find users with abnormal login failure rates(more than 20 percent failed events) in the last 14 days

select user_id, 
SUM(CASE when success_flag = 0 THEN 1 else 0 end) as failed_events,
count() as total_events,
100*SUM(CASE when success_flag = 0 THEN 1 else 0 end)/count() as fail_pct
from auditlogs
where event_time >= DATEADD(days, -14, GETDATE())
and event_type = 'LOGIN'
GROUP BY user_id
HAVING 100*SUM(CASE when success_flag = 0 THEN 1 else 0 end)/count() > 20