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
                    "enum": ["Pool", "Bar", "Restaurant", "Carpark"]
                  },
                  "apex": {"itemtype": "combobox"} 
    },
    "comment": {
      "type": "string", "maxLength": 4000,          
      "apex": {"itemtype": "richtext", "lines": 10, "colSpan": 6}
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
  "additionalProperties": false,
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

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-array-1',q'[{
  "type": "object",
  "properties": {
    "checkbox": { "type": "array",
                  "items": {
                    "type": "string",
                    "enum": ["val1", "val2", "val3"]
                  }
    },
    "checkbox_hor": { "type": "array",
                      "items": {
                        "type": "string",
                        "enum": ["val1", "val2", "val3"],
                        "apex": {
                          "enum": {"val1": "disp1", "val2": "disp2", "val3": "disp3"}
                        }
                      },
                      "apex": {
                        "direction": "horizontal"
                      }
    },
    "combo": { "type": "array",
               "items": {
                 "type": "string",
                 "enum": ["val1", "val2", "val3"]
               },
               "apex": {"itemtype": "combobox"}
    }
  }
}]');


Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-array-2',q'[{
  "type": "object",
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
    "email":     {"type": "string", "format": "email"},
    "addresses": {
      "type": "array",
      "items": {"$ref": "#/$defs/address"}
    } 
  },
  "$defs":{
    "name": {"type": "string", "maxLength": 30},
    "address": {
      "type": "object",
      "required": ["zipcode", "city"],
      "properties": {
        "country": {"type": "string"},
        "zipcode": {"type": "string"},
        "city":    {"type": "string"},
        "street":  {"type": "string"}
      }
    }
  }
}
]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-array-3',q'[{ 
  "type":"object",
  "properties": {
    "name": {"type": "string"},
    "interests": {
      "type": "array",
      "items": {
        "type": "string"
      }
    }
  }
}]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-boolean-1',q'[{
  "type": "object",
  "required": ["checkbox", "bool_switch", "bool_radio", "radio", "select"],
  "properties": {
    "checkbox": { "type": "boolean"},
    "checkbox_optional": { "type": "boolean"},
    "bool_switch": {
      "type": "boolean", 
      "apex":{"itemtype": "switch"}
    },
    "bool_radio": {
      "type": "boolean", 
      "apex": {"itemtype": "radio"}
    },
    "bool_radio_hor": {
      "type": "boolean", 
      "apex":{"itemtype": "radio", "direction": "horizontal"}
    },
    "select": { "type": "boolean",
                "apex": {"itemtype": "select"}
    }
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-default-1',q'[{
  "type": "object",
  "properties": {
    "string": {"type": "string", "default": "string"},
    "date": {"type": "string", "format": "date", "default": "NOW"},
    "datetime": {"type": "string", "format": "date-time", "default": "NOW"},
    "long_string": {"type": "string", "maxLength": 1000, "default": "long\nstring"},
    "boolean": {
      "type": "boolean", "default": true
    },
    "switch": {
      "type": "boolean", "default": true,
      "apex": {"itemtype": "switch"}
    },
    "radio": {
      "type": "boolean", "default": true,
      "apex": {"itemtype": "radio"}
    },
    "integer": {"type": "integer", "default": 4711},
    "number":  {"type": "number", "default": 8.15},
    "money":        {
      "type": "integer", "default": 4711,
      "apex": {"format": "currency"}
    },
    "money_cent":   {
      "type": "number", "default": 8.15,
      "apex": {"format": "currency"}
    },
    "starrating": {
      "type": "integer", "maximum": 5, "default": 3,
      "apex": {"itemtype": "starrating"}
    },
    "editor_string": {
      "type": "string", "maxLength": 1000, "default": "editor\n**string**",
      "apex": {"itemtype": "richtext", "colSpan":12}
    }
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-dependent-1',q'[{
  "type": "object",
  "required": ["lastname"],
  "dependentRequired":{
    "zip": ["city"],
    "city":   ["zip"]
  },
  "properties": {
    "lastname":  {"type": "string"},
    "firstname": {"type": "string"},
    "zip":       {"type": "string"},
    "city":      {"type": "string"},
    "payment":   {"type": "string", "enum":["Visa", "Mastercard", "Amex", "Diners"]}
  },
  "dependentSchemas": {
    "payment": {
     "type": "object",
      "properties": {
        "creditcard":    {"$ref": "#/$defs/creditcard"}
      }
    }
  },
  "$defs":{
    "creditcard": { 
      "type": "object",
      "required": ["number", "validity", "securitycode"],
      "properties": {
        "number":       { "type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}"},
        "validity":     { "type": "string", "pattern": "[0-9]{2}/[0-9]{2}"},
        "securitycode": { "type": "integer", "maximum": 999}
      }
    }
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-enum-1','{
  "type": "object",
  "properties": {
    "select": { "type": "string", "enum": ["val1", "val2", "val3"]},
    "radio_hor": { 
      "type": "string",
      "enum": ["val1", "val2"],
      "apex": {"itemtype": "radio", "direction": "horizontal", "enum": {"val1": "disp1", "val2": "disp2"}}
    },
    "radio_ver": { 
      "type": "string",
      "enum": ["val1", "val2"],
      "apex": {"itemtype": "radio", "direction": "vertical", "enum": {"val1": "disp1", "val2": "disp2"}}
    },
    "num_enum": {
      "type": "integer",
      "enum": [1, 2, 3, 4, 5],
      "apex": {
        "enum": {
          "1": "1",
          "2": "Two",
          "3": "Three",
          "4": "Four",
          "5": "Five"
        }
      }
    },
    "num_combo": { "type": "array",
      "items": {
        "type": "integer",
        "enum": [1,2,3]
      },
      "apex": {"itemtype": "combobox"}
    }
  }
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-format-1',q'[{
  "type": "object",
  "required": ["date", "date_time", "time", "email", "uri"],
  "properties": {
    "date":         { 
     "type": "string", 
     "format": "date",
     "default": "NOW"
    },
    "date_time":    { 
      "type": "string", 
      "format": "date-time",
      "default": "NOW"
    },
    "time": {
      "type": "string",
      "format": "time",
      "default": "now"
    },
    "date_past":         { 
     "type": "string", 
     "format": "date",
     "default": "NOW",
     "maximum": "NOW"
    },    "date_future":         { 
     "type": "string", 
     "format": "date",
     "default": "NOW",
     "minimum": "NOW"
    },
    "email":        { "type": "string", "format": "email", "apex": {"newRow": true}},
    "uri":          { "type": "string", "format": "uri"}
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-if-1',q'[{
  "type": "object",
  "required": ["lastname"],
  "additionalProperties": false,
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
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
       }
   }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-if-2',q'[{
  "type": "object",
  "required": ["lastname"],
  "additionalProperties": false,
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
    "office_address":     {"$ref": "#/$defs/address"},
    "invoice_address":    { "type": "boolean"},
    "deliverytohome":     { "type": "boolean", "apex": {"type": "switch", "label": "Delivery to homeoffice"}}
  },
  "if": {
    "allOf": [
      {
        "properties": {
          "anyOf": [
            {"deliverytohome":  { "const": true}},
            {"not": {"invoice_address": { "const": true}}}
          ]
        } 
      },
      { "required": ["lastname", "firstname"]}
    ]
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
       }
   }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-image-1','{
  "type": "object",
  "required": [],
  "properties": {
    "image": {
      "type": "string",
      "contentEncoding": "base64",
      "contentMediaType": "image/png"
    },
    "image_url": {
      "type": "string",
      "format": "uri",
      "apex": {"itemtype": "image"}
    },
    "qrcode": { 
      "type": "string",
      "apex": {"itemtype": "qrcode"}
    }
  }
}');


Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('Invoice',q'[
{ 
  "type":"object",
  "properties": {
    "customer": {"$ref": "#/$defs/customer"},
    "invoice":  {"$ref": "#/$defs/invoice"},
    "items": {
      "type": "array",
      "items": {"$ref": "#/$defs/item"}
    },
    "total":    {"$ref": "#/$defs/total"},
    "payment":  {"$ref": "#/$defs/payment"},
    "comments": {"type": "string", "maxLength": 1000}
  },
  "$defs": {
    "invoice": {
      "type": "object",
      "required": ["nr", "date", "status"],
      "properties": {
        "nr": {"type": "integer"},
        "date": {"type": "string", "format": "date", "maximum": "now"},
        "status": {"type": "string", "default": "new", "enum": ["new", "open", "paid", "rejected"]}
      }
    },
    "sepa": {
      "type": "object",
      "required": ["iban"],
      "properties": {
        "iban": {"type": "string", "pattern": "[A-Z]{2}[0-9]{2}[0-9]{12,30}"},
        "bic":  {"type": "string", "pattern": "[A-Z0-9]{11}", "apex": {"colSpan": 3}}
      }
    },
    "creditcard": {
      "type": "object",
      "required": ["number", "validity", "securitycode"],
      "properties":{
        "number":       { "type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}",  "apex": {"placeholder": "1234 1234 1234 1234"}},
        "validity":     { "type": "string", "pattern": "[0-9]{2}/[0-9]{2}", "apex": {"placeholder": "00/00", "colSpan": 2}},
        "securitycode": { "type": "string", "pattern": "[0-9]{3}", "maxLength": 3, "apex": {"colSpan": 2, "itemtype": "password"}}
      }
    },
    "payment": {
      "type": "object",
      "required": ["type"],
      "properties": {
        "type": {"type": "string", "enum": ["SEPA", "VISA", "Mastercard", "Amex", "Diners"], "apex": {"colSpan": 2}}
      },
      "if": {"type": {"const": "SEPA"}},
      "then": {
        "properties": {
          "sepa": {"$ref": "#/$defs/sepa"}
        }
      },
      "else": {
        "properties": {
          "creditcard": {"$ref": "#/$defs/creditcard"}
        }
      }
    },
    "customer": {
      "type": "object",
      "required": ["name", "zipcode", "city"],
      "properties": {
        "name":    { "type": "string"},
        "zipcode": { "type": "string"},
        "city":    { "type": "string"},
        "street":  { "type": "string"}
      }
    },
    "item": {
      "type": "object",
      "required": ["description", "quantity", "unit", "price_per_unit"],
      "properties": {
        "description":    { "type": "string", "apex": {"colSpan": 3}},
        "quantity":       {"type": "integer", "apex": {"colSpan": 2, "align": "right"}},
        "unit":           {"type": "string", "enum": ["hour", "day", "pcs", "l", "m","km", "m²", "m³"], "apex": {"colSpan": 2}},
        "price_per_unit": {"type": "number", "apex": {"colSpan": 2, "format": "currency", "align": "right"}},
        "total":          {"type": "number", "apex": {"colSpan": 2, "format": "currency", "align": "right"}}
     }
    },
    "total": {
      "type": "object",
      "required": ["description", "units", "price_per_unit"],
      "properties": {
        "total": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right"}},
        "vat": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right", "label": "VAT 10%"}},
        "grand total": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right"}}
     }
    }

  }
}]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-numeric-1',q'[{
  "type": "object",
  "required": ["int", "number"],
  "properties": {
    "int":          { "type": "integer", "minimum": 10, "maximum": 99 },
    "number":       { "type": "number" },
    "money_cent":   { "type": "number", "apex": {"format": "currency"}},
    "money":        { "type": "integer", "apex": {"format": "currency"}},
    "num_sel":      { "type": "number", "enum": [0, 0.5, 1, 1.5, 2]},
    "num_enum": {
      "type": "integer",
      "enum": [1, 2, 3, 4, 5],
      "apex": {
        "enum": {
          "1": "1",
          "2": "Two",
          "3": "Three",
          "4": "Four",
          "5": "Five"
        }
      }
    },
    "starrating": {
      "type": "integer", "maximum": 5,
      "apex": {"itemtype": "starrating"}
    }
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-object-1',q'[{
  "type": "object",
  "required": ["lastname"],
  "properties": {
    "lastname":  {"type": "string"},
    "firstname": {"type": "string"},
    "business":  {"$ref": "#/$defs/address", "apex": {"label": "Business address"}},
    "home":      {"$ref": "#/$defs/address"}
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
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-poll-1',q'[{
  "type": "object",
  "additionalProperties": false,
  "required": ["rating"],
  "properties":{
    "rating": { "type": "integer", "maximum": 5, "apex": {"itemtype": "starrating", "label": "Overall rating"}},
    "question1": { "$ref": "#/$defs/question", "apex": {"label": "How did you like the hotel?"}},
    "question2": { "$ref": "#/$defs/question", "apex": {"label": "How did you like the room?"}},
    "question3": { "$ref": "#/$defs/question", "apex": {"label": "Hod did you like the restaurant?"}},
    "question4": { "$ref": "#/$defs/question", "apex": {"label": "How id you like the service?"}},
    "comment": {
      "type": "string", "maxLength": 1000,
      "apex": {"label": "General Comments", "textBefore": "Others"}
    }
  },
  "$defs": {
    "question": {
      "type": "object",
      "required": ["vote"],
      "properties":{
        "vote": { 
          "type": "string", 
          "enum": ["1","2","3","4","5","not used" ],
          "apex": {"itemtype": "radio", "direction": "horizontal", "colSpan": 6}
        }
      },
      "if": {
        "properties": {
          "vote": { "enum": ["1", "2", "3"]}
        }
      },
      "then": {
      "required": ["comment"],
        "properties": {
          "comment":     {
            "type": "string", "maxLength": 1000,
            "apex": {"colSpan": 6, "label": "why did you rate 1, 2, 3"} 
          }
        }
      }
    }
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-properties-1',q'[{
  "type": "object",
  "additionalProperties": true,
  "properties":{
    "input": {"type": "string"}
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-readonly-1',q'[{
  "type": "object",
  "required": ["input"],
  "properties": {
    "input":   { "type": "string"},
    "display": { "type": "string", "apex": {"readonly": true}},
    "display_only": {
      "type": "object",
      "apex": { "readonly": true},
      "properties": {
          "string":      { "type": "string"},
          "date":        { "type": "string", "format": "date"},
          "datetime":    { "type": "string", "format": "date-time"},
          "long_string": { "type": "string", "maxLength": 1000},
          "boolean": {
            "type": "boolean"
          },
          "switch": {
            "type": "boolean",
            "apex": { "itemtype": "switch"}
          },
          "integer": { "type": "integer"},
          "number":  { "type": "number"},
          "money_cent":   {
            "type": "number", 
            "apex": { "format": "currency"}
          },
          "money":        {
            "type": "integer", 
            "apex": { "format": "currency"}
          },
          "starrating": {
            "type": "integer", "maximum": 5,
            "apex": { "itemtype": "starrating"}
          },
          "pct": {
            "type": "integer",
            "apex": { "itemtype": "pctgraph", "newRow": true}
          },
          "image": {
            "type": "string",
            "contentEncoding": "base64",
            "contentMediaType": "image/png"
          },
          "image_url": {
            "type": "string",
            "format": "uri",
            "apex": {"itemtype": "image"}
          },
          "qrcode": { 
            "type": "string",
            "apex": {"itemtype": "qrcode"}
          },
          "editor_string": {
            "type": "string", "maxLength": 1000, 
            "apex": { "itemtype": "richtext", "colSpan":12}
          }
        }
      }
  }
}]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-select-1',q'[{
  "type": "object",
  "properties": {
    "simple": {
      "type": "string",
      "enum": ["val1", "val2", "val3"]
    },
    "radio": {
      "type": "string",
      "enum": ["val1", "val2", "val3"],
      "apex": { 
        "itemtype": "radio"
      }
    },
    "checkbox": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["val1", "val2", "val3"]
      }
    },
    "combo": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["val1", "val2", "val3"]
      },
      "apex": { 
        "itemtype": "combobox"
      }
    },
    "selectone": {
      "type": "string",
      "enum": ["val1", "val2", "val3"],
      "apex": { 
        "itemtype": "selectone"
      }
    },
    "selectmany": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["val1", "val2", "val3"],
        "apex": { 
          "enum": {"val1": "disp1", "val2": "disp2", "val3": "disp3"}
        }
      },
      "apex": { 
        "itemtype": "selectmany"
      }
    }
  }
}]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-string-1',q'[{
  "type": "object",
  "required": ["string", "radio", "long_string", "editor_string", "password"],
  "properties": {
    "string": { "type": "string"},
    "pattern": { 
      "type": "string", 
      "pattern": "[0-9]{4}( [0-9]{4}){3}",
      "apex": {"label": "CC pattern"}
    },
    "all_lower": { "type": "string", "apex": {"textcase": "lower"}},
    "long_string": { "type": "string", "maxLength":400},
    "length": { "type": "string", "minLength": 3, "maxLength":10},
    "password":  {"type": "string", "minLength": 8, "maxLength": 16, "writeOnly": true, "apex": {"itemtype": "password"}},
    "select": { "type": "string", "enum": ["val1", "val2", "val3"]},
    "radio": { 
      "type": "string",
      "enum": ["val1", "val2"],
      "apex": {"itemtype": "radio", "direction": "horizontal", "enum": {"val1": "disp1", "val2": "disp2"}}
    },
    "editor_string": { 
      "type": "string", 
      "maxLength":400,
      "apex": {"itemtype": "richtext", "newRow": true, "colSpan": 12}
    }
  }
}]');
Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-validate-1',q'[{
  "type":"object",
  "properties": {
    "boolean": {
      "type": "object",
      "required": ["checkbox", "switch", "radio", "select", "switch"],
      "properties": {
        "checkbox": {"type": "boolean"},
        "radio":    {"type": "boolean", "apex":{"itemtype": "radio"}},
        "select":   {"type": "boolean", "apex":{"itemtype": "select"}},
        "switch":   {"type": "boolean", "apex":{"itemtype": "switch"}}
      }
    },
    "numeric": {
      "type": "object",
      "required": ["integer", "number", "money", "money_full", "starrating"],
      "properties": {
        "integer":      {"type": "integer", "minimum": 1,    "maximum": 99},
        "number":       {"type": "number",  "minimum": 0.01, "maximum":99.99},
        "money":        {"type": "integer", "minimum": 1,    "maximum":99, "apex": {"format": "currency"}},
        "money_full":   {"type": "number",  "minimum": 0.01, "maximum":99.99, "apex": {"format": "currency"}},
        "starrating":   { "type": "integer", "minimum": 1, "maximum": 5, "apex": {"itemtype": "starrating"}}
      }
    },
    "string": {
      "type": "object",
      "required": ["string", "pattern", "password", "long_string", "editor_string"],
      "properties": {
        "string":        {"type": "string"},
        "pattern": { 
          "type": "string", 
          "pattern": "[0-9]{4}( [0-9]{4}){3}",
          "apex": {"label": "CC pattern"}
        },
        "password":  {
          "type": "string", "minLength": 8, "maxLength": 16, 
          "apex": {"itemtype": "password"}
        },
        "long_string":   {"type": "string", "maxLength": 400},
        "editor_string": {"type": "string", "maxLength": 400, "apex": {"itemtype": "richtext", "colSpan": 12}}
      }
    },
    "date": {
      "type": "object",
      "required": ["date", "datetime", "time"],
      "properties": {
        "date":     {"type": "string", "format": "date",      "minimum": "2024-01-01T:00:00:00", "maximum": "now"},
        "datetime": {"type": "string", "format": "date-time", "minimum": "NOW", "maximum": "2024-12-31T23:59:00"},
        "time":     { "type": "string", "format": "time", "minimum": "09:00", "maximum": "16:59" }
      }
    },

    "array": {
      "type": "object",
      "required": ["checkbox", "combo", "num_combo"],
      "properties": {
        "checkbox": { "type": "array",
                      "items": {
                        "type": "string",
                        "enum": ["val1", "val2", "val3"]
                      }
        },
        "combo": { "type": "array",
                   "items": {
                     "type": "string",
                     "enum": ["val1", "val2", "val3"]
                   },
                   "apex": {"itemtype": "combobox"}
        },
        "num_combo": { "type": "array",
          "items": {
            "type": "integer",
            "enum": [1,2,3]
          },
          "apex": {"itemtype": "combobox"}
        }
      }
    }
  }
}]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-placeholder-1', q'[{ 
  "type":"object",
  "properties": {
    "string":    {"type": "string", "apex": {"placeholder": "string input"}},
    "credit_card":    {"type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}", "apex": {"placeholder": "1234 1234 1234 1234"}},
    "integer":   {"type": "integer", "apex": {"placeholder": "integer input"}},
    "number":    {"type": "number", "apex": {"placeholder": "number input"}},
    "date":      {"type": "string", "format": "date", "apex": {"placeholder": "date input"}},
    "date_time": {"type": "string", "format": "date-time", "apex": {"placeholder": "date-time input"}},
    "combo": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["val1", "val2", "val3"]
      },
      "apex": { 
        "itemtype": "combobox",
        "placeholder": "combo select/input"
      }
    },
    "selectone": {
      "type": "string",
      "enum": ["val1", "val2", "val3"],
      "apex": { 
        "itemtype": "selectone",
        "placeholder": "select one"
      }
    }
  } 
}]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-template-1', q'[{
  "type": "object",
  "required": ["floating_req", "above_req", "left_req", "hidden_req"],
  "properties": {
    "floating_req": {
      "type": "string",
      "apex": {"template": "floating"}
    },
    "floating_opt": {
      "type": "string",
      "apex": {"template": "floating"}
    },
    "above_req": {
      "type": "string",
      "apex": {"template": "above", "newRow": true}
    },
    "above_opt": {
      "type": "string",
      "apex": {"template": "above"}
    },
    "left_req": {
      "type": "string",
      "apex": {"template": "left", "newRow": true}
    },
    "left_opt": {
      "type": "string",
      "apex": {"template": "left"}
    },
    "hidden_req": {
      "type": "string",
      "apex": {"template": "hidden", "newRow": true}
    },
    "hidden_opt": {
      "type": "string",
      "apex": {"template": "hidden"}
    }
  },
  "apex": {"template": "above"}
}]');

Insert into OBJECT_TYPE (OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('test-css-1', q'[{
  "type":"object",
  "apex": {"css": "class-object"},
  "properties":{
    "lastname": {
      "type": "string",
      "apex": { "css": "class-lastname" }
    },
    "firstname": {
      "type": "string",
      "apex": { "css": "class-firstname" }
    }

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