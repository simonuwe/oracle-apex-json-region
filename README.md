# oracle-apex-json-item

An Oracle-APEX-plugin that provides for each property of a JSON-schema an input field to support an easy way to display and edit a JSON item.

## Idea

More and more database tables contain JSON-columns.
When you create an Oracle-APEX-application which has to display and edit data from such tables, there should be an easy way to transform this data into seperate input fields or table columns.
It should be possible to validate the data before saving them.

For this a description of the JSON content is required. 

These requirements could be solved with a JSON-schema description, for details see https://json-schema.org/

**JSON-schema**
```json
{
  "type": "object",
  "required": ["vendor", "model", "os", "purchased_at"],
  "properties": {
     "vendor": {"type": "string", "minLength": 3, "maxLength": 20},
     "model": {"type": "string"},
     "os": {"type": "string"},
     "cputype": {"type": "string"},
     "cpus": {"type": "integer"},
     "cores": {"type": "integer"},
     "ram": {"type": "number", "min": 0, "excludeMinimum": true, "max": 8192},
     "storageSize": { "type": "integer", "multipleOf": 100},
     "purchased_at": { "type": "string", "format": "date-time"} ,
     "warranty_ends": { "type": "string", "format": "date"} 
   },
```

**JSON-data**
```json
{
    "vendor":      "Honor",
    "model":       "Magicbook 16",
    "os":          "Ubuntu 20.04",
    "cputype":     "AMD Ryzen 4800H",
    "cpus":        6,
    "cores":       12,
    "ram":         16384,
    "storageSize": 500,
    "purchased_at": "2022-01-10",
    "warranty_ends":"2024-01-09" 
}
```

This Oracle-APEX-plugin provides a new item-type **json-item**. 

## Supported datatypes

The supported datatypes for JSON-attributes are
- string
- integer
- number (float)

### Input validation

- check for mandatory properties
- Check for correct datatype 
- Validate optional attributes

Optional attributes are
- enum (a static list of values)
- maxLength (maximal length of the input)
- minLength (minimal length of the input)
- multipleOf (numeric only)
- pattern (a regular expression)
- date (YYYY-MM-DD)
- date-time (YYYY-MM-DD HH24:MI)


## Configuration

In the APEX-GUI the plugin provides in the configuration view 
- static JSON-schema for the form 
- dynamic JSON-schema retrieved by a SQL-query.
- the width used in the form to display the JSON-data

### Example-application

The subdirectory **examples** contains a small demo-application to show the possibilities.

## Current status
- Form only, only **simple** JSON-schema without any hierarchy
- no arrays in JSON-schema
- Plugin supports german only
- no support of

## Next steps

- improve errormessages
- support of table views
- language suport 