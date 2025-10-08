--col Mbytes form 999,999,999,999 heading "Free MBytes"
--col percentfree form 999.999 heading "Percent Free"
--spool freesga.lst


select  con_id,inst_id,pool,name, bytes / power(1024,3) MBytes 
from 	gv$sgastat
where	name like '%free memory%'
/

--spool off 

clear col