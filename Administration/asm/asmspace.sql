-- program: asmspace
-- purpose: show ASM disk groups
--		- shows space internal to current DB
-- params:  none
-- history:
--	2011/07/25: gjose w/credit to jlinares
--
set lines 100  pages 100

set echo on  feedback 1 feedback 0n  trimout on   trimspool on

spool asmspace

select group_number, name, type, state, total_mb, free_mb, usable_file_mb
  from v$asm_diskgroup
/

desc v$asm_diskgroup

select * 
  from v$asm_diskgroup
/


spool off



