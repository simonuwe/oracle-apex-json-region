
-- ALTER TABLE dataitem DROP CONSTRAINT dataitem_ck_1;

ALTER TABLE dataitem ADD CONSTRAINT dataitem_ck_1 check (data is json validate '{
  "type"       : "object",
  "properties" : {"fruit"    : {"type"      : "string",
                                "minLength" : 1,
                                "maxLength" : 10},
                  "quantity" : {"type"      : "number",
                                "minimum"   : 0,
                                "maximum"   : 100}},
  "required"   : ["fruit", "quantity"]
}');