/****************************************************************************
****************Christophe Cartwright 03 Dec 2008 ***************************
********Dynammically resize the UNDO RETENTION ******************************
********parameter to the OPTIMAL UNDO RETENTION value************************
********This will help with long running queries that  **********************
********occassionally get the "snapshot too old" error**********************/

SET LINESIZE 175;
SET HEAD OFF;
SET ECHO OFF;
SET FEED OFF;
SPOOL UNDO_RETENTION_Exec.sql;


SELECT 	'ALTER SYSTEM SET UNDO_RETENTION = '||ROUND ((d.undo_size / (TO_NUMBER(f.value) * g.undo_block_per_sec)))||';'
FROM 	(
		SELECT SUM(a.bytes) undo_size
		FROM v$datafile a,v$tablespace b,dba_tablespaces c
        	WHERE c.contents = 'UNDO'
        	AND c.status = 'ONLINE'
        	AND b.name = c.tablespace_name
        	AND a.ts# = b.ts#
      	) d,
       	v$parameter e,
       	v$parameter f,
       	(
       		SELECT MAX(undoblks / (	(end_time-begin_time) *	3600	*	24)	)
              		undo_block_per_sec
        	FROM 	v$undostat
       	) g
WHERE 	e.name = 'undo_retention'
  AND 	f.name = 'db_block_size';

SPOOL OFF;



