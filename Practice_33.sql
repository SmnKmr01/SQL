


CREATE TABLE activity (
    customer_id INT,
    month DATE
);

INSERT INTO activity (customer_id, month)
VALUES
(1, '2024-01-01'),
(2, '2024-01-01'),
(2, '2024-02-01');

select * from activity

--Find customers active last month but not this month




SELECT DISTINCT a.customer_id
FROM activity a
WHERE a.month = '2024-01-01'
AND NOT EXISTS (
    SELECT 1
    FROM activity b
    WHERE b.customer_id = a.customer_id
    AND b.month = '2024-02-01'
);