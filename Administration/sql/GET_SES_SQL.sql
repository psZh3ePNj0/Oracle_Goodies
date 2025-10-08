-- +----------------------------------------------------+
-- | Name:                                              |
-- |   GET_SES_SQL.sql                                  |
-- | Description:                                       |
-- |   This script displays the last query executed     |
-- |     of all running sessions                        |
-- | Syntaxe of usage (you should have DBA role granted)|
-- |   GET_SES_SQL                                      |
-- +----------------------------------------------------+

set head     on
set echo     off
set verify   off
set feedback off
set linesize 800
set pagesize 1000

-- the format of the columns
col "SID"                        format 999
col "Program"                    format A12
col "Last (or current) query"    format A64
column username format a16

-- set a break
BREAK on Username ON SID on Serial# ON Program 
prompt === Show all sql on the database
-- to find the query text
select ses.username, 
       ses.sid,     
       ses.serial#, 
       sql.sql_text  "Last (or current) query"
from  sys.v_$session ses,
      sys.v_$sqltext sql
where ses.sql_address = sql.address
order by Username,sid, piece 
/
set pagesize 25
set pause ''
set pause off
