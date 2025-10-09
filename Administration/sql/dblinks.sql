set echo off

col owner		format a12
col db_link		format a30
col username		format a12
col host		format a20
col created		format date

set lines 100  pages 100

@timestamp
set heading off
select '==========  DBA DB Links  =========='
  from dual
/
set heading on
select * 
  from dba_db_links
 order by owner, db_link
/

