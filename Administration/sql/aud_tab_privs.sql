
clear breaks
break on grantee skip 2

col  GRANTEE		format a24
col  OWNER		format a20
col  TABLE_NAME		format a40
col  GRANTOR		format a20
col  PRIVILEGE		format a40
col  GRANTABLE		format a3
col  HIERARCHY		format a3

set lines 150  pages 50

ttitle 'Table Access Privileges by Grantee'

select name, grantee, owner, privilege, count(*) 
  from dba_tab_privs, v$database
 group by name, grantee, owner, privilege
 order by name, grantee, owner, privilege
/

