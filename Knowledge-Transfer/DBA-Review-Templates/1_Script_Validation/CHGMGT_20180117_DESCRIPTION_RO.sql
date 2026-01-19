
-------------------------------------------------------------------------------------------------------------------------------

    /**************************VERSION CONTROL LOG*****************************
    *
    * DATE             	Project-Management-System       Change-Management-System        AUTHOR              COMMENTS
    * <Relevant-Date> 	 <Relevant Info>	            <Relevant Info>                 <Relevant Info>     <Relevant Info>
    *
    ***************************VERSION CONTROL LOG******************************/
	
    /**************************VERSION CONTROL LOG*****************************
    *
    * DATE             	JIRA  			SCCD         	AUTHOR           COMMENTS
    * 17-JAN-2018 	 	XXXX		    YYYYY           ZZZZZZZ          Sample SQL Script employing some best practices
    *																	 
    ***************************VERSION CONTROL LOG******************************/
	
	
-------------------------------------------------------------------------------------------------------------------------------

    /******************************************************************************
    *
    *  Title:        <CHGMGT_DATE_RO>
    *  Schema Owner: <SCHEMA-OWNER>
    *  Created:      <DATE>
    *  Author:       ZZZZZZZZZ
    *
    *  Description:	 	Remove target rows from <SCHEMA-NAME>.<TABLENAME>  
    *					for this CHGMGT request. Target rows meet some business objective.
    *					Example: Target rows are obsolete configuration sales campaign rows that don't have 
    *	        UI to remove within the application).
    *          
    *
    *  Modifications:
    *  Date        Who               Description	
    *  	
    ******************************************************************************/


SET TERMOUT ON
SET ECHO ON
SET LINESIZE 80
SET ESCAPE ^

--In Addition to RolBack Scripts, having a Rollback cause in the Code is very useful, should transaction errors occur
SET SERVEROUTPUT ON SIZE 10000 WHENEVER SQLERROR EXIT ROLLBACK

column filename new_val filename
SELECT SYS_CONTEXT('USERENV', 'INSTANCE_NAME')     filename
  FROM dual; 


--Spool Log File 
spool  CHGMGT_DATE_RO_&filename1..log;


--Set Schema
alter session set current_schema = <DESIRED-SCHEMA>;

--Echo User
SELECT 'Current user is ' || USER
  FROM dual;

--Echo DB
SELECT 'Current database is ' || GLOBAL_NAME
  FROM GLOBAL_NAME;

--Echo Date
SELECT TO_CHAR(SYSDATE, 'DD-Mon-YYYY HH24:MI:SS') date_
  FROM dual;
  

--To Execute
delete /*+parallel (a 12)*/  from <SCHEMA-NAME>.<TABLENAME> a where <RELEVANT_CLAUSE>
/

COMMIT;

show ERRORS
spool OFF
