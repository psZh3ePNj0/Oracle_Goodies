- program:  asm_disk_used
-- purpose:  report on ASM space usage
-- params:   none
-- history:
--      2015.03.10: gjose
--
-- desc v$asm_diskgroup
-- Name                                                                                                              Null?    Type
-- ------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------
-- GROUP_NUMBER                                                                                                               NUMBER
-- NAME                                                                                                                       VARCHAR2(30)
-- SECTOR_SIZE                                                                                                                NUMBER
-- BLOCK_SIZE                                                                                                                 NUMBER
-- ALLOCATION_UNIT_SIZE                                                                                                       NUMBER
-- STATE                                                                                                                              VARCHAR2(11)
-- TYPE                                                                                                                       VARCHAR2(6)
-- TOTAL_MB                                                                                                                   NUMBER
-- FREE_MB                                                                                                                    NUMBER
-- HOT_USED_MB                                                                                                                NUMBER
-- COLD_USED_MB                                                                                                               NUMBER
-- REQUIRED_MIRROR_FREE_MB                                                                                                    NUMBER
-- USABLE_FILE_MB                                                                                                             NUMBER
-- OFFLINE_DISKS                                                                                                                      NUMBER
-- COMPATIBILITY                                                                                                                      VARCHAR2(60)
-- DATABASE_COMPATIBILITY                                                                                                     VARCHAR2(60)
-- VOTING_FILES                                                                                                               VARCHAR2(1)

col cold_used_mb                format 999,999,999,999          Heading cold_used_Gb
col free_mb                     format 999,999,999,999          heading free_Gb
col header_status               format a14
col hot_used_mb                 format 999,999,999,999          heading hot_used_Gb
col NAME                        format a10      heading "Diskgroup Name"
col mode_status                 format a12
col mount_status                format a12
col os_mb                       format 999,999,999,999          heading os_Gb
col read_errs                   format 999,999,999,999          heading read_errs
col redundancy                  format a12
col required_mirror_free_mb     format 999,999,999,999          heading required_mirror_free_Gb
col state                       format a10
col total_mb                    format 999,999,999,999          heading total_Gb
col write_errs                  format 999,999,999,999          heading write_errs

set numformat   999,999,999,999
set lines 130   pages 30

ttitle 'ASM Diskgroup Space Usage'

break on report skip


compute sum label 'Totals:' of total_mb free_mb hot_used_mb cold_used_mb required_mirror_free_mb usable_file_mb on report

--spool asm_disk_used_gb

select name, total_mb*1024 total_mb, free_mb*1024 free_mb, hot_used_mb*1024 hot_used_mb, cold_used_mb*1024 cold_used_mb, required_mirror_free_mb*1024 required_mirror_free_mb, usable_file_mb*1024 usable_file_mb
  from v$asm_diskgroup
 order by name
/
--spool off





Tue Aug 15												 page	 1
						    ASM Diskgroup Space Usage

Diskgroup	   total_Gb	     free_Gb	  hot_used_Gb	  cold_used_Gb required_mirror_free_Gb	 USABLE_FILE_MB
---------- ---------------- ---------------- ---------------- ---------------- ----------------------- ----------------
DATA_CWX1   366,917,713,920  365,377,732,608		    0	 1,539,981,312		12,230,590,464	117,715,714,048
DBFS_DG       1,758,822,400    1,756,864,512		    0	     1,957,888		    70,352,896	    562,169,856
RECO_CWX1    91,749,089,280   91,703,009,280		    0	    46,080,000		 3,058,302,976	 29,548,234,752
	   ---------------- ---------------- ---------------- ---------------- ----------------------- ----------------
Totals:     460,425,625,600  458,837,606,400		    0	 1,588,019,200		15,359,246,336	147,826,118,656




