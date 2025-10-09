col inst_id	format 999			heading IID
col name	format a40			heading NAME
col value	format 999,999,999,999,999	heading VALUE

ttitle 'PGA STAT'
select * 
  from gv$pgastat
 order by inst_id, name  
/

