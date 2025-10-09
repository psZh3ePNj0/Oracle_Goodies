select owner, object_name, object_type
  from dba_objects
 where object_name like 'GV$SES%'
    or object_name like '%OBJ%'
    or object_name like '%PROCE%'
/

