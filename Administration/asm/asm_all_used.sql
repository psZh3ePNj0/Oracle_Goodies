-- program: asm_all_used
-- purpose: see what is stored on the asm disks
-- params:  none
-- history:
--	2011/07/25: gjose w/credit to jlinares
--
set pages 100	lines 120

set echo on  feedback on feedback 1   trimout on trimspool on
set lines 130  pages 100

col FULL_ALIAS_PATH	format a90
col FILE_TYPE	        format a25

spool asm_all_used


select concat('+'||gname, sys_connect_by_path(aname, '/')) full_alias_path,
      system_created, alias_directory, file_type, file_mb
  from ( select b.name gname, a.parent_index pindex, a.name aname,
		   a.reference_index rindex , a.system_created, a.alias_directory,
		   c.type file_type, round(c.bytes/1024/1024,2) file_mb
	    from v$asm_alias a, v$asm_diskgroup b, v$asm_file c
	    where a.group_number = b.group_number
	    and a.group_number = c.group_number(+)
	    and a.file_number = c.file_number(+)
	    and a.file_incarnation = c.incarnation(+)
	  )
start with (mod(pindex, power(2, 24))) = 0
		 and rindex in
		       ( select a.reference_index
			 from v$asm_alias a, v$asm_diskgroup b
			 where a.group_number = b.group_number
			 and (mod(a.parent_index, power(2, 24))) = 0
		       )
connect by prior rindex = pindex
/

spool off

