drop table kunde
drop table postering
drop view kundeView

create table kunde (
kundeid int primary key,
navn varchar(25),
postnr char(4));

create table postering (
kundeid int, 
beloeb int);

----------------------------
go
create view kundeView as 
select * from kunde
union
select * from ddA.dbo.kunde
--------------------------

insert into kunde values (2, 'Sombra', 6200);
insert into kunde values (4, 'Shaniqua', 7261);
insert into kunde values (6, 'Shaheen', 2661);

insert into postering values (1, 100);
insert into postering values (2, 200);
insert into postering values (3, 300);
insert into postering values (4, 400);
insert into postering values (5, 500);
insert into postering values (6, 600);

--------------------------
--Lav en query på både database A og B, der finder alle kunder og summen af deres posteringer.
--Code goes here


-----practical-----
select * from kundeView
select * from kunde
select * from postering