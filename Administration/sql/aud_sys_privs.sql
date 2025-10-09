clear breaks
break on grantee skip 2

col grantee 	format a30
col privilege	format a40

ttitle 'System Privileges by Grantee'

select name, grantee, privilege 
  from dba_sys_privs, v$database
 order by grantee, privilege
/

