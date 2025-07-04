/*
 * JSON-region-plugin 0.9.7.4a
 * (c) Uwe Simon 2023, 2025
 * Apache License Version 2.0
 *
 * TODO: Remove conditional compile when min supported version is APEX >=24.2
 *
*/

/* 
 * READ a schema from ref-schema-query with column path, schema, sqlquery 
*/
FUNCTION generate_schema(p_refquery IN VARCHAR2 , p_path IN VARCHAR2) RETURN CLOB IS
    l_json     CLOB;
    l_sqlquery VARCHAR2(4000);
BEGIN
    APEX_DEBUG.INFO('generate_schema %s: "%s"', p_path, p_refquery);
    EXECUTE IMMEDIATE p_refquery INTO l_json, l_sqlquery USING p_path;
    IF l_json IS NULL THEN
      EXECUTE IMMEDIATE l_sqlquery INTO l_json;
    END IF;

    RETURN(l_json);
 END;

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
            p_component_name   => 'json-region-plugin');
  IF(l_column_value_list.count=1 AND l_column_value_list(1).count=1 AND l_column_value_list(1)(1) IS NOT NULL) THEN
    l_json := l_column_value_list(1)(1);
    APEX_DEBUG.INFO('readschema: %s', l_json);
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
  l_json                CLOB :=NULL;
  l_table_name          all_tab_columns.table_name%TYPE;
  l_owner               all_tab_columns.owner%TYPE;
  l_column_name         all_tab_columns.column_name%TYPE;
BEGIN
  $IF DBMS_DB_VERSION.VERSION>=23
  $THEN
    BEGIN
      APEX_DEBUG.INFO('readschemafromdictionary for database version %d', DBMS_DB_VERSION.VERSION);
      SELECT table_name, item_source
      INTO l_table_name, l_column_name
      FROM apex_application_page_items i 
      LEFT OUTER JOIN apex_application_page_regions r ON (r.region_id=i.region_id)
      WHERE i.application_id=NV('APP_ID') AND item_name=pItem;

      APEX_DEBUG.INFO('readschemafromdictionary: %s %s.%s', l_owner, l_table_name, l_column_name);

      SELECT REGEXP_SUBSTR(text, '({.+})',1,1,'n',1) AS json_schema
      INTO l_json
      FROM (
        SELECT table_name, constraint_name,
          SYS_DBURIGEN(table_name, constraint_name, search_condition, 'text()').getclob() as text 
        FROM user_constraints WHERE UPPER(search_condition_vc) like '%IS JSON%' AND constraint_type='C'
      ) c 
      JOIN user_cons_columns cc ON(c.table_name=cc.table_name AND c.constraint_name=cc.constraint_name)
      WHERE c.table_name=l_table_name AND column_name=l_column_name;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      IF(l_table_name IS NOT NULL) THEN
        l_json := json_serialize(DBMS_JSON_SCHEMA.describe(l_table_name, l_owner));
      ELSE
        APEX_DEBUG.ERROR('readschemafromdictionary JSON-item "%s not connected to database source, no JSON-schema found for database column', pItem);
      END IF;
    END;
    APEX_DEBUG.INFO('readschemafromdictionary JSON %s', substr(l_json,1,1000));
  $ELSE
    APEX_DEBUG.ERROR('readschemafromdictionary not supported for database version %d', DBMS_DB_VERSION.VERSION);
  $END
  RETURN l_json;
END readschemafromdictionary;
/*
 * Called when the plugin is to be rendered
 */

FUNCTION render_json_region(
    p_region              IN apex_plugin.t_region,
    p_plugin              IN apex_plugin.t_plugin,
    p_is_printer_friendly IN BOOLEAN)
  RETURN apex_plugin.t_region_render_result
