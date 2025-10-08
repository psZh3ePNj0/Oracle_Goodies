--DF Needing Recovery

col change# format 9999999999999;
set line 300;
col tablespace format a20;
col datafile format a60; 
col error format a20;
col r_time format a20;

SELECT 	t.name tablespace,d.name datafile,d.file#,r.online_status, r.error,r.change#, to_char(r.time,'yyyy-mm-dd hh24:mi:ss') r_time
FROM v$datafile d, v$tablespace t, v$recover_file r
WHERE t.ts# = d.ts# 
AND d.file# = r.file#
order by tablespace, datafile
/
