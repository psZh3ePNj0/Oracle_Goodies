rem
rem script to compile all invalid objects in the database
rem
rem user should have dba privilege to execute this
rem
rem Doug Hahn
rem
set termout off echo off pages 500 trims off lines 60
set verify off
set feedback off
spool recomp.sql
select 'alter '||decode(object_type,'PACKAGE BODY','PACKAGE',object_type)
|| ' '|| object_name ||' compile' ||
decode(object_type, 'PACKAGE BODY', ' body;', ';') || decode(object_type, 'VIEW', ' ', '                                           show err')
from user_objects
where status = 'INVALID'
/
--select 'alter index '||owner||'.'||index_name||' rebuild;' from dba_indexes 
--where status <> 'VALID'
/
spool off
set termout on feedback on echo on
select 'alter '||decode(object_type,'PACKAGE BODY','PACKAGE',object_type)
|| ' '|| object_name ||' compile' ||
decode(object_type, 'PACKAGE BODY', ' body;', ';') || decode(object_type, 'VIEW', ' ', '                                           show err')
from user_objects
where status = 'INVALID'
/
--select 'alter index '||owner||'.'||index_name||' rebuild;' from dba_indexes 
--where status <> 'VALID'
/
set termout on feedback on echo on
spool invalid_obj.lis
rem @recomp.sql

set verify on
set lines 80 pages 25
set feedback on
prompt Script file saved at recomp.sql
prompt