IS
  -- plugin attributes
  l_apex_version        apex_release.version_no%TYPE;
  l_name                p_region.name%TYPE;   -- name of the region
  l_dataitem            p_region.source%TYPE; -- dataitem with JSON-data P00_....
  l_schemaitem          p_region.attribute_15%TYPE;
  l_source              VARCHAR(32767);       -- source the for JSON-Schema (0: generate, 1: static, others SQL-query)
  l_schema              VARCHAR(32767);       -- The fixed JSON-schema
  l_query               VARCHAR(32767);       -- The SQL-query to retrieve the JSON-schema
  l_colwidth            NUMBER;               -- The column width for the field items in universal theme 1,2,3,4,6,12
  l_template            VARCHAR(32767);       -- Template used for input items        
  l_textareawidth       NUMBER;               -- The limit when textarea is used for long tex inputs
  l_keepattributes      BOOLEAN;              -- keep additional attributes not mentioned in JSON-schema
  l_additionalschema    VARCHAR(32767);       -- an additional schema merged with the "original" JSON-schema
  l_headers             BOOLEAN;              -- Show headers when sub-objects are in the JSON-schema
  l_hide                BOOLEAN;              -- Hide the JSON-field (default is true)
  l_removenulls         BOOLEAN;              -- Remove attributed from JSON with a NULL-value  
  l_is_printer_friendly BOOLEAN;              -- printerfriendly output
  l_result              apex_plugin.t_region_render_result;
  l_queryitems          VARCHAR2(4000);
  l_delimiter           VARCHAR2(1);
  l_binds               DBMS_SQL.varchar2_table;
--  l_columun     apex_plugin.t_region_column := p_region.region_columns(0);
  l_readonly    BOOLEAN;
BEGIN
$IF wwv_flow_api.c_current>=20241130
$THEN  -- new API for >= APEX_24.2
  l_dataitem            := UPPER(p_region.attributes.get_varchar2('attribute_10', p_region.source));
  l_schemaitem          := p_region.attributes.get_varchar2('attribute_15', p_region.attribute_15);
  l_source              := p_region.attributes.get_varchar2('attribute_02', p_region.attribute_02);
  l_schema              := p_region.attributes.get_varchar2('attribute_03', p_region.attribute_03);
  l_query               := p_region.attributes.get_varchar2('attribute_04', p_region.attribute_04);
  l_colwidth            := p_region.attributes.get_varchar2('attribute_05', p_region.attribute_05);
  l_template            := p_region.attributes.get_varchar2('attribute_11', 'floating');        
  l_textareawidth       := p_region.attributes.get_varchar2('attribute_01', 250);
  l_keepattributes      := p_region.attributes.get_boolean('attribute_06', false);
  l_additionalschema    := p_region.attributes.get_varchar2('attribute_14', p_region.attribute_14);
  l_headers             := p_region.attributes.get_boolean('attribute_07', false);
  l_hide                := p_region.attributes.get_boolean('attribute_08', true);
  l_removenulls         := p_region.attributes.get_boolean('attribute_09', true);
  APEX_DEBUG.TRACE('LEN-01: '||NVL(p_region.attribute_01,'NULL')||' '||LENGTH(p_region.attribute_01));
$ELSE
  l_dataitem            := UPPER(NVL(p_region.attribute_10, p_region.source));
  l_schemaitem          := p_region.attribute_15;
  l_source              := p_region.attribute_02;
  l_schema              := p_region.attribute_03;
  l_query               := p_region.attribute_04;
  l_colwidth            := p_region.attribute_05;
  l_template            := NVL(p_region.attribute_11, 'floating');        
  l_textareawidth       := NVL(p_region.attribute_01, 250);
  l_keepattributes      := NVL(p_region.attribute_06, 'N')='Y';
  l_additionalschema    := p_region.attribute_14;
  l_headers             := NVL(p_region.attribute_07, 'N')='Y';
  l_hide                := NVL(p_region.attribute_08, 'Y')='Y';
  l_removenulls         := NVL(p_region.attribute_09, 'Y')='Y';  
  l_is_printer_friendly := p_is_printer_friendly;
