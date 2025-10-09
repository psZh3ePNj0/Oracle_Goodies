-- 
-- SQL> desc nls_database_parameters
--  Name                                                  Null?    Type
--  ----------------------------------------------------- -------- ------------------------------------
--  PARAMETER                                             NOT NULL VARCHAR2(30)
--  VALUE                                                          VARCHAR2(40)
-- 
-- SQL> desc nls_instance_parameters
--  Name                                                  Null?    Type
--  ----------------------------------------------------- -------- ------------------------------------
--  PARAMETER                                                      VARCHAR2(30)
--  VALUE                                                          VARCHAR2(40)
-- 
-- SQL> desc nls_session_parameters
--  Name                                                  Null?    Type
--  ----------------------------------------------------- -------- ------------------------------------
--  PARAMETER                                                      VARCHAR2(30)
--  VALUE                                                          VARCHAR2(40)

set lines 150  pages 60
col parameter	format a30	heading "NLS Parameter"
col database	format a30	heading "Database Value"
col instance	format a24	heading "Instance Value"
col svalue  	format a30 	heading "Session Value"

select d.parameter parameter, d.value database, i.value instance, s.value svalue
  from 	nls_database_parameters d,
	nls_instance_parameters i,
	nls_session_parameters s
 where s.parameter = i.parameter
   and s.parameter = d.parameter
 order by d.parameter
/

