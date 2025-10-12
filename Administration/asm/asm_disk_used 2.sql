-- program:  asm_disk_used
-- purpose:  report on ASM space usage
-- params:   none
-- history:  
--	2015.03.10: gjose
--
-- desc v$asm_diskgroup
-- Name														     Null?    Type
-- ------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------
-- GROUP_NUMBER														      NUMBER
-- NAME															      VARCHAR2(30)
-- SECTOR_SIZE														      NUMBER
-- BLOCK_SIZE														      NUMBER
-- ALLOCATION_UNIT_SIZE													      NUMBER
-- STATE															      VARCHAR2(11)
-- TYPE															      VARCHAR2(6)
-- TOTAL_MB														      NUMBER
-- FREE_MB														      NUMBER
-- HOT_USED_MB														      NUMBER
-- COLD_USED_MB														      NUMBER
-- REQUIRED_MIRROR_FREE_MB												      NUMBER
-- USABLE_FILE_MB 													      NUMBER
-- OFFLINE_DISKS														      NUMBER
-- COMPATIBILITY														      VARCHAR2(60)
-- DATABASE_COMPATIBILITY 												      VARCHAR2(60)
-- VOTING_FILES														      VARCHAR2(1)

col cold_used_mb		format 999,999,999
col free_mb			format 999,999,999
col header_status		format a14
col hot_used_mb			format 999,999,999
col NAME			format a10	heading "Diskgroup Name"
col mode_status			format a12
col mount_status		format a12
col os_mb			format 999,999,999
col read_errs			format 999,999,999
col redundancy			format a12
col required_mirror_free_mb	format 999,999,999
col state			format a10
col total_mb			format 999,999,999
col write_errs			format 999,999,999

set numformat 	999,999,999,999
set lines 105   pages 30

ttitle 'ASM Diskgroup Space Usage'

break on report skip 

compute sum label 'Totals:' of total_mb free_mb hot_used_mb cold_used_mb required_mirror_free_mb usable_file_mb on report

spool asm_disk_used

select name, total_mb, free_mb, hot_used_mb, cold_used_mb, required_mirror_free_mb, usable_file_mb
  from v$asm_diskgroup
 order by name
/
spool off


