
col sysdate		format a20
col current_timestamp	format a38
col systimestamp	format a36
col localtimestamp	format a30

set lines 124  pages 20

select
  to_char(sysdate,'dd-MON-yyyy hh24:mi'),
  current_timestamp,
  systimestamp,
  localtimestamp
from
  dual
/
