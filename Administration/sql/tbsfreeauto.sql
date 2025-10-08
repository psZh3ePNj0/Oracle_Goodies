col tablespace format a25;
col file_name format a75;
select distinct a.tablespace_name, b.file_name,sum(a.bytes / (1024*1024*1024)) Gbytes_Free,b.bytes / (1024*1024*1024) GBytes,b.autoextensible,b.maxbytes / (1024*1024*1024)
from dba_free_space a, dba_data_files b
where a.tablespace_name = b.tablespace_name
group by a.tablespace_name,b.file_name,a.bytes,b.bytes,b.autoextensible,b.maxbytes
order by a.tablespace_name;
