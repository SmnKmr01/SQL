

create table MatchingPair(Id varchar(5), PersonType varchar(5));

insert into MatchingPair values
('A1', 'Adult'),
('C1', 'Child'),
('A2', 'Adult'),
('C2', 'Child'),
('A3', 'Adult'),
('C3', 'Child'),
('A4', 'Adult');

select * from MatchingPair


with cte as(
select *, right(Id, 1) as Val from MatchingPair)
, cte1 as(
select *, SUBSTRING(id, 2, 1) as Val from MatchingPair
)
,final_cte as(
select cte.Id as Adult, cte1.Id as Child
, ROW_NUMBER() over (partition by right(cte.Id, 1) order by cte.Id) as rn
from cte left join cte1 on cte.val = cte1.val and cte.Id <> cte1.Id)
select Adult, Child from final_cte where rn = 1