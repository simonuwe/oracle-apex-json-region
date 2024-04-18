*
 * JSON-region-plugin
 * (c) Uwe Simon 2023,2024
 * Apache License Version 2.0
*/

/*
 * Read the JSON-schema from database. The query must return a single row and the first column must be the JSON-schema.
 */ 
FUNCTION readschema(pQuery IN VARCHAR2) 
  RETURN CLOB IS 
  l_json                CLOB;
  l_column_value_list   apex_plugin_util.t_column_value_list;
BEGIN
  l_column_value_list := apex_plugin_util.get_data (
            p_sql_statement    => pQuery,
            p_min_columns      => 1,
            p_max_columns      => 1,
            p_component_name   => '1');
  IF(l_column_value_list.count=1 AND l_column_value_list(1).count=1 AND l_column_value_list(1)(1) IS NOT NULL) THEN
    APEX_DEBUG.INFO('readschema: %s %s', l_column_value_list(1).count, l_column_value_list(1)(1));
    l_json := l_column_value_list(1)(1);
  END IF;
  RETURN l_json;
END readschema;

/*
 * Read the JSON-schema from database dictionary. 
 * The query must return a single row and the first column must be the JSON-schema.
 * This works only with Oracle >=23x
 * Hack, use SYS_DBURIGEN to convert LONG to CLOB!!!!
 */
FUNCTION readschemafromdictionary(pItem IN VARCHAR2) 
  RETURN CLOB IS 
  l_json                CLOB;
  l_table_name          all_tab_columns.table_name%TYPE;
  l_owner               all_tab_columns.owner%TYPE;
  l_column_name         all_tab_columns.column_name%TYPE;
BEGIN
  $IF DBMS_DB_VERSION.VERSION>=23
  $THEN
    APEX_DEBUG.INFO('readschemafromdictionary for database version %d', DBMS_DB_VERSION.VERSION);
    SELECT table_name, item_source
    INTO l_table_name, l_column_name
    FROM apex_application_page_items i 
    JOIN apex_application_page_regions r ON (r.region_id=i.region_id)
    WHERE i.application_id=NV('APP_ID') AND item_name=pItem;

    APEX_DEBUG.INFO('readschemafromdictionary: %s %s %s', l_owner, l_table_name, l_column_name);

    SELECT REGEXP_SUBSTR(text, '({.+})',1,1,'n',1) AS json_schema
    INTO l_json
    FROM (
      SELECT table_name, constraint_name,
        SYS_DBURIGEN(table_name, constraint_name, search_condition, 'text()').getclob() as text 
      FROM user_constraints WHERE UPPER(search_condition_vc) like '%IS JSON%' AND constraint_type='C'
    ) c 
    JOIN user_cons_columns cc ON(c.table_name=cc.table_name AND c.constraint_name=cc.constraint_name)
    WHERE c.table_name=l_table_name AND column_name=l_column_name;
    APEX_DEBUG.INFO('JSON %s', substr(l_json,1,1000));
  $ELSE
    APEX_DEBUG.ERROR('readschemafromdictionary not supported for database version %d', DBMS_DB_VERSION.VERSION);
  $END
  RETURN l_json;
END readschemafromdictionary;
/*
 * Called when the plugin is to be rendered
 */
FUNCTION render_region(p_region              IN apex_plugin.t_region,
                       p_plugin              IN apex_plugin.t_plugin,
                       p_is_printer_friendly IN BOOLEAN)
  RETURN apex_plugin.t_region_render_result IS
  -- plugin attributes
  l_result      apex_plugin.t_region_render_result;
  l_dataitem            p_region.source%TYPE := UPPER(NVL(p_region.attribute_10, p_region.source));
  l_schema              p_region.attribute_03%TYPE := p_region.attribute_03;                            -- The fixed JSON-schema
  l_query               p_region.attribute_04%TYPE := p_region.attribute_04;                            -- The SQL-query to retrieve the JSON-schema
  l_colwidth            p_region.attribute_05%TYPE := p_region.attribute_05;                            -- The column width for the field items in universal theme 1,2,3,4,6,12
  l_textareawidth       p_region.attribute_01%TYPE :=  NVL(p_region.attribute_01, 250);                 -- The limit when textarea is used for long tex inputs
  l_keepattributes      p_region.attribute_06%TYPE :=  NVL(p_region.attribute_06, 'N');                 -- keep additional attributes not mentioned in JSON-schema
  l_headers             p_region.attribute_07%TYPE :=  NVL(p_region.attribute_07, 'N');                 -- Show headers when sub-objects are in the JSON-schema
  l_hide                boolean                    :=  NVL(p_region.attribute_08, 'Y')='Y';             -- Hide the JSON-field (default is true)
  l_removenulls         BOOLEAN                    :=  NVL(p_region.attribute_09, 'Y')='Y';             -- Remove attributed from JSON with a NULL-value  
  l_queryitems          varchar2(4000);
  l_delimiter           varchar2(1);
  l_binds               DBMS_SQL.varchar2_table;
