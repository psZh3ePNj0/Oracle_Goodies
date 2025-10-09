-- program: dba_dirs
-- purpose: list all directory objects defined in the database
-- params:  none
-- history:
--      2011/03/31
--
-- Define columns
col GRANTEE             format a20
col OWNER               format a10
col PRIVILEGE           format a10
col TABLE_NAME          format a30      heading 'DIRECTORY NAME'
col DIRECTORY_NAME      format a24
col DIRECTORY_PATH      format a60
break on table_name skip 1

-- define default settings
--
set pages 60            lines 100
set echo off            feedback off	heading off  
set trimspool on        trimout on

select 'Logged in as '||user||'@'||instance_name
  from v$instance
/
set heading on feedback 1

ttitle 'List of All Database Directories'
select * 
  from dba_directories
 order by owner, directory_name
/
ttitle 'List of Database Directories and Access Privileges'
select p.owner, p.table_name, p.grantee, p.privilege
  from dba_tab_privs p, dba_directories d
 where p.table_name = d.directory_name
   and p.grantor    = d.owner
-- order by p.owner, p.table_name, p.grantee
  order by p.table_name, p.grantee, p.privilege
/
ttitle off


