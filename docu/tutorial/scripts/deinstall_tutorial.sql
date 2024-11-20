Define a script to drop database objects and static files that are created by the installation scripts.

-- drop all already installed objects of the generic demo application

BEGIN
  FOR l_object IN (
    SELECT object_type, object_name
    FROM user_objects WHERE object_name IN ('GENERATE_JSON', 'FIXED_JSON', 'VARIABLE_JSON', 'JSON_TYPE', 'VALIDATE_JSON', 'DUALITY_JSON', 'CUSTOMER', 'ADDRESS', 'JSON_REF_HIERARCHIE', 'JSON_REF_SCHEMA', 'JSON_GENERATE_ENUM', 'JSON_GENERATE_CASCADE_ENUMS')
  ) LOOP
    dbms_output.put_line(l_object.object_type||'-'||l_object.object_name);
    EXECUTE IMMEDIATE 'DROP '||l_object.object_type||' '||l_object.objecT_name||CASE l_object.object_type WHEN 'TABLE' THEN ' CASCADE CONSTRAINTS' ELSE '' END;
  END LOOP;
END;
/
