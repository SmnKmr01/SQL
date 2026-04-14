
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO orders (order_date, amount) VALUES
('2025-01-01', 200),
('2025-01-01', 150),
('2025-01-02', 300),
('2025-01-03', 100),
('2025-01-03', 250),

('2025-02-01', 500),
('2025-02-01', 200),
('2025-02-02', 100),
('2025-02-03', 800),
('2025-02-03', 100),

('2025-03-01', 400),
('2025-03-02', 600),
('2025-03-02', 200),
('2025-03-03', 100);

select * from orders

--Find the day with the highest sales in each month


with daily_sales as(
select 
CAST(order_date AS date) as dayy,
sum(amount) as total
from orders 
group by CAST(order_date AS date)
),
ranked_sales as(
select dayy,
total,
RANK() over (PARTITIOn by year(dayy), month(dayy) order by total desc) as sales_rnk
from daily_sales
)
select DAyY, total
from ranked_sales
where sales_rnk = 1
order by dayy 

