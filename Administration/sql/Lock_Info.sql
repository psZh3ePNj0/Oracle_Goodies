/*************************************************************************
**                                              			**
** Script Name   : Lock_Info				        	**
** Author        : Christophe Cartwright,DBA Cable Bahamas             	**
** Date          : Sept 21st 2005	                              	**
** Description   : Obtains Key information on any Database locks, 	**
**		 : lock type,status,object locked and the user who has 	**
**		 : the lock						**
** Inputs        : none					        	**
** Outputs       : User and Database Lock Info				**
**									**
** Comments	  							**
** 		OS User - Name of operating system user			**
** 		OS PID - Operating system process id			**
** 		Oracle User - Name of Oracle user			**
** 		Oracle ID - Oracle session id				**
** 		Lock Type - Type of lock				**
** 		Lock Held - Current lock held				**
** 		Lock Requested - Type of lock requested			**
** 		Status - Status of object (Blocking,Not Blocking,Global)**
** 		Object Owner - Owner of the object			**
** 		Object Name - Name of the object			**
**									**
**									**
** Acknowlegement: http://vsbabu.org/oracle/sect09.html			**
**                                                                	**
*************************************************************************/

/*****************************************************************
**                                                              **
** Revision History - Please include author, date and change    **
** details:                                                     **
**                                                              **
*****************************************************************/


SET PAGESIZE 300;
SET LINESIZE 300;

COL OS_USER FORMAT a10;
COL OS_PID FORMAT a9;
COL ORACLE_USER FORMAT a11;
COL ORACLE_SID FORMAT 999999;
COL LOCK_TYPE FORMAT a26;
COL LOCK_HELD FORMAT a12;
COL LOCK_REQUESTED FORMAT a12;
COL STATUS FORMAT a12;
COL OWNER FORMAT a15;
COL OBJECT_NAME FORMAT a30;

SPOOL Lock_Info.log;

SELECT	vlo.OS_USER_NAME OS_USER,
	vlo.PROCESS OS_PID,
	vlo.ORACLE_USERNAME ORACLE_USER,
	vl.SID ORACLE_SID,
	DECODE(vl.TYPE,
		'MR', 'Media Recovery',
		'RT', 'Redo Thread',
		'UN', 'User Name',
		'TX', 'Transaction',
		'TM', 'DML',
		'UL', 'PL/SQL User Lock',
		'DX', 'Distributed Xaction',
		'CF', 'Control File',
		'IS', 'Instance State',
		'FS', 'File Set',
		'IR', 'Instance Recovery',
		'ST', 'Disk Space Transaction',
		'TS', 'Temp Segment',
		'IV', 'Library Cache Invalidation',
		'LS', 'Log Start or Switch',
		'RW', 'Row Wait',
		'SQ', 'Sequence Number',
		'TE', 'Extend Table',
		'TT', 'Temp Table', type) LOCK_TYPE,
	DECODE(vl.LMODE,
		0, 'None',
		1, 'Null',
		2, 'Row-S (SS)',
		3, 'Row-X (SX)',
		4, 'Share',
		5, 'S/Row-X (SSX)',
		6, 'Exclusive', lmode) LOCK_HELD,
	DECODE(vl.REQUEST,
		0, 'None',
		1, 'Null',
		2, 'Row-S (SS)',
		3, 'Row-X (SX)',
		4, 'Share',
		5, 'S/Row-X (SSX)',
		6, 'Exclusive', request) LOCK_REQUESTED,
	DECODE(vl.BLOCK,
		0, 'Not Blocking',
		1, 'Blocking',
		2, 'Global', block) STATUS,
	vdo.OWNER OWNER,
	vdo.OBJECT_NAME OBJECT_NAME
FROM	v$locked_object vlo,
	dba_objects vdo,
	v$lock vl
WHERE 	vlo.OBJECT_ID = vdo.OBJECT_ID
AND     vl.SID = vlo.SESSION_ID;


SPOOL OFF;
EXIT;