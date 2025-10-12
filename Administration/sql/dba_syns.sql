-- program:  dba_syns
-- purpose:  report on dba_synonyms 
-- params:   none
-- history:
-- 	2011/11/20: gjose
--
col  OWNER		format a20
col  SYNONYM_NAME	format a32
col  TABLE_OWNER	format a12
col  TABLE_NAME		format a30
col  DB_LINK		format a20

set  lines 120 pages 100 feedback 1 echo off 

spool dba_syns

--@timestamp

ttitle 'Count Synonyms from DBA_SYNONYMS'
select owner, count(*)
  from dba_synonyms
 group by owner
 order by owner
/
ttitle 'List Synonym Owners-Table Owners from DBA_SYNONYMS'
select owner, table_owner, count(*)
  from dba_synonyms
 group by owner, table_owner
 order by owner, table_owner
/
ttitle 'List DB_LINK Synonyms from DBA_SYNONYMS'
select owner, synonym_name, table_name, table_owner, db_link
  from dba_synonyms
 where db_link is not null
 order by owner, synonym_name, table_name, table_owner
/
spool off


