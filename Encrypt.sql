--- How  do you encrpt sensitive data in SQL database?

--Use AES-256 encryption for storing card details.
--Mask data using Dynamic Data Masking 
--High sensitive fiels using SHA-256
--Store encryption keys in secure key management systems

CREATE TABLE SecureAccounts(
	AccountID INT Primary Key,
	EncryptedAccount VARBINARY(256),
	EncryptedByKey VARBINARY(256)
);

--Encrypt Data
INSERT INTO SecureAccounts (AccountID,EncryptedAccount,EncryptedByKey)
VALUES(1,ENCRYPTBYKEY(KEY_GUID('KeyName'), CONVERT(VARBINARY(MAX), '1234567890')), 'SomeKey');


--Decrypt data
SELECT AccountID, CONVERT(VARCHAR, DECRYPTKEY(EncryptedAccount)) AS AccountNumber FROM SecureAccounts