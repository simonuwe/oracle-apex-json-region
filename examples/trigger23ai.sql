--
-- Trigger for validation of a JSON-column with a JSON-schema from a lookup table
-- object_schema with {"apex": {"validate": false"} are not validated
--
CREATE OR REPLACE TRIGGER object_tr 
BEFORE INSERT OR UPDATE ON object
FOR EACH ROW
DECLARE
  l_schema object_type.object_schema%TYPE;
  l_ret    PLS_INTEGER;
BEGIN
  SELECT object_schema INTO l_schema 
  FROM object_type ot 
  WHERE ot.object_type_id=:new.object_type_id;
  IF NVL(JSON_VALUE(l_schema, '$.apex.validate'),'true') = 'true' THEN
    l_ret:= DBMS_JSON_SCHEMA.is_valid(:new.data, l_schema, DBMS_JSON_SCHEMA.RAISE_ERROR);
  END iF;
END;
/