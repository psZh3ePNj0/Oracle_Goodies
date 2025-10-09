
set lines 300;
set numformat 999,999,999,999,999
column file_name format a50;
column tablespace_name format a20;

ttitle GV$DBA_TEMP_FILES
select * from dba_temp_files
/


ttitle GV$DBS_TEMP_FREE_SPACE
select * from dba_temp_free_space
/
ttitle GV$SORT_SEGMENT
select * from v$sort_segment
/
ttitle GV$TEMPSEG_USAGE
select * from v$tempseg_usage
/



