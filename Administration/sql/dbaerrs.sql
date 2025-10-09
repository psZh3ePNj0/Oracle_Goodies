select distinct owner, count(*)
  from dba_errors
 group by owner
 order by owner
/
-- select owner, type, name, count(*)
--   from dba_errors
--  group by owner, name, type, line
--  order by owner, name, type, line
-- /
/
