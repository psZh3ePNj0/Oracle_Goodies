set echo off
col component	format a30
col status	format a10

set lines  120  pages 60

set heading off

select 'Database ==> '||name||' === '||to_char(sysdate,'mm/dd/yy hh24:mi')
  from v$database
/
set heading on 

ttitle 'GV$SGA_RESIZE_OPS - Allocation Failures by node and pool type'

select inst_id, component, oper_type, oper_mode, status, count(*)
  from gv$sga_resize_ops
 group by inst_id, component, oper_type, oper_mode, status
 order by inst_id, component, oper_type, oper_mode, status
/
