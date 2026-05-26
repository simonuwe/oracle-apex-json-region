# Test environment

## Data
The data is included in the demo-application **json-region-demo.sql**

## Application
The tests are using the **demo-application**

## Tests
The tests are executed with Selenium-IDE inside a browser (for Example Firefox <151.0.1, Seleniumdoesn't support Chrome animore).
The file with the test is **JSON-Region.side** in this directory.
**Caution:** do noit execute Tests after 23:45, some date-time tests will fail.

## Execution

At start, the test will cleanup the test datasets.
After executing the Selenium-tests, the test data stays in the database.
You can identify the test records with
```sql
  select * from objects where object_name like 'sel-%';
```
**Caution**:

When the browser and/or database are slow, it could take too long to save the data, so test returns an error, even when the rows are created/saved.

## APEX-24.2 Limitation
There is an issue with the tests using the rich-text-editor.
The used CKeditor-library and Selenium "aren't friends"
Access to RichtTextEditor only via apex.item('xxxx').setValue('xxxx');
This works with Selenium-IDE on Firefox only!!!!!

## Support of ui-vison
The File ui-vision-zip contains all selenium-tests converted to ui-vision.
Fir **ui-vision pro** you can unpack the file in a directoryx and directly access these files, for **in-browser only** import the **zip-file**.
