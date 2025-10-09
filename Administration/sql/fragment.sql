column tablespace_name format a15
	column file_name format a30
	
	SELECT 	fs.tablespace_name, df.file_name, COUNT(*) AS fragments, 
	ROUND(SUM(fs.bytes)/1024,2) AS total_kb, ROUND(MAX(fs.bytes)/1024,2) AS biggest_kb
	FROM 	DBA_FREE_SPACE fs, DBA_DATA_FILES df
	WHERE 	fs.file_id(+) = df.file_id
	GROUP BY fs.tablespace_name,df.file_name;