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

/*
select Lpad(' ',2*level)||t.text,  t.*, level from json_region_hierarchie t
connect by (prior id = parent_id)
start with parent_id is null
order siblings by text;
*/

CREATE OR REPLACE FUNCTION json_region_generate_cascade_enums(p_sqlquery IN VARCHAR2, p_parent IN VARCHAR2 DEFAULT NULL, p_items IN VARCHAR2 DEFAULT NULL, p_level IN INTEGER DEFAULT 0) 
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
  l_json := '{ "properties": {"'||l_item||'": ' ||json_region_generate_enum(p_sqlquery, p_parent)||'}';
  l_cursor := DBMS_SQL.OPEN_CURSOR; 
  DBMS_SQL.PARSE(l_cursor, p_sqlquery, DBMS_SQL.NATIVE); 
  IF(p_parent IS NOT NULL) THEN
    DBMS_SQL.BIND_VARIABLE(l_cursor, ':1', p_parent);
    dbms_output.put_line('bind: '|| p_parent);
  END IF;
  l_ignore := DBMS_SQL.EXECUTE(l_cursor); 
  DBMS_SQL.DEFINE_COLUMN(l_cursor, 1, l_id);

  l_json := l_json || ', '||chr(10)||'  "allOf": ['||chr(10);
  LOOP
    IF DBMS_SQL.FETCH_ROWS(l_cursor)>0 THEN  -- found a row, process it 
      DBMS_SQL.COLUMN_VALUE(l_cursor, 1, l_id);
      l_entries := l_entries+1;
      l_enum := json_region_generate_cascade_enums(p_sqlquery, l_id, l_items, p_level+1);
      IF(l_enum IS NOT NULL) THEN
        l_json := l_json || l_delimiter||'{';
        l_json := l_json ||'"if": {"properties": {"'|| l_item ||'": {"const": '||l_id||'}}},';
        l_json := l_json ||'"then": '||l_enum;
        l_json := l_json||'}';
        l_delimiter :=', '||chr(13);
        END IF;
    ELSE
      EXIT;
    END IF;
  END LOOP;
  DBMS_SQL.CLOSE_CURSOR(l_cursor); 
  l_json:= l_json ||'  ]'||CHR(10);

  --  l_json := '{"allOf": ['||chr(13);

  IF(l_entries>0) THEN
    l_json := l_json || chr(13)||'}';
  ELSE
    l_json:=NULL;
  END IF;
  RETURN(l_json);
  EXCEPTION WHEN OTHERS THEN
    IF(DBMS_SQL.IS_OPEN(l_cursor)) THEN
      DBMS_SQL.CLOSE_CURSOR(l_cursor);
    END IF;
    RAISE;
END json_region_generate_cascade_enums;
/

select json_region_generate_cascade_enums('select id, text from json_region_hierarchie where parent_id=:1 OR (:1<0 and parent_id IS NULL) ORDER BY text', -1, 'sel,sel1,sel2,sel3') from dual;