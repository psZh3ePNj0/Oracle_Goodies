-- 
-- test sql for gv$session queries
--

spool gvt

select INST_ID												     
, SADDR													     
, SID													     
, SERIAL#												     
, AUDSID 												     
, PADDR													     
, USER#													     
, USERNAME												     
, COMMAND												     
, OWNERID
, TADDR
from gv$session
where schemaname is not null
  and rownum < 10
/

select 
  LOCKWAIT												     
, STATUS 												     
, SERVER 												     
, SCHEMA#												     
, SCHEMANAME												     
, OSUSER 												     
, PROCESS												     
, MACHINE												     
, PORT													     
, TERMINAL												     
, PROGRAM												     
, TYPE													     
from gv$session
where schemaname is not null
  and rownum < 10
/

select SQL_ADDRESS												     
, SQL_HASH_VALUE 											     
, SQL_ID 												     
, SQL_CHILD_NUMBER	
, SQL_EXEC_START 											     
, SQL_EXEC_ID												     
, PREV_SQL_ADDR												     
, PREV_HASH_VALUE											     
, PREV_SQL_ID												     
, PREV_CHILD_NUMBER	
, PREV_EXEC_START											     
, PREV_EXEC_ID												     
, PLSQL_ENTRY_OBJECT_ID											     
, PLSQL_ENTRY_SUBPROGRAM_ID										     
, PLSQL_OBJECT_ID											     
, PLSQL_SUBPROGRAM_ID											     
, MODULE 												     
, MODULE_HASH												     
from gv$session
where schemaname is not null
  and rownum < 10
/

select ACTION 												     
, ACTION_HASH												     
, CLIENT_INFO												     
, FIXED_TABLE_SEQUENCE											     
from gv$session
where schemaname is not null
  and rownum < 10
/

select
, ROW_WAIT_OBJ#												     
, ROW_WAIT_FILE# 											     
, ROW_WAIT_BLOCK#											     
, ROW_WAIT_ROW#												     
, TOP_LEVEL_CALL#											     
, LOGON_TIME												     
, LAST_CALL_ET												     
, PDML_ENABLED												     
, FAILOVER_TYPE												     
, FAILOVER_METHOD											     
, FAILED_OVER												     
from gv$session
where schemaname is not null
  and rownum < 10
/

select 
  RESOURCE_CONSUMER_GROUP										     
, PDML_STATUS												     
, PDDL_STATUS												     
, PQ_STATUS												     
, CURRENT_QUEUE_DURATION 										     
from gv$session
where schemaname is not null
  and rownum < 10
/

select CLIENT_IDENTIFIER											     
, BLOCKING_SESSION_STATUS										     
, BLOCKING_INSTANCE											     
, BLOCKING_SESSION											     
, FINAL_BLOCKING_SESSION_STATUS										     
, FINAL_BLOCKING_INSTANCE										     
, FINAL_BLOCKING_SESSION 										     
, SEQ#													     
, EVENT# 												     
, EVENT													     
, P1TEXT 												     
, P1													     
, P1RAW													     
, P2TEXT 												     
, P2													     
, P2RAW													     
, P3TEXT 												     
, P3													     
, P3RAW													     
from gv$session
where schemaname is not null
  and rownum < 10
/



select WAIT_CLASS_ID												     
, WAIT_CLASS#												     
, WAIT_CLASS												     
, WAIT_TIME												     
, SECONDS_IN_WAIT											     
, STATE													     
, WAIT_TIME_MICRO											     
, TIME_REMAINING_MICRO											     
, TIME_SINCE_LAST_WAIT_MICRO										     
, SERVICE_NAME												     
from gv$session
where schemaname is not null
  and rownum < 10
/

select SQL_TRACE												     
, SQL_TRACE_WAITS											     
, SQL_TRACE_BINDS											     
, SQL_TRACE_PLAN_STATS											     
, SESSION_EDITION_ID											     
, CREATOR_ADDR												     
, CREATOR_SERIAL#											     
, ECID													     
from gv$session
where schemaname is not null
  and rownum < 10
/

spool off

