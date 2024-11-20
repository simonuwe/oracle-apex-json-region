CREATE TABLE json_ref_schema(
  path     VARCHAR2(100) NOT NULL, 
  schema   CLOB, 
  sqlquery VARCHAR2(4000),
  CONSTRAINT json_ref_schema_pk PRIMARY KEY (path) 
);

Insert into json_ref_schema (path,schema,sqlquery) values ('/defs/address',q'[{
  "type":"object",
  "properties":{
    "country":  {"type":"string"},
    "zipcode":  {"type":"string"},
    "city":     {"type":"string"},
    "street":   {"type":"string"}
  }
}]',null);
xxxx  Insert into json_ref_schema (path,schema,sqlquery) values ('/enums/variable_name', null, q'[select json_generate_enum('select id, name from fixed_json order by name', null) from dual]');
Insert into json_ref_schema (path,schema,sqlquery) values ('/defs/car', null, q'[SELECT json_schema from json_type where name='Car']');
COMMIT;

CREATE TABLE json_ref_hierarchie(
  id INTEGER not null,
  parent_id INTEGER,
  text varchar2(100),
  constraint json_ref_hierarchie_pk primary key(id),
  constraint json_ref_hierarchie_fk foreign key (parent_id) references json_ref_hierarchie(id)
);


CREATE OR REPLACE FUNCTION json_generate_enum (
      p_query   IN VARCHAR2,
      p_search  IN VARCHAR2 DEFAULT NULL
    ) RETURN CLOB IS 
    l_ids       VARCHAR2(32000);
    l_names     VARCHAR2(32000);
    l_delimiter VARCHAR2(2);
    l_id        VARCHAR2(100);
    l_name      VARCHAR2(100);
    l_json      CLOB;
    l_cursor    INTEGER;
    l_ignore    INTEGER;
    l_desc      DBMS_SQL.DESC_TAB;
    l_cols      INTEGER;
    l_num_id    BOOLEAN;
    l_datatype  VARCHAR2(30) :='string';
  BEGIN
    l_cursor := dbms_sql.open_cursor; 
    DBMS_SQL.PARSE(l_cursor, p_query, DBMS_SQL.NATIVE); 
    l_ignore := DBMS_SQL.EXECUTE(l_cursor); 
    dbms_output.put_line('Query: '||p_query);
    DBMS_SQL.DESCRIBE_COLUMNS(l_cursor, l_cols, l_desc);
    dbms_output.put_line(l_cols||' '|| l_desc(1).col_name||' '||l_desc(1).col_type);
    DBMS_SQL.DEFINE_COLUMN(l_cursor, 1, l_id, 128);
    l_num_id := l_desc(1).col_type IN (2);
    IF(l_cols>1) THEN  -- with mapping of value and display
      dbms_output.put_line(l_cols||' '|| l_desc(2).col_name||' '||l_desc(2).col_type);
      DBMS_SQL.DEFINE_COLUMN(l_cursor, 2, l_name, 128); 
    END IF;
    if(l_num_id) THEN
      l_datatype:='number';
    ELSE
      l_datatype:='string';
    END IF;
    LOOP 
      IF DBMS_SQL.FETCH_ROWS(l_cursor)>0 THEN  -- found a row, process it 
         -- get column values of the row 
        DBMS_SQL.COLUMN_VALUE(l_cursor, 1, l_id); 
        IF(l_cols>1) THEN 
          DBMS_SQL.COLUMN_VALUE(l_cursor, 2, l_name);
        END IF;
        -- dbms_output.put_line('row: '||l_id||' '||l_name);
        IF(NOT(l_num_id))
        THEN
          l_id:= '"'||l_id||'"';
        END IF;
        l_ids := l_ids || l_delimiter||''||l_id||'';
        IF(l_cols>= 2 AND l_name != l_id) THEN
          IF(l_num_id) THEN
            l_id:= '"'||l_id||'"';
          END IF;
          l_names := l_names || l_delimiter||l_id||': "'||l_name||'"';
        END IF;
        l_delimiter:=', ';
      ELSE  
        EXIT; 
      END IF; 
    END LOOP; 

    DBMS_SQL.CLOSE_CURSOR(l_cursor); 

        -- build enum { "type": "string", "enum": [...], "apex": {"enum": {id: name, ...}}}
    l_json := '{"type": "'||l_datatype||'", "enum": ['||l_ids||']';
    IF(length(l_names)>0) THEN
      l_json := l_json || ', "apex": {"enum": {'||l_names|| '}}';
    END IF;
    l_json := l_json || '}';
    dbms_output.put_line(l_json);
    RETURN l_json;
END json_generate_enum;
/

CREATE OR REPLACE FUNCTION json_generate_cascade_enums (
      p_query   IN VARCHAR2,
      p_search  IN VARCHAR2 DEFAULT NULL
    ) RETURN CLOB IS 
BEGIN
  NULL;
END json_generate_cascade_enums;
/

