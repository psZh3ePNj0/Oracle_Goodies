set lines 200
 
col privilege format a12
col grantee   format  a25
col owner format  a25
col directory_name format  a100
 
select
   p.grantee, p.privilege, p.owner, d.directory_name
from
   dba_tab_privs p,
    dba_directories d
where
   p.table_name=d.directory_name
/
