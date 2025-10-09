	select 	'alter system kill session '''||s.sid||','||s.serial#||',@'||p.inst_id||''';'
   	from 		GV$process p, GV$session s
 	where 		s.paddr   = p.addr
   and 			s.inst_id = p.inst_id
   and 			s.username not in ('EXPUSER','DBSNMP','SYS','SYSTEM');


