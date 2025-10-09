
col inst_id		format 999	heading 'Inst#'
col sid			format 999	heading 'SID'
col seq#		format 999,999	heading 'Seq#'
col event		format a12	heading 'Event'
col p1text		format a10	heading 'P1Text'
col p1			format 999,999,999,999	
col p2text		format a30	
col p2			format 999	
col p3text		format a10
col p3			format 999
col wait_class		format a10

select 	inst_id, 	sid, 		seq#, 
	event,		p1text,		p1,
	p2text,		p2,		
	p3text,		p3,
	wait_class_id,	wait_class#,	wait_class,
	wait_time,	seconds_in_wait,	state,
	wait_time_micro,	time_remaining_micro,	time_since_last_wait_micro
  from gv$session_wait
/
