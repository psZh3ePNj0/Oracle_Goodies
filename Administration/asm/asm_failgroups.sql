set lines 100 pages 40

select failgroup, substr(name,(length(name)-8),length(name)), substr(name,1,4), count(*)
  from V$asm_disk
 group by failgroup, substr(name,(length(name)-8),length(name)), substr(name,1,4)
 order by failgroup, substr(name,(length(name)-8),length(name)), substr(name,1,4)
/
