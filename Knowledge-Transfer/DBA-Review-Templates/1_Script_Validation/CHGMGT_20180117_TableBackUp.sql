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
    *  Title:        <CHGMGT_DATE_RB>
    *  Schema Owner: <SCHEMA-OWNER>
    *  Created:      <DATE>
    *  Author:       ZZZZZZZZZ
    *
    *  Description:	 	Create a backup table of existing production  
	*					with relevant rows backed up (from WHERE clause).
	*					In the event of a Rollback this backup table's content
	*	                would be used. If Rollback isn't needed, this table can
    *                   be dropped post maintenance retention / monitoring window.
    *
    *  Modifications:
    *  Date        Who               Description	
    *  	
    ******************************************************************************/


--
-- BackUp Table generation as CTAS (create table as). Also degree of parallelism
-- set to 20 for speed on tables creation. Tweak according to your needs.
--

CREATE TABLE  <SCHEMA-NAME>.<TABLENAME_CHGMGT_DATE_RB>
INITRANS 1
PCTFREE  10
TABLESPACE <RELEVANT_TABLESPACE>
PARALLEL 20
AS
    select /*+parallel (a 12)*/ a.* from <SCHEMA-NAME>.<TABLENAME> a where <RELEVANT_CLAUSE>
/

--
--After table is created - restore parallelism to 1 as this is a costly
--DB resource that if left can impact the performance of other DB objects
--
alter table <SCHEMA-NAME>.<TABLENAME_CHGMGT_DATE_RB> NOPARALLEL 
/
