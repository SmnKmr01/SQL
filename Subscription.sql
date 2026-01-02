

CREATE TABLE subscription_details (
    customer_id INT,
    subscription_date DATE,
    plan_value INT
);

INSERT INTO subscription_details (customer_id, subscription_date, plan_value)
VALUES
(1, '2025-03-02', 889),
(1, '2025-04-01', 664),
(1, '2025-05-01', 299),
(2, '2025-03-01', 799),
(2, '2025-04-01', 599),
(3, '2025-05-01', 499),
(3, '2025-06-01', 599),
(4, '2025-06-01', 299),
(4, '2025-07-01', 399),
(4, '2025-08-02', 299);


SELECT * FROM SUBSCRIPTION_DETAILS


select customer_id, 
MAX(case when next_plan > plan_value then 'Yes' else 'No' end) as Upgrade,
MAX(Case when next_plan < plan_value then  'Yes' else 'No' end) as Downgrade

from(
select customer_id, subscription_date, plan_value,
LEAD(plan_value, 1, plan_value) over(partition by customer_id order by subscription_date) as next_plan
from subscription_details) a
group by customer_id