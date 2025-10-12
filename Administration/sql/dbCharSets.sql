-- program: dbCharSets
-- purpose: get database character sets
-- params:  none
-- history:
--	2011/11/19: gjose
--
set pages 100  lines 100  feedback 1

col name 	format a40
col value	format a40

ttitle Database Character Set
select value$ from sys.props$ where name='NLS_CHARACTERSET';

ttitle NLS Character Set
select value from nls_database_parameters where parameter = 'NLS_CHARACTERSET';

ttitle NLS National Character Set
select value from nls_database_parameters where parameter = 'NLS_NCHAR_CHARACTERSET';