$END
  SELECT VERSION_NO INTO l_apex_version FROM APEX_RELEASE;
  APEX_DEBUG.TRACE('APEX-Version: '||l_apex_version);
  APEX_DEBUG.TRACE('DB-Version:   '||DBMS_DB_VERSION.VERSION);
  apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region, p_is_printer_friendly =>l_is_printer_friendly);
  BEGIN
    CASE l_source
    WHEN '1'  THEN -- JSON-schema in static source
      IF(l_schema IS NULL OR LENGTH(l_schema)=0) THEN
        l_schema:=readschemafromdictionary(l_dataitem);
        IF(l_schema IS NULL OR LENGTH(l_schema)=0) THEN
        l_schema:= NULL;
        END IF;
      END IF;
    ELSE
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
    END CASE;

    EXCEPTION WHEN NO_DATA_FOUND THEN
      l_schema:=NULL;
  END;
  
  l_schema:=NVL(l_schema, '{"type": "object", "properties": {}}');
  -- escape input
  l_dataitem  := NVL(apex_escape.html(l_dataitem), '{}');
  --l_schema    := apex_escape.json(l_schema);
  l_readonly  := APEX_REGION.IS_READ_ONLY;

$IF wwv_flow_api.c_current<20241130 
$THEN   -- must include requireJS when >APEX_24.2
    APEX_JAVASCRIPT.ADD_REQUIREJS();
$END
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
         apex_javascript.add_attribute('generateSchema',   (l_source = '0'))||                                
         apex_javascript.add_attribute('queryitems',       l_queryitems) ||
         apex_javascript.add_attribute('dataitem',         l_dataitem) ||
         apex_javascript.add_attribute('schemaitem',       l_schemaitem) ||
         apex_javascript.add_attribute('name',             l_name) ||
         apex_javascript.add_attribute('colwidth',         l_colwidth) ||
         apex_javascript.add_attribute('readonly',         l_readonly) ||
         apex_javascript.add_attribute('textareawidth',    l_textareawidth) ||
         apex_javascript.add_attribute('keepAttributes',   l_keepattributes) ||
         apex_javascript.add_attribute('headers',          l_headers) ||
         apex_javascript.add_attribute('hide',             l_hide) || 
         apex_javascript.add_attribute('removeNulls',      l_removenulls) || 
         apex_javascript.add_attribute('template',         l_template) || 
         apex_javascript.add_attribute('schema',           l_schema) ||
         apex_javascript.add_attribute('additionalschema', l_additionalschema) ||
         apex_javascript.add_attribute('apex_files',       APEX_APPLICATION.G_IMAGE_PREFIX) ||
         apex_javascript.add_attribute('nls_date_format',  V('APP_NLS_DATE_FORMAT')) ||
         apex_javascript.add_attribute('apex_version',     l_apex_version, false,false) ||
                                '});'
  );                                 
  RETURN l_result;
  --
END render_json_region;

/*
 * The AJAX callback called from inside Javascript in the browser.
 * Must return a JSON
 */
FUNCTION ajax_json_region(p_region IN apex_plugin.t_region,
                     p_plugin IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_region_ajax_result 
IS
  l_sqlquery  VARCHAR2(32767);             -- the SQL-query entered in page designer is passed in attribute_04;
  l_refquery  VARCHAR2(32767);             -- The query to retreive the schema reference column, If set on region level use it, els from Component level
  l_function  APEX_APPLICATION.g_x04%TYPE; -- function executed by AJAX-callback
  l_param1    APEX_APPLICATION.g_x05%TYPE; -- 1st parameter for function
  l_result    apex_plugin.t_region_ajax_result;
  l_json      VARCHAR2(32767);
  l_j         APEX_JSON.T_VALUES;
  l_svg       CLOB;
BEGIN
  apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);
