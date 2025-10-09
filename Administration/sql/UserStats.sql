/*************************************************************************
**                                              			**
** Script Name   : UserStats				          	**
** Author        : Christophe Cartwright                         	**
** Date          : March 20th 2004	                              	**
** Description   : Generate User Stats making Connections to the DB  	**
** Inputs        : none					          	**
** Outputs       : none						  	**
**                                                                	**
*************************************************************************/

/*****************************************************************
**                                                              **
** Revision History - Please include author, date and change    **
** details:                                                     **
**                                                              **
**                                                              **
**                                                              **
*****************************************************************/

set pagesize 3000;
spool UserStats.log;

/********************************************************************
***************Obtain the System date and Time **********************
********************************************************************/
select to_char(sysdate,'dd-mon-yyyy hh24:mi:ss') from dual;


/**********************************************************************
******** Generate User Login Stats ************************************
**********************************************************************/

select username,count(*) as Login from v$session group by username;

/**********************************************************************
************Spool off file and exit SQL Session************************
**********************************************************************/

spool off;

exit;



