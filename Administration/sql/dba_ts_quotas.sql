-- program: dbtsquotas
-- purpose: show user quotas on tablespaces
-- params:  none
-- history:
--	2011/9/10: gjose
-- 
--
col  TABLESPACE_NAME      format a20
col  USERNAME             format a15 
col  BYTES                format 999,999,999,999
col  MAX_BYTES            format 999,999,999,999
col  BLOCKS               format 999,999,999
col  MAX_BLOCKS           format 999,999,999
col  DROPPED              format a8   

set lines 110  pages 60

ttitle 'DBA Tablespace Quotas'
select username, tablespace_name, bytes, max_bytes, blocks, max_blocks, dropped
  from dba_ts_quotas
 order by username, tablespace_name
/


