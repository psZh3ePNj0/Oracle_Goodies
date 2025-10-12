-- program: gvsess
-- purpose: display users currently connected to the database
--		through all online instances
-- params:  none
-- history:
--	2011/09/16: gjose
--
col osuser 	format a12
col process	format 99999999
col username 	format a12
col machine 	format a36
col terminal	format a5	heading 'TERM'
col program	format a40

select osuser, process, inst_id, sid, serial#, username, machine, terminal, program
  from gv$session 
 where username is not null
/

