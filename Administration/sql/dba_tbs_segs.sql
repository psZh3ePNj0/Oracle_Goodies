set lines 300;
column file_name format a40;
column tablespace_name format a30;
column  AUTOEXTENSIBLE format a15;

ttitle GV$DBA_TEMP_FILES
select file_name, file_id,tablespace_name,AUTOEXTENSIBLE, 
		bytes / (1024*1024*1024) as GB ,maxbytes / (1024*1024*1024) as MaxGB,user_bytes / (1024*1024*1024) as UserGB,
		status,increment_by
from dba_data_files
order by tablespace_name,file_id
/

