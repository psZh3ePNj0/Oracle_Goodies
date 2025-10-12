-- program: crm_users
-- purpose: Report on APPLICATION users with Oracle accounts
-- params:  none
-- history:
-- 	2011/12/02: gjose
--	2012/01/19: gjose: add db name and ttitle
--
col ACCOUNT_STATUS 		format a14		heading STATUS
col AUTHENTICATION_TYPE		format a8
col CREATED			format DATE
col DEFAULT_TABLESPACE		format a8 		heading DFLT_TBS
col EDITIONS_ENABLED		format a1
col EXPIRY_DATE			format DATE
col EXTERNAL_NAME		format a14
col FORENAME			format a15
col INITIAL_RSRC_CONSUMER_GROUP	format a24		heading CONSUMER_GROUP
col LAST_PASSWORD_CHANGE_DATE	format a12 		heading LAST_PW_CHG
col LOCK_DATE			format DATE
col PASSWORD			format a8
col PASSWORD_VERSIONS		format a8
col PROFILE			format a20
col SURNAME			format a20
col TEMPORARY_TABLESPACE	format a8  	 	heading TEMP_TBS
col USER_ID			format 9999999999	heading UID
col USERNAME			format a8

set pages 60 lines 175  echo off feedback off  heading off

spool crm_users

select 'Oracle Users in '||upper(name)||' Database --- '||to_char(sysdate,'dd-MON-yyyy hh:mi')
  from v$database
/
set feedback 1  heading on

ttitle 'DBA Users View'

select USERNAME,
	 USER_ID,
	 PASSWORD,
	 ACCOUNT_STATUS,
	 LOCK_DATE,
	 EXPIRY_DATE,
	 DEFAULT_TABLESPACE,
	 TEMPORARY_TABLESPACE,
	 CREATED,
	 PROFILE,
	 INITIAL_RSRC_CONSUMER_GROUP,
	 EXTERNAL_NAME,
	 PASSWORD_VERSIONS,
	 EDITIONS_ENABLED,
	 AUTHENTICATION_TYPE
  from dba_users
 order by username
/

spool off

