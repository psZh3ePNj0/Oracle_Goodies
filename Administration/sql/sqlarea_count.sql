column "Tot SQL run since startup" format 999,999,999 
column "SQL executing now"  format 999,999,999 
select sum(executions) "Tot SQL run since startup", 
                sum(users_executing) "SQL executing now" 
                from v$sqlarea; 
