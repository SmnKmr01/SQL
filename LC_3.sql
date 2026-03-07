drop table Person
create table Person(
id int PRIMARY KEY,
email varchar(50)
)

insert into Person(id, email)
VALUES(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com')

select * from Person

select email
FROM Person
GROUP BY email
Having count(distinct id) >1 