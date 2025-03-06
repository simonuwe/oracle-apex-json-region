delete from object;
delete from relation;
delete from relation_type;
delete from cardinality;
delete from object_type;

REM INSERTING into UWE.CARDINALITY
SET DEFINE OFF;
Insert into UWE.CARDINALITY (CARDINALITY_ID,CARDINALITY_NAME) values ('1','0:1');
Insert into UWE.CARDINALITY (CARDINALITY_ID,CARDINALITY_NAME) values ('2','1:1');
Insert into UWE.CARDINALITY (CARDINALITY_ID,CARDINALITY_NAME) values ('3','0:n');
Insert into UWE.CARDINALITY (CARDINALITY_ID,CARDINALITY_NAME) values ('4','1:n');

REM INSERTING into UWE.OBJECT_TYPE
SET DEFINE OFF;
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('1','Server',TO_CLOB(q'[{
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
  }
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('2','Switch','{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string",  "maxLength": 30},
    "model":  {"type": "string",  "maxLength": 30},
    "ports":  {"type": "integer", "minimum": 1},
    "speed":  {"type": "string",  "enum": ["10MBit", "100MBit", "1GBit", "10GBit", "100GBit"]}
  }
}');
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('3','Printer','{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string", "maxLength": 30},
    "model": {"type": "string", "maxLength": 30},
    "color": {"type": "boolean"},
    "papersize": {"type": "string", "enum":["A4", "A3", "Letter"]}
   }
}');
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('4','Full-Example',TO_CLOB(q'[
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
    "creditcard":  {"type": "string", "enum":["Visa", "]')
|| TO_CLOB(q'[Mastercard", "Amex", "Diners"]},
    "creditid":    {"$ref": "#/$defs/cardid"},
    "salary":      {"type": "number", "minimum": 10000.00,
                    "apex": {"format": "currency"}
                   },
    "payments":    {"type": "integer", "minimum": 1, "maximum": 15},
    "retired":     {"type": "boolean"},
    "email":       {"type": "string", "format": "email"},
    "website":     {"type": "string", "format": "uri"},
    "home_address":       {"$ref": "#/$defs/address"},
    "offic]')
|| TO_CLOB(q'[e_address":     {"$ref": "#/$defs/address",
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
        "required]')
|| TO_CLOB(q'[": ["zipcode", "city"],
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
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('5','Hotel',TO_CLOB(q'[
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
        "apex"]')
|| TO_CLOB(q'[: {"itemtype": "starrating", "label": "*-rating"}
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
                  "format": "date-time",]')
|| TO_CLOB(q'[
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
  "$defs" :{]')
|| TO_CLOB(q'[
    "price": {
        "type": "number",
        "minimum": 0,
        "apex": {"format": "currency"}
     }
  }
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('6','Person',TO_CLOB(q'[{
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
    "office_address":     {"$ref"]')
|| TO_CLOB(q'[: "#/$defs/address"},
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
 ]')
|| TO_CLOB(q'[       "type": "object",
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
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('7','test-array-1',TO_CLOB(q'[{
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
                          "enum": {"val1": "disp1", "val2": "disp2", "va]')
|| TO_CLOB(q'[l3": "disp3"}
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
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('8','test-array-2',TO_CLOB(q'[{
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
        "country": {"type": "string"]')
|| TO_CLOB(q'[},
        "zipcode": {"type": "string"},
        "city":    {"type": "string"},
        "street":  {"type": "string"}
      }
    }
  }
}
]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('9','test-boolean-1',TO_CLOB(q'[{
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
 ]')
|| TO_CLOB(q'[   "select": { "type": "boolean",
                "apex": {"itemtype": "select"}
    }
  }
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('10','test-default-1',TO_CLOB(q'[{
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
    "rad]')
|| TO_CLOB(q'[io": {
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
      "apex": {]')
|| TO_CLOB(q'["itemtype": "starrating"}
    },
    "editor_string": {
      "type": "string", "maxLength": 1000, "default": "editor\n**string**",
      "apex": {"itemtype": "richtext", "colSpan":12}
    }
  }
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('11','test-dependent-1',TO_CLOB(q'[{
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
        "creditcard":    {"$ref": "#]')
|| TO_CLOB(q'[/$defs/creditcard"}
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
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('12','test-enum-1','{
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
    }
  }
}');
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('13','test-format-1',TO_CLOB(q'[{
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
   ]')
|| TO_CLOB(q'[  "maximum": "NOW"
    },    "date_future":         { 
     "type": "string", 
     "format": "date",
     "default": "NOW",
     "minimum": "NOW"
    },
    "email":        { "type": "string", "format": "email", "apex": {"newRow": true}},
    "uri":          { "type": "string", "format": "uri"}
  }
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('14','test-if-1',TO_CLOB(q'[{
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
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('15','test-if-2',TO_CLOB(q'[{
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
          "anyOf]')
|| TO_CLOB(q'[": [
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
        "type": "obje]')
|| TO_CLOB(q'[ct",
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
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('16','test-image-1','{
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
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('17','Invoice',TO_CLOB(q'[
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
        "nr": {"]')
|| TO_CLOB(q'[type": "integer"},
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
      ]')
|| TO_CLOB(q'["type": "object",
      "required": ["number", "validity", "securitycode"],
      "properties":{
        "number":       { "type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}", "apex": {"placeholder": "1234 1234 1234 1234"}},
        "validity":     { "type": "string", "pattern": "[0-9]{2}/[0-9]{2}", "apex": {"placeholder": "00/00", "colSpan": 2}},
        "securitycode": { "type": "string", "pattern": "[0-9]{3}", "maxLength": 3, "apex": {"colSpan": 2, "itemtype": "password"}}
      }
    },
  ]')
|| TO_CLOB(q'[  "payment": {
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
    ]')
|| TO_CLOB(q'[  "type": "object",
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
        "quantity":       {"type"]')
|| TO_CLOB(q'[: "integer", "apex": {"colSpan": 2, "align": "right"}},
        "unit":           {"type": "string", "enum": ["hour", "day", "pcs", "l", "m","km", "m²", "m³"], "apex": {"colSpan": 2}},
        "price_per_unit": {"type": "number", "apex": {"colSpan": 2, "format": "currency", "align": "right"}},
        "total":          {"type": "number", "apex": {"colSpan": 2, "format": "currency", "align": "right"}}
     }
    },
    "total": {
      "type": "object",
      "required": ["description", "units", ]')
|| TO_CLOB(q'["price_per_unit"],
      "properties": {
        "total": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right"}},
        "vat": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right", "label": "VAT 10%"}},
        "grand_total": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right"}}
     }
    }
  }
}
]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('18','test-numeric-1',TO_CLOB(q'[{
  "type": "object",
  "required": ["int", "number"],
  "properties": {
    "int":          { "type": "integer", "minimum": 10, "maximum": 99 },
    "number":       { "type": "number" },
    "money_cent":   { "type": "number", "apex": {"format": "currency"}},
    "money":        { "type": "integer", "apex": {"format": "currency"}},
    "num_sel":      { "type": "number", "enum": [0, 0.5, 1, 1.5, 2]},
    "starrating": {
      "type": "integer", "maximum": 5,
      "apex": {"itemtype": "starrati]')
|| TO_CLOB(q'[ng"}
    }
  }
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('19','test-object-1',TO_CLOB(q'[{
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
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('20','test-poll-1',TO_CLOB(q'[{
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
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('21','test-properties-1','{
  "type": "object",
  "additionalProperties": true,
  "properties":{
    "input": {"type": "string"}
  }
}');
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('22','test-readonly-1',TO_CLOB(q'[{
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
          "long_string": { "type": "string", "maxLeng]')
|| TO_CLOB(q'[th": 1000},
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
       ]')
|| TO_CLOB(q'[   },
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
   ]')
|| TO_CLOB(q'[         "apex": {"itemtype": "image"}
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
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('23','test-string-1',TO_CLOB(q'[{
  "type": "object",
  "required": ["string", "radio", "combo", "long_string", "editor_string", "password"],
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
    "password":  {"type": "string", "minLength": 8, "maxLength": 16, "writeOnly": ]')
|| TO_CLOB(q'[true, "apex": {"itemtype": "password"}},
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
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('24','test-validate-1',TO_CLOB(q'[{
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
        "date":     {"type": "string", "format": "date",      "minimum": "2024-01-01T:00:00:00", "maximum": "now"},
        "datetime": {"]')
|| TO_CLOB(q'[type": "string", "format": "date-time", "minimum": "NOW", "maximum": "2024-12-31T23:59:00"},
        "time":     { "type": "string", "format": "time", "minimum": "09:00", "maximum": "16:59" }
      }
    },
    "array": {
      "type": "object",
      "required": ["checkbox", "combo"],
      "properties": {
        "checkbox": { "type": "array",
                      "items": {
                        "type": "string",
                        "enum": ["val1", "val2", "val3"]
                    ]')
|| TO_CLOB(q'[  }
        },
        "combo": { "type": "array",
                   "items": {
                     "type": "string",
                     "enum": ["val1", "val2", "val3"]
                   },
                   "apex": {"itemtype": "combobox"}
        }
      }
    }
  }
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('221','test-placeholder-1',TO_CLOB(q'[{ 
  "type":"object",
  "properties": {
    "string":    {"type": "string", "apex": {"placeholder": "string input"}},
    "credit_card":    {"type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}", "apex": {"placeholder": "1234 1234 1234 1234"}},
    "integer":   {"type": "integer", "apex": {"placeholder": "integer input"}},
    "number":    {"type": "number", "apex": {"placeholder": "number input"}},
    "date":      {"type": "string", "format": "date", "apex": {"placeholder": "date input"}},
   ]')
|| TO_CLOB(q'[ "date_time": {"type": "string", "format": "date-time", "apex": {"placeholder": "date-time input"}}
  } 
}]'));
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('222','test-template-1',TO_CLOB(q'[{
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

Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('261','test-array-4',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "lastname":  {"type": "string", "maxLength": 30},
    "firstname": {"type": "string", "maxLength": 30},
    "email":     {"type": "string", "format": "email"},
    "comments": {
      "type":     "array",
      "items":    {"$ref": "#/$defs/comment"},
      "readOnly": true,
      "apex": {
        "hasInsert": "begin",
        "xhasDelete": false
      }
    } 
  },
  "$defs":{
    "comment": {
      "type": "object")
|| TO_CLOB(q'[ty"],
      "properties": {
        "comment": {"type": "string"},
        "datetime": {"type": "string", "format": "date-time", "default": "NOW"}
      }
    }
  }
}]'));

Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('241','test-array-3','{ 
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
Insert into UWE.OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA) values ('262','test-css-1','{
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

REM INSERTING into UWE.RELATION_TYPE
SET DEFINE OFF;
Insert into UWE.RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('1','booking','6','3','5','3','{
  "type":  "object",
  "properties": {
     "checkin":      { "type":  "string", "format":  "date"},
     "checkout":   { "type":  "string", "format":  "date"},
     "checkedin":  { "type":  "boolean"}, 
      "room": {"type": "string"}
  },
  "required": ["checkin", "checkout"]
}');
Insert into UWE.RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('2','Server->Switch','1','3','2','4','{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}');
Insert into UWE.RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('3','Switch->Switch','2','3','2','3','{}');
Insert into UWE.RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('4','Printer->Switch','3','3','2','2','{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}');
Insert into UWE.RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('5','Server owned by','1','3','6','2','{}');
Insert into UWE.RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('6','Server->Admin','1','4','6','3','{}');



REM INSERTING into UWE.OBJECT
SET DEFINE OFF;
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('60','262','css-1',to_date('2024-05-27 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"lastname":"last","firstname":"first"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('39','241','simplearray',to_date('2024-05-13 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"name":"ABC","interests":["C++","Javascript","SQL","PL/SQL","Oracle","tensorflow"]}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('1','6','uwe',to_date('2024-05-10 18:32:21','yyyy-mm-dd hh24:mi:ss'),'{"lastname": "Simon", "firstname": "Uwe", "email": "uwe.simon@magenta.de", "job": "admin"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('24','9','boolean-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"checkbox":true,"checkbox_optional":false,"bool_switch":false,"select":false,"bool_radio":false}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('25','10','default-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"string":"string","date":"2024-05-10","datetime":"2024-05-10T21:00:00","long_string":"long\nstring","boolean":true,"switch":true,"radio":true,"integer":4711,"number":8.15,"money":4711,"money_cent":8.15,"starrating":3,"editor_string":"editor  \n**string**"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('27','12','enum-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"radio_hor":"val2","radio_ver":"val1","select":"val2"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('28','13','format-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"date":"2024-05-10","date_time":"2024-05-09T21:00:00","time":"21:02","date_past":"2024-05-10","date_future":"2024-05-27","email":"first.last@domain.com","uri":"https://domain.com"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('29','14','if-1-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"lastname":"Last","firstname":"First","office_address":{"country":"C1","state":"S1","zipcode":"z1","city":"c1","street":"s1"},"deliverytohome":true,"home_address":{"country":"C2","state":"S2","zipcode":"z2","city":"c2","street":"s2"}}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('30','15','if-2-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"lastname":"Last","firstname":"First","office_address":{"country":"C1","state":"S1","zipcode":"z1","city":"c1","street":"s1"},"invoice_address":false,"deliverytohome":false,"home_address":{"country":"C2","state":"S2","zipcode":"z2","city":"c2","street":"s2"}}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('31','16','image-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),TO_CLOB(q'[{
  "image_url": "https://www.oracle.com/a/ocom/img/customerlogo-oracle-connect-clr.svg",
  "image": "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAHXRFWHRqaXJhLXN5c3RlbS1pbWFnZS10eXBlAGF2YXRhcuQCGmEAABkRSURBVHhefZiHV5XJ0q/5D+6935l0ziRzBiQjOeccRERGkaAgiKAgimJARVFERQUxIAKCEQFBMOuMijkhmHWCM2ZUNlGZ59a7N6jjnPlY61nV/e70q67q6mq01p9vP/6BNo0913Z83bme8dm29+QKeWfbj+fVK7bt+AYZK+SdbRXb1vNcxvWtMlaeacYb6lXH8z8a551pVZP7U8vxjWfahFZB1WNbj+cLm3rYXK9BM28RVGo2n245vkXmWrkX2sm90PYR7eSJzTuv0P6eDUK+wrk2sRo2qp/1zJXnwk]')
|| TO_CLOB(q'[bFnm19z4YzLWysl3G9SsaCWGWcd+oN+TLfJK/1orxv89kPcxHOlrNtPSjzlh5UGivfrbXhooj7J8SZ/IsdajYqyLyXTRc62CQO/BXFAREiP7b+5EuWlt9m6vIq4pZVEr+ylvRdt8g9+UpNvjiQ++MrESzizim09tDGZvVc86zgI7acVf0NrY2XRdBf6PjLfJPCpXY297DlYi8dGivR6rX5p5pF7F58x6diaDkaPRMvdA3dBA8srEZj6xyGtUcc3hMWEZVRRWb1L2qxBed7uPBhvPUTFAc041YKzytjDVqbrshK9nK1U203X1XoZLOMCz5hqzhYcEm4rBkXilNbxYFFpVdw9IjGytofI2MRrefISAMnDIycMTZ2wdLcAz09e4Zr2zBMxx5dU18S1x1Vr2KhRPR/p+092z5Ba8u1Tv6JrVc1FF7r0thP2KYgTizdcRlXtzA83MZhYe6OkaEDlhYeItodSzNXHGy8MNS3RV/PBt2RNozQsW]')
|| TO_CLOB(q'[HoCGusXcNZV/dQvZLbZBE+pkgW6dNxkVCstm3v0dp6XcQ1dFHYgzLWzEXkdRHY8IEiea9CsThXfFVBIz7AP4rgwEgcbX0wM3bAzckfFwdfnGw88XMfg4utB6YGNpga2fVgj7mpMzbiZHLyUradekKxLESxpGvxFYWesRrNuERsidp+oPiSOFB0Q0R9xLZP5r0UNyh0qikRJ0qUKJ15yaTo+fh4hODq6C/i7bAwtcfByhUvJx+C/UII9gnG380fX2c//F38CfEZi5+TL+P8QvF3HU3UD1NInJVNwdnXlMiCKGxXuNJr23vQPCsVR8pEfKmgWK3ixrf8HRGoIMK3q22n2m4XWyq2VJk3dJC2phxPt7HYWnniIg4Y6VliY2aPu4MnY32DmTY5gdSE2aROTWZDRhYLp89mZ846FsYlkhgxhamR8cyYkkyQbxgzV1eJeBEmosuu/Z0dVxXaNVz5gFZp01u2CyVNXR+sIlLGn1Imr+1QkNdzD/]')
|| TO_CLOB(q'[+M/+gYDAwcsLP1RkfHAn19S1ztPPBzCyAyNEq9+iHCitnzOFJUzOLpKfx+4Rz5c+eSEh5FgHsgkybE8sOYSALHJUlOt7DjekcPne9RHNgpEd8pdlcPyninOKVVdusdZbdE3M23H2zv+FaX2u5UuNmlZpdib3QQnVaAsZk3ulJpjE1c0B5hwbBhplia2knuu2Fr5oiDmQNjnb2ozFnFzox01s6eRcedRqrXr6F42RLsR9ljZSp7xtEPT79otp57yW6J7i75frWVKO/+B/YoiKNaO26/pZedd969H6vnwu7b7wTFvmWPYsWZHQ3t2HrG8P3AUQwbYYOVlTd21j4Y6dtgYmiLkYE1tuaOTPL0Y0VcLHcP7efC7hKuV+/h1bVz3DlUxYmtGwh2ks1taM0o2fgu3hFSbV6zp7FTzd6P2HNDw95eRHwvWrvvdLPr7js1u+98YM9H7P2ErfXPGKrnxnf9jDA0dJaKMxoPpyAsTSQaUm0GDdQn0M]')
|| TO_CLOB(q'[mTtfHx1Bdupr3xMi8u/kTz1TO0NpzjyZmjNOwtZVpQKCN1zDE1ccDJY4JUlteUS4r+DRFdLmm7r4dycUr9TNDae7ebTyl/zzv23dNYDd3sE4eXlJ1n4HAbvu9rgI2lD/7uIQRJJfK090VnmAn9+2gT5xNAefoC7lTu4WzpFhqrd/H8wkm1+IcH93OvuoJlMdMY0F9XNr81ngHRkhptVEja7lO4qaFCoalTbfepbafYDjWVMtcqF4GKyH33FLF/pUKeV7y3gjihsKryBgOGWdOvv7GsfhDJUVMJ9x2Lm5RP7UF6OBnbsCjkB4qTkjhfXMD1qp2c3LaBurzV7M5cQo3siRMb81k1dQYmUrn8HXzIXF9O5a1Oqm53Ualw6+9UqW2nCO+gqgetivsiTKj8C+/eU/WJrbz3VqrAG/RH+TFggKnU/zFMGhtOXMhEvBw8cJDc97NxZ+7occS6epMQNJbxbh6Ee/mwOCaG3Nkz2ZGZwcmtm/mxoI]')
|| TO_CLOB(q'[AxLn6kT55K+eHrIr6T/Xe61LaXanGmWkQr7L/ZoaaqqZ3Kxja11ap80E2Vmnf/lf0fj8WBamG/OBE9Jx9tbVvcXELxlioS6hWEjYkNo/QtxNqxeMIklkyMIUoiE+bmRXLoeMpWZNB4YC+PfjzEvbpKGsp3M3v8JKrX5FBx9hHVIr76Tud7am4r/NUBRfS+hhYqGlTsVxzYL+KrHwoisPrBW2rU9p1YZfxfuC+IA0X1fzAmPA03twl4OvgRIKfrWI/ReEkJ9bHx4ODKtdzeW8XxdbmcL9xKk4h9WX+C56ePyriMW/t2crakkIObNvLk8hVqm1qoudPxz9wWbrW/p/qmgrQSiuC/iezhQC/3/07NvS5Wlp3G03UCIQFRRAWGkxQcwWS3ICbIqXw0ax0tZ85zaes2jqzI4lxeHidWZ9O0s4Sm3du5UlrI6eKt3Dxcw68XL1F3q5UDIvQDnRp7+2PaNdxqEyfa1FbrvdiH7/6r2FoR2kudMr]')
|| TO_CLOB(q'[/fpUHmuy88xd0pjADZyAneYayOnMaioAjipL24vrGErquNvDl1hvyoWDaER1O9YBE3d5VytWwb13aVcGHXdhpqKrl0vonaOyJMUOw/UddD7e2293xwoFf8A0WgRmjd/U41BxV7r5Paux2aH5IPVjW+Ye/FZ3i7x+BrH0iEQwDTXAOJsvYgxMKLkogkrqzcQMOWIopnpDLT1YfazCxulu/iqoi/uLOYi3t2sG5JDjvO/KYRJ9+v2INiFdRi/4v4ul4kalpV8rBKwrJfbM09CZPCXYV2NcqXHlTE31FyTiVha1U70LsCqUtL8bANYIytF5H23vib2OMkPf9Ec1di7X2IlX1xsXQ3RXPTmeE3mppVKzlTUsCZ0iLOSDR2FOxmz8WnIlgR/lfq7ohItZW54oD83kEF0dCL1t7rr6m40SK1tVV2uuSWvGG/bI79jSoqb8hr119R1aBhv5rX1DS2cECou9lK6YmHuNgF4WcrHaj0/Y7SStgb2O]')
|| TO_CLOB(q'[JkaEeInTd1y1fxU+5GCmankTo+nK3z0ziYv46TsoGPFhVSkpWDs/ckFhceoVqiqoiuvd363vairLYaWURFuGIVtPYpDjS8EaEKr6kUwZXXmqm63sx+oVpB5tVXm6n5yNaKI3WKM1de4uMZiYe1O0EOXrhICXU1tCHQ2J5EO0/yI2PZmZxK3rRpTPHxZs3MJPauzqIqbx01mzdRkbdRbmi26Bi7EzBpAdm76qmRinRAxNWqaZEK9YbKK48p+6mJLbWnydtbR07JXpZvLpaDTAQrKML3y4oflDcfbHzNYbFHml5z5OYb9fiwrM6hRsW2cPiGjEX8IXn/IYnK2OBEnM2d8RMHnIyscZYGbZzcxooTUji0LIvD2Su5WLyFncvSSZ8yma2L5lOVn0v9nj3UbSlk8GAz+gw2Z8hIRwzM/YlOzcVnwhzGTF5E7MwM4lPnMTcjjXnLUpm1MJGFmbOZNX8aSXPj5BwQUdUiREmNauHILZXQwrE7rZ]')
|| TO_CLOB(q'[y418ZRmdeJyAPXXlJzVUP1pedkFR7lgKz+psrLjDLzxVEccLFwwknaaRdpkz1GOeAjdpKHH+umJ3A4f626jc5MmMqGeXM4WiyVqGY/Ny83MHdhPhZOk+g/1F56LImGoRsj9F0YMNweG+cwHL1icPObintADGPDpFTHRRI6MYSAsT5oKeE5ICuuUKtYcaZGBPdyQKgVFCd6ydpyCN1hlth5RPB1H0O++V5P+npHHOU2ZisRUHC3dGbZtBmc3lHKlcpyjkpXWpq1nLTIcJZOm8qPZaWc213GkZqjPH7dzsnLv7O/9jxmlmPoO8gCXSNXBkmrrmvkjptPLN6jp0vDl4C7XzyObpNwdAplSUw0WifuSkpImiipcvR2ixp1ykjuHbmpGR+8IU5cf0nttRckZxahY+LJl/8Zzldfa/OvLwbz/z4bQN++I7GXC4y9tBOOprZ4WbsQEzCWOVHRrEpJZe2cuSyeGk+WNHjbli6lTlLoVNEWsjI38u]')
|| TO_CLOB(q'[ipbN76B7xse0fT7SeMsp1Iv8FywzNxp98QC0ZZB4kDCfgGJ+EfMhOfoOm4+cYxKTQereoGZaO+lJVupq5R2QOv1VZZ9Rp5Xn31BdVXXrD/8nPC4jP493f66hX/5ltt/ufzQWr+778G8H/+pz/mLsm4yaHmbuEgDjgT5OTFeM9AIv3GEDs6hAXRseSkzKZgwXxObdvIgbWryM0r5ZUID5+ymvMP39D+7k+2ltWjre/KYInACD1HhujYY+ciLUvAVDwCpomdprZegQmyByS3K0VkxaUn7D3/iN1nf2Xn6fuUnrzN9uNNlB1rIimzBCffGEZZ+mFk6IjeIAM++3KIrPzA9ygO6NolMDq2CL/RyXjbujPOzY9YubTMllN4eUIyqxJnkj9rDsc2b+BebTk5CYkUba+kTUQvTN/Iur0X6Oz+k9+ftjJx8mL6DzFnmK69pJQZ+qaecumJwNU7BmfZEy5eU3D2nIzWouwsUhbOZ2n2UhYum8e89B]')
|| TO_CLOB(q'[RS5iYyfVY8k+LiiZySgLmNH67u4+XDEbh5haGr78igoeb0HWDE518NlSgMVEehzzAnbEYvJyi2gPDYtQTI2ZAwZjzpUXGsik9mw4wUTm7O59GJWh4eqiDBP4QVaytYmnuQ9RurSMupRCXOdAM7y0+jo+/MoOGWaOvZ00+cMLMOFOGT1MKdPCbj6B6JlqW0wq5+Y4mSXj05JYHUtNliZ+AdEIql/RhsnEKkzk/AxSMMd98oPHwjcZH5SLlKGo9yY+BgY9kHA8WJAXz5jS5uoSswdptDeMpOYmJWSe0PYXlMAsVp87m6czu/Hqvl8anDXN9XxoL4ucxeUon7+Bzmra4lOaOQn1920iFOHDn1ECvHiejo2aFnoFmwESMdZANPUEfCwS1M0ioUre91HOir58xwU3fc/X+QchYkHoZi5xyCg8s4/L0m4OU0GifXcTjLvdXNe6IaS7sA9CSdho4wl3QaxOdfDuabPgYMM/DGyn85ftHbiF90iK]')
|| TO_CLOB(q'[XpBayT9PmpYBN3ayv5+Vgdzy6f5eLBI2wuO0fwpI0syDlGSmYlcbNXcvdFJ686url++wUhUVmYGNqTFRkpF38X+vQ1xMzKF2MLb9ngrpiYuaPVR9eBgUZu9Nd3wsDSFzP7YCxlI9o6BUujNpaDc6eyyNkGs+HGcml3wNrKE3tn2ai+YegbOaGrZ8OQoSb4SAXq09eYL74agldYDv5xO5iy5ASLS5o4UH6Shn27uXLoJw4fusa5i7+w88BtkjLqiJtbwSbZtMnppYyLTOUPVRctXd10ShTKKy4SKbe6F4WLWR8RxoB++gwZbo6RCB8+0lpS2VbjQF9dR/pq22NqF4ypTQDmtn4M1bVmRWwMzUVLaCnJZE9sKOHGxthrG+Fgofwnwg9nx0BMTJywM3OiMTMFkyGmfP2foeia/0B20UU2lF1l3Z4HlBz/g4PH77NmZxM5W05JlblA1uZzUpKPkbHxPCWV14idkY1/8FTuPH3Na3Hg7Z9QVd]')
|| TO_CLOB(q'[NAZsQUnm6ax8ttGYTZu/J9H11JXzuG61igPdIKre/kWthHx05W3wcTa19MrX2wcQzA0sabft8ORa/vEIItrdgaH86L7ZncX53CmgA33LUNsTG2w9HGixWRETzKSiAjaAxW0oW6Sm80c/kRmqU83vz5NVd+lsvHuccsLb3NvPVnySy8xvrdN0lbe54VxQ2cvPQLs9JWU1C4h6u3f+FF+zvaxIOivQ1ULszg9/WzeFWYzoaoMIYMMmTQECMGDzNmyAhTtPrKxtAx88TERiPe3NYXGwd/Rlm48fkXA/jss758+Xl//v15P0wHalOZGkNn+Woe5aWS5miJxTBDvK1cODEnlmOJE/FwCcTNfRxL845zouGluq7//LSNdlnV8jMvWCEp9VNTM63y/PdXb7n/ewsP/nhD5sqtbC+rpObYeV6KA10SgbojdzicmsQv2UnUzZLT2NoLA0mdvn10GDZiFNbS7WqN6BVv44OZiDe388VaImAuuf7V10]')
|| TO_CLOB(q'[P5lwj/4kupMF/05ysZf/tlP9KCfHhTmsmLLfOZL064SesQIHeB8pgJjPWfwNbC3Rw4eZV9J3/l1uMObjx8jehBSjxN91+pndI40MWT1295+LyL7HW7qT9/jeLdteoIKCm0a3M1TctmUCVOBEkRcZQMsZT87/O9LsbKv/Hl+qplLKtuKuliKt4ZyarrmzhK/2EvG8UFPWmJv+2jLW3DYHFiIF9JRL4SR77+sj+THO15UbKMth3LubEimSBxYHJIDD4ewdQdPsWq3BKeNMul6Pxjbv7RTu9f959/qp1RUMqlYsWQtXYXl67KHtmwnRZ58LL1LYuT17E9Po6Y0Gm4WHpha+yk/hemhZkr334zlJE6ZuKApQcmVu4Ymjkz0tQBI3MXzKQVtpbblKE0aH0H6snON6XfQGkhZE/859+D+PrfA+n7VT8y/Vy4nB7L6+3LuZkzT/qdxXjKqpTtqiZi8mxZfRWXpRzWyh1CWX3l760MOt51q4V39l]')
|| TO_CLOB(q'[jFgezcfZw8c1FSaTNtMj9x5hcmh69gnByc0wLHcT0njfMZiZQmRBJs58agPsPp//0wtMxkE5pYuknD5CHpIzVcqouto5RTK4mGkS3ffDeUAYMN5NTVZfBQI0Zoy4k4yokEVwd+TArj6JRAcv3deLx5Mc2l2aSP9iFt/nIqKg6yo+IEXZL7lfWPUXUp56smjZQyqczU9ETkwMGzLMvKJzYhnQfPOsgtvMQP4SuJ9B7LsVnhtFespfvARjr353F9WQLWg0YwuK84YG7rLSeuj1q4pb3sBRFuKJEwkdI4N9AHgz6DGTBIX3a+gZy6BnJ7MsNYblxnF8Xx28oE2rfM41JSCPeXTOHCwnh+zV9I5NhwduyoJCFxAa+a38geaOG35s73+6D1bbd6k76TeVe3Jgr1Z5vw8Y+WPiqGn5+9YVPJFcZHLGdvSizXFk3hebGka/l6Li6O44b8VqydDVaj5BxQNqyVVB1zicBIWfERehZyfFsw2t6ZO4]')
|| TO_CLOB(q'[si8B0+lO++HciAgTrigB7D5ECz1zfhyrzJPFubTOvWNB4vj+XRigSqIwM4MW0CiT6BpM5ZSvT4WJ6cPMjj5i6uSaepCFU2pxKBtz1jpXlTInH/52f4BcYxeuxUzjXcJX1dPZGhqTRlJXN/xXQe5c6lfMp4fpoRyv3l8eSM9sBQx0R6IVl1a1l9G8HBKRAn50DGeQZwfX4EL3PiWORiRr8+w6Tfl5zrN4Khkkp5P/hza1E0z9cm8WpDirwvkXsLo2krXMTttCiSnBzx9RyHr/cP1OetoPnOLU41NqsdaBfBL6VV6JCJ4kSXpNBb4dffXjBa+vzxEbMo2nWEaelHiA+KZHvsRE7PjuJ6+lRKgj1pmBfOH+uT2RMViO0IHXHATtLH1gc7R3+1eF+PMTSsSaGtYCbPV08hO0D6nUGykYfIMT5AG289Q6qjAri3OJon2Qk0r0uiOWc6N1Mn0iqHzY3ZYeydGEBo8GQSEuYzYUwEC6SdPnSkqS]')
|| TO_CLOB(q'[d9pHyqunnU8qfGiZ4odHW9I+wHuQeHJrGuoIL4xcfxtg/CysiGPXHjacyI535GrPzuJF5sSuXHGeMJ0NNFy15W3VaJgK1cyB182ZYQxavcRJ5mTaZ1UxJ+utpoDxUHBozAbMBgVrnbUznRhweSh89WJfB6fRLPV8Zzd244LQXzuZMew+m4sUwOjSZtYTYpMxcxzcuPDUmL1Kdru1SeZ+1/8rC5mxcdEhFxQDkXlOhkLytgXNgsJk1djn/0Lqn1XkTIZ68viefZprny3ZP5RdJVceDusjgijQ3QMhrliIGxLRbS3yQH+vNsjazqmjjeFqbwdGU0zt9/T78vv2PQ1/2JHWVI7aQAziUGc3d+FM9WTuWVvP+PjGgak8fzIm82r+SHjoX5EuXiy/TkJWQsXU9ObBwX06bz9JmKViWFOv/k5pN33HveLdHQHGqKA8ePXCBgzDScvOLxCC+SYuFKVXI097Jm8HxjKo0LJvNAfuv3NYk8yp5Gqp]')
|| TO_CLOB(q'[XsAXePEJWra5Bqorev6sGyGNWrnHjV26JZqo4tyao/lkWqpproqPp89o2q7xffqsJ0R6hqowJU11PGqx4unqx6sSZR1ZKbpHqeHa9qTJmgerImWdVWvEhVHxOkWuLtpUqZlaFauaZAlT01UfXL8pkq1e+/q6T6qFq7UT1p7Vb92vxOdfXRW9VvLd3ihlTat+9Uc+asUTkHpKk8IotVE1z9VbcyE1W/5sxUnZs3WXUkPlT1c2as6lneTNXTdTNUqZbGqv8P2dcN03zBdEAAAAAASUVORK5CYII=",
  "qrcode":"https://github.com/simonuwe/oracle-apex-json-region"
}]'));
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('32','18','numeric-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"int":12,"number":456.789,"money_cent":123.46,"money":789,"num_sel":0.5,"starrating":4}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('33','19','object-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"lastname":"Last","firstname":"First","business":{"country":"C1","state":"S1","zipcode":"z1","city":"c1","street":"s1"},"home":{"country":"C2","state":"S2","zipcode":"z2","city":"c2","street":"s2"}}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('34','20','poll-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"rating":3,"question1":{"vote":"3","comment":"only 3"},"question2":{"vote":"4"},"question3":{"vote":"not used"},"question4":{"vote":"2","comment":"only 2"},"comment":"my comment"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('35','21','properties-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"input":"my input"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('36','22','readonly-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),TO_CLOB(q'[{
  "input":"my input",
  "display": "display only",
  "display_only":{
    "string": "string",
    "long_string": "abc\ndef\nxyz",
    "date": "2024-03-31",
    "datetime": "2024-04-30T12:34",
    "boolean": true,
    "switch": true,
    "integer": 123,
    "number": 123.456,
    "money": 123,
    "money_cent": 123.456, 
    "pct": 25,
    "starrating": 4,
    "editor_string": "abc**def**ghi\nxyz",
    "qrcode": "uwe.simon@magenta.de",
    "image_url": "https://www.oracle.com/a/ocom/img/custome]')
|| TO_CLOB(q'[rlogo-oracle-connect-clr.svg",
    "image": "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAHXRFWHRqaXJhLXN5c3RlbS1pbWFnZS10eXBlAGF2YXRhcuQCGmEAABkRSURBVHhefZiHV5XJ0q/5D+6935l0ziRzBiQjOeccRERGkaAgiKAgimJARVFERQUxIAKCEQFBMOuMijkhmHWCM2ZUNlGZ59a7N6jjnPlY61nV/e70q67q6mq01p9vP/6BNo0913Z83bme8dm29+QKeWfbj+fVK7bt+AYZK+SdbRXb1vNcxvWtMlaeacYb6lXH8z8a551pVZP7U8vxjWfahFZB1WNbj+cLm3rYXK9BM28RVGo2n245vkXmWrkX2sm90PYR7eSJzTuv0P6eDUK+wrk2sRo2qp/1zJXnwkbFnm19z4YzLWysl3G9SsaCWGWcd+oN+TLfJK/1orxv89kPcxHOlrNtPSj]')
|| TO_CLOB(q'[zlh5UGivfrbXhooj7J8SZ/IsdajYqyLyXTRc62CQO/BXFAREiP7b+5EuWlt9m6vIq4pZVEr+ylvRdt8g9+UpNvjiQ++MrESzizim09tDGZvVc86zgI7acVf0NrY2XRdBf6PjLfJPCpXY297DlYi8dGivR6rX5p5pF7F58x6diaDkaPRMvdA3dBA8srEZj6xyGtUcc3hMWEZVRRWb1L2qxBed7uPBhvPUTFAc041YKzytjDVqbrshK9nK1U203X1XoZLOMCz5hqzhYcEm4rBkXilNbxYFFpVdw9IjGytofI2MRrefISAMnDIycMTZ2wdLcAz09e4Zr2zBMxx5dU18S1x1Vr2KhRPR/p+092z5Ba8u1Tv6JrVc1FF7r0thP2KYgTizdcRlXtzA83MZhYe6OkaEDlhYeItodSzNXHGy8MNS3RV/PBt2RNozQsWHoCGusXcNZV/dQvZLbZBE+pkgW6dNxkVCstm3v0dp6XcQ1dFHYgzLWzEX]')
|| TO_CLOB(q'[kdRHY8IEiea9CsThXfFVBIz7AP4rgwEgcbX0wM3bAzckfFwdfnGw88XMfg4utB6YGNpga2fVgj7mpMzbiZHLyUradekKxLESxpGvxFYWesRrNuERsidp+oPiSOFB0Q0R9xLZP5r0UNyh0qikRJ0qUKJ15yaTo+fh4hODq6C/i7bAwtcfByhUvJx+C/UII9gnG380fX2c//F38CfEZi5+TL+P8QvF3HU3UD1NInJVNwdnXlMiCKGxXuNJr23vQPCsVR8pEfKmgWK3ixrf8HRGoIMK3q22n2m4XWyq2VJk3dJC2phxPt7HYWnniIg4Y6VliY2aPu4MnY32DmTY5gdSE2aROTWZDRhYLp89mZ846FsYlkhgxhamR8cyYkkyQbxgzV1eJeBEmosuu/Z0dVxXaNVz5gFZp01u2CyVNXR+sIlLGn1Imr+1QkNdzD/+M/+gYDAwcsLP1RkfHAn19S1ztPPBzCyAyNEq9+iHCitnzOFJUzOLpKfx]')
|| TO_CLOB(q'[+4Rz5c+eSEh5FgHsgkybE8sOYSALHJUlOt7DjekcPne9RHNgpEd8pdlcPyninOKVVdusdZbdE3M23H2zv+FaX2u5UuNmlZpdib3QQnVaAsZk3ulJpjE1c0B5hwbBhplia2knuu2Fr5oiDmQNjnb2ozFnFzox01s6eRcedRqrXr6F42RLsR9ljZSp7xtEPT79otp57yW6J7i75frWVKO/+B/YoiKNaO26/pZedd969H6vnwu7b7wTFvmWPYsWZHQ3t2HrG8P3AUQwbYYOVlTd21j4Y6dtgYmiLkYE1tuaOTPL0Y0VcLHcP7efC7hKuV+/h1bVz3DlUxYmtGwh2ks1taM0o2fgu3hFSbV6zp7FTzd6P2HNDw95eRHwvWrvvdLPr7js1u+98YM9H7P2ErfXPGKrnxnf9jDA0dJaKMxoPpyAsTSQaUm0GDdQn0MmTtfHx1Bdupr3xMi8u/kTz1TO0NpzjyZmjNOwtZVpQKCN1zDE1ccDJY4J]')
|| TO_CLOB(q'[UlteUS4r+DRFdLmm7r4dycUr9TNDae7ebTyl/zzv23dNYDd3sE4eXlJ1n4HAbvu9rgI2lD/7uIQRJJfK090VnmAn9+2gT5xNAefoC7lTu4WzpFhqrd/H8wkm1+IcH93OvuoJlMdMY0F9XNr81ngHRkhptVEja7lO4qaFCoalTbfepbafYDjWVMtcqF4GKyH33FLF/pUKeV7y3gjihsKryBgOGWdOvv7GsfhDJUVMJ9x2Lm5RP7UF6OBnbsCjkB4qTkjhfXMD1qp2c3LaBurzV7M5cQo3siRMb81k1dQYmUrn8HXzIXF9O5a1Oqm53Ualw6+9UqW2nCO+gqgetivsiTKj8C+/eU/WJrbz3VqrAG/RH+TFggKnU/zFMGhtOXMhEvBw8cJDc97NxZ+7occS6epMQNJbxbh6Ee/mwOCaG3Nkz2ZGZwcmtm/mxoIAxLn6kT55K+eHrIr6T/Xe61LaXanGmWkQr7L/ZoaaqqZ3Kxja11ap80E2]')
|| TO_CLOB(q'[Vmnf/lf0fj8WBamG/OBE9Jx9tbVvcXELxlioS6hWEjYkNo/QtxNqxeMIklkyMIUoiE+bmRXLoeMpWZNB4YC+PfjzEvbpKGsp3M3v8JKrX5FBx9hHVIr76Tud7am4r/NUBRfS+hhYqGlTsVxzYL+KrHwoisPrBW2rU9p1YZfxfuC+IA0X1fzAmPA03twl4OvgRIKfrWI/ReEkJ9bHx4ODKtdzeW8XxdbmcL9xKk4h9WX+C56ePyriMW/t2crakkIObNvLk8hVqm1qoudPxz9wWbrW/p/qmgrQSiuC/iezhQC/3/07NvS5Wlp3G03UCIQFRRAWGkxQcwWS3ICbIqXw0ax0tZ85zaes2jqzI4lxeHidWZ9O0s4Sm3du5UlrI6eKt3Dxcw68XL1F3q5UDIvQDnRp7+2PaNdxqEyfa1FbrvdiH7/6r2FoR2kudMr/fpUHmuy88xd0pjADZyAneYayOnMaioAjipL24vrGErquNvDl1hvyoWDa]')
|| TO_CLOB(q'[ER1O9YBE3d5VytWwb13aVcGHXdhpqKrl0vonaOyJMUOw/UddD7e2293xwoFf8A0WgRmjd/U41BxV7r5Paux2aH5IPVjW+Ye/FZ3i7x+BrH0iEQwDTXAOJsvYgxMKLkogkrqzcQMOWIopnpDLT1YfazCxulu/iqoi/uLOYi3t2sG5JDjvO/KYRJ9+v2INiFdRi/4v4ul4kalpV8rBKwrJfbM09CZPCXYV2NcqXHlTE31FyTiVha1U70LsCqUtL8bANYIytF5H23vib2OMkPf9Ec1di7X2IlX1xsXQ3RXPTmeE3mppVKzlTUsCZ0iLOSDR2FOxmz8WnIlgR/lfq7ohItZW54oD83kEF0dCL1t7rr6m40SK1tVV2uuSWvGG/bI79jSoqb8hr119R1aBhv5rX1DS2cECou9lK6YmHuNgF4WcrHaj0/Y7SStgb2OJkaEeInTd1y1fxU+5GCmankTo+nK3z0ziYv46TsoGPFhVSkpWDs/ckFhc]')
|| TO_CLOB(q'[eoVqiqoiuvd363vairLYaWURFuGIVtPYpDjS8EaEKr6kUwZXXmqm63sx+oVpB5tVXm6n5yNaKI3WKM1de4uMZiYe1O0EOXrhICXU1tCHQ2J5EO0/yI2PZmZxK3rRpTPHxZs3MJPauzqIqbx01mzdRkbdRbmi26Bi7EzBpAdm76qmRinRAxNWqaZEK9YbKK48p+6mJLbWnydtbR07JXpZvLpaDTAQrKML3y4oflDcfbHzNYbFHml5z5OYb9fiwrM6hRsW2cPiGjEX8IXn/IYnK2OBEnM2d8RMHnIyscZYGbZzcxooTUji0LIvD2Su5WLyFncvSSZ8yma2L5lOVn0v9nj3UbSlk8GAz+gw2Z8hIRwzM/YlOzcVnwhzGTF5E7MwM4lPnMTcjjXnLUpm1MJGFmbOZNX8aSXPj5BwQUdUiREmNauHILZXQwrE7rZy418ZRmdeJyAPXXlJzVUP1pedkFR7lgKz+psrLjDLzxVEccLFwwknaaRd]')
|| TO_CLOB(q'[pkz1GOeAjdpKHH+umJ3A4f626jc5MmMqGeXM4WiyVqGY/Ny83MHdhPhZOk+g/1F56LImGoRsj9F0YMNweG+cwHL1icPObintADGPDpFTHRRI6MYSAsT5oKeE5ICuuUKtYcaZGBPdyQKgVFCd6ydpyCN1hlth5RPB1H0O++V5P+npHHOU2ZisRUHC3dGbZtBmc3lHKlcpyjkpXWpq1nLTIcJZOm8qPZaWc213GkZqjPH7dzsnLv7O/9jxmlmPoO8gCXSNXBkmrrmvkjptPLN6jp0vDl4C7XzyObpNwdAplSUw0WifuSkpImiipcvR2ixp1ykjuHbmpGR+8IU5cf0nttRckZxahY+LJl/8Zzldfa/OvLwbz/z4bQN++I7GXC4y9tBOOprZ4WbsQEzCWOVHRrEpJZe2cuSyeGk+WNHjbli6lTlLoVNEWsjI38uipbN76B7xse0fT7SeMsp1Iv8FywzNxp98QC0ZZB4kDCfgGJ+EfMhOfoOm]')
|| TO_CLOB(q'[4+cYxKTQereoGZaO+lJVupq5R2QOv1VZZ9Rp5Xn31BdVXXrD/8nPC4jP493f66hX/5ltt/ufzQWr+778G8H/+pz/mLsm4yaHmbuEgDjgT5OTFeM9AIv3GEDs6hAXRseSkzKZgwXxObdvIgbWryM0r5ZUID5+ymvMP39D+7k+2ltWjre/KYInACD1HhujYY+ciLUvAVDwCpomdprZegQmyByS3K0VkxaUn7D3/iN1nf2Xn6fuUnrzN9uNNlB1rIimzBCffGEZZ+mFk6IjeIAM++3KIrPzA9ygO6NolMDq2CL/RyXjbujPOzY9YubTMllN4eUIyqxJnkj9rDsc2b+BebTk5CYkUba+kTUQvTN/Iur0X6Oz+k9+ftjJx8mL6DzFnmK69pJQZ+qaecumJwNU7BmfZEy5eU3D2nIzWouwsUhbOZ2n2UhYum8e89BRS5iYyfVY8k+LiiZySgLmNH67u4+XDEbh5haGr78igoeb0HWDE518NlSg]')
|| TO_CLOB(q'[MVEehzzAnbEYvJyi2gPDYtQTI2ZAwZjzpUXGsik9mw4wUTm7O59GJWh4eqiDBP4QVaytYmnuQ9RurSMupRCXOdAM7y0+jo+/MoOGWaOvZ00+cMLMOFOGT1MKdPCbj6B6JlqW0wq5+Y4mSXj05JYHUtNliZ+AdEIql/RhsnEKkzk/AxSMMd98oPHwjcZH5SLlKGo9yY+BgY9kHA8WJAXz5jS5uoSswdptDeMpOYmJWSe0PYXlMAsVp87m6czu/Hqvl8anDXN9XxoL4ucxeUon7+Bzmra4lOaOQn1920iFOHDn1ECvHiejo2aFnoFmwESMdZANPUEfCwS1M0ioUre91HOir58xwU3fc/X+QchYkHoZi5xyCg8s4/L0m4OU0GifXcTjLvdXNe6IaS7sA9CSdho4wl3QaxOdfDuabPgYMM/DGyn85ftHbiF90iKXpBayT9PmpYBN3ayv5+Vgdzy6f5eLBI2wuO0fwpI0syDlGSmYlcbNXcvd]')
|| TO_CLOB(q'[FJ686url++wUhUVmYGNqTFRkpF38X+vQ1xMzKF2MLb9ngrpiYuaPVR9eBgUZu9Nd3wsDSFzP7YCxlI9o6BUujNpaDc6eyyNkGs+HGcml3wNrKE3tn2ai+YegbOaGrZ8OQoSb4SAXq09eYL74agldYDv5xO5iy5ASLS5o4UH6Shn27uXLoJw4fusa5i7+w88BtkjLqiJtbwSbZtMnppYyLTOUPVRctXd10ShTKKy4SKbe6F4WLWR8RxoB++gwZbo6RCB8+0lpS2VbjQF9dR/pq22NqF4ypTQDmtn4M1bVmRWwMzUVLaCnJZE9sKOHGxthrG+Fgofwnwg9nx0BMTJywM3OiMTMFkyGmfP2foeia/0B20UU2lF1l3Z4HlBz/g4PH77NmZxM5W05JlblA1uZzUpKPkbHxPCWV14idkY1/8FTuPH3Na3Hg7Z9QVdNAZsQUnm6ax8ttGYTZu/J9H11JXzuG61igPdIKre/kWthHx05W3wcTa19]')
|| TO_CLOB(q'[MrX2wcQzA0sabft8ORa/vEIItrdgaH86L7ZncX53CmgA33LUNsTG2w9HGixWRETzKSiAjaAxW0oW6Sm80c/kRmqU83vz5NVd+lsvHuccsLb3NvPVnySy8xvrdN0lbe54VxQ2cvPQLs9JWU1C4h6u3f+FF+zvaxIOivQ1ULszg9/WzeFWYzoaoMIYMMmTQECMGDzNmyAhTtPrKxtAx88TERiPe3NYXGwd/Rlm48fkXA/jss758+Xl//v15P0wHalOZGkNn+Woe5aWS5miJxTBDvK1cODEnlmOJE/FwCcTNfRxL845zouGluq7//LSNdlnV8jMvWCEp9VNTM63y/PdXb7n/ewsP/nhD5sqtbC+rpObYeV6KA10SgbojdzicmsQv2UnUzZLT2NoLA0mdvn10GDZiFNbS7WqN6BVv44OZiDe388VaImAuuf7V10P5lwj/4kupMF/05ysZf/tlP9KCfHhTmsmLLfOZL064SesQIHeB8pgJjPW]')
|| TO_CLOB(q'[fwNbC3Rw4eZV9J3/l1uMObjx8jehBSjxN91+pndI40MWT1295+LyL7HW7qT9/jeLdteoIKCm0a3M1TctmUCVOBEkRcZQMsZT87/O9LsbKv/Hl+qplLKtuKuliKt4ZyarrmzhK/2EvG8UFPWmJv+2jLW3DYHFiIF9JRL4SR77+sj+THO15UbKMth3LubEimSBxYHJIDD4ewdQdPsWq3BKeNMul6Pxjbv7RTu9f959/qp1RUMqlYsWQtXYXl67KHtmwnRZ58LL1LYuT17E9Po6Y0Gm4WHpha+yk/hemhZkr334zlJE6ZuKApQcmVu4Ymjkz0tQBI3MXzKQVtpbblKE0aH0H6snON6XfQGkhZE/859+D+PrfA+n7VT8y/Vy4nB7L6+3LuZkzT/qdxXjKqpTtqiZi8mxZfRWXpRzWyh1CWX3l760MOt51q4V39ljFgezcfZw8c1FSaTNtMj9x5hcmh69gnByc0wLHcT0njfMZiZQmRBJs58a]')
|| TO_CLOB(q'[gPsPp//0wtMxkE5pYuknD5CHpIzVcqouto5RTK4mGkS3ffDeUAYMN5NTVZfBQI0Zoy4k4yokEVwd+TArj6JRAcv3deLx5Mc2l2aSP9iFt/nIqKg6yo+IEXZL7lfWPUXUp56smjZQyqczU9ETkwMGzLMvKJzYhnQfPOsgtvMQP4SuJ9B7LsVnhtFespfvARjr353F9WQLWg0YwuK84YG7rLSeuj1q4pb3sBRFuKJEwkdI4N9AHgz6DGTBIX3a+gZy6BnJ7MsNYblxnF8Xx28oE2rfM41JSCPeXTOHCwnh+zV9I5NhwduyoJCFxAa+a38geaOG35s73+6D1bbd6k76TeVe3Jgr1Z5vw8Y+WPiqGn5+9YVPJFcZHLGdvSizXFk3hebGka/l6Li6O44b8VqydDVaj5BxQNqyVVB1zicBIWfERehZyfFsw2t6ZO4si8B0+lO++HciAgTrigB7D5ECz1zfhyrzJPFubTOvWNB4vj+XRigSqIwM]')
|| TO_CLOB(q'[4MW0CiT6BpM5ZSvT4WJ6cPMjj5i6uSaepCFU2pxKBtz1jpXlTInH/52f4BcYxeuxUzjXcJX1dPZGhqTRlJXN/xXQe5c6lfMp4fpoRyv3l8eSM9sBQx0R6IVl1a1l9G8HBKRAn50DGeQZwfX4EL3PiWORiRr8+w6Tfl5zrN4Khkkp5P/hza1E0z9cm8WpDirwvkXsLo2krXMTttCiSnBzx9RyHr/cP1OetoPnOLU41NqsdaBfBL6VV6JCJ4kSXpNBb4dffXjBa+vzxEbMo2nWEaelHiA+KZHvsRE7PjuJ6+lRKgj1pmBfOH+uT2RMViO0IHXHATtLH1gc7R3+1eF+PMTSsSaGtYCbPV08hO0D6nUGykYfIMT5AG289Q6qjAri3OJon2Qk0r0uiOWc6N1Mn0iqHzY3ZYeydGEBo8GQSEuYzYUwEC6SdPnSkqSd9pHyqunnU8qfGiZ4odHW9I+wHuQeHJrGuoIL4xcfxtg/CysiGPXHjacy]')
|| TO_CLOB(q'[I535GrPzuJF5sSuXHGeMJ0NNFy15W3VaJgK1cyB182ZYQxavcRJ5mTaZ1UxJ+utpoDxUHBozAbMBgVrnbUznRhweSh89WJfB6fRLPV8Zzd244LQXzuZMew+m4sUwOjSZtYTYpMxcxzcuPDUmL1Kdru1SeZ+1/8rC5mxcdEhFxQDkXlOhkLytgXNgsJk1djn/0Lqn1XkTIZ68viefZprny3ZP5RdJVceDusjgijQ3QMhrliIGxLRbS3yQH+vNsjazqmjjeFqbwdGU0zt9/T78vv2PQ1/2JHWVI7aQAziUGc3d+FM9WTuWVvP+PjGgak8fzIm82r+SHjoX5EuXiy/TkJWQsXU9ObBwX06bz9JmKViWFOv/k5pN33HveLdHQHGqKA8ePXCBgzDScvOLxCC+SYuFKVXI097Jm8HxjKo0LJvNAfuv3NYk8yp5GqpXsAXePEJWra5Bqorev6sGyGNWrnHjV26JZqo4tyao/lkWqpproqPp89o2]')
|| TO_CLOB(q'[q7xffqsJ0R6hqowJU11PGqx4unqx6sSZR1ZKbpHqeHa9qTJmgerImWdVWvEhVHxOkWuLtpUqZlaFauaZAlT01UfXL8pkq1e+/q6T6qFq7UT1p7Vb92vxOdfXRW9VvLd3ihlTat+9Uc+asUTkHpKk8IotVE1z9VbcyE1W/5sxUnZs3WXUkPlT1c2as6lneTNXTdTNUqZbGqv8P2dcN03zBdEAAAAAASUVORK5CYII="
  }
}]'));
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('26','11','dependent-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"lastname":"Last","firstname":"First","zip":"z1","city":"c1","payment":"Visa","creditcard":{"number":"1234 1234 1234 1234","validity":"12/26","securitycode":123}}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('38','24','validate-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"boolean":{"checkbox":true,"select":true,"switch":true,"radio":true},"numeric":{"integer":12,"number":123.456,"money":23,"money_full":123.46},"array":{"checkbox":["val2","val3"],"combo":["val3","val2"]},"date":{"date":"2024-05-10","datetime":"2024-05-13T15:45:00","time":"12:34"},"string":{"pattern":"1234 5678 1234 5678","password":"12345678","string":"str","long_string":"long\nstring","editor_string":"formated\n\n**bold**\n\nstring"}}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('21','222','template-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"floating_req":"abc","floating_opt":"def","above_req":"ghi","above_opt":"jkl","left_req":"mno","left_opt":"pqr","hidden_req":"stu","hidden_opt":"vwx"}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('22','7','array-1-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"checkbox":["val1","val3"],"checkbox_hor":["val1","val3"],"combo":["val1","val3"]}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('23','8','array-2-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"lastname":"Last","firstname":"First","email":"last.first@domain.com","addresses":[{"country":"123","zipcode":"z1","city":"c1","street":"s1"},{"country":"234","zipcode":"z2","city":"c2","street":"s2"}]}');
Insert into UWE.OBJECT (OBJECT_ID,OBJECT_TYPE_ID,OBJECT_NAME,CREATED_AT,DATA) values ('37','23','string-1',to_date('2024-05-10 00:00:00','yyyy-mm-dd hh24:mi:ss'),'{"string":"str1","pattern":"1234 5678 1234 5678","long_string":"long\n<\n15\"\nstring","length":"abcdefghij","select":"val1","radio":"val2","editor_string":"format\n\n**bold**\n\nString","password":"12345678"}');
