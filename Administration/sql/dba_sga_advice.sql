COLUMN component FORMAT A30
column name	 format a35

set lines 100 pages 40

ttitle 'V$MEMORY_DYNAMIC_COMPONENTS'

SELECT inst_id, component, current_size, min_size, max_size
  FROM gv$memory_dynamic_components
 WHERE current_size != 0
 order by inst_id, component
/
ttitle 'V$MEMORY_TARGET_ADVICE'
SELECT * 
  FROM gv$memory_target_advice 
 ORDER BY inst_id, memory_size
/
ttitle 'V$SGA INFO'
select * 
  from gv$sgainfo 
 order by inst_id, name
/
ttitle 'V$SGA_TARGET_ADVICE'
select * 
  from gv$sga_target_advice 
 order by inst_id, sga_size
/
	
