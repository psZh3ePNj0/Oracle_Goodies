set echo off
SET feedback OFF
set linesize 500
PROMPT Showing Library Cache Activity...
COLUMN gethitratio FORMAT 999.9999 HEADING 'GETHITR'
COLUMN pinhitratio FORMAT 999.9999 HEADING 'PINHITR'
COLUMN gets FORMAT 999999990 HEADING 'GETS'
COLUMN gethits FORMAT 999999990 HEADING 'GETHITS' 
COLUMN pins FORMAT 999999990 HEADING 'PINS'
COLUMN pinhits FORMAT 999999990 HEADING 'PINHITS'
COLUMN reloads FORMAT 999999990 HEADING 'RELOADS'
COLUMN invalidations FORMAT 999999 HEADING 'INV'
COLUMN Executions format 999,999,999,999
BREAK ON REPORT
COMPUTE Sum OF pins reloads ON REPORT

SELECT * FROM v$librarycache;
COLUMN proc HEADING 'RELOADS/PINS in %'

PROMPT
select sum(pins) Executions, sum(pinhits) "Execution Hits",
((sum(pinhits) / sum(pins)) * 100) phitrat,
sum(reloads) Misses,
((sum(pins) / (sum(pins) + sum(reloads))) * 100) hitrat
from v$librarycache;
PROMPT
PROMPT NB! If the ratio is < 99.9% then increase
PROMPT NB! the initialization parameter SHARED_POOL_SIZE

  select count(*) number_of_waiters
   from v$session_wait w, v$latch l
  where w.wait_time = 0
   and  w.event     = 'latch free'
   and  w.p2        = l.latch#
   and  l.name      like 'library%';

SET termout ON feedback ON echo on
