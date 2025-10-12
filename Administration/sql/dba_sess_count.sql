-- program: dba_sess_count
-- purpose: list currently connect DB users by session count - order by user, machine
-- params:  none
-- history:
--	2012/04: long saga of stepwise improvements
--	2013/02/08: gjose - latest version - use machine not terminal
--	xxxx/xx/xx: gjose - next fix = remove tns v1-v3 from module
--      xxxx/xx/xx: ccartwright - minor change - generalized user list - please modify this list for your objectives
--
set echo off
col INST_ID			format 99	heading 'IID'
col SPID			format a6
col PORT			format 99999
col SID    			format 9999
col SERIAL# 			format 99999
col USERNAME			format a6	heading 'User'
col SCHEMANAME		       	format a12	heading 'Schema'
col OSUSER			format a16	heading 'Osuser'
col STATUS			format a8
col LAST_CALL_ET		format 99999999	heading 'Last Call'
col PROGRAM 			format a15
col MACHINE			format a32
col TERMINAL			format a16
col LOGON_TIME			format a18
col MODULE			format a34
col SORT			noprint
clear  breaks
clear  computes
ttitle 'DB Session Counts by Instance, OSUser and Schema'
break on schemaname skip 1 
compute count label 'Connections' of schemaname on schemaname
set lines 90  pages 60

select 	p.inst_id,		
	osuser,
	schemaname,
	trim(machine) machine,
	count(*)
from GV$process p, GV$session s
where s.paddr   = p.addr
  and s.inst_id = p.inst_id
  and s.username not in ('SYS','SYSTEM','DBSNMP','SYSMAN','OTHER-NATIVE-ORACLE-USERs','<CORE-APP-CONFIGURATION-USERS>')
 group by 
	p.inst_id,              
        osuser,
        schemaname,
        trim(machine) 
 order by 
	p.inst_id,              
        osuser,
        schemaname,
        trim(machine)
/
