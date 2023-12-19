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
  "title": "An example schema with all supported types",
  "type": "object",
  "required": ["lastname", "gender"],
  "dependentRequired":{
    "creditcard": ["creditid"]
  },
  "properties": {
    "lastname":    {"$ref": "#/$defs/name"},
    "firstname":   {"$ref": "#/$defs/name"},
    "birthday":    {"type": "string", "format": "date", "minimum": "1900-01-01"},
    "gender":      {"type": "string", "enum":["female", "male", "diverse"]},
    "creditcard":  {"type": "string", "enum":["Visa", "Mastercard", "Amex", "Diners"]},
    "creditid":    {"$ref": "#/$defs/cardid"},
    "salary":      {"type": "number", "minimum": 10000.00,
                    "apex": {"format": "currency"}
                   },
    "payments":    {"type": "integer", "minimum": 1, "maximum": 15},
    "retired":     {"type": "boolean"},
    "email":       {"type": "string", "format": "email"},
    "website":     {"type": "string", "format": "uri"},
    "home_address":       {"$ref": "#/$defs/address"},
    "office_address":     {"$ref": "#/$defs/address",
                           "room": {"type": "string"}
                          },
    "comment":     {"type": "string", "maxLength": 500},
    "lastlogin":   {"type": "string", "format": "date-time", "default": "2023-01-02T12:10:20"},
    "source":      {"const": "via APEX-application"},
    "dummy":       {"type": "null"}
  },
  "$defs":{
      "name": {"type": "string", "maxLength": 30},
      "address": {
        "type": "object",
        "required": ["zipcode", "city"],
        "properties": {
           "country": {"$ref": "#/$defs/name"},
           "state":   {"$ref": "#/$defs/name"},
           "zipcode": {"type": "string", "maxLength": 10},
           "city":    {"$ref": "#/$defs/name"},
           "street":  {"$ref": "#/$defs/name"}
         }
       }, 
      "cardid": {"type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}"}
   }
}]');

INSERT INTO object_type(object_type_name, object_schema) VALUES ('Hotel', q'[
{
  "type": "object",
  "properties": {
     "name":      { "type": "string"},
     "continent": { "type": "string",
                    "enum": ["Europe", "Africa", "America", "Antarctica", "Asia", "Australia"],
                    "apex": {"itemtype": "radio", "newRow": true, "textBefore": "Location Info"}
                  },
     "country":   { "type": "string"
                  },
     "city":      { "type": "string"},
     "stars": {
        "type": "integer", "maximum": 5,
        "apex": {"itemtype": "starrating", "label": "*-rating"}
     },
    "roomrates": {
       "type": "object",
       "properties":{
          "from": {"$ref": "#/$defs/price"},
          "to":   {"$ref": "#/$defs/price"}
       }
    },
    "allinclusive": {
      "type": "boolean", 
      "apex": {"itemtype": "switch"}
    },
    "breakfastincluded": {
      "type": "boolean", 
      "apex": {"itemtype": "switch"}
    },
    "updated":   {"extendedType": "date",
                  "format": "date-time",
                  "default": "NOW"
    },
    "features":  {"type": "array",
                  "items": { 
                    "type": "string", 
                    "enum": ["Pool", "Bar", "Restaurant", "Carpark"],
                    "apex": {"itemtype": "combobox"}
                  } 
    },
    "comment": {
      "type": "string", "maxLength": 4000,          
      "apex": {"lines": 10, "colSpan": 6}
    }
  },
  "required": ["name", "continent", "city"],
  "$defs" :{
    "price": {
        "type": "number",
        "minimum": 0,
        "apex": {"format": "currency"}
     }
  }
}]');

INSERT INTO object_type(object_type_name, object_schema) VALUES ('Person', q'[{
  "type": "object",
  "required": ["lastname", "email"],
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
    "email":     {"type": "string", "format": "email"},
    "job":       {"type": "string", "enum": ["User", "DBA", "Admin"]},
    "password":  {"type": "string", "minLength": 8, "maxLength": 8, 
                  "apex": {"itemtype": "password"}},
    "office_address":     {"$ref": "#/$defs/address"},
    "deliverytohome":     { "type": "boolean", "apex": {"type": "switch", "label": "Delivery to homeoffice"}}
  },
  "if": {
      "properties": {
        "deliverytohome": { "const": true}
      }
  },
  "then": {
     "properties": {
       "home_address":     {"$ref": "#/$defs/address"}
     }
  },
  "else": {
     "properties": {
       "delivery_info":     {"type": "string"}
     }
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
INSERT INTO relation_type (relation_type_NAME,from_object_type_id,from_cardinality_id,to_object_type_id,to_cardinality_id,relation_schema) 
SELECT 'booking', f.object_type_id, 3, t.object_type_id, 3,q'[{
  "type":  "object",
  "properties": {
     "checkin":      { "type":  "string", "format":  "date"},
     "checkout":   { "type":  "string", "format":  "date"},
     "checkedin":  { "type":  "boolean"}, 
      "room": {"type": "string"}
  },
  "required": ["checkin", "checkout"]
}]'
FROM object_type f, object_type t where f.object_type_name='Person' and t.object_type_name='Hotel';

INSERT INTO relation_type (relation_type_NAME,from_object_type_id,from_cardinality_id,to_object_type_id,to_cardinality_id,relation_schema) 
SELECT 'Server->Switch', f.object_type_id, 3, t.object_type_id, 4,q'[{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}]'
FROM object_type f, object_type t where f.object_type_name='Server' and t.object_type_name='Switch';

INSERT INTO relation_type (relation_type_NAME,from_object_type_id,from_cardinality_id,to_object_type_id,to_cardinality_id,relation_schema) 
SELECT 'Switch->Switch', f.object_type_id, 3, t.object_type_id, 3, '{}'
FROM object_type f, object_type t where f.object_type_name='Switch' and t.object_type_name='Switch';

INSERT INTO relation_type (relation_type_NAME,from_object_type_id,from_cardinality_id,to_object_type_id,to_cardinality_id,relation_schema) 
SELECT 'Printer->Switch', '3', f.object_type_id, '2', t.object_type_id, q'[{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}]'
FROM object_type f, object_type t where f.object_type_name='Printer' and t.object_type_name='Switch';

INSERT INTO relation_type (relation_type_NAME,from_object_type_id,from_cardinality_id,to_object_type_id,to_cardinality_id,relation_schema)  
SELECT 'Server owned by', f.object_type_id, 3, t.object_type_id, 2, '{}'
FROM object_type f, object_type t where f.object_type_name='Server' and t.object_type_name='Person';

INSERT INTO relation_type (relation_type_NAME,from_object_type_id,from_cardinality_id,to_object_type_id,to_cardinality_id,relation_schema)  
SELECT 'Server->Admin',f.object_type_id, 4, t.object_type_id, 3, '{}'
FROM object_type f, object_type t where f.object_type_name='Server' and t.object_type_name='Person';
COMMIT;

-- objects
INSERT INTO object(object_type_id, object_name, created_at, data)
SELECT object_type_id, 'uwe', current_timestamp, q'[{"lastname": "Simon", "firstname": "Uwe", "email": "uwe.simon@magenta.de", "job": "admin"}]' FROM object_type WHERE object_type_name='Person';
COMMIT;

exit;