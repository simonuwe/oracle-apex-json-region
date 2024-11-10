-- cardinalities
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(1,	'0:1');
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(2,	'1:1');
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(3,	'0:n');
INSERT INTO cardinality (cardinality_id, cardinality_name) VALUES(4,	'1:n');
COMMIT;

-- object types
REM INSERTING into OBJECT_TYPE
SET DEFINE OFF;
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('1','Server',TO_CLOB(q'[{
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
 ]')
|| TO_CLOB(q'[   "warranty_ends": {"type": "string", "format": "date"}
  },
  "apex": {
    "display": {
      "default": "Server: #$.vendor# #$.model#"
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2','Switch','{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string",  "maxLength": 30},
    "model":  {"type": "string",  "maxLength": 30},
    "ports":  {"type": "integer", "minimum": 1},
    "speed":  {"type": "string",  "enum": ["10MBit", "100MBit", "1GBit", "10GBit", "100GBit"]}
  }
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('3','Printer','{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string", "maxLength": 30},
    "model": {"type": "string", "maxLength": 30},
    "color": {"type": "boolean"},
    "papersize": {"type": "string", "enum":["A4", "A3", "Letter"]}
   }
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('4','Full-Example',TO_CLOB(q'[
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
    "birthday":    {
                     "type": "string", "format": "date", 
                     "apex": {"minimum": "1900-01-01"}
                   },
    "gender":      {"type": "string", "enum":["female", "m]')
|| TO_CLOB(q'[ale", "diverse"]},
    "creditcard":  {"type": "string", "enum":["Visa", "Mastercard", "Amex", "Diners"]},
    "creditid":    {"$ref": "#/$defs/cardid"},
    "salary":      {"type": "number", "minimum": 10000.00,
                    "apex": {"format": "currency"}
                   },
    "payments":    {"type": "integer", "minimum": 1, "maximum": 15},
    "retired":     {"type": "boolean"},
    "email":       { "type": "string", 
                     "apex": {"format": "email"}
                ]')
|| TO_CLOB(q'[   },
    "website":     { "type": "string", 
                     "apex": {"format": "uri"
                   }},
    "home_address":       {"$ref": "#/$defs/address"},
    "office_address":     {"$ref": "#/$defs/address",
                           "room": {"type": "string"}
                          },
    "comment":     {"type": "string", "maxLength": 500},
    "lastlogin":   {"type": "string", "format": "date-time", "default": "2023-01-02T12:10:20"},
    "source":      {"const": "via APEX-a]')
|| TO_CLOB(q'[pplication"},
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
]')
|| TO_CLOB(q'[      "cardid": {"type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}"}
   }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('5','Hotel',TO_CLOB(q'[{
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
        "apex":]')
|| TO_CLOB(q'[ {"itemtype": "starrating", "label": "*-rating"}
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
    "updated":   {"type": "string",
                  "format": "date-time",
      ]')
|| TO_CLOB(q'[            "apex": {"default": "now"}
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
  "$defs"]')
|| TO_CLOB(q'[ :{
    "price": {
        "type": "number",
        "minimum": 0,
        "apex": {"format": "currency"}
     }
  },
  "apex": {
    "display": {
      "default": "Hotel: #$.name# - #$.country# #$.city#"
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('6','Person',TO_CLOB(q'[{
  "type": "object",
  "required": ["lastname", "email"],
  "additionalProperties": false,
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
    "email":     {"type": "string", "apex": {"format": "email"}},
    "job":       {"type": "string", "enum": ["User", "DBA", "Admin"]},
    "password":  {"type": "string", "minLength": 8, "maxLength": 8, 
                  "apex": {"itemtype": "password"}},
    "office_address":  ]')
|| TO_CLOB(q'[   {"$ref": "#/$defs/address"},
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
      "add]')
|| TO_CLOB(q'[ress": {
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
}]'));
-- ----------- sTart of Test datasets ---------------------
REM INSERTING into OBJECT_TYPE
SET DEFINE OFF;
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2241','test-allOf-1',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "sel1": {"type": "string", "enum": ["val1-1", "val1-2", "val1-3"]}
  },
  
  "allOf": [
    {
      "properties":{
        "sel21": {"type": "string", "enum": ["val21-1", "val21-2",  "val21-3"], "apex": {"textBefore": "allOf"}}
      }
    },{          
      "properties":{
        "sel22": {"type": "string", "enum": ["val22-1", "val22-2",  "val22-3"]}
      }
    },{
      "properties":{
        "sel23": {"type": "string", "enum": ["val23-1", "val23-2]')
|| TO_CLOB(q'[",  "val23-3"]}
      }
    },{
      "properties": {
        "comment": { "type": "string"},
        "date":    { "type": "string", "format": "date", "default": "now"}
      }
    }
  ]
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2222','test-allOf-2',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "sel1": {"type": "string", "enum": ["val1-1", "val1-2", "val1-3"]}
  },
  
  "allOf": [
    {
          "if":   {"properties": {"sel1": { "const": "val1-1" } }}, 
          "then": {
            "properties":{
              "sel21": {"type": "string", "enum": ["val21-1", "val21-2",  "val21-3"]}
            }
          }
    },{          
          "if":   {"properties": {"sel1": { "const": "val1-2" } }}, 
          "then": {
            "properties":{
]')
|| TO_CLOB(q'[              "sel22": {"type": "string", "enum": ["val22-1", "val22-2",  "val22-3"]}
            }
          }
    },{
          "if":   {"properties": {"sel1": { "const": "val1-3" } }}, 
          "then": {
            "properties":{
               "sel23": {"type": "string", "enum": ["val23-1", "val23-2", "val23-3"]}
            }
          }
    }
  ]
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2281','test-allOf-3',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "sel1": {"type": "string", "enum": ["val1-1", "val1-2", "val1-3"]}
  },
  
  "allOf": [
    {
          "if":   {"properties": {"sel1": { "const": "val1-1" } }}, 
          "then": {
            "properties":{ "sel2": {"type": "string", "enum": ["val21-1", "val21-2",  "val21-3"]} }
          }
    },{          
          "if":   {"properties": {"sel1": { "const": "val1-2" } }}, 
          "then": {
            "properties":{ "sel2": {"type": "string", ]')
|| TO_CLOB(q'["enum": ["val22-1", "val22-2",  "val22-3"]} }
          }
    },{
          "if":   {"properties": {"sel1": { "const": "val1-3" } }}, 
          "then": {
            "properties":{ "sel2": {"type": "string", "enum": ["val23-1", "val23-2", "val23-3"]} }
          }
    }
  ],
  "apex": {"label": "dependent select list"}
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2346','test-allOf-4',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "sel1": {"type": "string", "enum": ["val1-1", "val1-2", "val1-3"]}
  },
  "allOf": [{
    "if":   {"properties": {"sel1": { "const": "val1-1" } }}, 
    "then": {
      "properties":{ "sel2": {"type": "string", "enum": ["val21-1", "val21-2",  "val21-3"]} }
    }
  },{          
    "if":   {"properties": {"sel1": { "const": "val1-2" } }}, 
    "then": {
      "properties":{ "sel2": {"type": "string", "enum": ["val22-1", "val22-2",  "more"]} },
      "i]')
|| TO_CLOB(q'[f":  { "properties": {"sel2": { "const": "more" } }}, 
      "then": {
        "properties":{ "sel3": {"type": "string", "enum": ["valmore-1", "valmore-2", "valmore-3"]} }
      }
    }
  }],
  "apex": {"label": "dependent select lists (up to 3 levels)"}
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('7','test-array-1',TO_CLOB(q'[{
  "type": "object",
  "required": ["shuttle"],
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
                          "enum": {"val1": "d]')
|| TO_CLOB(q'[isp1", "val2": "disp2", "val3": "disp3"}
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
    },
    "shuttle": { "type": "array",
               "items": {
                 "t]')
|| TO_CLOB(q'[ype": "string",
                 "enum": ["val1", "val2", "val3"]
               },
               "apex": {"itemtype": "shuttle", "newRow": true, "colSpan": 7}
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('8','test-array-2',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
    "email":     {"type": "string", "apex": {"format": "email"}},
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
        "country": {"type"]')
|| TO_CLOB(q'[: "string"},
        "zipcode": {"type": "string"},
        "city":    {"type": "string"},
        "street":  {"type": "string"}
      }
    }
  }
}
]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('9','test-array-3','{ 
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
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('301','test-array-4',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
    "email":     {"type": "string", "apex": {"format": "email"}},
    "comments": {
      "type":     "array",
      "items":    {"$ref": "#/$defs/comment"},
      "readOnly": true,
      "apex": {
        "hasInsert": "end",
        "xhasDelete": false
      }
    } 
  },
  "$defs":{
    "comment": {
      "type": "object",
      "properties": {
   ]')
|| TO_CLOB(q'[     "comment": {"type": "string"},
        "datetime": {"type": "string", "format": "date-time", "default": "NOW"}
      }
    }
  },
  "apex": {"validate": false}
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2261','test-array-5','{
  "title": "Toplevel type: array, a todolist",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "description": {"type": "string"},
      "deadline":    {"type": "string", "format": "date"},
      "comment":     {"type": "string", "apex": {"itemtype": "textarea", "newRow": true}}
    }
  },
  "apex": {"label": "Todos"}
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('10','test-boolean-1',TO_CLOB(q'[{
  "type": "object",
  "required": ["checkbox", "bool_switch", "bool_radio", "bool_radio_hor", "select"],
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
      "apex":{"itemtype": "radio", "direction": "horizontal"}]')
|| TO_CLOB(q'[
    },
    "select": { "type": "boolean",
                "apex": {"itemtype": "select"}
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('28','test-css-1','{
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
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('11','test-default-1',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "string": {"type": "string", "default": "string"},
    "date": {"type": "string", "format": "date", "default": "NOW"},
    "datetime": {"type": "string", "format": "date-time", "apex": {"default": "NOW"}},
    "long_string": {"type": "string", "maxLength": 1000, "default": "long\nstring"},
    "boolean": {
      "type": "boolean", "default": true
    },
    "switch": {
      "type": "boolean", "default": true,
      "apex": {"itemtype": "switch"}
    }]')
|| TO_CLOB(q'[,
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
     ]')
|| TO_CLOB(q'[ "apex": {"itemtype": "starrating"}
    },
    "editor_string": {
      "type": "string", "maxLength": 1000, "default": "editor\n**string**",
      "apex": {"itemtype": "richtext", "colSpan":12}
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('12','test-dependent-1',TO_CLOB(q'[{
  "type": "object",
  "required": ["lastname"],
  "dependentRequired":{
    "zip": ["city"],
    "city":   ["zip"],
    "payment": ["creditcard"]
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
     ]')
|| TO_CLOB(q'[   "creditcard":    {"$ref": "#/$defs/creditcard"}
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
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('13','test-enum-1',TO_CLOB(q'[{
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
    "num_enum]')
|| TO_CLOB(q'[": {
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
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('321','test-extended-1','{
  "type": "object",
  "properties": {
    "date": {"extendedType": "date", "format": "date", "apex": {"default": "now"}},
    "datetime": {"extendedType": "date", "format": "date-time", "apex": {"default": "now"}},
    "extended": {"extendedType": "date", "apex": {"default": "now"}}
  },
  "apex": {"validate": false}
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('14','test-format-1',TO_CLOB(q'[{
  "type": "object",
  "required": ["date", "date_time", "time", "email", "uri"],
  "properties": {
    "date":         { 
      "type": "string", 
      "format": "date",
      "apex": {
        "default": "NOW"
      }
    },
    "date_time":    { 
      "type": "string", 
      "format": "date-time",
      "apex": {
       "default": "NOW"
      }
    },
    "time": {
      "type": "string",
      "format": "time",
      "apex": {
        "default": "now"
      }
    },
    "date_past": { 
 ]')
|| TO_CLOB(q'[     "type": "string", 
      "format": "date",
      "apex": {
        "default": "NOW",
        "maximum": "NOW"
      }
    },
    "date_future": { 
      "type": "string", 
      "format": "date",
      "apex": {
        "default": "NOW",
        "minimum": "NOW"
      } 
    },
    "email":        { "type": "string", "apex": {"format": "email", "newRow": true}},
    "uri":          { "type": "string", "apex": {"format": "uri"}},
    "ipv4":         { "type":    "string", 
                  ]')
|| TO_CLOB(q'[    "apex": {"format":  "ipv4"}
                    },
    "ipv6":         { "type":      "string", 
                      "apex":      {"format": "ipv6", "colSpan": 6}
                    },
    "uuid":         { 
                      "type":      "string", 
                      "apex":      {"format":    "uuid", "colSpan": 6}
                    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('15','test-if-1',TO_CLOB(q'[{
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
]')
|| TO_CLOB(q'[       "home_address":     {"$ref": "#/$defs/address"}
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
]')
|| TO_CLOB(q'[           "street":  {"type": "string"}
         }
       }
   }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('16','test-if-2',TO_CLOB(q'[{
  "type": "object",
  "required": ["lastname"],
  "additionalProperties": true,
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
          "anyOf"]')
|| TO_CLOB(q'[: [
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
        "type": "objec]')
|| TO_CLOB(q'[t",
        "required": ["zipcode", "city"],
        "properties": {
           "country": {"type": "string"},
           "state":   {"type": "string"},
           "zipcode": {"type": "string"},
           "city":    {"type": "string"},
           "street":  {"type": "string"}
         }
       }
   },
  "apex": {"validate": false}
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2310','test-if-3',TO_CLOB(q'[{
  "type": "object",
  "required": ["lastname"],
  "additionalProperties": true,
  "properties": {
    "lastname":        {"type": "string", "maxLength": 30},
    "firstname":       {"type": "string", "maxLength": 30},
    "add_comments":    {"type": "boolean", "apex": {"type": "switch", "label": "Add comments"}}
  },
  "if": {
    "properties": {
      "add_comments": { "const": true}
    }
  },
  "then": {
    "properties": {
      "comments": {
                    "type": "array",
          ]')
|| TO_CLOB(q'[          "items": {"$ref": "#/$defs/comment"}
      }
    }
  },
  "$defs":{
    "comment": {
      "type": "object",
      "required": ["comment"],
      "properties": {
        "comment": {"type": "string", "apex": {"itemtype": "textarea"}},
        "date":    {"type": "string", "format": "date-time", "apex": {"default": "now"}}
      }
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2325','test-if-4','{
  "type": "object",
  "properties": {
    "sel1": {"type": "string", "enum": ["val1-then", "val1-2", "val1-3"]}
  },
  "if": {"properties": {"sel1": { "const": "val1-then" }} }, 
  "then":{
    "properties":{
      "sel2": {"type": "string", "enum": ["val2-then-1", "val2then-2",  "val2then-3"]}
    }
  },
  "else": {
    "properties":{
      "sel2": {"type": "string", "enum": ["val2else-1", "val2else-2",  "val2else-3"]}
    }
  }
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('17','test-image-1','{
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
      "apex": { "format": "uri", "itemtype": "image"}
    },
    "qrcode": { 
      "type": "string",
      "apex": {"itemtype": "qrcode"}
    }
  }
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('241','test-invalidkeys-1','{
  "type":"object",
  "properties": {
    "key_ok": {"type": "string"},
    "key not ok": {"type": "string"}
  } 
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2282','test-layout-1',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "field1_label": {"type": "string", "apex": {"label": "Field Label"}},
    "field_wide": {"type": "string", "apex": {"colSpan": 6}},
    "field_normal": {"type": "string"},
    "field4": {"type": "string"},
    "field_label": {"type": "string", "apex":{"newRow": true, "textBefore": "text before"}},
    "obj1": {
      "type": "object",
      "properties": {
        "field6": {"type": "string"},
        "field7": {"type": "string"}
     },
     "apex": {]')
|| TO_CLOB(q'["textBefore": "text before", "label": "Object label"}
    }
  }
}
]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('19','test-numeric-1',TO_CLOB(q'[{
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
     ]')
|| TO_CLOB(q'[   "enum": {
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
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('20','test-object-1',TO_CLOB(q'[{
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
        ]')
|| TO_CLOB(q'[   "state":   {"type": "string"},
           "zipcode": {"type": "string"},
           "city":    {"type": "string"},
           "street":  {"type": "string"}
         }
       }, 
      "cardid": {"type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}"}
   }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('26','test-placeholder-1',TO_CLOB(q'[{ 
  "type":"object",
  "properties": {
    "string":    {"type": "string", "apex": {"placeholder": "string input"}},
    "credit_card":    {"type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}", "apex": {"placeholder": "1234 1234 1234 1234"}},
    "integer":   {"type": "integer", "apex": {"placeholder": "integer input"}},
    "number":    {"type": "number", "apex": {"placeholder": "number input"}},
    "date":      {"type": "string", "format": "date", "apex": {"placeholder": "date input"}},
   ]')
|| TO_CLOB(q'[ "date_time": {"type": "string", "format": "date-time", "apex": {"placeholder": "date-time input"}},
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
        "placeholder": "sel]')
|| TO_CLOB(q'[ect one"
      }
    }
  } 
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('21','test-poll-1',TO_CLOB(q'[{
  "type": "object",
  "additionalProperties": false,
  "required": ["rating"],
  "properties":{
    "rating": { "type": "integer", "maximum": 5, "apex": {"itemtype": "starrating", "label": "Overall rating"}},
    "question1": { "$ref": "#/$defs/question", "apex": {"label": "How did you like the hotel?"}},
    "question2": { "$ref": "#/$defs/question", "apex": {"label": "How did you like the room?"}},
    "question3": { "$ref": "#/$defs/question", "apex": {"label": "Hod did you like the restaur]')
|| TO_CLOB(q'[ant?"}},
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
          "apex": {"itemtype": "radio", "directi]')
|| TO_CLOB(q'[on": "horizontal", "colSpan": 6}
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
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('22','test-properties-1','{
  "type": "object",
  "additionalProperties": true,
  "properties":{
    "input": {"type": "string"}
  }
}');
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('23','test-readonly-1',TO_CLOB(q'[{
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
        "long_string": { "type": "string", "maxLength": 100]')
|| TO_CLOB(q'[0},
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
          "t]')
|| TO_CLOB(q'[ype": "integer", "maximum": 5,
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
          "apex": {"format": "uri", "itemtype": "image"}
        },
        "qrcode": { 
          "type"]')
|| TO_CLOB(q'[: "string",
          "apex": {"itemtype": "qrcode"}
        },
        "editor_string": {
          "type": "string", "maxLength": 1000, 
          "apex": { "itemtype": "richtext", "colSpan":12}
        },
        "combo": {
          "type": "array",
          "items": {
            "type": "string",
            "enum": ["val1", "val2", "val3"]
          },
          "apex": { "itemtype": "combobox" }
        },
        "selectone": {
          "type": "string",
          "enum": ["val1", "va]')
|| TO_CLOB(q'[l2", "val3"],
          "apex": { "itemtype": "selectone"}
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
          "apex": { "itemtype": "selectmany" }
        },
        "shuttle": {
          "type": "array",
          "items": {
            "type": "string",
 ]')
|| TO_CLOB(q'[           "enum": ["val1", "val2", "val3"],
            "apex": { 
              "enum": {"val1": "disp1", "val2": "disp2", "val3": "disp3"}
            }
          },
          "apex": { 
            "itemtype": "shuttle", "colSpan": 7
          }
        }
      }
    }
  },
  "apex": {"validate": false}
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('261','test-ref-1',TO_CLOB(q'[{ "type":"object",
  "properties": {
    "boolean":   {"$ref": "#/$defs/boolean"},
    "string":    {"$ref": "#/$defs/string"},
    "enum":      {"$ref": "#/$defs/enum"},
    "email":     {"$ref": "#/$defs/email"},
    "url":       {"$ref": "#/$defs/url"},
    "date":      {"$ref": "#/$defs/date"},
    "date_time": {"$ref": "#/$defs/datetime"},
    "time":      {"$ref": "#/$defs/time"},
    "integer":   {"$ref": "#/$defs/integer"},
    "number":    {"$ref": "#/$defs/number"}
  },
  "$defs": {
  ]')
|| TO_CLOB(q'[  "boolean": {
      "type":   "boolean", 
      "default": true
    },
    "string": { 
      "type":      "string", 
      "default":   null, 
      "pattern":   ".*",
      "maxLength": 10
    },
    "enum": { 
      "type": "string", 
      "enum": ["val1", "val2", "val3"]
    },
    "email": {
      "type":    "string", 
      "format":  "email",
      "default": "xx.xx@xx"
    },
    "url": { 
      "type":    "string", 
      "format":  "uri",
      "default": "http://xx.xx"
    },
    "d]')
|| TO_CLOB(q'[ate": {
      "type":    "string", 
      "format":  "date",
      "default": "now",
      "maximum": "now"
    },
    "datetime": { 
      "type":    "string",
      "format":  "date-time",
      "minimum": "now"
    },
    "time": {
      "type":    "string", 
      "format":  "time",
      "default": "now",
      "maximum": "now"
    },
    "integer": { 
      "type":    "integer",
      "default": 5,
      "minimum": 1,
      "maximum": 99
    },
    "number": { 
      "type":    "number",
 ]')
|| TO_CLOB(q'[     "default": 10.05,
      "minimum": 0.5,
      "maximum": 99.99
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('281','test-select-1',TO_CLOB(q'[{
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
        "enum"]')
|| TO_CLOB(q'[: ["val1", "val2", "val3"]
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
 ]')
|| TO_CLOB(q'[       "itemtype": "selectmany"
      }
    },
    "shuttle": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["val1", "val2", "val3"],
        "apex": { 
          "enum": {"val1": "disp1", "val2": "disp2", "val3": "disp3"}
        }
      },
      "apex": { 
        "itemtype": "shuttle"
      }
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('24','test-string-1',TO_CLOB(q'[{
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
    "password":  {"typ]')
|| TO_CLOB(q'[e": "string", "minLength": 8, "maxLength": 16, "writeOnly": true, "apex": {"itemtype": "password"}},
    "select": { "type": "string", "enum": ["val1", "val2", "val3"]},
    "radio": { 
      "type": "string",
      "enum": ["val1", "val2"],
      "apex": {"itemtype": "radio", "direction": "horizontal", "enum": {"val1": "disp1", "val2": "disp2"}}
    },
    "color": {
      "type": "string",
      "apex": {"itemtype": "color"}
    },
    "editor_string": { 
      "type": "string", 
      "maxLen]')
|| TO_CLOB(q'[gth":400,
      "apex": {"itemtype": "richtext", "newRow": true, "colSpan": 12}
    }
  },
  "apex": {
    "display": {
      "default": "string: <b>#$.string#</b> - pattern: <b>#$.pattern#</b>",
      "list1":   "yyyyyyyyyyyyyyyyy"
    }
  }
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('27','test-template-1',TO_CLOB(q'[{
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
    "left_req": {]')
|| TO_CLOB(q'[
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
}]'));
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('25','test-validate-1',TO_CLOB(q'[{
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
      "required"]')
|| TO_CLOB(q'[: ["integer", "number", "money", "money_full", "starrating"],
      "properties": {
        "integer":      {"type": "integer", "minimum": 1,    "maximum": 99},
        "number":       {"type": "number",  "minimum": 0.01, "maximum":99.99},
        "money":        {"type": "integer", "minimum": 1,    "maximum":99, "apex": {"format": "currency"}},
        "money_full":   {"type": "number",  "minimum": 0.01, "maximum":99.99, "apex": {"format": "currency"}},
        "starrating":   { "type": "intege]')
|| TO_CLOB(q'[r", "minimum": 1, "maximum": 5, "apex": {"itemtype": "starrating"}}
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
          "type": "string", "minLength": 8, "maxLen]')
|| TO_CLOB(q'[gth": 16, 
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
        "date":     {"type": "string", "format": "date",      "apex": {"minimum": "2024-01-01T:00:00:00", "maximum": "now"}},
        "dat]')
|| TO_CLOB(q'[etime": {"type": "string", "format": "date-time", "apex": {"minimum": "NOW", "maximum": "2024-12-31T23:59:00"}},
        "time":     { "type": "string", "format": "time",     "apex": {"minimum": "09:00", "maximum": "16:59" }}
      }
    },
    "array": {
      "type": "object",
      "required": ["checkbox", "combo", "num_combo"],
      "properties": {
        "checkbox": { "type": "array",
                      "items": {
                        "type": "string",
                        "enum"]')
|| TO_CLOB(q'[: ["val1", "val2", "val3"]
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
]')
|| TO_CLOB(q'[    }
  }
}]'));

COMMIT;



-- relation types
REM INSERTING into RELATION_TYPE
SET DEFINE OFF;
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('1','booking','6','3','5','3','{
  "type":  "object",
  "properties": {
     "checkin":      { "type":  "string", "format":  "date"},
     "checkout":   { "type":  "string", "format":  "date"},
     "checkedin":  { "type":  "boolean"}, 
      "room": {"type": "string"}
  },
  "required": ["checkin", "checkout"]
}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('2','Server->Switch','1','3','2','4','{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('3','Switch->Switch','2','3','2','3','{}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('4','Printer->Switch','3','3','2','2','{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('5','Server owned by','1','3','6','2','{}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('6','Server->Admin','1','4','6','3','{}');

COMMIT;
