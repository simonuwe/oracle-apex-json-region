-- fill demo table with some data

-- cardinalities
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(1,	'0:1');
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(2,	'1:1');
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(3,	'0:n');
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(4,	'1:n');
COMMIT;

-- object types
INSERT INTO object_type(object_type_name, object_schema) VALUES ('Server', q'[{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor":  {"type": "string", "maxLength": 30},
    "model":   {"type": "string", "maxLength": 30},
    "os":      {"type": "string"},
    "cputype": {"type": "string"},
    "cpus":    {"type": "integer", "minimum": 1},
    "cores":   {"type": "integer", "minimum": 1},
    "threads": {"type": "integer", "minimum": 1},
    "ram":     {"type": "integer", "minimum": 1},
    "storage": {"type": "integer", "minimum": 0},
    "warranty_ends": {"type": "string", "format": "date"}
  }
}]');
INSERT INTO object_type(object_type_name, object_schema) VALUES ('Switch', q'[{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string",  "maxLength": 30},
    "model":  {"type": "string",  "maxLength": 30},
    "ports":  {"type": "integer", "minimum": 1},
    "speed":  {"type": "string",  "enum": ["10MBit", "100MBit", "1GBit", "10GBit", "100GBit"]}
  }
}]');
INSERT INTO object_type(object_type_name, object_schema) VALUES ('Printer', q'[{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string", "maxLength": 30},
    "model": {"type": "string", "maxLength": 30},
    "color": {"type": "boolean"},
    "papersize": {"type": "string", "enum":["A4", "A3", "Letter"]}
   }
}]');
INSERT INTO object_type(object_type_name, object_schema) VALUES ('Full-Example', q'[
{
  "type": "object",
  "required": ["lastname", "gender"],
  "properties": {
    "lastname":           {"$ref": "#/$defs/name"},
    "firstname":          {"$ref": "#/$defs/name"},
    "birthday":           {"type": "string", "format": "date", "minimum": "1900-01-01"},
    "gender":             {"type": "string", "enum":["female", "male", "diverse"]},
    "creditcard":         {"type": "string", "enum":["Visa", "Mastercard", "Amex", "Diners"]},
    "creditid":           {"$ref": "#/$defs/cardid"},
    "salary":             {"type": "integer", "minimum": 10000},
    "retired":            {"type": "boolean"},
    "email":              {"type": "string", "format": "email"},
    "website":            {"type": "string", "format": "uri"},
    "home_address":       {"$ref": "#/$defs/address"},
    "office_address":     {"$ref": "#/$defs/address"},
    "comment":            {"type": "string", "maxLength": 500},
    "lastlogin":          {"type": "string", "format": "date-time"}
  },
  "$defs":{
      "name": {"type": "string", "maxLength": 30},
      "address": {
        "type": "object",
        "required": ["zipcode", "city"],
        "properties": {
           "country": {"type": "string"},
           "state":   {"type": "string"},
           "zipcode": {"type": "string"},
           "city":    {"type": "string"},
           "street":  {"type": "string"}
         }
       }, 
      "cardid": {"type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}"}
   }
}]');
COMMIT;

-- relation types
COMMIT;

-- objects
INSERT INTO object(objecT_type_id, objecT_name, created_at, data)
SELECT objecT_type_id, 'Server1', current_timestamp, q'[{}]' FROM object_type WHERE object_type_name='Server';
INSERT INTO object(objecT_type_id, objecT_name, created_at, data)
SELECT objecT_type_id, 'Server2', current_timestamp, q'[{}]' FROM object_type WHERE object_type_name='Server';
INSERT INTO object(objecT_type_id, objecT_name, created_at, data)
SELECT objecT_type_id, 'Printer1', current_timestamp, q'[{}]' FROM object_type WHERE object_type_name='Printer';
INSERT INTO object(objecT_type_id, objecT_name, created_at, data)
SELECT objecT_type_id, 'Switch1', current_timestamp, q'[{}]' FROM object_type WHERE object_type_name='Switch';
INSERT INTO object(objecT_type_id, objecT_name, created_at, data)
SELECT objecT_type_id, 'Full-Example', current_timestamp, q'[{}]' FROM object_type WHERE object_type_name='Full-Example';
COMMIT;

exit;