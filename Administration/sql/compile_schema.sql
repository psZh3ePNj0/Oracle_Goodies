/*
	program: compile_schema
	purpose: invoke dbms_utility.compile_schema
		 * compile_schema runs as logged in user, not sys
		 * SQLPATH must include $ORACLE_HOME/rdbms/admin

	params:	 connect_file : file with connect string for DB logon
	history:
		2011/02/25: gjose
		xxxx/xx/xx: ccartwright - minor change - generalized CONNECTION PATH - please modify this list for your objectives
*/
set echo off feedback on termout on
set lines 80 pages 45
col object_name 	format a30
col object_type		format a30
col status		format a10

--
-- Define schema name as input parameter 1
-- modify for your objectives: ex: connect_file='$HOME/par/&&1'
--
def  connect_file='<DESIRED-PATH-WITH-INPUT-PARAMETER-FILE>/&&1'

-- Connect to database 
@&Connect_file


begin    
  dbms_utility.compile_schema('&_user');
end;
/

select object_name, object_type, status
  from user_objects 
 where status = 'INVALID';

exit

