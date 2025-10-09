set lines 150 pages 40

select inst_id, group_number, disk_number, name, failgroup, MOUNT_Status, HEADER_STATUs, MODE_STatus, STATE
  from gv$asm_disk
 order by group_number, disk_number, name
/
