set echo off
set feedback off
column name format a50
column status format a78
column pid format a7
column type format a12
column LOGSTDBY_ID format 999 
column status_code format 99999 
column read_scn format 99,999,999,999
column high_scn format 99,999,999,999
column TIME_MP format 99,999,999,999
column SCN_BAS format 99,999,999,999 
column HIGHEST_SCN_READ format 99,999,999,999 
column LOWEST_SCN_READ format 99,999,999,999 
column "PREV APPLIED"  format  99,999,999,999
column delay format 999.99
column data_type format a30
column MinArch2Start format 9999999
set line 200
set pagesize 100
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
--select * from DBA_LOGSTDBY_EVENTS order by EVENT_TIME
--/
 
--SELECT L.SEQUENCE#, L.FIRST_TIME,
-- (CASE WHEN L.NEXT_CHANGE# < P.READ_SCN THEN 'YES'
--           WHEN L.FIRST_CHANGE# < P.APPLIED_SCN THEN 'CURRENT'
--           ELSE 'NO' END) APPLIED
--   FROM DBA_LOGSTDBY_LOG L, DBA_LOGSTDBY_PROGRESS P
--   where L.FIRST_TIME > sysdate-5
--   ORDER BY SEQUENCE#
--/

select * from v$logstdby_stats where value <> '0' and name not like 'record%'
/
select SERIAL#, LOGSTDBY_ID "ID", PID,TYPE,  STATUS,HIGH_SCN from v$logstdby
/
--select *  from sys.SMON_SCN_TIME where SCN_BAS > (select max(HIGH_SCN) from v$logstdby ) 
--and rownum < 5
--UNION
--select *  from sys.SMON_SCN_TIME where SCN_BAS = (select max(SCN_BAS) from sys.SMON_SCN_TIME  ) 
--and rownum < 5
--/

--select * from dba_logstdby_unsupported where owner not in 
--('SYS','SYSTEM','OUTLN','WKSYS','ORDSYS','MDSYS','CTXSYS','XDB',
--'ODM','RMAN','QS_WS','SH','OE','HR','ODM_MTR','QS_CS','QS_CBADM',
--'QS_OS','PM','QS_ES','QS','SCOTT','WMSYS','PERFSTAT','DBPROC','TOAD')
--and table_name <> 'PLAN_TABLE'
--and table_name <> 'MICROSOFTDTPROPERTIES'
--/
--select APPLIED_SCN, READ_SCN, NEWEST_SCN from dba_logstdby_progress
--/
select sysdate,applied_time,(sysdate -applied_time)*24 "DELAY",READ_SCN,HIGHEST_SCN_READ,LOWEST_SCN_READ,APPLIED_SCN "PREV APPLIED",NEWEST_SCN,"No2Read", "MinArch2Start" 
from dba_logstdby_progress,
(select count(*) "No2Read" from sys.SMON_SCN_TIME where SCN_BAS > (select max(HIGH_SCN) from v$logstdby ) ),
(select  max(HIGH_SCN) "HIGHEST_SCN_READ" , min(HIGH_SCN) "LOWEST_SCN_READ" from v$logstdby ),
(select thread# thr#, max(sequence#) "MinArch2Start" from dba_logstdby_log log, dba_logstdby_progress prog where log.next_change# < prog.read_scn group by thread#)
/

set feedback on
set echo on
