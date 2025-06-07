Create table TestTable
(
    IDName nvarchar(25)
)
Go

-- Insert values
Insert into TestTable values('Nir10ma01a1')
Insert into TestTable values('1A0ru0na2')
Insert into TestTable values('S1h00ashi3')
Insert into TestTable values('N100aga4raj')
Insert into TestTable values('Sruj100a5n')
Insert into TestTable values('Sr1u0s0h6ti')
Insert into TestTable values('Ha1n0u0man7th')
Insert into TestTable values('Sh10iva08mma')
Insert into TestTable values('10Sonu09')
Insert into TestTable values('Nim10m1u0')

select * from TestTable

Create function UDF_ExtractNumbers
(
	@input varchar(255)
)
Returns varchar(255)
AS
Begin
	Declare @AlphabetIndex int = Patindex('%[^0-9]%', @input)
	Begin	
		while @AlphabetIndex > 0 
		Begin 
			Set @input = Stuff(@input, @alphabetIndex, 1, '')
			Set @AlphabetIndex = pATINDEX('%[0-9]', @input)
		End
	End
	Returns Isnull(@input , 0)
End

 



select dbo.UDFExtractNumbers(IDName) as ID,
		dbo.UDFExtractAlphabets(IDName) as Name
from TestTable