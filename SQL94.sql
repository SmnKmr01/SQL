CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    merchant_id INT,
    credit_card_id INT,
    amount INT,
    transaction_timestamp DATETIME
);

INSERT INTO transactions (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES
(1, 101, 1, 100, '2022-09-25 12:00:00'),
(2, 101, 1, 100, '2022-09-25 12:08:00'),
(3, 101, 1, 100, '2022-09-25 12:28:00'),
(4, 102, 2, 300, '2022-09-25 12:00:00'),
(5, 102, 2, 300, '2022-09-25 12:05:00'),
(6, 102, 2, 400, '2022-09-25 14:00:00');

 select * from transactions

 with cte as(
 select *, 
 LAG(transaction_timestamp) over (partition by merchant_id, credit_card_id, amount
 order by transaction_timestamp) as prev_timestamp
 from transactions
 )
 select *,Datediff(minute,prev_timestamp, transaction_timestamp) as time_diff
 from cte
 where prev_timestamp is not null
 and Datediff(minute,prev_timestamp, transaction_timestamp) <=10

