REM INSERTING into OBJECT_TYPE
SET DEFINE OFF;
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('4','Full-Example',TO_CLOB(q'[
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2386','generated-enum-1',TO_CLOB(q'[{
  "type": "object",
  "properties":{
    "sel1": 
{ "type": "string", "enum": ["4", "5", "18", "6", "3", "1", "2", "2241", "2222", "2281", "2346", "2363", "7", "8", "9", "301", "2261", "2367", "10", "2368", "28", "11", "12", "13", "321", "14", "15", "16", "2310", "2325", "17", "241", "2282", "19", "20", "26", "21", "22", "23", "261", "2383", "281", "24", "27", "25", "2365", "2366", "2312", "2221"], "apex": {"enum": { "4": "Full-Example", "5": "Hotel", "18": "Invoice", "6": "Person", "3": "Prin]')
|| TO_CLOB(q'[ter", "1": "Server", "2": "Switch", "2241": "test-allOf-1", "2222": "test-allOf-2", "2281": "test-allOf-3", "2346": "test-allOf-4", "2363": "test-allOf-5", "7": "test-array-1", "8": "test-array-2", "9": "test-array-3", "301": "test-array-4", "2261": "test-array-5", "2367": "test-assettype-1", "10": "test-boolean-1", "2368": "test-countries", "28": "test-css-1", "11": "test-default-1", "12": "test-dependent-1", "13": "test-enum-1", "321": "test-extended-1", "14": "test-format-1", "15": "test-if-1]')
|| TO_CLOB(q'[", "16": "test-if-2", "2310": "test-if-3", "2325": "test-if-4", "17": "test-image-1", "241": "test-invalidkeys-1", "2282": "test-layout-1", "19": "test-numeric-1", "20": "test-object-1", "26": "test-placeholder-1", "21": "test-poll-1", "22": "test-properties-1", "23": "test-readonly-1", "261": "test-ref-1", "2383": "test-ref-2", "281": "test-select-1", "24": "test-string-1", "27": "test-template-1", "25": "test-validate-1", "2365": "test-xx-1", "2366": "test-xx-2", "2312": "xxx", "2221":
"xxx-1"]')
|| TO_CLOB(q'[ } }}
  }
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('5','Hotel',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('22241','hotel evaluation',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "name": {
      "type": "string"
    },
    "rating": {
      "type": "integer",
      "minimum": 1,
      "maximum": 5,
      "apex": {
        "itemtype": "starrating"
      }
    },
    "minPrice": {
      "type": "number"
    },
    "maxPrice": {
      "type": "number"
    },
    "features": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["WiFi", "Pool", "Gym", "Spa", "Restaurant", "Parki]')
|| TO_CLOB(q'[ng"]
      },
      "apex": {
        "itemtype": "selectmany",
        "colSpan": 6
      }
    },
    "comment": {
      "type": "string",
      "apex": {
        "itemtype": "richtext",
        "colSpan": 6,
        "newRow": true
      }
    }
  },
  "required": ["name", "rating"]
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('18','Invoice',TO_CLOB(q'[
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
        "iban": {"type": "string", "pattern": "[A-Z]{2}[0-9]{2}[0-9]{12,30}", "apex": {"placeholder": "DE123456789012..."}},
        "bic":  {"type": "string", "pattern": "[A-Z0-9]{11}", "apex": {"placehold]')
|| TO_CLOB(q'[er": "DE123XYZ456", "colSpan": 3}}
      }
    },
    "creditcard": {
      "type": "object",
      "required": ["number", "validity", "securitycode"],
      "properties":{
        "number":       { "type": "string", "pattern": "[0-9]{4}( [0-9]{4}){3}",  "apex": {"placeholder": "1234 1234 1234 1234"}},
        "validity":     { "type": "string", "pattern": "[0-9]{2}/[0-9]{2}", "apex": {"placeholder": "00/00", "colSpan": 2}},
        "securitycode": { "type": "string", "pattern": "[0-9]{3}", "max]')
|| TO_CLOB(q'[Length": 3, "apex": {"colSpan": 2, "itemtype": "password"}}
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
          "creditcard": {]')
|| TO_CLOB(q'["$ref": "#/$defs/creditcard"}
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
        "description":    {]')
|| TO_CLOB(q'[ "type": "string", "apex": {"colSpan": 3}},
        "quantity":       {"type": "integer", "apex": {"colSpan": 2, "align": "right"}},
        "unit":           {"type": "string", "enum": ["hour", "day", "pcs", "l", "m","km", "m²", "m³"], "apex": {"colSpan": 2}},
        "price_per_unit": {"type": "number", "apex": {"colSpan": 2, "format": "currency", "align": "right"}},
        "total":          {"type": "number", "apex": {"colSpan": 2, "format": "currency", "align": "right"}}
     }
    },
    "]')
|| TO_CLOB(q'[total": {
      "type": "object",
      "required": ["description", "units", "price_per_unit"],
      "properties": {
        "total": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right"}},
        "vat": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right", "label": "VAT 10%"}},
        "grand_total": {"type": "number", "apex": {"colSpan": 11, "format": "currency", "align": "right"}}
     }
    }
  }
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('6','Person',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('3','Printer','{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string", "maxLength": 30},
    "model": {"type": "string", "maxLength": 30},
    "color": {"type": "boolean"},
    "papersize": {"type": "string", "enum":["A4", "A3", "Letter"]}
   }
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('1','Server',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2','Switch','{
  "type": "object",
  "required": ["vendor", "model"],
  "properties": {
    "vendor": {"type": "string",  "maxLength": 30},
    "model":  {"type": "string",  "maxLength": 30},
    "ports":  {"type": "integer", "minimum": 1},
    "speed":  {"type": "string",  "enum": ["10MBit", "100MBit", "1GBit", "10GBit", "100GBit"]}
  }
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2241','test-allOf-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2222','test-allOf-2',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2281','test-allOf-3',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2346','test-allOf-4',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2363','test-allOf-5',TO_CLOB(q'[{
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
      "properties":{ "sel2": {"type": "string", "enum": ["val22-1", "val22-2",  "more1", "more2"]} }]')
|| TO_CLOB(q'[,
      "allOf": [{
        "if":  { "properties": {"sel2": { "const": "more1" } }}, 
        "then": {
          "properties":{ "sel3": {"type": "string", "enum": ["valmore1-1", "valmore1-2", "valmore1-3"]} }
        }
        },{
        "if":  { "properties": {"sel2": { "const": "more2" } }}, 
        "then": {
          "properties":{ "sel3": {"type": "string", "enum": ["valmore2-1", "valmore2-2", "valmore2-3"]} }
        }
      }]
    }
  }]
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('7','test-array-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('8','test-array-2',TO_CLOB(q'[{
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
]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('9','test-array-3','{ 
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
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('301','test-array-4',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2261','test-array-5','{
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
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2367','test-assettype-1',TO_CLOB(q'[{
  "properties": {
    "asset_type": {
      "type": "string",
      "enum": [
        "Firewall",
        "Server",
        "Router",
        "Switch",
        "WLAN-Accessport",
        "Others"
      ]
    }
  },
  "allOf": [
    {
      "if": {
        "asset_type": {
          "const": "Firewall"
        }
      },
      "then": {
        "properties": {
          "vendor": {
            "type": "string",
            "enum": [
              "Checkpoint",
              "Cisco",
            ]')
|| TO_CLOB(q'[  "Fortinet",
              "Juniper"
            ]
          }
        }
      }
    },
    {
      "if": {
        "asset_type": {
          "const": "Server"
        }
      },
      "then": {
        "properties": {
          "vendor": {
            "type": "string",
            "enum": [
              "Dell",
              "HP",
              "IBM",
              "Lenovo"
            ]
          },
          "cpu": {
            "type": "string",
            "enum": [
              "AMD Ryz]')
|| TO_CLOB(q'[en 5",
              "AMD Ryzen 7",
              "Intel i3",
              "Intel i5",
              "Intel i7",
              "Intel i9"
            ]
          }
        }
      }
    },
    {
      "if": {
        "asset_type": {
          "const": "Switch"
        }
      },
      "then": {
        "properties": {
          "vendor": {
            "type": "string",
            "enum": [
              "Cisco",
              "IBM",
              "Linksys"
            ]
          },
          ]')
|| TO_CLOB(q'["speed": {
            "type": "string",
            "enum": [
              "10MBit",
              "100MBit",
              "1GBit",
              "2.5GBit",
              "10GBit"
            ]
          },
          "ports": {
            "type": "number",
            "enum": [
              4,
              8,
              16,
              24,
              48,
              96
            ]
          }
        }
      }
    },
    {
      "if": {
        "asset_type": {
          "const"]')
|| TO_CLOB(q'[: "WLAN-Accessport"
        }
      },
      "then": {
        "properties": {
          "vendor": {
            "type": "string",
            "enum": [
              "AVM",
              "Cisco",
              "D-Link"
            ]
          },
          "frequency": {
            "type": "string",
            "enum": [
              "2.4GHz",
              "5GHz"
            ]
          },
          "security": {
            "type": "string",
            "enum": [
              "WEP",
       ]')
|| TO_CLOB(q'[       "WPA2",
              "WPA2+3"
            ]
          }
        }
      }
    }
  ]
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('10','test-boolean-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('22262','test-complex-array-1',TO_CLOB(q'[{
  "type": "object",
  "properties": {
    "firstname": {"type": "string"},
    "lastname":  {"type": "string"},
    "emails":    {
      "type": "array",
      "items": {"type": "string", "apex": {"format": "email"}}
    },
    "business": { 
      "type": "object",
      "properties": {
        "showorders": {"type": "boolean", "apex": {"itemtype": "switch"}}
      },
      "if": {
        "properties": {
          "showorders": { "const": true }
        }
      },
      "then": {
          "properties": {
            "orders": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "orderid": {"type": "string", "apex": {"textBefore": "Order"}},
                "orderdate": {"type": "string", "format": "date"},
                "orderitems": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "id": {"type": "string"},
                      "name": {"type": "string"},
                      "units": {"type": "integer"},
                      "unitprice": {"type": "number", "apex": {"format": "currency"}}
                    },
                    "required": ["id", "name", "units", "unitprice"]
                  }
                },
                "ordervolume": {"type": "number", "default": 0, "apex": {"format": "currency"}}
              }, 
              "required": ["orderid", "orderdate"]
            }
          },
          "businessvolume": {"type": "number", "default": 0, "apex": {"format": "currency", "textBefore": "Total Business"}}
        }
      }
    },
    "vip": {"type": "boolean", "apex": {"itemtype": "switch"}}
  },
  "required": ["lastname"]
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2368','test-countries',TO_CLOB(q'[{
  "properties": {
    "region": {
      "type": "string",
      "enum": [ "Africa", "America", "Asia", "Antarctica", "Europe"
      ]
    }
  },
  "allOf": [
    {
      "if": {
        "region": { "const": "Africa" }
      },
      "then": {
        "properties": {
          "country": {
            "type": "string",
            "enum": [
              "Algeria", "Angola", "Benin", "Botswana", "British Indian Ocean Territory", "Burkina Faso",
              "Burundi", "Cabo Verde", "Cameroon",]')
|| TO_CLOB(q'[ "Central African Republic", "Chad", "Comoros",
              "Congo", "Congo", "Côte d'Ivoire", "Djibouti", "Egypt", "Equatorial Guinea",
              "Eritrea", "Eswatini", "Ethiopia", "French Southern Territories", "Gabon", "Gambia",
              "Ghana", "Guinea", "Guinea-Bissau", "Kenya", "Lesotho", "Liberia",
              "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius",
              "Mayotte", "Morocco", "Mozambique", "Namibia", "Niger", "Nigeria",
              "Réu]')
|| TO_CLOB(q'[nion", "Rwanda", "Saint Helena", "Sao Tome and Principe", "Senegal", "Seychelles",
              "Sierra Leone", "Somalia", "South Africa", "South Sudan", "Sudan", "Tanzania",
              "Togo", "Tunisia", "Uganda", "Western Sahara", "Zambia", "Zimbabwe"
            ]
          }
        }
      }
    },
    {
      "if": {
        "region": { "const": "America" }
      },
      "then": {
        "properties": {
          "country": {
            "type": "string",
            "enum": [
      ]')
|| TO_CLOB(q'[        "American Samoa", "Anguilla", "Antigua and Barbuda", "Argentina", "Aruba", "Bahamas",
              "Barbados", "Belize", "Bermuda", "Bolivia", "Bonaire", "Bouvet Island",
              "Brazil", "Canada", "Cayman Islands", "Chile", "Colombia", "Costa Rica",
              "Cuba", "Curaçao", "Dominica", "Dominican Republic", "Ecuador", "El Salvador",
              "Falkland Islands (Malvinas)", "French Guiana", "Greenland", "Grenada", "Guadeloupe", "Guatemala",
              "Guyana", "Ha]')
|| TO_CLOB(q'[iti", "Honduras", "Jamaica", "Martinique", "Mexico",
              "Montserrat", "Nicaragua", "Panama", "Paraguay", "Peru", "Puerto Rico",
              "Saint Barthélemy", "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin (French part)", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines",
              "Sint Maarten (Dutch part)", "South Georgia and the South Sandwich Islands", "Suriname", "Trinidad and Tobago", "Turks and Caicos Islands", "United States of America",
          ]')
|| TO_CLOB(q'[    "Uruguay", "Venezuela", "Virgin Islands (British)", "Virgin Islands (U.S.)"
            ]
          }
        }
      }
    },
    {
      "if": {
        "region": { "const": "Asia" }
      },
      "then": {
        "properties": {
          "country": {
            "type": "string",
            "enum": [
              "Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan",
              "Brunei Darussalam", "Cambodia", "China", "Cyprus", "Georgia", "Hong Kong",
        ]')
|| TO_CLOB(q'[      "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan",
              "Jordan", "Kazakhstan", "Korea", "Korea", "Kuwait", "Kyrgyzstan",
              "Lao People's Democratic Republic", "Lebanon", "Macao", "Malaysia", "Maldives", "Mongolia",
              "Myanmar", "Nepal", "Oman", "Pakistan", "Palestine", "Philippines",
              "Qatar", "Saudi Arabia", "Singapore", "Sri Lanka", "Syrian Arab Republic", "Tajikistan",
              "Thailand", "Timor-Leste", "Türkiye", "Turkmenistan"]')
|| TO_CLOB(q'[, "United Arab Emirates", "Uzbekistan",
              "Viet Nam", "Yemen"
            ]
          }
        }
      }
    },
    {
      "if": {
        "region": {
          "const": "Europe"
        }
      },
      "then": {
        "properties": {
          "country": {
            "type": "string",
            "enum": [
              "Åland Islands", "Albania", "Andorra", "Austria", "Belarus", "Belgium",
              "Bosnia and Herzegovina", "Bulgaria", "Croatia", "Czechia", "Denmark", "E]')
|| TO_CLOB(q'[stonia",
              "Faroe Islands", "Finland", "France", "Germany", "Gibraltar", "Greece",
              "Guernsey", "Holy See", "Hungary", "Iceland", "Ireland", "Isle of Man",
              "Italy", "Jersey", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg",
              "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands", "North Macedonia",
              "Norway", "Poland", "Portugal", "Romania", "Russian Federation", "San Marino",
              "Serbia", "Slovakia", "Slovenia",]')
|| TO_CLOB(q'[ "Spain", "Svalbard and Jan Mayen", "Sweden",
              "Switzerland", "Ukraine", "United Kingdom of Great Britain and Northern Ireland"
            ]
          }
        }
      }
    }
  ]
}
]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('28','test-css-1','{
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
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('11','test-default-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('12','test-dependent-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('13','test-enum-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('321','test-extended-1','{
  "type": "object",
  "properties": {
    "date": {"extendedType": "date", "format": "date", "apex": {"default": "now"}},
    "datetime": {"extendedType": "date", "format": "date-time", "apex": {"default": "now"}},
    "extended": {"extendedType": "date", "apex": {"default": "now"}}
  },
  "apex": {"validate": false}
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('14','test-format-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('15','test-if-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('16','test-if-2',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2310','test-if-3',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2325','test-if-4','{
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
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('17','test-image-1','{
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
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('241','test-invalidkeys-1','{
  "type":"object",
  "properties": {
    "key_ok": {"type": "string"},
    "key not ok": {"type": "string"}
  } 
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2282','test-layout-1',TO_CLOB(q'[{
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
]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('19','test-numeric-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('20','test-object-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('26','test-placeholder-1',TO_CLOB(q'[{ 
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('21','test-poll-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('22','test-properties-1','{
  "type": "object",
  "additionalProperties": true,
  "properties":{
    "input": {"type": "string"}
  }
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('23','test-readonly-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('261','test-ref-1',TO_CLOB(q'[{ "type":"object",
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2383','test-ref-2',TO_CLOB(q'[{
  "type": "object",
  "required": ["select"],
  "properties": {
    "lastname":    {"type": "string"},
    "firstname":   {"type": "string"},
    "birthdate":   {"type": "string", "format": "date"},
    "address":     {"$ref": "/defs/address", "apex": {"label": "external fixed Schema"}},
    "object_type": {"$ref": "/enums/object_type", "apex": {"newRow": true, "textBefore": "dynamic enum"}},
    "boolean":     {"$ref": "/defs/boolean", "apex": {"label": "external fixed schema from an other ta]')
|| TO_CLOB(q'[ble"}}
  }
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('2404','test-ref-3','{
  "type": "object",
  "allOf":[
    {"$ref": "/enums/hierarchie"},
    {
      "properties": {
        "comment": {"type": "string"}
      }
    }
  ] 
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('281','test-select-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('24','test-string-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('27','test-template-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('22261','test-upload-1','{
  "type": "object",
  "readOnly": false,
  "properties": {
    "file": {
      "type": "object",  
      "apex": {"itemtype": "fileupload", "maxFilesize": 128, "download": true, "mimetypes": ".pdf,.png,.jpg,.gif,.csv" }},
    "image": {
      "type": "object",  
      "apex": {"itemtype": "imageupload", "maxFilesize": 128, "download": true, "mimetypes": ".png,.jpg,.gif,.csv" }
    }
  },
  "required": ["file"]
}', EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('25','test-validate-1',TO_CLOB(q'[{
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
}]'), EMPTY_CLOB());
Insert into OBJECT_TYPE (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,OBJECT_SCHEMA,AI_PROMPT) values ('22221','xx','{
  "type": "object",
  "properties": {
    "txt": {"type": "string"},
    "int": {"type": "integer"}
   },
  "required": ["txt"]
}', EMPTY_CLOB());

COMMIT;