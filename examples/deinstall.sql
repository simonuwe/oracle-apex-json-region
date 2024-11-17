-- drop all already installed objects of the generic demo application

BEGIN
  FOR l_object IN (
    SELECT object_type, object_name
    FROM user_objects WHERE object_name IN ('RELATION', 'OBJECT', 'RELATION_TYPE', 'OBJECT_TYPE', 'CARDINALITY', 'OBJECT23AI', 'JSON23AI', 'DRIVER_RACE_MAP', 'DRIVER', 'TEAM', 'RACE', 'JSON_REGION_SCHEMA', 'JSON_REGION_GENERATE_ENUM')
  ) LOOP
    dbms_output.put_line(l_object.object_type||'-'||l_object.object_name);
    EXECUTE IMMEDIATE 'DROP '||l_object.object_type||' '||l_object.objecT_name||CASE l_object.object_type WHEN 'TABLE' THEN ' CASCADE CONSTRAINTS' ELSE '' END;
  END LOOP;
END;
/