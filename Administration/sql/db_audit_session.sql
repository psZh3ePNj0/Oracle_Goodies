
-- See https://erikwramner.wordpress.com/2012/10/20/fix-unknown-expired-oracle-passwords-without-changing-them/

/*
begin
  for rec in (select
    regexp_substr( dbms_metadata.get_ddl('USER', username), '''[^'']+''') pw,
    username from dba_users where username IN ('<user>')) loop
    execute immediate 'alter user ' || rec.username ||
      ' identified by values ' || rec.pw;
  end loop;
end;
/

/*


--[i]


/* Can use a review around LOGOFF_TIME. This is a DATE filed that isn't granular to millisecs


set lines 300;
set heading on;
column DB_USER_LOGIN format a20;
column OS_USERNAME format a25;
column MACHINE format a40;
column  AUDIT_ACTION_TIME format a30;
--column LOGOFF_TIME format a30;
column  ACTION_ATTEMPTED format a20;
column  PRIV_USED format a20;
--column  COMMENT_TEXT format a50;
SELECT distinct USERHOST MACHINE,OS_USERNAME,USERNAME DB_USER_LOGIN,
to_char(EXTENDED_TIMESTAMP,'yyyy-mm-dd hh24:mi:ss') AUDIT_ACTION_TIME,
to_char(to_timestamp(to_char(LOGOFF_TIME,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') LOGOFF_TIME,
ACTION_NAME ACTION_ATTEMPTED,PRIV_USED,RETURNCODE
FROM DBA_AUDIT_TRAIL
WHERE username ='<user>'
--AND ACTION_NAME='ALTER USER'
--AND to_char(EXTENDED_TIMESTAMP,'yyyy-mm-dd') >= 'yyyy-mm-dd'
order by 4,5,3,2,1;





set lines 300;
set heading on;
column DB_USER_LOGIN format a20;
column OS_USERNAME format a25;
column MACHINE format a40;
column  AUDIT_ACTION_TIME format a30;
--column LOGOFF_TIME format a30;
column  ACTION_ATTEMPTED format a20;
column  PRIV_USED format a20;
--column  COMMENT_TEXT format a50;
SELECT distinct USERHOST MACHINE,OS_USERNAME,USERNAME DB_USER_LOGIN,
to_char(EXTENDED_TIMESTAMP,'yyyy-mm-dd hh24:mi:ss') AUDIT_ACTION_TIME,
to_char(to_timestamp(to_char(LOGOFF_TIME,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') LOGOFF_TIME,
ACTION_NAME ACTION_ATTEMPTED,PRIV_USED,RETURNCODE
FROM DBA_AUDIT_TRAIL
WHERE username ='<user>'
AND to_char(EXTENDED_TIMESTAMP,'yyyy-mm-dd') between 'yyyy-mm-dd'  and 'yyyy-mm-dd'
order by 4,5,3,2,1;






*/
