Set Transaction isolation level repeatable read
set transaction isolation level read committed
set Transaction isolation level read uncommitted
set transaction isolation level serializable

--select * from Fighters

Begin tran
select * from Fighters WHERE Age = '18'

commit tran
--eller
rollback tran

select * 
from sys.dm_tran_locks 
