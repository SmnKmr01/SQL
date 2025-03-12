--- all about aggregation in SQL. sum(), avg(), min(), Max()

select salesperson_id, order_number, order_date, amount
from int_orders


--simple sum
select sum(amount) from int_orders

select salesperson_id, sum(amount)  from int_orders
group by salesperson_id


  select salesperson_id, order_number, order_date, amount 
 , sum(amount) over(order by order_date) from int_orders

  select salesperson_id, order_number, order_date, amount 
 , sum(amount) over(order by order_date rows between 2 preceding and current row) from int_orders

   select salesperson_id, order_number, order_date, amount 
 , sum(amount) over(order by order_date rows between 2 preceding and 1 following) from int_orders

   select salesperson_id, order_number, order_date, amount 
 , sum(amount) over(order by order_date rows between unbounded preceding and current row) from int_orders

   select salesperson_id, order_number, order_date, amount 
 , sum(amount) over(partition by salesperson_id order by order_date rows between 2 preceding and current row) from int_orders