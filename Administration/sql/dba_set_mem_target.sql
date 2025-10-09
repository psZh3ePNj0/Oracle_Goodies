--CCartwright: 
--[0] Below should be done in Non-Prod and then Prod.
--[i]  CRITICAL: backup DB Settings below by Creating a PFILE - in the event you bounce the DB and the settings cause startup issued.
--[ii] Uncomment and run the below ONLY when you are CERTAIN of the values.

--alter system set memory_target=2g scope=spfile
--/
--alter system set memory_max_target=2g scope=spfile
--/

