select unique b.username
       ,b.sid
       ,b.serial#
       ,decode(b.lockwait,null,null,'BLOCKED')  BLOCKED
 from
       sys.v_$session B
      ,sys.v_$lock    O
where  b.lockwait is not null
   and B.sid        = O.sid;
