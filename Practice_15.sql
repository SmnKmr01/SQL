CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(50),
    state VARCHAR(50),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');


select * from Transactions

select	
	left(trans_date,7) as month, 
	country,
	COUNT(id) trans_count,
	SUM(case when state = 'approved' then 1 else 0 end) as approved_count,
	sum(amount) as trans_total_amount,
	SUM(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions
group by left(trans_date,7), country
