select inst_id, component, oper_type, oper_mode, status, to_char(start_time,'mm/dd/yyyy hh24:mi:ss'), to_char(end_time,'mm/dd/yyyy hh24:mi:ss')
  from gv$sga_resize_ops
 order by inst_id, component, oper_type, oper_mode, status
/
