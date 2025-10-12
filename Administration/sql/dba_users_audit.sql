-- program: dba_users_audit
-- purpose: Report on Oracle user accounts
-- params:  none
-- history:
-- 	2013/11/18: gjose
--
col ACCOUNT_STATUS 		format a20		heading STATUS
col AUTHENTICATION_TYPE		format a8
col CREATED			format DATE
col DEFAULT_TABLESPACE		format a14		heading DFLT_TBS
col EDITIONS_ENABLED		format a1
col EXPIRY_DATE			format DATE
col EXTERNAL_NAME		format a14
col FORENAME			format a15
col INITIAL_RSRC_CONSUMER_GROUP	format a24		heading CONSUMER_GROUP
col LAST_PASSWORD_CHANGE_DATE	format a12 		heading LAST_PW_CHG
col LOCK_DATE			format DATE
col PASSWORD			format a8
col PASSWORD_VERSIONS		format a8
col PROFILE			format a24
col SURNAME			format a20
col TEMPORARY_TABLESPACE	format a8  	 	heading TEMP_TBS
col USER_ID			format 9999999999	heading UID
col USERNAME			format a20

set pages 60 lines 175  echo off feedback off  heading off

spool dba_users_audit

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
	 CREATED,
	 PROFILE,
	 INITIAL_RSRC_CONSUMER_GROUP,
	 EXTERNAL_NAME
  from dba_users
 order by username
/

spool off

