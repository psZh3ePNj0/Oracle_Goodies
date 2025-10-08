--select max(ksmchsiz) max_ksmchsiz, avg(ksmchsiz)
--avg_ksmchsiz ,sum(ksmchsiz) sum_ksmchsiz
--from sys.x$ksmsp
--where ksmchcls in ('free','recr');

Prompt Memory Left in Shared Pool
column bytes format 999,999,999,999
select * from v$sgastat where name='free memory'
/
