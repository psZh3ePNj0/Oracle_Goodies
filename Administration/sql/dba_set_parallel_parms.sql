-- program:  dba_set_parallel_parms
-- purpose:  set parallel parameters to prevent DB 
-- 		from creating too many parallel processes
--	     NOTE 1:  It is not necessary to bounce the DB
--	     NOTE 2:  the resource group must also be set
-- params:   none
-- history: 
--	2014/04/15:  gjose & gcoleman
--  xxxx/xx/xx:  ccartwright: commented out the below ALTER DDLs. Before uncommenting to use:
--              i:  Please Create a PFILE from your SPFILE as a backup in the event you have to 
--                  ROLLBACK using the PFILE due to unforeseen events
--              ii: Added Before query on Parameters so that DBAs have a before / after value for changes done.
--              iii: Once [i] is secured - uncomment, change values to your objectives  and run
--                  within a NON-Production environment (ideally environment is as close to production settings as possible).
--                  Post changes in Non Production, please work with Q/A | UAT teams to run App Layer regression testing
--                  and obtain QA| UAT | Change Management teams signoff before Production Deployment 
--
col name 	format a30
col value	format a20
set echo off

spool dba_set_parallel_parms
--@timestamp
set echo on

select inst_id, name, value 
  from gv$parameter
 where name in ('cpu_count','parallel_degree_limit','parallel_max_servers',
		'parallel_servers_target','parallel_threads_per_cpu')
 order by name, inst_id
/

--alter system set cpu_count=4 scope=both sid='*'
--/
--alter system set parallel_degree_limit=24  scope=both sid='*'
--/
--alter system set parallel_max_servers=24   scope=both sid='*'
--/
--alter system set parallel_servers_target=12  scope=both sid='*'
--/
--alter system set parallel_threads_per_cpu=1  scope=both sid='*'
--/

select inst_id, name, value 
  from gv$parameter
 where name in ('cpu_count','parallel_degree_limit','parallel_max_servers',
		'parallel_servers_target','parallel_threads_per_cpu')
 order by name, inst_id
/
spool off

