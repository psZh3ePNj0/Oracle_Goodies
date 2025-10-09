set pages 60 lines 120
col name	format a30
col path	format a50
col total_mb	format 999,999,999

select name, path, total_mb
from v$asm_disk order by name
/

