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
COMMIT;

exit;