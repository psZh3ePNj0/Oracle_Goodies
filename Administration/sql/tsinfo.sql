rem
rem Information about tablespace - Extents, Size, Freespace, Datafiles
rem
rem Acknowledgements to resource allocated with script: Che Hahn
rem
rem Provide the tablespace name along with the scriptname
rem
set serveroutput on feedback off verify off pages 0
set line 500
--spool tsinfo.lst
declare
 
     wtablespace varchar2(255):='&tablespace_name';
     /*  Tablespaces */
     cursor cts is select tablespace_name, round(initial_extent/1024) ini_ext, 
            round(next_extent/1024) nxt_ext, pct_increase, max_extents, status,contents,logging
     from dba_tablespaces 
     where tablespace_name like upper(nvl(wtablespace,'%'))
     order by tablespace_name;
     /* Data files */
     cursor cdf (t in varchar2) is
     select file_name, round(bytes/1048576,1) filesize, status
     from dba_data_files where
     tablespace_name = upper(t);
     wcount number := 0;
     wdate varchar2 (25) := to_char(sysdate,'Mon DD, YYYY  HH:MI AM');
     w5space char(5) := '.    ';
     wdum1 varchar2 (255);
     wdum2 varchar2 (255);
     wdum3 varchar2 (255);
     wdum4 varchar2 (255);
     wdum5 varchar2 (255);
     wdum6 varchar2 (255);
     wdum7 varchar2 (255);
     wfrag number :=0;
  begin
    dbms_output.enable(100000);
    for rts in cts loop
      dbms_output.put_line('********** TABLESPACE INFORMATION **********          ' || wdate);
      dbms_output.put_line('*--------------------------------------------------------------------------*');
      dbms_output.put_line('Tablespace Name                   Ini(K)    Nxt(K)    PctInc          MaxExt');
      dbms_output.put_line('TotSize(M)         Free(M) (%)       FreeExts     MaxSize(M)          Status');
      dbms_output.put_line('*--------------------------------------------------------------------------*');
      wcount := wcount + 1;
      dbms_output.put_line(rpad(rts.tablespace_name||'/'||rts.contents||'/'||rts.logging,30) || lpad(rts.ini_ext,10) || lpad(rts.nxt_ext,10) || lpad(rts.pct_increase,10) || lpad(rts.max_extents,16));
      select round(sum(bytes)/1048576,1) into wdum1 
      from   dba_data_files
      where  tablespace_name = rts.tablespace_name;
      select round(sum(bytes)/1048576,1), count(tablespace_name), 
             round(max(bytes)/1048576,1) 
      into wdum2, wdum3, wdum4
      from   dba_free_space
      where  tablespace_name = rts.tablespace_name;
      dbms_output.put_line(rpad(wdum1,15) || lpad(wdum2||' / '||round(wdum2/wdum1*100)||'%',15) || lpad(wdum3,15) || lpad(wdum4,15) || lpad(rts.status,16));
      dbms_output.put_line(w5space);
      select count(*) into wfrag from dba_free_space where tablespace_name =rts.tablespace_name;
      dbms_output.put_line('Number of Fragments = '||wfrag);
      dbms_output.put_line(' Where Number of Fragments = Number of datafiles is ideal.');
      dbms_output.put_line(w5space || 'File Name                                     Size (M)           Status');
      dbms_output.put_line(w5space || '*---------------------------------------------------------------------*');
      for rdf  in cdf (rts.tablespace_name) loop
          dbms_output.put_line(w5space || rpad(rdf.file_name,50) || rpad(rdf.filesize,10) || lpad(rdf.status,11));
          end loop;
      dbms_output.put_line(w5space);
    end loop;
    dbms_output.put_line('*--------------------------------------------------------------------------*');
    if wcount =0 then
      dbms_output.put_line('******************************************************');
      dbms_output.put_line('*                                                    *');
      dbms_output.put_line('* Plese Verify Input Parameters... No Matches Found! *');
      dbms_output.put_line('*                                                    *');
      dbms_output.put_line('******************************************************');
    end if;
  end;
/
set serveroutput off feedback on verify on pages 999
spool off
