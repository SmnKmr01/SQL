

CREATE TABLE spend (
    customer_id INT,
    month DATE,
    amount INT
);

INSERT INTO spend (customer_id, month, amount) VALUES
(1, '2024-01-01', 1000),
(1, '2024-02-01', 1500),
(2, '2024-01-01', 2000),
(2, '2024-02-01', 1800);

select * from spend

--FInd customers whose spend strictly increased month over month


with lags as(
select customer_id, month, amount,
lag(amount) over (partition by customer_id order by month) as prev_amount
from spend
)
select customer_id, month, amount
from lags
where prev_amount < amount