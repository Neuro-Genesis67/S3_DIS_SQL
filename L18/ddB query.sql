drop table kunde
drop table postering

create table kunde (
kundeid int primary key,
navn varchar(25),
postnr char(4));

create table postering (
kundeid int, 
beloeb int);

insert into kunde values (4, 'Sombra', 6200);
insert into kunde values (5, 'Shaniqua', 7261);
insert into kunde values (6, 'Shaheen', 2661);

insert into postering values (1, 200);
insert into postering values (2, 400);
insert into postering values (3, 600);

---------------------------
create view kundeView as 
select kundeid, navn, postnr 
from kunde

drop view kundeView

select * from kundeView
--------------------------






select * from kunde
select * from postering