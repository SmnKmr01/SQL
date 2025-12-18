--Replace NULL values with a default value or remove them based on the context

select COALESCE(column_name, 'DefaultValue') AS column_name from table_name

--Identify and delete duplicate rows based on key columns

WITH CTE AS ( 
		SELECT id, column1, column2,
		ROW_NUMBER() over(PARTITION BY column1, column2 ORDER BY id) as row_num
		from table_name
		)
DELETE FROM table_name
WHERE id IN (
	SELECT id 
	FROM CTE
	WHERE row_num > 1)

--Convert text to lower or upper case to ensure consistency

SELECT LOWER(column_name) AS cleaned_column from table_name

--Remove extra spaces from text fields

SELECT TRIM(column_name) as cleaned_column
from table_name


--Convert date strings into a consistent date format

SELECT STR_TO_DATE(column_name, '%m/%d%Y') AS formatted_date
from table_name

--Identify and manage outliers in numerical data
SELECT * 
FROM table_name
WHERE column_name BETWEEN lower_limit AND upper_limit

--Replace or remove special characters in text fields
SELECT REGEXP_REPLACE(column_name, '[^a-zA-Z0-9]', '') AS cleaned_column from table_name

-- Standardize values in categorical columns
UPDATE table_name
SET column_name = 'Male'
WHERE column_name IN ('M' , 'male')