col username format a40
select sid,serial#, username,status  from v$session
where username is not null
and username='&username'
/

alter system kill session '&sid,&serial'
/
