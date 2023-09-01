/* There are 2 tables, first table has 5 records and second table has 10 records.
you can assume any values in each of the tables. how manu maximum and minimum records possible in case of 
inner join, left join, right join and full outer join */

create table t1
(
id1 varchar(10)
)

create table t2
(
id2 varchar(10)
)

create table t3
(
id3 varchar(10)
)

truncate table t1
INSERT INTO t1
VALUES(1),(1),(1),(1),(1);

INSERT INTO t2
VALUES(1),(1),(1),(1),(1),(1),(1),(1),(1),(1);

INSERT INTO t3
VALUES(2),(2),(2),(2),(2),(2),(2),(2),(2),(2);

select * from t1;
select* from t2;
select* from t3;


select * from t1
inner join t2 on t1.id1 = t2.id2

select * from t1
right join t2 on t1.id1 = t2.id2

select * from t1
left join t2 on t1.id1 = t2.id2

select * from t1
full outer join t2 on t1.id1 = t2.id2

select * from t1
inner join t3 on t1.id1 = t3.id3

select * from t1
right join t3 on t1.id1 = t3.id3

select * from t1
left join t3 on t1.id1 = t3.id3

select * from t1
full outer join t3 on t1.id1 = t3.id3