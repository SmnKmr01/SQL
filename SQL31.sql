--Write a quey t oprint top 5 cities with highest spends and their
--percentage contribution of total credit card spends

CREATE TABLE Credit_transactions (
    transaction_id INT,
    city VARCHAR(50),
    transaction_date DATE,
    card_type VARCHAR(20),
    exp_type VARCHAR(20),
    gender CHAR(1),
    amount INT
);

INSERT INTO credit_transactions VALUES
(1, 'Delhi', '2014-10-29', 'Gold', 'Bills', 'F', 82475),
(2, 'Greater Mumbai', '2014-08-22', 'Platinum', 'Bills', 'F', 32555),
(3, 'Bengaluru', '2014-08-27', 'Silver', 'Bills', 'F', 101738),
(4, 'Greater Mumbai', '2014-04-12', 'Signature', 'Bills', 'F', 123424),
(5, 'Bengaluru', '2015-05-05', 'Gold', 'Bills', 'F', 171574),
(6, 'Delhi', '2014-09-08', 'Silver', 'Bills', 'F', 100036),
(7, 'Delhi', '2015-02-24', 'Gold', 'Bills', 'F', 143250),
(8, 'Greater Mumbai', '2014-06-26', 'Platinum', 'Bills', 'F', 150980),
(9, 'Delhi', '2014-03-28', 'Silver', 'Bills', 'F', 192247),
(10, 'Delhi', '2014-09-01', 'Platinum', 'Bills', 'F', 67932),
(11, 'Delhi', '2014-06-22', 'Platinum', 'Bills', 'F', 280061),
(12, 'Greater Mumbai', '2013-12-07', 'Signature', 'Bills', 'F', 278036),
(13, 'Greater Mumbai', '2015-08-07', 'Gold', 'Bills', 'F', 19226),
(14, 'Delhi', '2014-04-27', 'Signature', 'Bills', 'F', 254359),
(15, 'Greater Mumbai', '2014-08-15', 'Signature', 'Bills', 'F', 302834),
(16, 'Greater Mumbai', '2014-11-28', 'Platinum', 'Bills', 'F', 647116),
(17, 'Greater Mumbai', '2014-06-14', 'Signature', 'Bills', 'F', 421878),
(18, 'Greater Mumbai', '2015-03-30', 'Gold', 'Bills', 'F', 986379);


select top(3) city,
	SUM(amount) as total_spend,
	ROUND(
		100.0 * SUM(amount)/(select sum(amount)
			from credit_transactions),2) as per_of_totalspend
FROM Credit_transactions
GROUP BY city
order by total_spend DESC
