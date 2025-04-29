CREATE TABLE Delievry_Partner (
    Brand_1 VARCHAR(512),
    Brand_2 VARCHAR(512),
    Brand_3 VARCHAR(512),
    Winner VARCHAR(512)
);

INSERT INTO Delievry_Partner (Brand_1, Brand_2, Brand_3, Winner) VALUES
 ('A', 'B', 'C', 'B'),
 ('B', 'C', 'E', 'E'),
 ('C', 'A', 'D', 'D'),
 ('D', 'E', 'A', 'A'),
 ('F', 'B', 'C', 'F');

  with final_step as(
 select Brand_1,
 case when brand_1 = winner then 1 else 0 end as win_flag
 from Delievry_Partner
 union all
 select Brand_2,
 case when brand_2 = winner then 1 else 0 end as win_flag
 from Delievry_Partner
union all
 select Brand_3,
 case when brand_3 = winner then 1 else 0 end as win_flag
 from Delievry_Partner
 )
 select brand_1 brand_name, count(*) no_of_rides,
 sum(win_flag) win_rides, count(*) - sum(win_flag) losses
 from final_step
 group by brand_1


