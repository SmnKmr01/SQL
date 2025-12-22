--Given issues(issue_id, process_id, severity, status, opened_date, closed_date), write a query to compute average time to close high severity issues by process

SELECT 
    process_id,
    AVG(DATEDIFF(DAY, opened_date, closed_date) * 1.0) AS avg_days_to_close
FROM Issues
WHERE severity = 'HIGH'
  AND status = 'CLOSED'
GROUP BY process_id;