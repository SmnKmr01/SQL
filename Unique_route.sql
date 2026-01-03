--Write a sql query to return only unique route combinations

CREATE TABLE travel_distance (
    start_location VARCHAR(50),
    end_location   VARCHAR(50),
    distance       INT
);

INSERT INTO travel_distance (start_location, end_location, distance) VALUES
('Delhi',     'Pune',       1400),
('Pune',      'Delhi',      1400),
('Bangalore', 'Chennai',     350),
('Mumbai',    'Ahmedabad',   500),
('Chennai',   'Bangalore',   350),
('Patna',     'Ranchi',      300);

select * from travel_distance

 
 select 
 case when start_location < end_location then start_location else end_location end as start_point
 , case when start_location < end_location then end_location else start_location end as end_point
 , max(distance) as distance
 from travel_distance
 group by case when start_location < end_location then start_location else end_location end 
 , case when start_location < end_location then end_location else start_location end