--Write a query to find all trades in the last 30 days whose exposure  exceeds the products approved risk limit, assuming tables trades.

select t.trade_id, product_id, t.exposure FROM Trades t
JOIN Products p on t.product_id = p.product_id
WHERE t.trade_date >= DATEADD(DAY, -30, CAST(GETDATE() AS DATE))
AND t.exposure > p.risk_limit


--Write a query to identify clients whose total open exposure across all trades exceeds their assigned credit limit, given, Clients(client_id. credit_limit) and Trades(trade_id, client_id, status, exposure)

SELECT c.client_id, SUM(t.exposure) AS total_exposure
from clients c
join trades t on c.client_id = t.client_id
where t.status = 'OPEN'
GROUP BY c.client_id
HAVING SUM(t.exposure) > MAX(c.credit_limit)