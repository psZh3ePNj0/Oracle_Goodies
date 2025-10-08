select p.spid,s.sid,s.serial#,machine,s.username,s.terminal,action,status
from sys.v_$process p, sys.v_$session s
where p.addr = s.paddr
and p.spid=&1
/
