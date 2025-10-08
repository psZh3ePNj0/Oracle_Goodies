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
select  total.tablespace_name                       tsname,  
	count(free.bytes)                           nfrags,  
	nvl(max(free.bytes)/1048576,0)              mxfrag,  
	total.bytes/1048576                         totsiz,  
	nvl(sum(free.bytes)/1048576,0)              avasiz,  
	(1-nvl(sum(free.bytes),0)/total.bytes)*100  pctusd
from  (select   tablespace_name,
                          sum(bytes)  bytes
                 from     dba_data_files
                 group by tablespace_name) total,
	dba_free_space  free
	where  total.tablespace_name = free.tablespace_name(+)
	group by  total.tablespace_name,  total.bytes
/
spool off
