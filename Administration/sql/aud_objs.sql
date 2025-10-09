clear breaks 
break on owner skip 2

set echo off 

ttitle 'Database Objects by Owner'

select name, owner, object_type, count(*)
from dba_objects, v$database
group by name, owner, object_type
order by name, owner, object_type
/
