-- program: dba_usr_node
-- purpose: list currently connect DB users - order by user, machine
-- params:  none
-- history:
--	2012/04: long saga of stepwise improvements
--	2013/02/08: gjose - latest version - use machine not terminal
--	xxxx/xx/xx: gjose - next fix = remove tns v1-v3 from module
--  xxxx/xx/xx: ccartwright - minor change - generalized user list - please modify this list for your objectives
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

ttitle '<Desired> Application User Connections by Module/Program'
break on schemaname skip 1 
compute count label 'Connections' of schemaname on schemaname

set lines 174  pages 60

select 	p.inst_id,		spid,			port	, 
	s.sid,			s.serial#,	
	to_char(logon_time,'mm/dd/yy hh24:mi:ss') logon_time,
	upper(osuser) sort,	osuser,
	schemaname,
	s.status,		trim(machine) machine, 
	module,			substr(p.program,8,8)||' '||substr(p.program,28,6) program
from GV$process p, GV$session s
where s.paddr   = p.addr
  and s.inst_id = p.inst_id
  and s.osuser not in ('<core-configuration-user-1>','<core-application-configuration-user-2>','<core-configuration-user-n>') 
  and s.username not in ('DBSNMP','SYSMAN','SYS','SYSASM','DBSNMP','OTHER-NATIVE-ORACLE-USERs')
  and schema# <> 0
 order by p.inst_id, upper(s.osuser), machine, module
/

