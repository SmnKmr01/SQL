--Trigger to log all high value transactions(>5000) into an audit table

CREATE TRIGGER trg_HighValueTxn
ON Transactions
AFTER INSERT
AS 
BEGIN
	INSERT INTO TransactionAudit(TxnID, AccountID, Amount, TxnType, CreatedAt)
	Select TxnID, AccountID, AMount, TxnType, CreatedAt
	FROM INSERTED
	where Amount > 5000;
END;