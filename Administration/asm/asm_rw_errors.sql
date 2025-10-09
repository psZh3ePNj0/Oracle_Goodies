col free_mb		format 999,999
col header_status	format a14
col label 		format a28
col library		format a8
col mode_status		format a12
col mount_status	format a12
col os_mb		format 999,999
col read_errs		format 9,999,999
col redundancy		format a12
col state		format a10
col total_mb		format 999,999
col write_errs		format 9,999,999

set lines 160 pages 40

select LABEL, MOUNT_STATUS, HEADER_STATUS, MODE_STATUS,
       STATE, REDUNDANCY,   LIBRARY,
       OS_MB, TOTAL_MB,     FREE_MB, read_errs, write_errs
  from v$asm_disk
 where read_errs > 0
    or write_errs > 0
/
