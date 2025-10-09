set lines 200;
col NAME format a40;
col TYPE format a20;
col TBLSP format a5;
col owner format a20;

SELECT DISTINCT(segment_name) as NAME ,segment_type as TYPE,tablespace_name as TBLSP,
	extents,(bytes / (1024 * 1024)) as MBytes,owner
FROM dba_segments 
WHERE segment_type IN ('INDEX','TABLE','TABLE SUBPARTITION')
AND owner NOT IN ('SYS','SYSTEM')
AND extents > 4
AND TABLESPACE_NAME='USERS'
ORDER BY owner,extents,MBytes ASC;
