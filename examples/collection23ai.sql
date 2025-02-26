-- Oracle 23ai collection view and table

CREATE JSON COLLECTION TABLE table23ai;	

/*
ALTER TABLE table23ai ADD CONSTRAINT table23ai_ck_1 check (data IS JSON VALIDATE q'[{
  "type"       : "object",
  "properties" : {"fruit"    : {"type"      : "string",
                                "minLength" : 1,
                                "maxLength" : 10},
                  "quantity" : {"type"      : "number",
                                "minimum"   : 0,
                                "maximum"   : 100},
                  "orderdate": {"type":   "string",
                                "format": "date",
                                "apex":   {"default": "NOW"}}
  },
  "required"   : ["fruit", "quantity"]
}]');
*/

CREATE OR REPLACE JSON COLLECTION VIEW view23ai AS
  SELECT JSON {'_id'         : driver_id,
               name,             
               points,
               birthdate,
               team_id} data
    FROM driver;
