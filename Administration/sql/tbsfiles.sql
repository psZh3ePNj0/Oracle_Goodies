#set newpage 0 linesize 132 pagesize 60 head off termout off 
#def rptname     = 'tbsfree'
#def aps_prog	= 'tbsfree.sql'
#def aps_title	= 'Database Freespace Summary'
#start rptitle
col tsname  format         a17 justify c heading 'Tablespace'
col nfrags  format 999,990     justify c heading 'Free|Frags'
col mxfrag  format  99,990.999 justify c heading 'Largest|Free Frag'
col totsiz  format 999,990.999 justify c heading 'Total|Mbytes'
col avasiz  format 999,990.999 justify c heading 'Available|Mbytes'
col pctusd  format     990.99  justify c heading 'Percent|Used'
break -  
	on tablespace skip 1 -   
	on bytesk on report
compute sum of totsiz on report
compute sum of avasiz on report
set newpage 0 
set linesize 100 
set pagesize 60 
set head off 
set termout off 

col tablespace  format       a15 justify c trunc heading 'Tablespace'
col file_name   format       a45 justify c       heading 'File Name'
col bytesk      format       999,999,990 justify c heading 'Bytes in K' 
break -
on tablespace skip 1 -
on report
compute sum of bytesk on report
select
tablespace_name              tablespace,
file_name,
bytes/1024 bytesk
from
dba_data_files
order by tablespace_name, file_name
/
spool off
