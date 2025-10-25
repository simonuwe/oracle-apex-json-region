# 0.9.8

## Fixed Isses
 - #218 enum with numbers: value and displayvalue swapped
 - #221 Empty JSON-schema causes javascript-error in JSON.parse

## New Features
 - #219 APEX:-24.2: Variable-substitution does not work for static-schema
 - #220 Support JSON-schema properties "title", "description"

# 0.9.7.5

## Fixed Isses

 - #213 demo application: JSON CLOBs truncated
 - #212 "readonly": true broken in some cases with 0.9.7.4
 - #210 DependentSchemas anf if/then/else: optional textBefore is always shown
 - #209 complex cascading object, array, object, ... display order not correct
 - #208 "apex": {"format": "currency"} €,00 instead of €0,00
 - #207 "default": 0, "default": 0.0 and "default": false don't work
 - #206 Add AI-Prompt into example-application
 - #205 JSON-schema located in a page item
 - #204 newRow missing infront of "simple item" following an array
 - #203 Readonly doesn't work correctly numeric enum/enum with value mapping
 - #200 Log error when "required" contains unknow itemname
 - #198 Region shown with data: File-/Image-upload error, when not changed and item is mandatory

## New Features

 - #202 APEX-24.2 new Password Visibility

# 0.9.7.4a

## Fixed Isses

  - #195 Import pre APEX-24.2 application into APEX 242 with plugin-0.9.7.4 causes PL/SQL-errors at runtime

## New Features

# 0.9.7.4

## Fixed Isses

  - #192 "type": "null" and "const": "...." causes a console error output

## New Features

 - #135 APEX-deprecate info: change plugin-callbacks to procedure
 - #191 Upload of files and store content as base64

# 0.9.7.3a 2024-03-31

## Fixed Isses

  - #188 Generate JSON-schema from data is broken with 0.9.7.3

## New Features

  - #182 Merge generate JSON-schema with fixed JSON-schema
  - #184 Support of 23ai COLLECTION TABLE/VIEW
  - #185 Support of universal-scheme style **Redwood-light**

## Fixed Isses

  - #158 "additionalProperties": true does not remove data of conditional-schema expressions
  - #186 Oracle 23.7: JSON-schema of Duality-view with "optional" items now uses "oneOf" 

# 0.9.7.2 2024-01-25

## New Features

- #177 Support of APEX-24.2

## Fixed Isses
 - #179 Demo broken with APEX-24.2
 - #176 When "Headers" is off in JSON-region-configuration, arrays are saved with property name "undefined"
 - #175 Example for "Cascading Select-lists"
 - #174 Wrong error message in browser log: JSON-schema invalid: then invalid type undefined


# 0.9.7.1 2024-10-19

## New Features

- #161 Tutorial
 
## Fixed Isses

- #171 rel-0.9.7 returns error when example table doesn't exist
- #170 Change of SQL-query for schema references in region-attributes shows warning
- #169 APEX<=22.1: datepicker partially broken


# 0.9.7 2024-10-17

## New Features

- #160 support of dynamic subschema read from database
- #151 Cascading Select list
- #152 support of JSON-schema's "allOf" 
- #148 Logging of unknown key/values in JSON-schema
- #145 Support of shuttle for multiple selection
- #141 Testautomation with Selenium 
- #90  Better error-logs for errors in JSON-schema

## Fixed Issues

- #166 Oracle23ai: "extendedType": "date" not working
- #164 Itemtype "selectlist" font size of floating label wrong, when value optional 
- #163 Oracle23ai: PLSQL-error when JSON-data-item has no "Source"
- #162 Warnings on Browser-Console when in debug-mode
- #159 null reference when "type" property is missing
- #157 "if", "then", "else" does not work, when then and else contain same property 
- #157 "if", "then" doesn't work if "then" part is an array-property
- #155 wrong logging when JSON-data contains a null object 
- #154 Toplevel "type": "array" does not work
- #153 wrong size of label for itemtype: "switch"

# 0.9.6 2024-10-11

## Fixed Issues
- #144 dbms_json_schema.is_valid return error when json-data IS NULL 
- #143 Javascript error when Popup-LOV exists outside of JSON-regon
- #142 Oracle23ai: validation-error on JSON-schema at minumum, maximum for non numeric types
- #141 Testautomation with Selenium (1st tests)

## New Features

- #146 Support of Color-Picker (APEX >=23.01)

# 0.9.5 2024-08-30
## Fixed Issues
- #129 placeholder not shown for 23.2 combo-item
- #139 "const": "..." causes errormessage in console log

## New Features
- #133 Permissions for "type": "array"
- #136 Improve demo installation

# 0.9.4 2024-06-20
## Fixed Issues

## New Features
- #127 APEX-24.1: Support of new itemtypes SelectOne/SelectMany

## Fixed Issues

# 0.9.3 2024-06-18
## New Features
- Support for APEX-24.1

## Fixed Issues
- #125 alternate labels for comboboxes

# 0.9.2 2024-06-12

## New Features
- #121 auto upper/lower for text fields

## Fixed Issues

- #118 date format RR not working for APEX<21.2
- #119 delete button on array items does not work for newly created 

