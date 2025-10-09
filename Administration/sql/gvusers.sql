select
 STATUS , SERVER , SCHEMANAME , OSUSER
, PROCESS , MACHINE , PORT , TERMINAL , PROGRAM
, MODULE
from gv$session
 where schemaname not in ('SYS','SYSMAN','DBSNMP')
order by machine, program
/

