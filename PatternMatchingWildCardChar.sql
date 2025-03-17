--pattern matching in SQL with LIKE Operator

--% 0 or more characters
--'_' a single character
--[] anything within brackets can come

select order_id, order_date, customer_name
from orders 
where customer_name = 'Andrew Allen'

select order_id, order_date, customer_name
from orders 
where customer_name = 'Andrew%'

select order_id, order_date, customer_name
from orders 
where customer_name like 'Andrew%'

select order_id, order_date, customer_name
from orders 
where customer_name like '%Allen'

select order_id, order_date, customer_name
from orders 
where customer_name like 'A%n'

select order_id, order_date, customer_name
from orders 
where customer_name like '%All%'

select order_id, order_date, customer_name
from orders 
where customer_name like '-_a%'

select order_id, order_date, customer_name
from orders 
where customer_name like 'A[NP]%'

select order_id, order_date, customer_name
from orders 
where customer_name like '^A[NP]%'


select order_id, order_date, customer_name
from orders 
where customer_name like 'A[b-k]%'

select order_id, order_date, customer_name
from orders 
where customer_name not like 'A[b-k]%'

