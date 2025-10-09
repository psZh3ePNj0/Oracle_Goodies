clear breaks
break on granted_role skip 2

col granted_role	format a30
col grantee		format a30

ttitle 'DB Roles to Grantees'

select name, granted_role, grantee 
  from dba_role_privs, v$database
 order by granted_role, grantee
/
break on grantee skip 2

ttitle 'DB Grantees and Granted Roles'

select name, grantee, granted_role
  from dba_role_privs, v$database
 order by grantee, granted_role
/
