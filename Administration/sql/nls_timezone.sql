
col tzname 	format a20
col tzabbrev	format a20

spool nls_timezone.log

SELECT *
  FROM v$timezone_names
 where tzname like '%Input-Desired_TimeZone%'
    or tzname like '%<Input-Desired_TimeZone%'
 order by tzname
/

-- SELECT tzname, tzabbrev 
--   FROM v$timezone_names
--  order by tzname
-- /

spool off

