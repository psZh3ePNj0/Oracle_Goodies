col CUST_DB_ID format     a20  justify c heading 'Cust_DB_ID'
col report_name format    a20  justify c heading 'REPORT_NAME'
col report_date format    a20  justify c heading 'REPORT_DATE'
column  owner          format a30
column  segment_name   format a30
column  segment_type   format a10
column  extents        format 99999999999999
column  max_extents    format 99999999999999
SELECT   to_char(sysdate,'DD-MON-YYYY HH:MI:SS') REPORT_DATE,
        'EXTENTS' REPROT_NAME,
         owner,
         segment_name,
        segment_type,
        extents, 
         max_extents
from     dba_segments
where     extents > 10
and      owner <> 'SYS'
and      owner <> 'SYSTEM'
order by extents desc
/
