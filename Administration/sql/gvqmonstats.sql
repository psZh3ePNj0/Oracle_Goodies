set pages 100 lines 130 feedback 1

spool gvqmonstats

select * 
  from GV$QMON_COORDINATOR_STATS
/

select * 
  from gv$qmon_tasks
 order by task_name
/

select * 
  from gv$qmon_task_stats
 order by task_name
/

select * 
  from gv$qmon_server_stats
/

