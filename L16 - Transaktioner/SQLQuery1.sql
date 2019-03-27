drop table Fighters

create table Fighters (
	Name varchar(50),
	Age int,
	Stances int,
)

insert into Fighters values 
	('Xiaoyu', 18, 4),
	('Nina', 24, 3),
	('Miguel', 34, 2);

Begin tran
UPDATE Fighters 
SET Age = '99'
WHERE Name = 'Xiaoyu'
ROLLBACK TRAN

select * from Fighters