$IF wwv_flow_api.c_current>=20241130
$THEN  -- new API for >= APEX_24.2
  l_sqlquery  := p_region.attributes.get_varchar2('attribute_04', p_region.attribute_04);
  l_refquery  := NVL(p_region.attributes.get_varchar2('attribute_12', p_region.attribute_12), p_plugin.attribute_01);  -- region specific attribute_12 or when empty plugin attribute_01
$ELSE
  l_sqlquery  := p_region.attribute_04;
  l_refquery  := NVL(p_region.attribute_12, p_plugin.attribute_01);
$END

  l_function  := APEX_APPLICATION.g_x04;
  l_param1    := APEX_APPLICATION.g_x05;
  BEGIN
        -- x01-x03 used by QRCode callback
    APEX_DEBUG.TRACE('ajax_json_region pplugin %s', p_plugin.attribute_01);
    APEX_DEBUG.TRACE('ajax_json_region source %s', p_region.source);
    APEX_DEBUG.TRACE('ajax_json_region items %s', p_region.ajax_items_to_submit);
    APEX_DEBUG.TRACE('ajax_json_region g_x01 %s', APEX_APPLICATION.g_x01);
    IF(APEX_APPLICATION.g_x01 IS NOT NULL AND LENGTH(APEX_APPLICATION.g_x01)>0) THEN  
        -- generate a QR-code  QC-code callback uses x01-x03
$IF wwv_flow_api.c_current>=20231031 
$THEN
        -- apex_qrcode is only available in APEX >=23.2 (20231031), so conditional compile
      l_svg := apex_barcode.get_qrcode_svg(p_value => APEX_APPLICATION.g_x01); 
      apex_json.open_object;
      apex_json.write('QR', l_svg);
$ELSE
      apex_json.open_object;
      apex_json.write('{}');
$END
    ELSE
      APEX_DEBUG.TRACE('ajax_json_region g_x04 %s', l_function);
      APEX_DEBUG.TRACE('ajax_json_region g_x05 %s', l_param1);
      CASE APEX_APPLICATION.g_x04
        WHEN 'getSubschema' THEN  -- x05 contains the JSON-schema requested schema path
          l_json := generate_schema(l_refquery, l_param1);
          apex_json.parse(l_j , l_json);
          apex_json.write(l_j);
        WHEN 'getSchema' THEN  -- the names of the search items for requested JSON-schema is in pageItems
          APEX_DEBUG.TRACE('ajax_json_region others');
          l_json := readschema(l_sqlquery);
          apex_json.parse(l_j , l_json);
          apex_json.write(l_j);
        ELSE 
          apex_json.open_object;
      END CASE;
    END IF;
  apex_json.close_all();
  EXCEPTION WHEN NO_DATA_FOUND THEN
    apex_json.open_object();
    apex_json.close_all(); 
    RAISE; 
  END;
  --
  RETURN l_result;
  --
END ajax_json_region;

$IF wwv_flow_api.c_current>=20241130
$THEN  -- new API for >= APEX_24.2
PROCEDURE render_json_region (
    p_plugin IN            apex_plugin.t_plugin,
    p_region IN            apex_plugin.t_region,
    p_param  IN            apex_plugin.t_region_render_param,
    p_result IN OUT NOCOPY apex_plugin.t_region_render_result )
IS
BEGIN
  p_result := render_json_region(p_plugin => p_plugin, p_region => p_region, p_is_printer_friendly => p_param.is_printer_friendly);
END;

PROCEDURE ajax_json_region (
    p_plugin IN            apex_plugin.t_plugin,
    p_region IN            apex_plugin.t_region,
    p_param  IN            apex_plugin.t_region_ajax_param,
    p_result IN OUT NOCOPY apex_plugin.t_region_ajax_result ) IS
BEGIN
  p_result := ajax_json_region(p_plugin=>p_plugin, p_region=>p_region);
END;
$END
