# generic database example

## Screenshots
![Server](server.png)
![Printer](printer.png)
![Switch](switch.png)



## install database schema

```
sqlplus  username@db @install.sql
sqlplus  username@db @initdata.sql
```

## install APEX-demo-application

```
sqlplus  username@db @json-region-demo.sql
```

## deinstall APEX-application

## deinstall database schema

```
sqlplus  username@db @deinstall.sql
```

## Use the generic database example

The example demonstrates how to use row-dependent JSON-schemas.
It uses a "generic" database-schema with 2 tables **object** and **relation**
Via **object_types** it is possible to configure object_type dependend JSON-schemas.

After creating a new object in **objects** the matching input fields will be displays depending on the selected **Object Type**.
