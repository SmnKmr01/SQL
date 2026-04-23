

CREATE TABLE support_tickets (
    ticket_id INT PRIMARY KEY,
    support_agent_id INT,
    opened_date DATETIME,
    closed_date DATETIME
);

INSERT INTO support_tickets (ticket_id, support_agent_id, opened_date, closed_date)
VALUES
(1, 101, '2024-04-01 09:00:00', '2024-04-01 12:00:00'),
(2, 101, '2024-04-02 10:00:00', '2024-04-02 15:00:00'),
(3, 102, '2024-04-01 11:00:00', '2024-04-01 13:00:00'),
(4, 102, '2024-04-03 09:30:00', '2024-04-03 11:00:00'),
(5, 103, '2024-04-02 14:00:00', '2024-04-02 18:00:00'),
(6, 103, '2024-04-03 10:00:00', NULL); -- still open

select * from support_tickets

--Calculate the average time to close tickets per support agent

select support_agent_id,
avg(DATEDIFF(hour, opened_date, closed_date) ) as avg_time
from support_tickets
group by support_agent_id