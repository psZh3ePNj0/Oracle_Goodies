column owner format a1 noprint
column object_name format a1 noprint
column order_col format a1 noprint
column cmd format a132

set heading off
set pagesize 0
set linesize 180
set echo off
set feedback off

spool recompile-sql.sql

select 'set echo on' from dual;



select 'spool recompile.lis' from dual;

select distinct 'alter session set current_schema=' ||
        owner || ';' cmd,    owner,
        1 order_col,
        NULL object_name
from dba_objects
where status = 'INVALID'
and object_type in ('PACKAGE','PACKAGE BODY','VIEW','PROCEDURE',
                      'FUNCTION','TRIGGER')
union

select 'ALTER ' ||
        decode(object_type, 'PACKAGE BODY', 'PACKAGE', object_type) || ' ' ||
        owner || '.' || object_name || ' COMPILE' ||
        decode(object_type, 'PACKAGE BODY', ' BODY', '') ||    ';' cmd,
        owner,
        2 order_col,
        object_name
from dba_objects outer
where status = 'INVALID'
and object_type in ('PACKAGE','PACKAGE BODY','VIEW','PROCEDURE','FUNCTION','TRIGGER')
and (object_type <> 'PACKAGE BODY'
or not exists
        (select null
        from dba_objects
        where owner = outer.owner
        and object_name = outer.object_name
        and object_type = 'PACKAGE'
        and status = 'INVALID'))
        order by 2,3,4
/
spool off;
set heading on
set feedback on
set pagesize 9999
set linesize 80
