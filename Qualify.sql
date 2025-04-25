--Understanding SQL Qualify clause and performance impact
--Write sql to find highest trip_amount trip for each company

SELECT unique_key, company, trip_total, trip_start_timestamp, trip_end_timestand
from taxi_trips
where company is not null
Qualify row_number() over (partition by company order by trip_total desc) =1 