# Test environment

## Data
The data is included in the demo-application **json-region-demo.sql**

## Application
The tests are using the **demo-application**

## Tests
The tests are executed with Selenium-IDE inside a browser (for Example Chrome).
The file with the test is **JSON-Region.side** in this directory.
**Caution:** do noit execute Tests after 23:45, some dat-time tests will fail.

## Execution

At start, the test will cleanup the test datasets.
After executing the Selenium-tests, the test data stays in the database.
You can identify the test records with
```sql
  select * from objects where object_name like 'sel-%';
```