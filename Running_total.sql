--Find out running total

CREATE TABLE transactions_1308 (transaction_id BIGINT, type VARCHAR(50), amount INT,transaction_date DATE)

INSERT INTO transactions_1308 VALUES (53151, 'deposit', 178, '2022-07-08'), (29776, 'withdrawal', 25, '2022-07-08'),(16461, 'withdrawal', 45, '2022-07-08'),(19153, 'deposit', 65, '2022-07-10'),(77134, 'deposit', 32, '2022-07-10')

with cte as (
select *, ROW_NUMBER() over (partition by transaction_date order by(select null)) as rn
from transactions_1308)
select * ,
sum( case when type = 'deposit' then amount else -amount end) over ( order by transaction_date, transaction_id) as total
from cte


