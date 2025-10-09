--ASM Grid Disk Rebalancing View

set lines 300;
select INST_ID,GROUP_NUMBER,OPERATION,POWER,STATE,ACTUAL,SOFAR,EST_WORK,EST_RATE,EST_MINUTES
from GV$ASM_OPERATION;





col failgroup           format a12
col free_mb             format 999,999
col disk_number         format 99999999999
col group_number        format 99999999999
col header_status       format a14
col label               format a28
col library             format a8
col mode_status         format a12
col mount_status        format a12
col name                format a30
col os_mb               format 999,999
col read_errs           format 9,999,999
col redundancy          format a12
col state               format a10
col total_mb            format 999,999
col write_errs          format 9,999,999


set linesize 160
set pagesize 40

select  label,        group_number,  disk_number,
        name,        failgroup,      state,
        MOUNT_Status, HEADER_STATUs, MODE_STatus,create_date,mount_date
  from v$asm_disk
  where mode_status='OFFLINE'
 order by group_number, disk_number, name;
/