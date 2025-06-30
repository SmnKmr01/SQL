create table FinancialTransactions
(
    TransactionID int primary key,
    TransactionDate date,
    Amount float,
    TransactionType varchar(10)
);

Insert into FinancialTransactions 
(TransactionID, TransactionDate, Amount, TransactionType)
values
(1, '2024-01-15', 56.00, 'Debit'),
(2, '2024-01-15', 23.00, 'Credit'),
(3, '2024-01-15', 880.00, 'Credit'),
(4, '2024-01-15', 76.00, 'Debit'),
(5, '2024-01-16', 60.00, 'Credit'),
(6, '2024-01-16', 146.00, 'Debit');

select
    TransactionDate,
    sum(case 
            when TransactionType = 'Credit' then Amount 
            else -Amount 
        end) as Balance
from FinancialTransactions
group by TransactionDate;