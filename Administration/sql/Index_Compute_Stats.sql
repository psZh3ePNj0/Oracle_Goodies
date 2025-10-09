SET LINES 200;
SET HEADING OFF;
SET TERM OFF;
SET FEED OFF;
SET VERIFY OFF;
SET ECHO OFF;

SPOOL Index_Compute_Stats_Exec.sql;

SELECT 'alter index ' || index_name  || ' compute statistics;' FROM user_indexes;

SPOOL OFF;
EXIT;
