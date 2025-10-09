spool foo.txt
set lines 300;
col name format a33;
col value format a118;
col description format a64;
select NAME,VALUE,ISDEFAULT,DESCRIPTION
from v$parameter;
spool off;
