set echo off
clear breaks

col USERNAME			format a22
col USER_ID			format 999	heading UID
col PASSWORD			format a30
col ACCOUNT_STATUS 		format a20
col LOCK_DATE			format DATE
col EXPIRY_DATE			format DATE
col DEFAULT_TABLESPACE		format a15	heading DFLT_TBS
col TEMPORARY_TABLESPACE	format a10  	heading TEMP_TBS
col CREATED			format DATE
col PROFILE			format a25
col INITIAL_RSRC_CONSUMER_GROUP	format a30
col EXTERNAL_NAME		format a4000
col PASSWORD_VERSIONS		format a8
col EDITIONS_ENABLED		format a1
col AUTHENTICATION_TYPE		format a8

set pages 50 lines 150

ttitle 'Database User Accounts'

select d.name, u.username, u.account_status, u.lock_date, u.expiry_date, u.created,
	u.default_tablespace, u.temporary_tablespace, u.profile
  from dba_users u, v$database d
 order by u.username
/

