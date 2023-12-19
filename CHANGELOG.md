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