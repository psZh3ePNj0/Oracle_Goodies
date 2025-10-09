set pages 0
spool ind_log_exec.sql
select 'ALTER INDEX '||owner||'.'||index_name||' LOGGING;'
from dba_indexes
where logging = 'NO'
order by 1;
spool off
