set line 500
set pagesize 500
set feedback on
select o.object_name "OBJECT_NAME", o.object_type "OBJECT_TYPE" , decode(l2.locked_mode,0,NULL,
1,1,2,'SHARE UPDATE | ROW SHARE',3,'ROW EXCLUSIVE',4,'SHARE',5,'SHARE ROW EXCLUS
IVE',6,'EXCLUSIVE MODE') "LOCKED_MODE",
l2.oracle_username "ORACLE_USERNAME", l2.os_user_name "OS_USER_NAME",
 l2.session_id "SESSION_ID", s.serial# "SERIAL#" 
 from v$locked_object l2, sys.all_objects o, v$session s
 where o.object_id = l2.object_id
   and s.sid       = l2.session_id
order by session_id
/
/*
select unique b.username
       ,b.sid
       ,b.serial#
       ,decode(b.lockwait,null,null,'BLOCKED')  BLOCKED
 from
       sys.v_$session B
      ,sys.v_$lock    O
where  b.lockwait is not null
   and B.sid        = O.sid
   /
*/             
    
