
-- ALTER TABLE dataitem DROP CONSTRAINT dataitem_ck_1;

ALTER TABLE dataitem modify (data JSON);

ALTER TABLE dataitem ADD CONSTRAINT dataitem_ck_1 check (data is json validate '{
  "type"       : "object",
  "properties" : {"fruit"    : {"type"      : "string",
                                "minLength" : 1,
                                "maxLength" : 10},
                  "quantity" : {"type"      : "number",
                                "minimum"   : 0,
                                "maximum"   : 100}},
                  "orderdate": {"type": "string",
                                "format": "date"},
  "required"   : ["fruit", "quantity"]
}');