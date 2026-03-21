--Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount

CREATE TABLE CustomerVisits (
    customer_id INT,
    name VARCHAR(50),
    visited_on DATE,
    amount INT
);

INSERT INTO CustomerVisits (customer_id, name, visited_on, amount)
VALUES
(1, 'Jhon',   '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade',   '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston','2019-01-05', 110),
(6, 'Elvis',  '2019-01-06', 140),
(7, 'Anna',   '2019-01-07', 150),
(8, 'Maria',  '2019-01-08', 80),
(9, 'Jaze',   '2019-01-09', 110),
(1, 'Jhon',   '2019-01-10', 130),
(3, 'Jade',   '2019-01-10', 150);

select * from CustomerVisits

-- visited_on  amount (7-Day Sum)  average_amount (7-Day Avg) 
	2019-01-07 860					122.86 
	2019-01-08 840					120.00 
	2019-01-09 840					120.00 
	2019-01-10 1000					142.86




-------------------------------
WITH daily_sales AS (
    SELECT 
        visited_on,
        SUM(amount) AS total_amount
    FROM CustomerVisits
    GROUP BY visited_on
)

SELECT 
    visited_on,
    
    SUM(total_amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    
    ROUND(
        AVG(total_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2
    ) AS average_amount

FROM daily_sales
WHERE visited_on >= (
    SELECT DATEADD(DAY, 6, MIN(visited_on)) FROM daily_sales
)
ORDER BY visited_on;


select * from CustomerVisits