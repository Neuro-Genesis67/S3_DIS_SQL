drop table kunde
drop table bestilling

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
insert into kunde values (2, 'Xiaoyu', 7800);
insert into kunde values (3, 'Nina', 6760);

insert into bestilling values (4, 'Hæksaks', 22);
insert into bestilling values (5, 'Bælte', 1);
insert into bestilling values (6, 'Faldskærm', 3);
---------------------------

---------------------------
create view kundeView AS 
SELECT * FROM kunde
UNION 
SELECT * FROM ddB.dbo.kunde 
---------------------------

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

	INSERT INTO kundeView values (7, 'Karsten gråhår', 9999)
---------------------------

