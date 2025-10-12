-- program: nls_vparams
-- purpose: list report for database NLS parms from v$parameter - order by name
-- params:  none
-- history:
--      2012/03/09: gjose: 
--

col name                format a35
col value               format a60
col description         format a30
col update_comment      format a20

select 'Reporting NLS Parameters from V$PARAMETER for '||name
  from v$database
/

select name, value
  from v$parameter
 where name like 'nls%'
 order by name
/

