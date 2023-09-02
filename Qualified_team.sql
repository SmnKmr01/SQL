

create table Ameriprise_LLC
(
teamID varchar(2),
memberID varchar(10),
Criteria1 varchar(1),
Criteria2 varchar(1)
);

insert into Ameriprise_LLC values 
('T1','T1_mbr1','Y','Y'),
('T1','T1_mbr2','Y','Y'),
('T1','T1_mbr3','Y','Y'),
('T1','T1_mbr4','Y','Y'),
('T1','T1_mbr5','Y','N'),
('T2','T2_mbr1','Y','Y'),
('T2','T2_mbr2','Y','N'),
('T2','T2_mbr3','N','Y'),
('T2','T2_mbr4','N','N'),
('T2','T2_mbr5','N','N'),
('T3','T3_mbr1','Y','Y'),
('T3','T3_mbr2','Y','Y'),
('T3','T3_mbr3','N','Y'),
('T3','T3_mbr4','N','Y'),
('T3','T3_mbr5','Y','N');

select * from Ameriprise_LLC

with qualified_team as(
select teamID, count(1) as no_of_eligible_members
from Ameriprise_LLC
where Criteria1='Y' and Criteria2='Y'
group by teamID
having count(1)>=2)

select al.*, qt.* 
,case when Criteria1='Y' and Criteria2='Y' and qt.no_of_eligible_members is not null then 'Y' else 'N' end as qualified_flag
from
Ameriprise_LLC al
left join qualified_team qt on al.teamID=qt.teamID

--OR

select al.*
,case when Criteria1='Y' and Criteria2='Y' and
sum(case when Criteria1 = 'Y' and Criteria2='Y' then 1 else 0 end) over(partition by teamid)>=2 then 'Y' else 'N' end as qualified_flag
from
Ameriprise_LLC al