# 0.9.1 2024-06-03

## New Features
- CSS-classes supported for items
- show image for URLs pointing to images
- Support of APEX 20.2
- images via URL

## Fixed Issues
- #103 Array: add/delete row does not work for simple arrays (bug)
- #110 APEX-22.1: datepicker broken (bug)
- #111 configuration of CSS-classes (enhancement)
- #112 Support of APEX 20.2 (enhancement)
- #113 Show images for "type": "string", "format": "uri" (enhancement) 
- #116 wrong time in "default": "NOW" (bug)

# 0.9.0 2024-05-13

## New Features:
- Support of templates for inout-items (floating, above/left, hidden)
- On the fly generation of JSON-schema based on JSON-data, so no JSON-schema required
- Support of Oracle23c JSON-duality-views
- **array** of **object** with add and delete of rows.
- Support of UI-items QR-Code, PCT-Graph, Image
- **if** with **allOf**, **anyOf** and **not**
- Align of input-fields

## Fixed Issues


- #106 Support of more item configurations (enhancement)
- #80 Use the schema of Oracle23c-JSON-relational-duality view (enhancement)
- #2 array of properties (enhancement)
- #102 password item with pattern (enhancement) 
- #101 Generate JSON-schema on the fly (enhancement)
- #74  Support of attributes "contentEncoding" and "contentMediaType" (enhancement)
- #100 Support of {"type": "string", "format": "time"} (enhancement)
- #92  Advanced support for "if": {...} (enhancement)
- #91  support of "writeOnly": true (enhancement)
- #87  Support of QRcode item (enhancement)
- #98  Support of Percent Graph (enhancement)
- #86  Key/Value-Pairs for enum (enhancement)
- #83  "required" not working for "enum" with "radiobutton" (bug)


# 0.8.1 2024-04-11
- #88 readonly on property level not 100% working bug
- #89 enum for "type": "integer or "number" does not work bug
- #85 readonly does not work for Richttext-Editor bug
- #77 richttext-editor not shown, when JSON-schema is changed on page bug
- #73 undefined reference bug
- #84 "itemtype": "combobox", configuration at wrong property bug
- #82 Optionally place Checkboxes and Radio in a row not column enhancement
- #81 Wrong default for "additionalProperties" bug
- #79 "default": "now" does not work enhancement
- #78 Oracle 23c: extraction of JSON-Schema from constraint sometimes not working bug
- #76 Wrong example for date, date-time error message bug
- #75 1 pixel border on json-region bug
- #71 plugin-configuration enhancement
- #70 css and js files loaded even when not required enhancement

# 0.8.0 2024-01-07
- #36 textarea with markdown- and/or richttext-editor enhancement
- #50 Support APEX-23.2 combobox enhancement

# Release 0.7.6 2023-12-19
 - #67 somtimes javascript errors when json-region contains datepicker

# Release 0.7.5 2023-12-10
 - #59 Oracle 23c extraction of JSON-schema sometimes not working
 - #60 add a table with Oracle23c IS JSON VALIDATE constraint to examples
 - #61 Text separator before items
 - #62 Default values
 - #63 support of password item

# Release 0.7.0 2023-12-03
- #48 css lost for APEX-22.1
- #49 Help texts lost during backport to APEX-22.1
- #44 support of conditional JSON-schema "IF", "THEN", "ELSE" 
- #54 conditional schema always show header of subobjects

# Release 0.6.5 2023-11-11
 - #3 display of date/date-time and numbers in local format
 - #4 configurable labels
 - #30 Support of "dependentRequired"
 - #32 Automatic JSON-schema with Oracle 23c
 - #33 additional UI-items
 - #34 Oracle 23c JSON-schema and date
 - #37 Recursive $ref does not work in JSON-schema
 - #39 switch always "false" when readonly
 - #45 Compatibility broken
 - #46 Export/Import of application causes inline-errormessages to disapear 
 - #47 APEX-22.1 has another date/time-picker


# Release 0.6 2023-10-28
- #7 Support of PWA
- #19 Option to keep attributes not specified in JSON-schema 
- #20 Header for subobjects 
- #21 Support of theming 
- #22 Refresh JSON-region on demand
- #24 Reduce logging to browser console
- #26 hardcoded itemname in html 
- #27 No warning on data change and close
- #28 Remove all null properties from JSON
- #29 Support of JSON-schema keyword const

# Release 0.5 2023-09-14
- #6 Support of textarea: New plugin-configuration **textareawidth** for textareas. Input of **string** with **maxLength>textareawidth** will be displayied as textareas (5 rows).
- #18, missing part in JSON-schema description cause javascript errors

# Release 0.4 2023-08-29
- Config of JSON-item in page-designer in attribute **Source** instead via **Dataitem** in **Attributes** (not compatible to older version)
- **string** with format **date**, **date-time** support attributes **minimum" and **maximum**
- new **string** formats **email** (a valid email-address), **uri** (a valid URL)

# Release 0.2  2023-08-27
- nested objects
- schema support of **$defs**, **$ref**

# Release 0.1 2023-08-23
- initial release
- only plain object
