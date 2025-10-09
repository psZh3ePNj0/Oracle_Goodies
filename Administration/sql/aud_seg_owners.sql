clear breaks

col owner		format a20
col tablespace_name	format a32
col bytes		format 999,999,999,999,999

set lines 100 pages 50

break on report skip 2
compute sum of bytes on report 

ttitle 'Total Bytes by Owner'

select name, owner, sum(bytes) bytes
  from dba_segments, v$database
 group by name, owner
 order by name, owner
/
break on owner skip 2
compute sum of bytes on owner 

ttitle 'Total Bytes by Owner and Tablespace'

select name, owner, tablespace_name, sum(bytes) bytes
  from dba_segments, v$database
 group by name, owner, tablespace_name
 order by name, owner, tablespace_name
/

