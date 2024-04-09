ALTER TABLE object23c ADD CONSTRAINT object23c_ck_1 check (data is json validate q'[{
  "type"       : "object",
  "properties" : {"fruit"    : {"type"      : "string",
                                "minLength" : 1,
                                "maxLength" : 10},
                  "quantity" : {"type"      : "number",
                                "minimum"   : 0,
                                "maximum"   : 100},
                  "orderdate": {"type": "string",
                                "default": "NOW",
                                "format": "date"}
  },
  "required"   : ["fruit", "quantity"]
}]');


ALTER TABLE object ADD CONSTRAINT object_ck_1 check (data IS JSON(STRICT));