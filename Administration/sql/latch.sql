set echo off
Prompt Show Latch hit rates less than 100%
set line 500
column "Sleeps per day" format 99,999,999
column "Sleeps Total" format   99,999,999
column "Gets per day" format   99,999,999,999
column "Gets Total" format     99,999,999,999
column "Misses per day" format 99,999,999
column "Misses Total" format   99,999,999
column "Latch with one sleep per day" format a30
column "Latch HR" format 999.9999
select name "Latch with one sleep per day",
(1-(sleeps+misses)/decode(gets,0,1,gets))*100 "Latch HR",
sleeps "Sleeps Total",sleeps/(sysdate-startup_time) "Sleeps per day"
,gets "Gets Total",gets/(sysdate-startup_time) "Gets per day"
,misses "Misses Total",misses/(sysdate-startup_time) "Misses per day"
from v$latch ,v$instance
where (1-(sleeps+misses)/decode(gets,0,1,gets))*100 < 100
order by "Latch HR" desc;
