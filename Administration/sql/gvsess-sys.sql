-- 
-- sql/vsess-sys.sql
-- 
col inst_id		format 9999		heading INST
col username		format a8
col schema#		format 9999999
col schemaname		format a10
col osuser		format a10
col machine		format a38
col terminal		format a30
col program		format a20
col status		format a8

set  lines 156  pages 120  feedback 1

select inst_id, username, status, schemaname, osuser, machine, terminal, program 
  from gv$session
 where schema# = 0
 order by inst_id, username, osuser
/