--  l_columun     apex_plugin.t_region_column := p_region.region_columns(0);
  l_readonly    BOOLEAN;
BEGIN
  apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region, p_is_printer_friendly =>true);
  BEGIN
    IF(l_query IS NOT NULL) THEN -- dynamic json-schema from configured query
      l_schema:=readSchema(l_query);  
    -- Build a list of queryitems required for AJAX-callback
      l_binds := wwv_flow_utilities.get_binds(l_query);
      FOR i IN 1 .. l_binds.count
      LOOP
        l_queryitems := l_queryitems||l_delimiter||'#'||substr(l_binds(i),2);
        l_delimiter:=',';
      END LOOP;
    END IF;

    IF(l_schema IS NULL OR LENGTH(l_schema)=0) THEN
      l_schema:=readschemafromdictionary(l_dataitem);
    END IF;

    EXCEPTION WHEN NO_DATA_FOUND THEN
      l_schema:=NULL;
  END;
  
  l_schema:=NVL(l_schema, '{"type": "object", "properties": {}}');
  -- escape input
  l_dataitem  := NVL(apex_escape.html(l_dataitem), '{}');
  l_schema    := apex_escape.json(l_schema);
  l_readonly  := APEX_REGION.IS_READ_ONLY;

--  APEX_JAVASCRIPT.ADD_ONLOAD_CODE(
    -- execute the code directly not via add_onload_code. Hack to enable the handlers for text-/number-items
  APEX_JAVASCRIPT.ADD_INLINE_CODE (
       p_key=> 'json-region', 
       p_code => 'initJsonRegion(' ||
       apex_javascript.add_value(p_region.static_id) || 
       apex_javascript.add_value(p_region.name) ||        
       apex_javascript.add_value(apex_plugin.get_ajax_identifier) ||       
                                '{' ||
         apex_javascript.add_attribute('isDynamic', l_query IS NOT NULL AND LENGTH(l_query)>0) ||                                
         apex_javascript.add_attribute('queryitems', l_queryitems) ||
         apex_javascript.add_attribute('dataitem', l_dataitem) ||
         apex_javascript.add_attribute('colwidth', l_colwidth) ||
         apex_javascript.add_attribute('readonly', l_readonly) ||
         apex_javascript.add_attribute('textareawidth', l_textareawidth) ||
         apex_javascript.add_attribute('keepAttributes', l_keepattributes!='N') ||
         apex_javascript.add_attribute('headers', l_headers!='N') ||
         apex_javascript.add_attribute('hide', l_hide) || 
         apex_javascript.add_attribute('removeNulls', l_removenulls) || 
         apex_javascript.add_attribute('schema', l_schema, false,false) ||
                                '});'
  );                                 
  RETURN l_result;
  --
END render_region;

/*
 * The AJAX callback called from inside Javascript in the browser.
 * Must return a JSON
 */
FUNCTION ajax_region(p_region IN apex_plugin.t_region,
                     p_plugin IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_region_ajax_result IS
  l_sqlquery p_region.attribute_04%TYPE :=p_region.attribute_04;  -- the SQLquery entered in page designer is passed in attribute_04;
  l_result   apex_plugin.t_region_ajax_result;
  l_json     VARCHAR2(32000);
  l_j        APEX_JSON.T_VALUES;
  l_svg      clob;
BEGIN
  APEX_DEBUG.TRACE('ajax_region %s', APEX_APPLICATION.g_x01);
  apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);
  BEGIN
    IF(APEX_APPLICATION.g_x01 IS NOT NULL) THEN  -- generate a QR-code 
$if wwv_flow_api.c_current>=20231031 $then   -- apex_barcode is only available in APEX >=23.2 (20231031), so conditional compile
      l_svg := apex_barcode.get_qrcode_svg(p_value => APEX_APPLICATION.g_x01); 
      apex_json.open_object;
      apex_json.write('QR', l_svg);
      apex_json.close_all();
$else
      apex_json.open_object;
$end
    ELSE   -- read JSON-schema
      l_json := readschema(l_sqlquery);
      apex_json.parse(l_j , l_json);
      apex_json.write(l_j);
    END IF;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    apex_json.open_object();
    apex_json.close_all();  
  END;
  RETURN l_result;
END ajax_region;