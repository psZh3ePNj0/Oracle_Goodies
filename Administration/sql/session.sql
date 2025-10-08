set echo off
set pagesize 180
set line 280
prompt Show number of connections per machine, osuser and username 
prompt For connection pooling
column machine format a30
column osuser format a25
column username format a22
column program format a100
prompt Total Sessions ( real time )
select count(*) from v$session;
select nvl(machine,'INTERNAL') "MACHINE",nvl(osuser,'INTERNAL') "OSUSER",nvl(username,'INTERNAL') "USERNAME",status,count(*),program
--,sid,serial#
from v$session 
group by machine,osuser,username,status,program
--,sid,serial#
order by status,username,program
;
