set echo off
SET feedback OFF pagesize 62 space 3
PROMPT Showing DATA DICTIONARY ACTIVITY...
COLUMN gets FORMAT 99,999999
COLUMN pm FORMAT 999.99 HEADING "% miss"
BREAK ON REPORT
COMPUTE Sum OF gets getmisses ON REPORT

SELECT UNIQUE parameter "Cache Entry", 
gets "Gets", /* Read from memory */
getmisses "Misses", /* Read from disk */
getmisses/(gets+getmisses)*100 pm
FROM v$rowcache
WHERE gets+getmisses <> 0;

COLUMN proc HEADING 'Row (Data Dictionary) cache hit rate in %'
SELECT (1-(Sum(getmisses)/Sum(gets)))*100 proc FROM v$rowcache;

PROMPT
PROMPT NB! If the ratio is < 90% then increase
PROMPT NB! the initialization parameter SHARED_POOL_SIZE
PROMPT
PROMPT NB! Values of DC_TABLE_GRANTS, DC_USER_GRANTS, DC_USERS
PROMPT NB! should be < 5% each
set echo on
