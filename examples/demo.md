# create tables

# create APEX-application

# create form object table_name OBJECT
 - pagemode drawer
 - OBJECT_TYPE_ID readonly "item is not null" PXX_OBJECT_TYPE_ID
 - Templay options "Header Hidden"
 - Sub region "Region display Selector"
    - Server side condition "Item is NOT NULL" PXX_OBJECT_ID
    - Template "Blank with attributes"
    - Attributes no "Include Show All"
 - Relation body "Interactive grid" name "relation to"
    - Tablename RELATION
    - Where clause "FROM_OBJECT_ID=:PXX_OBJECT_ID
    - Advanced "Region Display Selector"
    - Attributes "Edit enabled"
    - Attributes Toolbar "Actions Menu"+"Reset Button"
    - FROM_OBJECT_ID "Hidden" Default" Item PXX_OBJECT_ID
     RELATION_ID no "Query only"
    - RELATION_TYPE_ID Type "Select list"
    - List of values "Shared component"
    - TO_OBJECT_ID Type "Select List"
    - List of values "Shared component"
 - Relation body "Interactive grid" name "relation from"
    - alanog "relation to" swat "FROM" and "TO" in columnnames
  - Region Type "JSON-Region
    - Name "dynamicAttributes"
    -  Source PXX_DATA
    - JSON-schema source "SQL-Query"
    - Attribute Headers "on"
    - Attribute SQL-Query 
```
    select object_schema 
    from object_type
    where object_type_id=:P4_OBJECT_TYPE_ID
```

-
    - Dynamic Action Change PXX_OBJECT_TYPE_ID
    - "True" "Effected Element" to "Region" dynamicAttributes"