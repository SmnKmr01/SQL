CREATE TABLE sales_deals (
    deal_id INT IDENTITY(1,1) PRIMARY KEY,
    sales_rep_id INT,
    deal_close_date DATE,
    deal_amount DECIMAL(10,2)
);


INSERT INTO sales_deals (sales_rep_id, deal_close_date, deal_amount)
VALUES
(101, '2026-04-01', 5000),
(101, '2026-04-05', 7000),
(101, '2026-03-20', 8000), -- previous quarter (ignored)
(102, '2026-04-02', 4000),
(102, '2026-04-07', 6500),
(102, '2026-04-10', 7200),
(103, '2026-04-03', 5500),
(103, '2026-04-15', 9000),
(104, '2026-04-06', 3000),
(104, '2026-04-18', 4500),
(104, '2026-04-20', 4700),
(104, '2026-01-15', 6000); -- previous quarter


select * from sales_deals


--Find the top 3 sales reps by number of deals closed this quarter

select Top(3) sales_rep_id, COUNT(*) as deals_closed
from sales_deals 
where deal_close_date > DATEADD(quarter,DATEDIFF(Quarter, 0, GETDATE()), 0)
group by sales_rep_id
order by deals_closed desc