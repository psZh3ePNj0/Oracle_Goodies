set echo off
col INST_ID                     format 99       heading 'IID'
col SPID                        format a6
col PORT                        format 99999
col SID                         format 9999
col SERIAL#                     format 99999
col USERNAME                    format a6       heading 'User'
col SCHEMANAME                  format a12      heading 'Schema'
col OSUSER                      format a16      heading 'Osuser'
col STATUS                      format a8
col LAST_CALL_ET                format 99999999 heading 'Last Call'
col PROGRAM                     format a15
col MACHINE                     format a32
col TERMINAL                    format a16
col LOGON_TIME                  format a18
col MODULE                      format a36
col SORT                        noprint


clear  breaks
clear  computes

ttitle 'User Connections to Database by Module/Program'
break on schemaname skip 1
compute count label 'Connections' of schemaname on schemaname

set lines 200  pages 60



SELECT
p.inst_id,
s.sid,s.serial#,s.username
,s.status
,substr(s.machine,1,10)
,s.osuser,s.module
,to_char(logon_time, 'mm/dd/yy hh24:mi:ss') logon_time
-- idle time
-- days separately
,substr('0'||trunc(last_call_et/86400),-2,2) || ':' ||
-- hours
substr('0'||trunc(mod(last_call_et,86400)/3600),-2,2) || ':' ||
-- minutes
substr('0'||trunc(mod(mod(last_call_et,86400),3600)/60),-2,2) || ':' ||
--seconds
substr('0'||mod(mod(mod(last_call_et,86400),3600),60),-2,2) idle_time
from GV$process p, GV$session s
WHERE s.username IS NOT NULL
AND p.addr(+) = s.paddr
AND s.username not in ('SYS','SYSTEM','DBSNMP','SYSMAN','TIVOLI')
AND s.status ='INACTIVE'
AND last_call_et > 1800
ORDER BY
idle_time desc;

