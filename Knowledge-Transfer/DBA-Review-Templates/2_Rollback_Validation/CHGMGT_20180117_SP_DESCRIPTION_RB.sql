 
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
    *  Title:        CHGMGT_20180117_SP_DESCRIPTION_RB
    *  Schema Owner: <Schema-Owner> 
    *  Created:      <Date>
    *  Author:       <AUTHOR>
    *
    *  Description:	 <Detail wih Relevant information for your Objectives>
	*					 
	*					
    *
    *  
    *  Modifications:
    *  Date        Who               Description
    *  	
    ******************************************************************************/



	
   CREATE OR REPLACE PROCEDURE sample_stored_procedure_r(p_variable_i IN VARCHAR2, p_result OUT NUMBER)
	as 
		--local variable
				
		l_variable_i	varchar2(128):='<VALUE_i>';
        --....--
		l_variable_n	varchar2(128):='<VALUE_n>';

		l_error			varchar2(1024);
	
		
	
BEGIN	


			-------------------------------------------------------------------

		if (p_variable_i ='<condition_i>') THEN 
			
					update 		<SCHEMA>.<TABLE> 	
					set			<column_i>=l_variable_i
					where       <SOME-CRITERION> = <SOME_VALUE>;				
														
					commit;
					p_result:=<some_number>;

					
			-------------------------------------------------------------------

		--.......--	
	
			-------------------------------------------------------------------	
			
		elsif (p_variable_i ='<condition_n>') THEN 
			
					update 		<SCHEMA>.<TABLE> 	
					set			<column_i>=l_variable_n
					where       <SOME-CRITERION> = <SOME_VALUE>;				
					
									
					commit;
					p_result:=<some_number>;


			-------------------------------------------------------------------

			--Action Handing - Send Some OutPut Value to Indicate no Action |Default Value was taken 
		else 			
					p_result:=<some_default_number>;		
		end if;
			
			-------------------------------------------------------------------
			
			
EXCEPTION 
	WHEN OTHERS then

		    l_error:=SUBSTR(SQLERRM,1,1024);
			
			update 		<SCHEMA>.<TABLE-ERROR> 	
			set			column_error=l_error;
				
			commit;
				
             p_result:=<some_error_number>;
		
END sample_stored_procedure_r
/
		
		
	