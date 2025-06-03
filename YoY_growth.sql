--Year over Year Growth in Sales

select YEAR(order_date) as Year,
	SUM(revenue) as Total_revenue,
	LAG(SUM(revenue)) OVER (ORDERBY YEAR(order_date)) AS prev_year_revenue,
	ROUND(SUM(revenue) - LAG(SUM(revenue)) OVER (order by YEAR(order_date))) /
	LAG(SUM(revenue)) OVER (ORDER BY YEAR(order_date))*100,2) AS YoY_growth
From Sales
Group by YEAR(order_date)