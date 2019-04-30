drop table kunde
drop table bestilling
drop view kundeView
---------------------------

---------------------------
create table kunde (
kundeid int primary key,
navn varchar(25),
postnr char(4));

create table bestilling (
kundeid int,
varenavn varchar(25),
antalVarer int);
---------------------------


---------------------------
insert into kunde values (1, 'Pedro', 8920);
insert into kunde values (3, 'Xiaoyu', 7800);
insert into kunde values (5, 'Nina', 6760);

insert into bestilling values (1, 'Hæksaks', 1);
insert into bestilling values (2, 'Bælte', 3);
insert into bestilling values (3, 'Faldskærm', 5);
insert into bestilling values (4, 'Ulddyr', 200);
insert into bestilling values (5, 'Elcykel', 1);
insert into bestilling values (6, 'Mascara', 3);
---------------------------

---------------------------
go
create view kundeView as 
select * from kunde
union
select * from ddB.dbo.kunde
--------------------------

---------------------------
CREATE TRIGGER kundeViewTrigger 
on kundeView
INSTEAD OF INSERT 
AS 
BEGIN
	IF ((SELECT i.kundeid from INSERTED i) % 2 = 0) 
	INSERT INTO kunde(kundeid, navn, postnr)
	SELECT i.kundeid, i.navn, i.postnr 
	FROM INSERTED i

	ELSE 
	INSERT INTO ddB.dbo.kunde(kundeid, navn, postnr)
	SELECT i.kundeid, i.navn, i.postnr 
	FROM INSERTED i
	END

	--INSERT INTO kundeView values (7, 'Karsten gråhår', 9999)
	--delete from ddB.dbo.kunde where kundeid = 7;
---------------------------
-- Summen af alle bestillinger --
--Code goes here





---------------------------
SELECT * FROM kunde
select * from bestilling
SELECT * FROM ddB.dbo.kunde 