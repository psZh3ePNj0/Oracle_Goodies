-- program: dba_usr_summ
-- purpose: list currently connect TIVOLI sessions -  order by user, machine
-- params:  none
-- history:
--	2012/04: long saga of stepwise improvements
--	2013/02/08: gjose - latest version - use machine not terminal
--	xxxx/xx/xx: gjose - next fix = remove tns v1-v3 from module
--
set echo off
col INST_ID			format 99	heading 'IID'
col SPID			format a6
col PORT			format 99999
col SID    			format 9999
col SERIAL# 			format 99999
col USERNAME			format a6	heading 'User'
col SCHEMANAME		       	format a8 	heading 'Schema'
col OSUSER			format a10	heading 'Osuser'
col STATUS			format a8
col LAST_CALL_ET		format 99999999	heading 'Last Call'
col PROGRAM 			format a10
col MACHINE			format a40
col TERMINAL			format a16
col LOGON_TIME			format a18
col MODULE			format a42
col SORT			noprint

clear  breaks
clear  computes
col USERNAME			format a24	heading 'User'
col SCHEMANAME		       	format a24	heading 'Schema'

ttitle 'Session Summary'
break on inst_id skip 2 
compute sum label 'Connections' of inst_id on inst_id

select 	p.inst_id inst_id,		
	osuser,
	schemaname,  count(*)
from GV$process p, GV$session s
where s.paddr   = p.addr
  and s.inst_id = p.inst_id
 group by p.inst_id, osuser, schemaname
 order by p.inst_id, osuser, schemaname
/


