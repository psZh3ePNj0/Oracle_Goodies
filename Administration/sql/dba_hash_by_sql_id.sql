select 	snap_id,
		dbid,
		instance_number,
		sample_time,
		session_id,
		session_serial#,
		sql_id,
		is_sqlid_current,event,
		sql_opcode, 
		sql_plan_hash_value,
		sql_full_plan_hash_value,
		sql_plan_operation,
		sql_plan_options,
		blocking_session_status,
		blocking_session
from 	DBA_HIST_ACTIVE_SESS_HISTORY 
where 	sql_id = '&sql_id'
order 	by snap_id,sample_time,event desc;
