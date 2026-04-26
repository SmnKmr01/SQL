

CREATE TABLE events (
    user_id INT,
    event_time DATETIME
);

INSERT INTO events (user_id, event_time) VALUES
(1, '2024-01-01 10:00:00'),
(1, '2024-01-01 10:15:00'),
(1, '2024-01-01 11:00:00');

select * from events

--Identify new user sessions when inactivity gap > 30 minutes

with lags as(
select 
user_id, event_time,
lag(event_time) over (partition by user_id order by event_time) as prev_event_time
from events
)
select user_id, event_time,
SUM( case when DATEDIFF(minute, prev_event_time, event_time) > 30 then 1 else 0 end) over(partition by user_id order by event_time) + 1 as new_session
from lags
