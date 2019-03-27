Set Transaction isolation level repeatable read
set transaction isolation level read committed
set Transaction isolation level read uncommitted
set transaction isolation level serializable


Begin tran
--Transaktion
commit tran
--eller
rollback tran

select * 
from sys.dm_tran_locks 
