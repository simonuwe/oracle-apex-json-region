# 0.9.3

# New features
- Support for APEX-24.1

## Fixed issues
- #125 alternate labels for comboboxes

# 0.9.2 2024-06-12

# New features
- #121 auto upper/lower for text fields

## Fixed issues

- #118 date format RR not working for APEX<21.2
- #119 delete button on array items does not work for newly created 

# 0.9.1 2024-06-03

# New features
- CSS-classes supported for items
- show image for URLs pointing to images
- Support of APEX 20.2

## Fixed issues
- #103 Array: add/delete row does not work for simple arrays (bug)
- #110 APEX-22.1: datepicker broken (bug)
- #111 configuration of CSS-classes (enhancement)
- #112 Support of APEX 20.2 (enhancement)
- #113 Show images for "type": "string", "format": "uri" (enhancement) 
- #116 wrong time in "default": "NOW" (bug)

## New Features:
- images via URL

# 0.9.0 2024-05-13

## New Features:
- Support of templates for inout-items (floating, above/left, hidden)
- On the fly generation of JSON-schema based on JSON-data, so no JSON-schema required
- Support of Oracle23c JSON-duality-views
- **array** of **object** with add and delete of rows.
- Support of UI-items QR-Code, PCT-Graph, Image
- **if** with **allOf**, **anyOf** and **not**
- Align of input-fields

## Fixed issues


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