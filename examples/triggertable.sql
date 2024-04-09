ALTER TABLE object ADD CONSTRAINT object_ck_1 check (data IS JSON(STRICT));


CREATE TABLE hotel_feature(
  feature VARCHAR2(100) NOT NULL,
  CONSTRAINT hotel_feature_pk PRIMARY KEY(feature)
);

CREATE OR REPLACE TRIGGER hotel_feature_tr
  AFTER INSERT OR UPDATE OR DELETE ON hotel_feature
DECLARE enum VARCHAR2(32000);
BEGIN
  SELECT listagg('"'||REPLACE(feature,'"', '\"')||'"', ',') WITHIN GROUP (ORDER BY feature) 
  INTO enum 
  FROM hotel_feature;
  UPDATE object_type SET object_schema =
    json_mergepatch(object_schema, '{"properties": {"features": {"items": {"enum":['||enum||']}}}}')
  WHERE object_type_name='Hotel';
END;
/

