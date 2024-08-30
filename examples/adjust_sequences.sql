-- adjust sequences for identity columns
DECLARE 
  l_max NUMBER;
  l_curr NUMBER;
BEGIN
  FOR l_seq in (SELECT table_name, column_name, data_default_vc as val
                FROM user_tab_columns where data_default_vc like '%ISEQ$$%') LOOP
    dbms_output.put_line(l_seq.table_name||' '||l_seq.column_name||' '||l_seq.val);
    EXECUTE IMMEDIATE 'SELECT NVL(MAX('||l_seq.column_name||'),0) FROM '||l_seq.table_name INTO l_max;
    LOOP
      EXECUTE IMMEDIATE 'SELECT '||l_seq.val||' FROM DUAL' INTO l_curr;
      dbms_output.put_line('MAX: '||l_max||' CURR: '||l_curr);    
      EXIT WHEN l_curr>=l_max;
    END LOOP;
  END LOOP;
END;
/
