COL component 	FORMAT A30
col name	format a35
col value	format 999,999,999,999

set lines 170 pages 60

ttitle 'GV$MEMORY_DYNAMIC_COMPONENTS'

SELECT inst_id, component, current_size, min_size, max_size
  FROM gv$memory_dynamic_components
 WHERE current_size != 0
 order by inst_id, component
/
ttitle 'GV$MEMORY_TARGET_ADVICE'
SELECT * 
  FROM gv$memory_target_advice 
 ORDER BY inst_id, memory_size
/
prompt '====='
prompt '====='
prompt '=====  PGA AGGREGATE TARGET'
prompt '====='
prompt '=====  PGA memory available to all server processes attached to the instance'
prompt '====='
show parameter pga
prompt '====='
prompt '====='
prompt '=====  *_AREA_SIZE parameters'
prompt '====='
show parameter _AREA_SIZE
prompt '====='
prompt '====='

ttitle 'GV$PGA STAT'
select * 
  from gv$pgastat 
 order by inst_id, name
/
ttitle 'GV$PGA_TARGET_ADVICE'
select * 
  from gv$pga_target_advice 
 order by inst_id, pga_target_for_estimate
/
ttitle 'GV$PGA_TARGET_ADVICE_HISTOGRAM'
select * 
  from gv$pga_target_advice_histogram
 order by inst_id, pga_target_for_estimate
/
	
