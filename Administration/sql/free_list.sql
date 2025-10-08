SET verify OFF feedback OFF
COLUMN s_v FORMAT 9,999,999,999,999 HEADING 'Total Num of Requests' NEW_VALUE tnr
COLUMN count FORMAT 99999990 NEW_VALUE cnt
PROMPT Examining Free List Contention...

SELECT class, count FROM v$waitstat WHERE class = 'free list';

SELECT Sum(value) s_v FROM v$sysstat
WHERE name IN ('db block gets', 'consistent gets');

COLUMN proc HEADING 'Ratio in %'
PROMPT
SELECT &cnt/&tnr * 100 proc FROM dual;

PROMPT
PROMPT NB! If the ratio is > 1% then increase
PROMPT NB! FREELIST storage parameter of STORAGE CLAUSE

SET feedback ON
