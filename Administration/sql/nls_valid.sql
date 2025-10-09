-- 
-- SQL> desc V$NLS_VALID_VALUES
--  Name						       Null?	Type
--  ----------------------------------------------------- -------- ------------------------------------
--  PARAMETER							VARCHAR2(64)
--  VALUE							VARCHAR2(64)
--  ISDEPRECATED						VARCHAR2(5)

set lines 150  		pages 60
col parameter		format a30	heading "NLS Parameter"
col value		format a30	heading "NLS Value"
col isdeprecated	format a24	heading "Is Deprecated"

spool nls_valid

select *
  from v$nls_valid_values	
 order by parameter, value
/

spool off

