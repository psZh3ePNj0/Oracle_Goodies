
col name 	format a30 
col value 	format 999,999,999,999


prompt ---
prompt --- ASMM Report
prompt ---

break on inst_id skip 2
compute sum of value on inst_id

ttitle 'SGA by Instance'
select * 
  from gv$sga
 order by inst_id, name
/

col value	format a30

set lines 100 pages 60 echo off feedback off

ttitle 'ASMM - Auto-Tuned Parameters - SGA_TARGET > 0|Statistics Level Typical or All'
select inst_id, name , value 
  from gv$parameter 
 where name in ('db_cache_size','shared_pool_size','large_pool_size',
		'java_pool_size','streams_pool_size','statistics_level')
order by inst_id, name
/
ttitle 'ASMM - SGA STAT - Current Shared Pool Sizing'
select inst_id, nvl(pool,name) , count(*), sum(bytes)
  from gv$sgastat
 group by inst_id, nvl(pool,name)
 order by inst_id, nvl(pool,name)
/
ttitle 'ASMM - SGA STAT - Large Pool Components'
select inst_id, pool, name, bytes
  from gv$sgastat
 where pool = 'large pool'
 order by 1, 2, 3
/
ttitle 'ASMM - Manual-Tuned Parameters'
select inst_id, name , value 
  from gv$parameter
 where (name like '%pool%' and 
	name not in ('shared_pool_size','large_pool_size','java_pool_size','streams_pool_size'))
    or (name like 'db%cache%' and name <> 'db_cache_size')
    or (name  in  ('log_buffer'))
order by inst_id, name
/
clear computes breaks
