/****************************************************************/
/*                                                              	*/
/* Free Space  									*/
/* Author : Martin Smith                                        	*/
/* Date Created : 4th October 2001                              	*/
/* Change History :  Christophe Cartwright 6th July, 2004       	*/
/*                :  Spooled output to file and downgraded      	*/
/*			:  server output version for current Oracle   	*/
/*			:  instance							*/
/****************************************************************/

set pagesize 2000;
spool freespace.log

set serveroutput on size 999999

DECLARE
lc_tablespace_name	VARCHAR2(40);
ln_tablespace_size	NUMBER(15);
ln_tablespace_free_size	NUMBER(15);
lc_datafile_name	VARCHAR2(200);
ln_datafile_size	NUMBER(15);
return_value		INTEGER;
cursorx			INTEGER;

CURSOR tablespace_cursor IS
	SELECT tablespace_name
	FROM   dba_tablespaces;

CURSOR datafile_cursor IS
	SELECT file_name,
	       bytes
	FROM   dba_data_files
	WHERE  tablespace_name = lc_tablespace_name;

BEGIN
	OPEN tablespace_cursor;
	LOOP
		FETCH tablespace_cursor INTO lc_tablespace_name;
		EXIT WHEN tablespace_cursor%NOTFOUND;

		SELECT SUM(bytes)
		INTO   ln_tablespace_size
		FROM   dba_data_files
		WHERE  tablespace_name = lc_tablespace_name;

		SELECT SUM(bytes)
		INTO   ln_tablespace_free_size
		FROM   dba_free_space
		WHERE  tablespace_name = lc_tablespace_name;

		dbms_output.put_line('----------------------------------------------------------------------');
		dbms_output.put_line('Tablespace: ' || lc_tablespace_name);
		dbms_output.put_line('----------------------------------------------------------------------');
		dbms_output.put_line('Datafile(s):');

		OPEN datafile_cursor;
		LOOP
			FETCH datafile_cursor
			INTO  lc_datafile_name,
			      ln_datafile_size;
			EXIT WHEN datafile_cursor%NOTFOUND;
			dbms_output.put_line(lc_datafile_name || chr(9) || to_char(ln_datafile_size / (1024 * 1024), '99990.00') || 'Mb');
		END LOOP;
		CLOSE datafile_cursor;

		dbms_output.put_line('----------------------------------------------------------------------');
		dbms_output.put_line('Free Space: ' || to_char(ln_tablespace_free_size / (1024 * 1024), '99990.00') || 'Mb');
		dbms_output.put_line('Total Size: ' || to_char(ln_tablespace_size / (1024 * 1024), '99990.00') || 'Mb');
		dbms_output.put_line('%Free: ' || to_char((1 - ((ln_tablespace_size - ln_tablespace_free_size) / ln_tablespace_size)) * 100, '990.00') || '%');
		dbms_output.put_line('----------------------------------------------------------------------');

		IF (ln_tablespace_size - ln_tablespace_free_size) / ln_tablespace_size >= 0.75 THEN
			dbms_output.put_line('Warning : Less than 25% free in tablespace ' || lc_tablespace_name || '!');
			dbms_output.put_line('----------------------------------------------------------------------');
		ELSIF (ln_tablespace_size - ln_tablespace_free_size) / ln_tablespace_size >= 0.90 THEN
			dbms_output.put_line('SEVERE WARNING : Less than 10% free in tablespace ' || lc_tablespace_name || '!');
			dbms_output.put_line('----------------------------------------------------------------------');
		END IF;

		dbms_output.put_line(chr(10));
	END LOOP;
	CLOSE tablespace_cursor;
END;
/
spool off;