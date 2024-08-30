-- drop all already installed objects of the generic demo application

BEGIN
  FOR l_object IN (
    SELECT object_type, object_name
    FROM user_objects WHERE object_name IN ('RELATION', 'OBJECT', 'RELATION_TYPE', 'OBJECT_TYPE', 'CARDINALITY', 'OBJECT23AI', 'DRIVER', 'TEAM', 'JSON23AI')
  ) LOOP
    dbms_output.put_line(l_object.object_type||'-'||l_object.object_name);
    EXECUTE IMMEDIATE 'DROP '||l_object.object_type||' '||l_object.objecT_name||' CASCADE CONSTRAINTS';
  END LOOP;
END;
/