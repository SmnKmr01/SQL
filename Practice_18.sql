--Pivot Rows into Columns

CREATE TABLE SalesRegion (
Region VARCHAR(20),
Amount INT
);

INSERT INTO SalesRegion VALUES
('East',100),
('West',200),
('North',150),
('East',120);

select * from SalesRegion

select * from (
select Region, Amount from SalesRegion
) src
PIVOT
(SUM(Amount) For Region IN ([East], [West], [North])
) p

--or--

SELECT
SUM(CASE WHEN Region='East' THEN Amount END) East,
SUM(CASE WHEN Region='West' THEN Amount END) West,
SUM(CASE WHEN Region='North' THEN Amount END) North
FROM SalesRegion;


