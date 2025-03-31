--drop table json_region_hierarchie;

create table json_region_hierarchie(
  id integer not null,
  parent_id integer,
  text varchar2(100),
  constraint hier_pk primary key(id),
  constraint hier_fk foreign key (parent_id) references json_region_hierarchie(id)
);

insert into json_region_hierarchie values(1, null, 'val-1');
insert into json_region_hierarchie values(2, null, 'val-2');
insert into json_region_hierarchie values(3, null, 'val-3');
insert into json_region_hierarchie values(4, null, 'val-4');

insert into json_region_hierarchie values(21, 2, 'val-21');
insert into json_region_hierarchie values(22, 2, 'val-22');
insert into json_region_hierarchie values(23, 2, 'val-23');
insert into json_region_hierarchie values(24, 2, 'val-24');

insert into json_region_hierarchie values(41, 4, 'val-21');
insert into json_region_hierarchie values(42, 4, 'val-22');
insert into json_region_hierarchie values(43, 4, 'val-23');
insert into json_region_hierarchie values(44, 4, 'val-24');


insert into json_region_hierarchie values(231, 23, 'val-231');
insert into json_region_hierarchie values(232, 23, 'val-232');
insert into json_region_hierarchie values(233, 23, 'val-233');
insert into json_region_hierarchie values(234, 23, 'val-234');

commit;

Insert into json_region_schema (path,schema,sqlquery) values ('/enums/hierarchie',  null, q'[SELECT json_region_generate_cascade_enums('select id, text FROM json_region_hierarchie WHERE parent_id=:1 OR (:1<0 and parent_id IS NULL) ORDER BY text', -1, 1, 'sel1,sel2,sel3,sel4') from dual]');
COMMIT;


/*
select Lpad(' ',2*level)||t.text,  t.*, level from json_region_hierarchie t
connect by (prior id = parent_id)
start with parent_id is null
order siblings by text;
*/

/*
 * Function to generate the JSON-schema for a cascading selectlist based on a hierarchical sqlquery
 * The query has to return 1 or 2 columns (1 column when the enum-value isequal to the display value)
 * The qury is passed to json_region_generate_enum to generate the enum. 
 * The hierarchy is build using JSON-schemas if/then/allOf
 *
 * Parameter:
 *   p_sqlquery   sql-query to retrieve all entries for a parent-id
 *   p_parent     the id of the parent
 *   p_required   !=0 means the enums are required
 *   p_items      a comma separated list of item-names used for the enums
 *   p_level      (only used internaly)
 *
 * Usage: 
 *   SELECT json_region_generate_cascade_enums('select id, text FROM json_region_hierarchie WHERE parent_id=:1 OR (:1<0 and parent_id IS NULL) ORDER BY text', -1, 0, 'sel1,sel2,sel3,sel4') from dual
 */
CREATE OR REPLACE FUNCTION json_region_generate_cascade_enums(p_sqlquery IN VARCHAR2, p_parent IN VARCHAR2 DEFAULT NULL, p_required BOOLEAN DEFAULT FALSE, p_items IN VARCHAR2 DEFAULT NULL, p_level IN INTEGER DEFAULT 0) 
  RETURN CLOB IS
  l_json      CLOB;
  l_delimiter VARCHAR2(10);
  l_cursor    INTEGER;
  l_id        INTEGER;
  l_ignore    INTEGER;
  l_entries   INTEGER:=0;
  l_item      VARCHAR2(100):='sel';
  l_items     VARCHAR(1000);
  l_enum      CLOB;
  l_pos       INTEGER;
  l_dependent CLOB :='';
  l_padding   VARCHAR2(100):= CHR(10)||LPAD('  ', 2+2*p_level, ' ');
BEGIN
  l_pos := INSTR(p_items, ',');
  if(l_pos>=0) THEN
    l_item  := SUBSTR(p_items,1, l_pos-1);
    l_items := SUBSTR(p_items, l_pos+1);
  ELSE
    l_item:=p_items;
  END IF;
  
  IF(l_item IS NULL OR NOT LENGTH(l_item)>0) THEN
    l_item:='sel_'||p_level;
  END IF;
  
  l_enum :=json_region_generate_enum(p_sqlquery, p_parent);
  IF(l_enum IS NOT NULL) THEN  -- an enum is generated, 
    l_json := l_padding || '{ "properties": {"'||l_item||'": ' ||json_region_generate_enum(p_sqlquery, p_parent)||'}';
    IF(p_required = TRUE) THEN
      l_json := l_json || ','||l_padding||'"required": ["'||l_item||'"]';
    END IF;
    l_cursor := DBMS_SQL.OPEN_CURSOR; 
    DBMS_SQL.PARSE(l_cursor, p_sqlquery, DBMS_SQL.NATIVE); 
    IF(p_parent IS NOT NULL) THEN
      DBMS_SQL.BIND_VARIABLE(l_cursor, ':1', p_parent);
      dbms_output.put_line('bind: '|| p_parent);
    END IF;
    l_ignore := DBMS_SQL.EXECUTE(l_cursor); 
    DBMS_SQL.DEFINE_COLUMN(l_cursor, 1, l_id);

    LOOP
      IF DBMS_SQL.FETCH_ROWS(l_cursor)>0 THEN  -- found a row, process it 
        DBMS_SQL.COLUMN_VALUE(l_cursor, 1, l_id);
        l_enum := json_region_generate_cascade_enums(p_sqlquery, l_id, p_required, l_items, p_level+1);
        IF(l_enum IS NOT NULL) THEN
          l_entries := l_entries+1;
          l_dependent := l_dependent || l_delimiter || l_padding ||'  {';
          l_dependent := l_dependent || l_padding ||'    "if": {"properties": {"'|| l_item ||'": {"const": '||l_id||'}}},';
          l_dependent := l_dependent || l_padding ||'    "then": '||l_enum;
          l_dependent := l_dependent || l_padding ||'  }';
          l_delimiter :=', ';
          END IF;
      ELSE
        EXIT;
      END IF;
    END LOOP;
    DBMS_SQL.CLOSE_CURSOR(l_cursor); 
  --  l_json := '{"allOf": ['||chr(13);

    IF(l_entries>0) THEN
      l_json := l_json || ', '||l_padding||'  "allOf": ['||l_dependent||l_padding||'  ]';
--   ELSE
--      l_json:=NULL;
    END IF;
    IF(l_json IS NOT NULL) THEN -- it's generate some stuff, need a }
      l_json:= l_json||'}';
    END IF;
  END IF;
  RETURN(l_json);
  EXCEPTION WHEN OTHERS THEN
    IF(DBMS_SQL.IS_OPEN(l_cursor)) THEN
      DBMS_SQL.CLOSE_CURSOR(l_cursor);
    END IF;
    RAISE;
END json_region_generate_cascade_enums;
/

--select json_region_generate_enum('select id, text from json_region_hierarchie where parent_id=:1 OR (:1<0 and parent_id IS NULL) ORDER BY text', 5) from dual;
--select json_region_generate_cascade_enums('select id, text from json_region_hierarchie where parent_id=:1 OR (:1<0 and parent_id IS NULL) ORDER BY text', -1, 1, 'sel,sel1,sel2,sel3') from dual;