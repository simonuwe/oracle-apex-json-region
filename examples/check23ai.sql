--
-- validate the data column for all rows agains it's JSON-schema 
--

set pages 1000


set pages 1000
set linesize 100
set trimspool on
SELECT  
  object_id, object_name,
  dbms_lob.getlength(data) as datalen,
  o.object_type_id, object_type_name, json_serialize(DBMS_JSON_SCHEMA.validate_report(JSON(data), JSON(object_schema)) PRETTY) as result
from object o join object_type ot on (o.object_type_id=ot.object_type_id)
--where o.object_type_id=1
;


--
--  Gen JSON-schema from duality-view
--

select  JSON_SERIALIZE(DBMS_JSON_SCHEMA.DESCRIBE('JSON23AI') pretty) from dual;