col parameter	format a30
col value	format a50

set lines 100 pages 100

select * from nls_session_parameters
 order by parameter
/
