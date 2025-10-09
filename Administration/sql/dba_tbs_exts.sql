set echo off
-- program: dba_tbs_exts
-- purpose: List extents by segment for requested owner
-- params:  ext_owner
col blocks		format 999,999,999
col bytes		format 999,999,999,999
col exts		format 999,999
col files		format 9,999
col owner		format a12
col segment_name 	format a30
col sum(bytes)  	format 999,999,999,999
col sum(blocks) 	format 999,999,999,999
col tablespace_name	format a24		

undef  ext_owner
accept ext_owner        char    prompt 'Show extent count by segment - for which owner? '

set lines 134  pages 100  feedback 1  verify off

ttitle 'DBA_EXTENTS:  Segment Fragmentation Report for &&ext_owner in DB: $ORACLE_SID'

select owner, 			tablespace_name, 
       segment_name, 		segment_type, 
       count(extent_id) exts, 	count(distinct file_id) files, 
       sum(bytes) bytes,        sum(blocks) blocks
  from dba_extents
 where owner like upper('%&&ext_owner%')
 group by owner, tablespace_name, segment_name, segment_type
 order by owner, tablespace_name, segment_name, segment_type
/
set echo on

