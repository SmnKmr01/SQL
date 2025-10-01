--Month over Month Sales Growth

select 
	DATE_TRUNC('month', order_date) AS month,
	SUM(amount) AS monthly_sales,
	LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS previous_month_sales,
	ROUND(SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DAT_TRUNC('month', order_date)))*100.0/
	NULLIF(LAG(SUM(amount)) OVER(ORDER BY DATE_TRUNC('month', order_date)),0),2) AS growth_percentage
	FROM sales
	GROUP BY DATE_TRUNC('month', order_date)