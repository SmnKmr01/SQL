select * from tblgender

create table tblGender (
ID int Primary Key,
Gender varchar(20))

insert into tblGender(ID, Gender)
values(1,'Male'),
(2,'Female'),
(3,'Unknown')

CREATE TABLE tblPerson (
    ID INT,
    Name VARCHAR(50),
    Email VARCHAR(100),
    GenderId INT
)
INSERT INTO tblPerson(ID, Name, Email, GenderId) VALUES
(1, 'John', 'j@j.com', 1),
(2, 'Mary', 'm@m.com', 2),
(3, 'Simon', 's@s.com', 1),
(4, 'Sam', 'sam@sam.com', 1),
(5, 'May', 'may@may.com', 2),
(6, 'Kenny', 'k@k.com', 3);

alter table tblPerson
DROP COnstraint DF_tblPerson_GenderId


alter table tblPerson
ADD Constraint DF_tblPerson_GenderId
Default 3 for GenderID

select * from tblPerson

insert into tblPerson(ID, Name, Email) Values(8,'sara', 'r@r.com')