prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_220100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.0'
,p_default_workspace_id=>3500471199294590
,p_default_application_id=>100
,p_default_id_offset=>12248033781588176
,p_default_owner=>'UWE'
);
end;
/
 
prompt APPLICATION 100 - json-region-demo
--
-- Application Export:
--   Application:     100
--   Name:            json-region-demo
--   Date and Time:   19:25 Friday May 17, 2024
--   Exported By:     UWE
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 36151739649985791
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     1200177640069352
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/json_region_uwesimon_selfhost_e
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(36151739649985791)
,p_plugin_type=>'REGION TYPE'
,p_name=>'JSON_REGION.UWESIMON.SELFHOST.E'
,p_display_name=>'Json-Region'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/minified/widget.starRating.min.js',
'#IMAGE_PREFIX#libraries/apex/minified/widget.numberField.min.js',
'#PLUGIN_FILES#json-region#MIN#.js',
''))
,p_css_file_urls=>'#PLUGIN_FILES#json-region.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
' * JSON-region-plugin',
' * (c) Uwe Simon 2023,2024',
' * Apache License Version 2.0',
'*/',
'',
'/*',
' * Read the JSON-schema from database. The query must return a single row and the first column must be the JSON-schema.',
' */ ',
'FUNCTION readschema(pQuery IN VARCHAR2) ',
'  RETURN CLOB IS ',
'  l_json                CLOB;',
'  l_column_value_list   apex_plugin_util.t_column_value_list;',
'BEGIN',
'  l_column_value_list := apex_plugin_util.get_data (',
'            p_sql_statement    => pQuery,',
'            p_min_columns      => 1,',
'            p_max_columns      => 1,',
'            p_component_name   => ''1'');',
'  IF(l_column_value_list.count=1 AND l_column_value_list(1).count=1 AND l_column_value_list(1)(1) IS NOT NULL) THEN',
'    APEX_DEBUG.INFO(''readschema: %s %s'', l_column_value_list(1).count, l_column_value_list(1)(1));',
'    l_json := l_column_value_list(1)(1);',
'  END IF;',
'  RETURN l_json;',
'END readschema;',
'',
'/*',
' * Read the JSON-schema from database dictionary. ',
' * The query must return a single row and the first column must be the JSON-schema.',
' * This works only with Oracle >=23x',
' * Hack, use SYS_DBURIGEN to convert LONG to CLOB!!!!',
' */',
'FUNCTION readschemafromdictionary(pItem IN VARCHAR2) ',
'  RETURN CLOB IS ',
'  l_json                CLOB;',
'  l_table_name          all_tab_columns.table_name%TYPE;',
'  l_owner               all_tab_columns.owner%TYPE;',
'  l_column_name         all_tab_columns.column_name%TYPE;',
'BEGIN',
'  $IF DBMS_DB_VERSION.VERSION>=23',
'  $THEN',
'    BEGIN',
'      APEX_DEBUG.INFO(''readschemafromdictionary for database version %d'', DBMS_DB_VERSION.VERSION);',
'      SELECT table_name, item_source',
'      INTO l_table_name, l_column_name',
'      FROM apex_application_page_items i ',
'      JOIN apex_application_page_regions r ON (r.region_id=i.region_id)',
'      WHERE i.application_id=NV(''APP_ID'') AND item_name=pItem;',
'',
'      APEX_DEBUG.INFO(''readschemafromdictionary: %s %s %s'', l_owner, l_table_name, l_column_name);',
'',
'      SELECT REGEXP_SUBSTR(text, ''({.+})'',1,1,''n'',1) AS json_schema',
'      INTO l_json',
'      FROM (',
'        SELECT table_name, constraint_name,',
'          SYS_DBURIGEN(table_name, constraint_name, search_condition, ''text()'').getclob() as text ',
'        FROM user_constraints WHERE UPPER(search_condition_vc) like ''%IS JSON%'' AND constraint_type=''C''',
'      ) c ',
'      JOIN user_cons_columns cc ON(c.table_name=cc.table_name AND c.constraint_name=cc.constraint_name)',
'      WHERE c.table_name=l_table_name AND column_name=l_column_name;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'    SELECT json_serialize(DBMS_JSON_SCHEMA.describe(l_table_name, l_owner))',
'      INTO l_json;',
'    END;',
'    APEX_DEBUG.INFO(''JSON %s'', substr(l_json,1,1000));',
'  $ELSE',
'    APEX_DEBUG.ERROR(''readschemafromdictionary not supported for database version %d'', DBMS_DB_VERSION.VERSION);',
'  $END',
'  RETURN l_json;',
'END readschemafromdictionary;',
'/*',
' * Called when the plugin is to be rendered',
' */',
'FUNCTION render_region(p_region              IN apex_plugin.t_region,',
'                       p_plugin              IN apex_plugin.t_plugin,',
'                       p_is_printer_friendly IN BOOLEAN)',
'  RETURN apex_plugin.t_region_render_result IS',
'  -- plugin attributes',
'  l_result              apex_plugin.t_region_render_result;',
'  l_name                p_region.name%TYPE         := p_region.name;',
'  l_dataitem            p_region.source%TYPE       := UPPER(NVL(p_region.attribute_10, p_region.source));',
'  l_source              p_region.attribute_02%TYPE := p_region.attribute_02;                            -- source the for JSON-Schema (0: generate, 1: static, others SQL-query)',
'  l_schema              p_region.attribute_03%TYPE := p_region.attribute_03;                            -- The fixed JSON-schema',
'  l_query               p_region.attribute_04%TYPE := p_region.attribute_04;                            -- The SQL-query to retrieve the JSON-schema',
'  l_colwidth            p_region.attribute_05%TYPE := p_region.attribute_05;                            -- The column width for the field items in universal theme 1,2,3,4,6,12',
'  l_template            p_region.attribute_11%TYPE :=  NVL(p_region.attribute_11, ''floating'');          -- Template used for input items        ',
'  l_textareawidth       p_region.attribute_01%TYPE :=  NVL(p_region.attribute_01, 250);                 -- The limit when textarea is used for long tex inputs',
'  l_keepattributes      p_region.attribute_06%TYPE :=  NVL(p_region.attribute_06, ''N'');                 -- keep additional attributes not mentioned in JSON-schema',
'  l_headers             p_region.attribute_07%TYPE :=  NVL(p_region.attribute_07, ''N'');                 -- Show headers when sub-objects are in the JSON-schema',
'  l_hide                boolean                    :=  NVL(p_region.attribute_08, ''Y'')=''Y'';             -- Hide the JSON-field (default is true)',
'  l_removenulls         BOOLEAN                    :=  NVL(p_region.attribute_09, ''Y'')=''Y'';             -- Remove attributed from JSON with a NULL-value  ',
'  l_queryitems          varchar2(4000);',
'  l_delimiter           varchar2(1);',
'  l_binds               DBMS_SQL.varchar2_table;',
'--  l_columun     apex_plugin.t_region_column := p_region.region_columns(0);',
'  l_readonly    BOOLEAN;',
'BEGIN',
'  apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region, p_is_printer_friendly =>true);',
'  BEGIN',
'    IF(l_query IS NOT NULL) THEN -- dynamic json-schema from configured query',
'      l_schema:=readSchema(l_query);  ',
'    -- Build a list of queryitems required for AJAX-callback',
'      l_binds := wwv_flow_utilities.get_binds(l_query);',
'      FOR i IN 1 .. l_binds.count',
'      LOOP',
'        l_queryitems := l_queryitems||l_delimiter||''#''||substr(l_binds(i),2);',
'        l_delimiter:='','';',
'      END LOOP;',
'    END IF;',
'',
'    IF(l_schema IS NULL OR LENGTH(l_schema)=0) THEN',
'      l_schema:=readschemafromdictionary(l_dataitem);',
'    END IF;',
'',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      l_schema:=NULL;',
'  END;',
'  ',
'  l_schema:=NVL(l_schema, ''{"type": "object", "properties": {}}'');',
'  -- escape input',
'  l_dataitem  := NVL(apex_escape.html(l_dataitem), ''{}'');',
'  --l_schema    := apex_escape.json(l_schema);',
'  l_readonly  := APEX_REGION.IS_READ_ONLY;',
'',
'  -- HACK for Apex <22.2 to inilialize oraclejet when',
'',
'  APEX_DEBUG.TRACE(''APEX-Flow-Version %s'', wwv_flow_api.c_current);',
'',
'  IF wwv_flow_api.c_current<20221007 AND false THEN',
'    APEX_JAVASCRIPT.ADD_INLINE_CODE (',
'      p_key=> ''json-region-hack221'', ',
'      p_code => ''initJsonRegionHack221('' ||',
'        apex_javascript.add_value(p_region.static_id) ||',
'      '')''',
'    );',
'  END IF;',
'',
'--  APEX_JAVASCRIPT.ADD_ONLOAD_CODE(',
'    -- execute the code directly not via add_onload_code. Hack to enable the handlers for text-/number-items',
'  APEX_JAVASCRIPT.ADD_INLINE_CODE (',
'       p_key=> ''json-region'', ',
'       p_code => ''initJsonRegion('' ||',
'       apex_javascript.add_value(p_region.static_id) || ',
'       apex_javascript.add_value(p_region.name) ||        ',
'       apex_javascript.add_value(apex_plugin.get_ajax_identifier) ||       ',
'                                ''{'' ||',
'         apex_javascript.add_attribute(''isDynamic'', l_query IS NOT NULL AND LENGTH(l_query)>0) ||                                ',
'         apex_javascript.add_attribute(''generateSchema'', (l_source = ''0''))||                                ',
'         apex_javascript.add_attribute(''queryitems'',     l_queryitems) ||',
'         apex_javascript.add_attribute(''dataitem'',       l_dataitem) ||',
'         apex_javascript.add_attribute(''name'',           l_name) ||',
'         apex_javascript.add_attribute(''colwidth'',       l_colwidth) ||',
'         apex_javascript.add_attribute(''readonly'',       l_readonly) ||',
'         apex_javascript.add_attribute(''textareawidth'',  l_textareawidth) ||',
'         apex_javascript.add_attribute(''keepAttributes'', l_keepattributes!=''N'') ||',
'         apex_javascript.add_attribute(''headers'',        l_headers!=''N'') ||',
'         apex_javascript.add_attribute(''hide'',           l_hide) || ',
'         apex_javascript.add_attribute(''removeNulls'',    l_removenulls) || ',
'         apex_javascript.add_attribute(''template'',       l_template) || ',
'         apex_javascript.add_attribute(''schema'',         l_schema, false,false) ||',
'                                ''});''',
'  );                                 ',
'  RETURN l_result;',
'  --',
'END render_region;',
'',
'/*',
' * The AJAX callback called from inside Javascript in the browser.',
' * Must return a JSON',
' */',
'FUNCTION ajax_region(p_region IN apex_plugin.t_region,',
'                     p_plugin IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_region_ajax_result IS',
'  l_sqlquery p_region.attribute_04%TYPE :=p_region.attribute_04;  -- the SQLquery entered in page designer is passed in attribute_04;',
'  l_result   apex_plugin.t_region_ajax_result;',
'  l_json     VARCHAR2(32000);',
'  l_j        APEX_JSON.T_VALUES;',
'  l_svg      clob;',
'BEGIN',
'  APEX_DEBUG.TRACE(''ajax_region %s'', APEX_APPLICATION.g_x01);',
'  apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);',
'  BEGIN',
'    IF(APEX_APPLICATION.g_x01 IS NOT NULL) THEN  -- generate a QR-code ',
'$if wwv_flow_api.c_current>=20231031 $then   -- apex_barcode is only available in APEX >=23.2 (20231031), so conditional compile',
'      l_svg := apex_barcode.get_qrcode_svg(p_value => APEX_APPLICATION.g_x01); ',
'      apex_json.open_object;',
'      apex_json.write(''QR'', l_svg);',
'      apex_json.close_all();',
'$else',
'      apex_json.open_object;',
'$end',
'    ELSE   -- read JSON-schema',
'      l_json := readschema(l_sqlquery);',
'      apex_json.parse(l_j , l_json);',
'      apex_json.write(l_j);',
'    END IF;',
'  EXCEPTION WHEN NO_DATA_FOUND THEN',
'    apex_json.open_object();',
'    apex_json.close_all();  ',
'  END;',
'  RETURN l_result;',
'END ajax_region;'))
,p_api_version=>2
,p_render_function=>'render_region'
,p_ajax_function=>'ajax_region'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.9.1'
,p_about_url=>'https://github.com/simonuwe/oracle-apex-json-region'
,p_files_version=>723
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36351337945249463)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>50
,p_prompt=>'Textarealimit'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'250'
,p_is_translatable=>false
,p_help_text=>'The maximal length of a simple text input field. When the maxLength of the field is longer a textarea is used to display the field.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36352402004268360)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>10
,p_prompt=>'Source'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'0'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The source for the JSON-schema.',
'This could be a static schema or a schema retrieved by a SQL-query.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(18996273543351180)
,p_plugin_attribute_id=>wwv_flow_imp.id(36352402004268360)
,p_display_sequence=>0
,p_display_value=>'No fixed schema - generate from JSON-data'
,p_return_value=>'0'
,p_help_text=>'There is no JSON-schema. Generate JSON-schema from the structure of the JSON-data.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(36353057582269209)
,p_plugin_attribute_id=>wwv_flow_imp.id(36352402004268360)
,p_display_sequence=>10
,p_display_value=>'Static'
,p_return_value=>'1'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(36353485676269991)
,p_plugin_attribute_id=>wwv_flow_imp.id(36352402004268360)
,p_display_sequence=>20
,p_display_value=>'SQL-Query'
,p_return_value=>'SQL-Query'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(39578567980597302)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>20
,p_prompt=>'Static schema'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(36352402004268360)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'1'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36452987522319210)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>30
,p_prompt=>'SQL-Query'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(36352402004268360)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL-Query'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Query to retrieve the JSON-schema. It must return exactly one row with the JSON-schema-column.',
'',
'The schema must contain the attributes',
'type, properties and optionally required.',
'For a detailed JSON-schema description see https://json-schema.org/'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36454049388334385)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>40
,p_prompt=>'Column width'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'3'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The width of a column.',
'The default universal-theme supports here 1 (12 columns), 2, 3, 4, 6, 12(1 column)'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36458658071369954)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Keep additional attributes'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'When the JSON contains more attributes than defined in the JSON-schema the additional attributes are kept when updating the data.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36461843671383453)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Headers'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'When the JSON-schema contains "sub-objects" headers for each sub-object are shown.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36457533711361744)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Hide JSON-item'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Automatically hide the related JSON-item. This is the default.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36456433307355659)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Remove NULLS from JSON'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Remove NULL values from JSON. This is useful to compact JSON-data with only a few attributes set.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(36463481440467736)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>5
,p_prompt=>'JSON-item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The JSON-item the region is linked to. All data shown/edited in the region is read/written to this field-item. ',
'This field-item should be a textarea.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(20299315293284750)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>55
,p_prompt=>'Template'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'floating'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Template used for input-items.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(20300587493286859)
,p_plugin_attribute_id=>wwv_flow_imp.id(20299315293284750)
,p_display_sequence=>10
,p_display_value=>'Label Floating'
,p_return_value=>'floating'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(20300932927289859)
,p_plugin_attribute_id=>wwv_flow_imp.id(20299315293284750)
,p_display_sequence=>20
,p_display_value=>'Label Above'
,p_return_value=>'above'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(20301376404290871)
,p_plugin_attribute_id=>wwv_flow_imp.id(20299315293284750)
,p_display_sequence=>30
,p_display_value=>'Label Left'
,p_return_value=>'left'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(20301714818291687)
,p_plugin_attribute_id=>wwv_flow_imp.id(20299315293284750)
,p_display_sequence=>40
,p_display_value=>'Label Hidden'
,p_return_value=>'hidden'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E6A736F6E726567696F6E7B6D617267696E2D6C6566743A2D2E3572656D3B6D617267696E2D72696768743A2D2E3572656D7D2E6A736F6E726567696F6E202E742D526567696F6E2D6865616465727B626F726465722D626C6F636B2D656E642D737479';
wwv_flow_imp.g_varchar2_table(2) := '6C653A6E6F6E653B6D617267696E2D746F703A3870783B6D617267696E2D626F74746F6D3A3470787D2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696D672C2E6A736F6E726567696F6E202E742D466F726D2D697465';
wwv_flow_imp.g_varchar2_table(3) := '6D57726170706572207376677B6865696768743A313030257D2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D646174655D3A3A2D7765626B69742D63616C656E6461722D7069636B65722D69';
wwv_flow_imp.g_varchar2_table(4) := '6E64696361746F722C2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D6461746574696D652D6C6F63616C5D3A3A2D7765626B69742D63616C656E6461722D7069636B65722D696E6469636174';
wwv_flow_imp.g_varchar2_table(5) := '6F722C2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D74696D655D3A3A2D7765626B69742D63616C656E6461722D7069636B65722D696E64696361746F727B706F736974696F6E3A72656C61';
wwv_flow_imp.g_varchar2_table(6) := '746976653B746F703A2D313070787D2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D646174655D2C2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075';
wwv_flow_imp.g_varchar2_table(7) := '745B747970653D6461746574696D652D6C6F63616C5D2C2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D74696D655D7B6865696768743A3372656D7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(20307379780454874)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_file_name=>'json-region.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2275736520737472696374223B66756E6374696F6E20696E69744A736F6E526567696F6E28652C742C612C72297B6C657420693D7B7D3B66756E6374696F6E206E28652C74297B72657475726E22626F6F6C65616E223D3D747970656F6620653F653A74';
wwv_flow_imp.g_varchar2_table(2) := '7D66756E6374696F6E207028652C2E2E2E74297B41727261792E697341727261792874292626742E6C656E6774683E303F617065782E64656275672E6572726F7228224A534F4E2D736368656D6120696E76616C69643A20222B652C2E2E2E74293A6170';
wwv_flow_imp.g_varchar2_table(3) := '65782E64656275672E6572726F7228224A534F4E2D736368656D6120696E76616C69643A20222B65297D66756E6374696F6E207328297B72657475726E206E65772050726F6D697365282866756E6374696F6E28652C74297B6F2865297D29297D66756E';
wwv_flow_imp.g_varchar2_table(4) := '6374696F6E206F2865297B6C657420743D242822612D726963682D746578742D656469746F7222293B742626745B305D2626745B305D2E676574456469746F7228293F6528293A73657454696D656F7574286F2E62696E6428746869732C65292C333029';
wwv_flow_imp.g_varchar2_table(5) := '7D6173796E632066756E6374696F6E206C28297B6C657420653D242822612D726963682D746578742D656469746F7222293B652626655B305D262628617065782E64656275672E747261636528227761697420666F722072696368746578742D65646974';
wwv_flow_imp.g_varchar2_table(6) := '6F72206265656F6E20696E697469616C697A656422292C617761697420732829297D66756E6374696F6E20632865297B6C657420743D21303B696628617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E69734F626A65637445';
wwv_flow_imp.g_varchar2_table(7) := '6D707479222C65292C652626226F626A656374223D3D747970656F66206529666F7228636F6E73745B612C725D6F66204F626A6563742E656E74726965732865292972262628743D2131293B656C73652065262628743D2131293B72657475726E206170';
wwv_flow_imp.g_varchar2_table(8) := '65782E64656275672E747261636528223C3C6A736F6E526567696F6E2E69734F626A656374456D707479222C74292C747D66756E6374696F6E206428297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E61706578486163';
wwv_flow_imp.g_varchar2_table(9) := '6B7322292C617065782E7468656D653432262628617065782E64656275672E696E666F28225468656D65343220706174636822292C617065782E6576656E742E7472696767657228617065782E6750616765436F6E74657874242C226170657872656164';
wwv_flow_imp.g_varchar2_table(10) := '79656E642229292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E617065784861636B7322297D722E6461746174656D706C61746545543D24282428222E612D466F726D2D6572726F725B646174612D74656D706C617465';
wwv_flow_imp.g_varchar2_table(11) := '2D69645D22295B305D292E617474722822646174612D74656D706C6174652D696422297C7C2278785F4554222C24282223222B65292E6373732822626F72646572222C226E6F6E6522293B636F6E7374206D3D226F626A656374222C753D226172726179';
wwv_flow_imp.g_varchar2_table(12) := '222C783D2270726F70657274696573222C623D227265717569726564222C663D2224726566222C673D22737472696E67222C793D22696E7465676572222C683D226E756D626572222C453D22626F6F6C65616E222C523D22636F6E7374222C413D226461';
wwv_flow_imp.g_varchar2_table(13) := '7465222C493D22646174652D74696D65222C6A3D2274696D65222C773D22616C6C4F66222C4C3D22616E794F66222C443D22696D6167652F706E67222C4F3D22696D6167652F6A7067222C6B3D22696D6167652F676966222C763D22626173653634222C';
wwv_flow_imp.g_varchar2_table(14) := '543D225F222C4E3D22737769746368222C533D227269636874657874222C503D227465787461726561222C433D22636F6D626F626F78222C4D3D22726164696F222C563D22636865636B626F78222C5F3D2273656C656374222C553D2273746172726174';
wwv_flow_imp.g_varchar2_table(15) := '696E67222C463D227172636F6465222C713D22696D616765222C483D2263757272656E6379222C423D227063746772617068222C593D7B7363726970743A7B7461673A22736372697074222C72656C3A6E756C6C2C617474723A22737263222C70726566';
wwv_flow_imp.g_varchar2_table(16) := '69783A223F763D222B617065782E656E762E415045585F56455253494F4E2C747970653A22746578742F6A617661736372697074227D2C6373733A7B7461673A226C696E6B222C72656C3A227374796C657368656574222C617474723A2268726566222C';
wwv_flow_imp.g_varchar2_table(17) := '7072656669783A22222C747970653A22746578742F637373227D7D2C583D7B6C6566743A22752D746578745374617274222C63656E7465723A22752D7465787443656E746572222C72696768743A22752D74657874456E64227D3B66756E6374696F6E20';
wwv_flow_imp.g_varchar2_table(18) := '5128652C74297B6C657420613D22223B72657475726E20653F28613D652C74262628612B3D542B7429293A613D742C617D66756E6374696F6E204728652C74297B6C657420613D21303B653D657C7C7B7D2C617065782E64656275672E74726163652822';
wwv_flow_imp.g_varchar2_table(19) := '3E3E6A736F6E526567696F6E2E6576616C45787072657373696F6E222C652C74293B666F7228636F6E73745B722C695D6F66204F626A6563742E656E7472696573286529297B73776974636828636F6E736F6C652E6C6F6728224556414C222C722C6929';
wwv_flow_imp.g_varchar2_table(20) := '2C72297B6361736520623A696628617065782E64656275672E747261636528226576616C45787072657373696F6E3A20222C652E72657175697265642C226E6F7420656D707479222C74292C41727261792E6973417272617928692929666F7228636F6E';
wwv_flow_imp.g_varchar2_table(21) := '73742065206F662069296E756C6C213D745B655D262630213D745B655D2E6C656E6774687C7C28613D2131293B656C736520702822636F6E646974696F6E616C20736368656D61222C722C226D75737420626520616E20617272617922293B627265616B';
wwv_flow_imp.g_varchar2_table(22) := '3B6361736520773A666F7228636F6E73742065206F66206929613D6126264728652C74293B627265616B3B63617365204C3A617065782E64656275672E747261636528226576616C45787072657373696F6E3A20222C722C692C224F5222293B6C657420';
wwv_flow_imp.g_varchar2_table(23) := '6E3D21313B666F7228636F6E73742065206F662069296E3D6E7C7C4728652C74293B613D6126266E3B627265616B3B63617365226E6F74223A617065782E64656275672E747261636528226576616C45787072657373696F6E3A20222C692C224E4F5422';
wwv_flow_imp.g_varchar2_table(24) := '292C613D214728692C74293B627265616B3B6361736520783A613D4728652E70726F706572746965732C74293B627265616B3B64656661756C743A41727261792E6973417272617928692E656E756D293F28617065782E64656275672E74726163652822';
wwv_flow_imp.g_varchar2_table(25) := '6576616C45787072657373696F6E3A222C722C22696E20222C692C745B725D292C692E656E756D2E696E636C7564657328745B725D297C7C28613D213129293A766F69642030213D3D69262628617065782E64656275672E747261636528226576616C45';
wwv_flow_imp.g_varchar2_table(26) := '787072657373696F6E3A222C722C223D3D222C692C745B725D292C692E636F6E7374213D745B725D262628613D213129297D627265616B7D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6576616C4578';
wwv_flow_imp.g_varchar2_table(27) := '7072657373696F6E222C652C61292C617D66756E6374696F6E204A28652C74297B73776974636828743D747C7C7B747970653A7B7D2C6974656D747970653A7B7D2C666F726D61743A7B7D7D2C617065782E64656275672E747261636528223E3E6A736F';
wwv_flow_imp.g_varchar2_table(28) := '6E526567696F6E2E6765744974656D7479706573222C652C74292C742E747970655B652E747970655D3D21302C652E74797065297B63617365206D3A666F72286C65745B612C725D6F66204F626A6563742E656E747269657328652E70726F7065727469';
wwv_flow_imp.g_varchar2_table(29) := '65732929743D4A28722C74293B627265616B3B6361736520753A743D4A28652E6974656D732C74292C652E61706578262628742E6974656D747970655B652E617065782E6974656D747970655D3D2130293B627265616B3B64656661756C743A652E666F';
wwv_flow_imp.g_varchar2_table(30) := '726D6174262628742E666F726D61745B652E666F726D61745D3D2130292C652E61706578262628742E6974656D747970655B652E617065782E6974656D747970655D3D2130297D72657475726E20617065782E64656275672E747261636528223C3C6A73';
wwv_flow_imp.g_varchar2_table(31) := '6F6E526567696F6E2E6765744974656D7479706573222C74292C747D66756E6374696F6E207A28652C742C61297B696628617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F70616761746553686F77222C652C742C61';
wwv_flow_imp.g_varchar2_table(32) := '292C742E747970653D3D6D29666F72286C65745B692C6E5D6F66204F626A6563742E656E747269657328742E70726F706572746965732929722E68656164657273262628313D3D61262624282223222B652B225F68656164696E6722292E73686F772829';
wwv_flow_imp.g_varchar2_table(33) := '2C303D3D61262624282223222B652B225F68656164696E6722292E686964652829292C7A285128652C69292C6E2C61293B656C736520313D3D6126262824282223222B652B225F434F4E5441494E455222292E73686F7728292C24282223222B65292E70';
wwv_flow_imp.g_varchar2_table(34) := '726F7028227265717569726564222C742E6973526571756972656429292C303D3D6126262824282223222B652B225F434F4E5441494E455222292E6869646528292C24282223222B65292E70726F7028227265717569726564222C213129293B61706578';
wwv_flow_imp.g_varchar2_table(35) := '2E64656275672E747261636528223C3C6A736F6E526567696F6E2E70726F70616761746553686F7722297D66756E6374696F6E205728652C742C61297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F7061676174';
wwv_flow_imp.g_varchar2_table(36) := '655265717569726564222C652C742C61293B6C657420723D24282223222B65293B722E70726F7028227265717569726564222C61292C313D3D613F722E636C6F7365737428222E742D466F726D2D6669656C64436F6E7461696E657222292E616464436C';
wwv_flow_imp.g_varchar2_table(37) := '617373282269732D726571756972656422293A722E636C6F7365737428222E742D466F726D2D6669656C64436F6E7461696E657222292E72656D6F7665436C617373282269732D726571756972656422292C617065782E64656275672E74726163652822';
wwv_flow_imp.g_varchar2_table(38) := '3C3C6A736F6E526567696F6E2E70726F706167617465526571756972656422297D66756E6374696F6E204B28652C74297B22223D3D3D74262628743D6E756C6C292C617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E697465';
wwv_flow_imp.g_varchar2_table(39) := '6D56616C7565324A736F6E222C652C74293B6C657420613D743B6966286E756C6C213D74297472797B73776974636828652E74797065297B6361736520673A73776974636828652E666F726D6174297B6361736520413A613D617065782E646174652E74';
wwv_flow_imp.g_varchar2_table(40) := '6F49534F537472696E6728617065782E646174652E706172736528742C617065782E6C6F63616C652E67657444617465466F726D6174282929292E737562737472696E6728302C3130293B627265616B3B6361736520493A613D617065782E646174652E';
wwv_flow_imp.g_varchar2_table(41) := '746F49534F537472696E6728617065782E646174652E706172736528742C617065782E6C6F63616C652E67657444617465466F726D617428292B2220484832343A4D493A53532229293B627265616B3B63617365206A3A613D747D613D612E6C656E6774';
wwv_flow_imp.g_varchar2_table(42) := '683E303F613A6E756C6C3B627265616B3B6361736520453A613D2259223D3D743B627265616B3B6361736520793A6361736520683A6E756C6C213D74262628613D652E617065782E666F726D61743F617065782E6C6F63616C652E746F4E756D62657228';
wwv_flow_imp.g_varchar2_table(43) := '742C652E617065782E666F726D6174293A617065782E6C6F63616C652E746F4E756D626572287429297D7D63617463682861297B617065782E64656275672E6572726F722822496E76616C696420696E7075742064617461222C652E617065782E666F72';
wwv_flow_imp.g_varchar2_table(44) := '6D61742C742C61297D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6974656D56616C7565324A736F6E222C61292C617D66756E6374696F6E205A28652C742C61297B617065782E64656275672E747261';
wwv_flow_imp.g_varchar2_table(45) := '636528223E3E6A736F6E526567696F6E2E676574436F6E7374616E74222C652C742C61293B6C657420723D743B69662822737472696E67223D3D747970656F6620742626224E4F57223D3D742E746F5570706572436173652829297B7377697463682865';
wwv_flow_imp.g_varchar2_table(46) := '297B6361736520413A723D617065782E646174652E666F726D6174286E657720446174652C22595959592D4D4D2D444422293B627265616B3B6361736520493A723D617065782E646174652E666F726D6174286E657720446174652C22595959592D4D4D';
wwv_flow_imp.g_varchar2_table(47) := '2D444454484832343A4D493A535322293B627265616B3B63617365206A3A723D617065782E646174652E666F726D6174286E657720446174652C22484832343A4D4922293B627265616B3B64656661756C743A723D747D617C7C65213D417C7C28722B3D';
wwv_flow_imp.g_varchar2_table(48) := '225430303A30303A303022297D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E676574436F6E7374616E74222C72292C727D66756E6374696F6E20656528652C742C61297B6C657420723D743B69662861';
wwv_flow_imp.g_varchar2_table(49) := '7065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6A736F6E56616C7565324974656D222C65292C61262621742626652E64656661756C74262628743D5A28652E666F726D61742C652E64656661756C742C213029292C652E7772';
wwv_flow_imp.g_varchar2_table(50) := '6974654F6E6C79262628743D6E756C6C2C723D6E756C6C292C747C7C303D3D747C7C303D3D747C7C303D3D74297B723D743B7472797B73776974636828652E74797065297B6361736520793A6361736520683A723D652E617065782E666F726D61743F61';
wwv_flow_imp.g_varchar2_table(51) := '7065782E6C6F63616C652E666F726D61744E756D62657228722C652E617065782E666F726D6174293A617065782E6C6F63616C652E666F726D61744E756D6265722872293B627265616B3B6361736520673A73776974636828652E666F726D6174297B63';
wwv_flow_imp.g_varchar2_table(52) := '61736520413A617065782E656E762E415045585F56455253494F4E3E3D2232322E322E3022262628723D617065782E646174652E666F726D617428617065782E646174652E706172736528742C22595959592D4D4D2D444422292C617065782E6C6F6361';
wwv_flow_imp.g_varchar2_table(53) := '6C652E67657444617465466F726D6174282929293B627265616B3B6361736520493A743D742E7265706C616365282220222C225422292C617065782E656E762E415045585F56455253494F4E3E3D2232322E322E3022262628723D617065782E64617465';
wwv_flow_imp.g_varchar2_table(54) := '2E666F726D617428617065782E646174652E706172736528742C22595959592D4D4D2D444454484832343A4D4922292C617065782E6C6F63616C652E67657444617465466F726D617428292B2220484832343A4D493A53532229293B627265616B3B6361';
wwv_flow_imp.g_varchar2_table(55) := '7365206A3A723D742E737562737472696E6728302C35293B627265616B3B64656661756C743A696628652E726561644F6E6C792973776974636828652E617065782E6974656D74797065297B6361736520503A723D723F722E7265706C616365416C6C28';
wwv_flow_imp.g_varchar2_table(56) := '223C222C22266C743B22292E7265706C616365416C6C28225C6E222C223C62722F3E22293A22223B627265616B3B6361736520533A723D77696E646F772E6D61726B65642E706172736528722C7B67666D3A21302C627265616B733A21302C7461626C65';
wwv_flow_imp.g_varchar2_table(57) := '733A21302C6D616E676C653A21312C7868746D6C3A21312C6865616465724964733A21317D297D7D627265616B3B6361736520453A723D743F2259223A224E223B627265616B3B6361736520793A6361736520683A723D617065782E6C6F63616C652E66';
wwv_flow_imp.g_varchar2_table(58) := '6F726D61744E756D62657228742C652E617065782626652E617065782E666F726D61747C7C6E756C6C297D7D63617463682865297B617065782E64656275672E6572726F722822496E76616C6964204A534F4E2D64617461222C742C65297D7D72657475';
wwv_flow_imp.g_varchar2_table(59) := '726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6A736F6E56616C7565324974656D222C72292C727D66756E6374696F6E20746528742C612C722C692C6E2C70297B617065782E64656275672E747261636528223E3E';
wwv_flow_imp.g_varchar2_table(60) := '6A736F6E526567696F6E2E6174746163684172726179222C742C722C692C6E293B656528722C6E2C70293B28723D727C7C7B7D292E617065783D722E617065787C7C7B7D3B6C657420733D722E6974656D737C7C7B7D3B69662841727261792E69734172';
wwv_flow_imp.g_varchar2_table(61) := '72617928732E656E756D2929617065782E656E762E415045585F56455253494F4E3E3D2232332E322E3022262628722E617065782E6974656D747970653D3D437C7C732E617065782626732E617065782E6974656D747970653D3D43293F617065782E69';
wwv_flow_imp.g_varchar2_table(62) := '74656D2E63726561746528742C7B6974656D5F747970653A22636F6D626F626F78227D293A617065782E7769646765742E636865636B626F78416E64526164696F282223222B742C22636865636B626F7822293B656C7365206966286E3D6E7C7C5B5D2C';
wwv_flow_imp.g_varchar2_table(63) := '41727261792E69734172726179286E29297B24282223222B742B225F43524541544522292E6F6E2822636C69636B222C2866756E6374696F6E2861297B2166756E6374696F6E28742C61297B617065782E64656275672E747261636528223E3E6A736F6E';
wwv_flow_imp.g_varchar2_table(64) := '526567696F6E2E6164644172726179526F77222C742C61293B6C657420723D24282223222B652B27205B69645E3D22272B742B275F225D2E726F7727293B636F6E737420693D722E6C656E6774682D312C6E3D725B695D2E69643B6C657420703D666528';
wwv_flow_imp.g_varchar2_table(65) := '612E6974656D732C7B7D2C742C22222B692C21312C21302C2130293B702E68746D6C3D273C64697620636C6173733D22726F77206A736F6E726567696F6E223E272B702E68746D6C2B223C2F6469763E222C24282223222B6E292E616674657228702E68';
wwv_flow_imp.g_varchar2_table(66) := '746D6C292C696528742B225F222B692C22222C612E6974656D732C21312C7B7D2C2130292C617065782E6974656D2E6174746163682824282223222B6529292C6428292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E61';
wwv_flow_imp.g_varchar2_table(67) := '64644172726179526F7722297D28742C72297D29293B666F7228636F6E7374206520696E206E29696528742B542B652C612C732C692C6E5B655D2C70293B2428275B69645E3D22272B742B275F225D20627574746F6E27292E6F6E2822636C69636B222C';
wwv_flow_imp.g_varchar2_table(68) := '2866756E6374696F6E2865297B2166756E6374696F6E2865297B6C657420743D2822222B65292E7265706C616365282F44454C455445242F2C22434F4E5441494E455222293B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E';
wwv_flow_imp.g_varchar2_table(69) := '2E64656C4172726179526F77222C652C74292C24282223222B74292E72656D6F766528292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E64656C4172726179526F7722297D28242874686973295B305D2E6964297D2929';
wwv_flow_imp.g_varchar2_table(70) := '7D692626617065782E6974656D2874292E64697361626C6528292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E617474616368417272617922297D66756E6374696F6E20616528652C742C612C722C69297B617065782E';
wwv_flow_imp.g_varchar2_table(71) := '64656275672E747261636528223E3E6A736F6E526567696F6E2E7365744F626A65637456616C756573222C652C742C612C722C69292C612E617065783D612E617065787C7C7B7D3B6C6574206E3D656528612C692C4165293B73776974636828612E7479';
wwv_flow_imp.g_varchar2_table(72) := '7065297B63617365206E756C6C3A6361736520766F696420303A7028276D697373696E67202274797065222061742022257322272C65293B627265616B3B63617365206D3A696628226F626A656374223D3D747970656F6620612E70726F706572746965';
wwv_flow_imp.g_varchar2_table(73) := '73297B693D697C7C7B7D3B666F72286C65745B742C725D6F66204F626A6563742E656E747269657328612E70726F7065727469657329292822222B74292E7374617274735769746828225F22297C7C6165285128652C74292C652C722C612E726561644F';
wwv_flow_imp.g_varchar2_table(74) := '6E6C792C695B745D297D627265616B3B6361736520753A2166756E6374696F6E28652C742C612C722C69297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E736574417272617956616C756573222C652C742C612C722C69';
wwv_flow_imp.g_varchar2_table(75) := '293B6C6574206E3D656528612C692C4165293B612E617065783D612E617065787C7C7B7D3B6C657420733D612E6974656D737C7C7B7D3B696628693D697C7C5B5D2C41727261792E697341727261792869292969662841727261792E6973417272617928';
wwv_flow_imp.g_varchar2_table(76) := '732E656E756D29295B672C792C685D2E696E636C7564657328732E7479706529262628617065782E64656275672E74726163652822736574417272617956616C7565733A222C6E292C617065782E6974656D2865292E73657456616C7565286E7C7C5B5D';
wwv_flow_imp.g_varchar2_table(77) := '292C722626617065782E6974656D2865292E64697361626C652829293B656C736520666F7228636F6E7374206120696E206929616528652B542B612C742C732C722C695B615D293B656C73652070282264617461206D75737420626520616E2061727261';
wwv_flow_imp.g_varchar2_table(78) := '79222C69293B617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E736574417272617956616C75657322297D28652C652C612C612E726561644F6E6C792C69293B627265616B3B6361736522636F6E7374223A63617365226E75';
wwv_flow_imp.g_varchar2_table(79) := '6C6C223A627265616B3B6361736520453A617065782E6974656D2865292E73657456616C7565286E292C612E726561644F6E6C792626617065782E6974656D2865292E64697361626C6528293B627265616B3B64656661756C743A612E726561644F6E6C';
wwv_flow_imp.g_varchar2_table(80) := '7926265B555D2E696E636C7564657328612E617065782E6974656D74797065292626617065782E6974656D2865292E64697361626C6528292C612E726561644F6E6C792626215B465D2E696E636C7564657328612E617065782E6974656D74797065297C';
wwv_flow_imp.g_varchar2_table(81) := '7C28617065782E656E762E415045585F56455253494F4E3E3D2232322E322E30227C7C215B492C415D2E696E636C7564657328612E666F726D617429292626617065782E6974656D2865292E73657456616C7565286E297D696628612E6966297B696628';
wwv_flow_imp.g_varchar2_table(82) := '612E7468656E297B6C657420743D612E7468656E2E70726F706572746965737C7C7B7D3B616528652C652C7B747970653A6D2C70726F706572746965733A747D2C612E726561644F6E6C792C69297D696628612E656C7365297B6C657420743D612E656C';
wwv_flow_imp.g_varchar2_table(83) := '73652E70726F706572746965737C7C7B7D3B616528652C652C7B747970653A6D2C70726F706572746965733A747D2C612E726561644F6E6C792C69297D7D617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7365744F626A65';
wwv_flow_imp.g_varchar2_table(84) := '637456616C75657322297D66756E6374696F6E2072652865297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E676574436F6E646974696F6E616C4974656D73222C65293B6C657420743D5B5D3B666F7228636F6E73745B';
wwv_flow_imp.g_varchar2_table(85) := '612C725D6F66204F626A6563742E656E7472696573286529297377697463682861297B6361736520623A41727261792E697341727261792872293F743D723A702822636F6E646974696F6E616C20736368656D61222C612C226D75737420626520616E20';
wwv_flow_imp.g_varchar2_table(86) := '617272617922293B627265616B3B6361736520773A63617365204C3A666F7228636F6E73742065206F66207229743D742E636F6E636174287265286529293B627265616B3B63617365226E6F74223A6361736520783A743D742E636F6E63617428726528';
wwv_flow_imp.g_varchar2_table(87) := '655B615D29293B627265616B3B64656661756C743A742E707573682861297D72657475726E20743D41727261792E66726F6D286E657720536574287429292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E676574436F6E';
wwv_flow_imp.g_varchar2_table(88) := '646974696F6E616C4974656D73222C74292C747D66756E6374696F6E20696528652C742C612C722C692C6E297B73776974636828617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6174746163684F626A656374222C652C74';
wwv_flow_imp.g_varchar2_table(89) := '2C612C722C692C6E292C28613D617C7C7B7D292E617065783D612E617065787C7C7B7D2C612E74797065297B63617365206E756C6C3A6361736520766F696420303A7028276D697373696E67202274797065222061742022257322272C65293B62726561';
wwv_flow_imp.g_varchar2_table(90) := '6B3B63617365206D3A696628226F626A656374223D3D747970656F6620612E70726F70657274696573297B693D697C7C7B7D3B666F72286C65745B742C725D6F66204F626A6563742E656E747269657328612E70726F7065727469657329292822222B74';
wwv_flow_imp.g_varchar2_table(91) := '292E7374617274735769746828225F22297C7C6965285128652C74292C652C722C612E726561644F6E6C792C695B745D2C6E297D627265616B3B6361736520753A746528652C652C612C612E726561644F6E6C792C692C6E293B627265616B3B63617365';
wwv_flow_imp.g_varchar2_table(92) := '226E756C6C223A627265616B3B6361736520673A69662821612E726561644F6E6C792973776974636828612E617065782E6974656D74797065297B63617365204D3A617065782E7769646765742E636865636B626F78416E64526164696F282223222B65';
wwv_flow_imp.g_varchar2_table(93) := '2C22726164696F22293B627265616B3B6361736520713A6361736520463A627265616B3B64656661756C743A617065782E6974656D2E63726561746528652C7B7D297D627265616B3B6361736520453A73776974636828612E617065782E6974656D7479';
wwv_flow_imp.g_varchar2_table(94) := '7065297B63617365204E3A617065782E7769646765742E7965734E6F28652C225357495443485F434222293B627265616B3B63617365204D3A617065782E7769646765742E636865636B626F78416E64526164696F282223222B652C22726164696F2229';
wwv_flow_imp.g_varchar2_table(95) := '3B627265616B3B63617365205F3A64656661756C743A617065782E6974656D2E63726561746528652C7B7D297D612E726561644F6E6C792626617065782E6974656D2865292E64697361626C6528293B627265616B3B6361736520683A6361736520793A';
wwv_flow_imp.g_varchar2_table(96) := '73776974636828612E617065782E6974656D74797065297B6361736520423A627265616B3B6361736520553A617065782E7769646765742E73746172526174696E6728652C7B73686F77436C656172427574746F6E3A21312C6E756D53746172733A612E';
wwv_flow_imp.g_varchar2_table(97) := '6D6178696D756D7D293B627265616B3B64656661756C743A612E726561644F6E6C797C7C617065782E6974656D2E63726561746528652C7B7D297D627265616B3B64656661756C743A213120696E20612626617065782E64656275672E6572726F722822';
wwv_flow_imp.g_varchar2_table(98) := '6974656D207769746820756E646566696E65642074797065222C652C612E74797065297D696628612E6966297B6C657420743D4728612E69662C69293B696628612E7468656E297B6C657420723D612E7468656E2E70726F706572746965737C7C7B7D3B';
wwv_flow_imp.g_varchar2_table(99) := '696528652C652C7B747970653A6D2C70726F706572746965733A727D2C612E726561644F6E6C792C692C6E293B666F7228636F6E73745B612C695D6F66204F626A6563742E656E7472696573287229297A285128652C61292C692C21303D3D3D74297D69';
wwv_flow_imp.g_varchar2_table(100) := '6628612E656C7365297B6C657420723D612E656C73652E70726F706572746965737C7C7B7D3B696528652C652C7B747970653A6D2C70726F706572746965733A727D2C612E726561644F6E6C792C692C6E293B666F7228636F6E73745B612C695D6F6620';
wwv_flow_imp.g_varchar2_table(101) := '4F626A6563742E656E7472696573287229297A285128652C61292C692C21313D3D3D74297D7D696628612E6966297B6C657420743D726528612E6966293B666F72286C65742072206F66207429636F6E736F6C652E6C6F6728226F6E4368616E6765222C';
wwv_flow_imp.g_varchar2_table(102) := '652C72292C24282223222B5128652C7229292E6F6E28226368616E6765222C2866756E6374696F6E28297B696628636F6E736F6C652E6C6F672822636C69636B6564206F6E222C652C72292C612E6966297B6C657420743D6E6528652C22222C612C7B7D';
wwv_flow_imp.g_varchar2_table(103) := '293B636F6E736F6C652E6C6F6728224556414C222C74293B6C657420723D4728612E69662C74293B696628612E7468656E297B6C657420743D612E7468656E2E70726F706572746965737C7C7B7D3B666F7228636F6E73745B612C695D6F66204F626A65';
wwv_flow_imp.g_varchar2_table(104) := '63742E656E7472696573287429297A285128652C61292C692C313D3D72297D696628612E656C7365297B6C657420743D612E656C73652E70726F706572746965737C7C7B7D3B666F7228636F6E73745B612C695D6F66204F626A6563742E656E74726965';
wwv_flow_imp.g_varchar2_table(105) := '73287429297A285128652C61292C692C303D3D72297D7D7D29297D69662841727261792E6973417272617928612E646570656E64656E74526571756972656429297B666F7228636F6E73742065206F6620612E646570656E64656E745265717569726564';
wwv_flow_imp.g_varchar2_table(106) := '297B6C657420723D693B57285128742C65292C615B655D2C722626722E6C656E6774683E30297D24282223222B65292E6F6E28226368616E6765222C2866756E6374696F6E28297B666F7228636F6E73742065206F6620612E646570656E64656E745265';
wwv_flow_imp.g_varchar2_table(107) := '717569726564297B6C657420723D5128742C65292C693D242874686973292E76616C28293B636F6E736F6C652E7761726E2822646570656E6473222C615B655D2C69292C5728722C615B655D2C692626692E6C656E6774683E30297D7D29297D61706578';
wwv_flow_imp.g_varchar2_table(108) := '2E64656275672E747261636528223C3C6A736F6E526567696F6E2E6174746163684F626A65637422297D66756E6374696F6E206E6528742C612C722C69297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E676574446174';
wwv_flow_imp.g_varchar2_table(109) := '61222C742C612C722C69293B6C6574206E3D7B7D3B696628722E617065783D722E617065787C7C7B7D2C215B752C6D5D2E696E636C7564657328722E74797065292626722E726561644F6E6C79296E3D693B656C736520737769746368286E3D722E6164';
wwv_flow_imp.g_varchar2_table(110) := '646974696F6E616C50726F706572746965733F693A7B7D2C722E74797065297B63617365206D3A6966286920696E7374616E63656F66204F626A6563747C7C28617065782E64656275672E74726163652822536368656D61206D69736D617463683A222C';
wwv_flow_imp.g_varchar2_table(111) := '722E747970652C224A534F4E3A222C692C226D75737420626520616E206F626A65637422292C6E3D7B7D2C693D7B7D292C722E70726F7065727469657329666F72286C65745B652C615D6F66204F626A6563742E656E747269657328722E70726F706572';
wwv_flow_imp.g_varchar2_table(112) := '7469657329296E5B655D3D6E65285128742C65292C652C612C695B655D293B627265616B3B63617365226E756C6C223A6E3D6E756C6C3B627265616B3B6361736520753A696628722E6974656D733D722E6974656D737C7C7B7D2C41727261792E697341';
wwv_flow_imp.g_varchar2_table(113) := '7272617928722E6974656D732E656E756D29297B6E3D4B28722C617065782E6974656D2874292E67657456616C75652829297D656C73657B6E3D5B5D2C693D697C7C5B5D3B6C657420613D24282223222B652B27205B69645E3D22272B742B275F225D2E';
wwv_flow_imp.g_varchar2_table(114) := '726F7727293B666F7228636F6E73742065206F662061297B636F6E737420743D6E6528242865295B305D2E69642E7265706C616365282F5F434F4E5441494E4552242F2C2222292C22222C722E6974656D732C7B7D293B632874297C7C6E2E7075736828';
wwv_flow_imp.g_varchar2_table(115) := '74297D7D627265616B3B6361736520673A6361736520793A6361736520683A6361736520453A7B6C657420653D4B28722C617065782E6974656D2874292E67657456616C75652829293B6E3D6E756C6C213D653F653A6E756C6C2C2822222B61292E7374';
wwv_flow_imp.g_varchar2_table(116) := '617274735769746828225F22292626286E3D69297D627265616B3B64656661756C743A5220696E20722626286E3D722E636F6E7374297D696628722E6966297B6C657420653D4728722E69662C6E293B696628722E7468656E2626313D3D65297B6C6574';
wwv_flow_imp.g_varchar2_table(117) := '20653D722E7468656E2E70726F706572746965737C7C7B7D2C613D6E6528742C22222C7B747970653A6D2C70726F706572746965733A657D2C69293B6E3D7B2E2E2E6E2C2E2E2E617D7D696628722E656C73652626303D3D65297B6C657420653D722E65';
wwv_flow_imp.g_varchar2_table(118) := '6C73652E70726F706572746965737C7C7B7D2C613D6E6528742C22222C7B747970653A6D2C70726F706572746965733A657D2C69293B6E3D7B2E2E2E6E2C2E2E2E617D7D7D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E';
wwv_flow_imp.g_varchar2_table(119) := '526567696F6E2E67657444617461222C6E292C6E7D66756E6374696F6E20706528652C74297B6C657420613D22223B72657475726E20613D742E617065782626226C6162656C22696E20742E617065783F742E617065782E6C6162656C7C7C22223A652E';
wwv_flow_imp.g_varchar2_table(120) := '746F4C6F7765724361736528292E73706C6974282F207C5C2D7C5F2F292E6D61702828653D3E652E6368617241742830292E746F55707065724361736528292B652E737562737472696E6728312929292E6A6F696E28222022292C617D66756E6374696F';
wwv_flow_imp.g_varchar2_table(121) := '6E2073652865297B696628617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F70616761746552656673222C65292C652626226F626A656374223D3D747970656F66206529696628652E24726566262622737472696E67';
wwv_flow_imp.g_varchar2_table(122) := '223D3D747970656F6620652E24726566297B6C657420743D652E247265663B69662822232F223D3D742E737562737472696E6728302C3229297B6C657420613D28652C74293D3E742E7265706C6163652822232F222C2222292E73706C697428222F2229';
wwv_flow_imp.g_varchar2_table(123) := '2E726564756365282828652C74293D3E655B745D292C65293B7472797B6C657420693D6128722E736368656D612C74293B693F4F626A6563742E61737369676E28652C69293A702822756E6B6E6F776E222C662C652E24726566292C64656C6574652065';
wwv_flow_imp.g_varchar2_table(124) := '2E247265667D63617463682865297B617065782E64656275672E6572726F7228222464656673206E6F7420666F756E643A20222C74297D7D7D656C73652069662841727261792E6973417272617928652929666F7228636F6E7374207420696E20652965';
wwv_flow_imp.g_varchar2_table(125) := '5B745D3D736528655B745D293B656C736520666F7228636F6E73745B742C615D6F66204F626A6563742E656E747269657328652929655B745D3D73652861293B72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F';
wwv_flow_imp.g_varchar2_table(126) := '6E2E70726F70616761746552656673222C4A534F4E2E737472696E67696679286529292C657D66756E6374696F6E206F6528652C742C612C692C732C6F297B69662828653D657C7C7B7D292E617065783D652E617065787C7C7B7D2C652E617065782E63';
wwv_flow_imp.g_varchar2_table(127) := '6F6E646974696F6E616C3D6F2C617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F70616761746550726F70657274696573222C742C652C612C692C732C6F292C2B2B743E323029617065782E64656275672E6572726F';
wwv_flow_imp.g_varchar2_table(128) := '72282270726F70616761746550726F7065727469657320726563757273696F6E222C742C22746F206465657022293B656C73657B696628652E646570656E64656E74536368656D6173297B6C657420743D4F626A6563742E6B65797328652E646570656E';
wwv_flow_imp.g_varchar2_table(129) := '64656E74536368656D6173293B696628313D3D742E6C656E677468297B652E69663D7B70726F706572746965733A7B7D7D2C652E69662E70726F706572746965735B745B305D5D3D7B636F6E73743A6E756C6C7D2C652E656C73653D7B70726F70657274';
wwv_flow_imp.g_varchar2_table(130) := '6965733A7B7D7D2C652E656C73652E70726F706572746965733D652E646570656E64656E74536368656D61735B745B305D5D2E70726F706572746965733B636F6E737420613D652E646570656E64656E74536368656D61735B745B305D5D2E7265717569';
wwv_flow_imp.g_varchar2_table(131) := '7265643B41727261792E69734172726179286129262628652E646570656E64656E7452657175697265643D5B5D2C652E646570656E64656E7452657175697265645B745B305D5D3D61292C64656C65746520652E646570656E64656E74536368656D6173';
wwv_flow_imp.g_varchar2_table(132) := '7D656C736520617065782E64656275672E6572726F722822646570656E64656E74536368656D61733A206E756D626572206F66206F626A6563747320213D203122297D696628652E747970653D3D75262628652E6974656D733F303D3D4F626A6563742E';
wwv_flow_imp.g_varchar2_table(133) := '6B65797328652E6974656D73292E6C656E6774682626617065782E64656275672E7761726E282261727261792073686F756C642068617665206174206C656173742031206974656D7322293A287028276D697373696E6720226974656D732220666F7220';
wwv_flow_imp.g_varchar2_table(134) := '2274797065223A202261727261792227292C652E6974656D733D7B7D29292C652E747970653D3D6D262628652E70726F706572746965733F303D3D4F626A6563742E6B65797328652E70726F70657274696573292E6C656E6774682626617065782E6465';
wwv_flow_imp.g_varchar2_table(135) := '6275672E7761726E28226F626A6563742073686F756C642068617665206174206C6561737420312070726F706572747922293A287028276D697373696E67202270726F706572746965732220666F72202274797065223A20226F626A6563742227292C65';
wwv_flow_imp.g_varchar2_table(136) := '2E70726F706572746965733D7B7D292C652E6164646974696F6E616C50726F706572746965733D6E28652E6164646974696F6E616C50726F706572746965732C73292C652E646570656E64656E7452657175697265642929666F72286C65745B742C615D';
wwv_flow_imp.g_varchar2_table(137) := '6F66204F626A6563742E656E747269657328652E646570656E64656E74526571756972656429297472797B652E70726F706572746965735B745D2E646570656E64656E7452657175697265643D617D63617463682865297B617065782E64656275672E65';
wwv_flow_imp.g_varchar2_table(138) := '72726F722822646570656E64656E745265717569726564206E6F7420666F756E643A20222C742C65297D696628652E6D696E696D756D262628652E6D696E696D756D3D5A28652E666F726D61742C652E6D696E696D756D2C213129292C652E6D6178696D';
wwv_flow_imp.g_varchar2_table(139) := '756D262628652E6D6178696D756D3D5A28652E666F726D61742C652E6D6178696D756D2C213129292C652E7061747465726E262621652E74797065262628652E747970653D67292C652E70726F706572746965732626652E70726F706572746965732E64';
wwv_flow_imp.g_varchar2_table(140) := '625072696D6172794B6579262664656C65746520652E70726F706572746965732E64625072696D6172794B65792C652E657874656E64656454797065297377697463682841727261792E6973417272617928652E657874656E6465645479706529262628';
wwv_flow_imp.g_varchar2_table(141) := '652E657874656E646564547970652E696E636C75646573286E756C6C292C313D3D652E657874656E646564547970652E6C656E677468262628652E657874656E646564547970653D652E657874656E646564547970655B305D29292C652E657874656E64';
wwv_flow_imp.g_varchar2_table(142) := '656454797065297B6361736520413A652E747970653D672C652E666F726D61743D652E666F726D61747C7C413B627265616B3B636173652274696D657374616D70223A652E747970653D672C652E666F726D61743D652E666F726D61747C7C493B627265';
wwv_flow_imp.g_varchar2_table(143) := '616B3B6361736520673A6361736520453A652E747970653D652E657874656E646564547970653B627265616B3B6361736520793A6361736520683A303D3D652E73716C5363616C653F652E747970653D793A652E747970653D652E657874656E64656454';
wwv_flow_imp.g_varchar2_table(144) := '7970653B627265616B3B64656661756C743A617065782E64656275672E6572726F722822536368656D6120636F6E7461696E7320756E737570706F727420657874656E64656454797065202573222C652E657874656E64656454797065297D7377697463';
wwv_flow_imp.g_varchar2_table(145) := '6828652E656E756D262628652E617065782E6974656D747970653D652E617065782E6974656D747970657C7C5F292C652E617065782E726561646F6E6C793D6E28652E617065782E726561646F6E6C792C61292C652E726561644F6E6C793D6E28652E72';
wwv_flow_imp.g_varchar2_table(146) := '6561644F6E6C792C652E617065782E726561646F6E6C79292C652E77726974654F6E6C793D6E28652E77726974654F6E6C792C69292C652E74797065297B6361736520683A652E617065782E666F726D61743D652E617065782E666F726D61743D3D483F';
wwv_flow_imp.g_varchar2_table(147) := '22464D4C39393947393939473939394739393947393939443939223A652E617065782E666F726D61743B627265616B3B6361736520793A652E617065782E666F726D61743D652E617065782E666F726D61743D3D483F22464D4C39393947393939473939';
wwv_flow_imp.g_varchar2_table(148) := '394739393947393939223A652E617065782E666F726D61747C7C223939393939393939393939393939393939393939393939222C652E617065782E6974656D747970653D3D42262628652E726561644F6E6C793D2130293B627265616B3B636173652067';
wwv_flow_imp.g_varchar2_table(149) := '3A696628652E617065782E6974656D74797065213D462626652E636F6E74656E74456E636F64696E67213D767C7C28652E726561644F6E6C793D21302C652E697352657175697265643D2131292C652E636F6E74656E74456E636F64696E6729652E636F';
wwv_flow_imp.g_varchar2_table(150) := '6E74656E74456E636F64696E673D3D763F28652E617065782E696D6167653D652E636F6E74656E744D65646961547970652C652E617065782E6974656D747970653D712C5B6B2C4F2C445D2E696E636C7564657328652E636F6E74656E744D6564696154';
wwv_flow_imp.g_varchar2_table(151) := '797065297C7C28617065782E64656275672E6572726F722827756E6B6E6F776E20737472696E6720636F6E74656E744D65646961547970652022257322272C652E636F6E74656E744D6564696154797065292C652E636F6E74656E744D65646961547970';
wwv_flow_imp.g_varchar2_table(152) := '653D4F29293A28617065782E64656275672E6572726F722827756E6B6E6F776E20737472696E6720656E636F64696E672022257322272C652E636F6E74656E74456E636F64696E67292C652E636F6E74656E74456E636F64696E673D76293B656C736520';
wwv_flow_imp.g_varchar2_table(153) := '73776974636828652E666F726D6174297B6361736520413A652E617065782E666F726D61743D652E617065782E666F726D61743F652E617065782E666F726D61743A617065782E6C6F63616C652E67657444617465466F726D617428293B627265616B3B';
wwv_flow_imp.g_varchar2_table(154) := '6361736520493A652E617065782E666F726D61743D652E617065782E666F726D61743F652E617065782E666F726D61743A617065782E6C6F63616C652E67657444617465466F726D617428292B2220484832343A4D493A5353223B627265616B3B636173';
wwv_flow_imp.g_varchar2_table(155) := '65206A3A652E617065782E666F726D61743D22484832343A4D49223B627265616B3B64656661756C743A652E6D61784C656E6774682626652E6D61784C656E6774683E722E746578746172656177696474682626652E617065782E6974656D7479706521';
wwv_flow_imp.g_varchar2_table(156) := '3D53262628652E617065782E6974656D747970653D50297D7D696628617065782E656E762E415045585F56455253494F4E3C2232332E322226265B462C532C435D2E696E636C7564657328652E617065782E6974656D7479706529262628702827697465';
wwv_flow_imp.g_varchar2_table(157) := '6D747970652022257322206E6F7420737570706F7274656420696E2022257322272C652E617065782E6974656D747970652C617065782E656E762E415045585F56455253494F4E292C652E617065782E6974656D747970653D3D533F652E617065782E69';
wwv_flow_imp.g_varchar2_table(158) := '74656D747970653D503A64656C65746520652E617065782E6974656D74797065292C41727261792E6973417272617928652E72657175697265642929666F72286C65742074206F6620652E726571756972656429652E70726F706572746965732626652E';
wwv_flow_imp.g_varchar2_table(159) := '70726F706572746965735B745D262628652E70726F706572746965735B745D2E697352657175697265643D2130292C652E6974656D732626652E6974656D735B745D262628652E6974656D735B745D2E697352657175697265643D2130293B652E746865';
wwv_flow_imp.g_varchar2_table(160) := '6E26266F65287B747970653A6D2C72657175697265643A652E7468656E2E72657175697265647C7C5B5D2C70726F706572746965733A652E7468656E2E70726F706572746965737D2C742C652E726561644F6E6C792C652E77726974654F6E6C792C652E';
wwv_flow_imp.g_varchar2_table(161) := '6164646974696F6E616C50726F706572746965732C2130292C652E656C736526266F65287B747970653A6D2C72657175697265643A652E656C73652E72657175697265647C7C5B5D2C70726F706572746965733A652E656C73652E70726F706572746965';
wwv_flow_imp.g_varchar2_table(162) := '737D2C742C652E726561644F6E6C792C652E77726974654F6E6C792C652E6164646974696F6E616C50726F706572746965732C2130293B666F72286C65745B612C725D6F66204F626A6563742E656E747269657328652E70726F706572746965737C7C7B';
wwv_flow_imp.g_varchar2_table(163) := '7D29296F6528722C742C652E726561644F6E6C792C652E77726974654F6E6C792C652E6164646974696F6E616C50726F706572746965732C2131293B652E6974656D73262628652E6974656D732E6164646974696F6E616C50726F706572746965733D6E';
wwv_flow_imp.g_varchar2_table(164) := '28652E6974656D732E6164646974696F6E616C50726F706572746965732C73292C6F6528652E6974656D732C742C652E726561644F6E6C792C652E77726974654F6E6C792C652E6164646974696F6E616C50726F706572746965732C213129292C617065';
wwv_flow_imp.g_varchar2_table(165) := '782E64656275672E747261636528223C3C6A736F6E526567696F6E2E70726F70616761746550726F70657274696573222C74297D7D66756E6374696F6E206C6528652C742C612C722C692C6E2C70297B6C657420733D7B6974656D733A302C7772617070';
wwv_flow_imp.g_varchar2_table(166) := '6572747970653A6E756C6C2C68746D6C3A22227D3B696628652E617065783D652E617065787C7C7B7D2C652E617065782E656E756D3D652E617065782E656E756D7C7C7B7D2C617065782E64656275672E747261636528223E3E6A736F6E526567696F6E';
wwv_flow_imp.g_varchar2_table(167) := '2E67656E6572617465466F7253656C656374222C652C742C612C722C692C6E292C6E3D3D5F297B733D7B6974656D733A312C68746D6C3A275C6E3C73656C6563742069643D222349442322206E616D653D22234944232220235245515549524544232063';
wwv_flow_imp.g_varchar2_table(168) := '6C6173733D2273656C6563746C69737420617065782D6974656D2D73656C6563742220646174612D6E61746976652D6D656E753D2266616C7365222073697A653D2231223E5C6E277D2C652E697352657175697265647C7C28732E68746D6C2B3D273C6F';
wwv_flow_imp.g_varchar2_table(169) := '7074696F6E2076616C75653D22223E3C2F6F7074696F6E3E27293B666F7228636F6E73742074206F6620652E656E756D29732E68746D6C2B3D617065782E7574696C2E6170706C7954656D706C61746528275C6E20203C6F7074696F6E2076616C75653D';
wwv_flow_imp.g_varchar2_table(170) := '222356414C554523223E23444953504C415956414C5545233C2F6F7074696F6E3E5C6E272C7B706C616365686F6C646572733A7B56414C55453A742C444953504C415956414C55453A652E617065782E656E756D5B745D7C7C747D7D293B732E68746D6C';
wwv_flow_imp.g_varchar2_table(171) := '2B3D225C6E3C2F73656C6563743E5C6E227D656C73657B733D7B6974656D733A312C68746D6C3A617065782E7574696C2E6170706C7954656D706C61746528275C6E3C64697620746162696E6465783D222D31222069643D22234944232220617269612D';
wwv_flow_imp.g_varchar2_table(172) := '6C6162656C6C656462793D22234944235F4C4142454C22202352455155495245442320636C6173733D22202354595045235F67726F757020617065782D6974656D2D67726F757020617065782D6974656D2D67726F75702D2D726320617065782D697465';
wwv_flow_imp.g_varchar2_table(173) := '6D2D2354595045232220726F6C653D2223545950452367726F7570223E5C6E272C7B706C616365686F6C646572733A7B545950453A6E7D7D297D3B6C657420743D303B666F7228636F6E73742061206F6620652E656E756D29732E68746D6C2B3D617065';
wwv_flow_imp.g_varchar2_table(174) := '782E7574696C2E6170706C7954656D706C61746528275C6E20203C64697620636C6173733D22617065782D6974656D2D6F7074696F6E222023444952233E5C6E202020203C696E70757420747970653D22235459504523222069643D22234944235F234E';
wwv_flow_imp.g_varchar2_table(175) := '522322206E616D653D22234944232220646174612D646973706C61793D222356414C554523222076616C75653D222356414C554523222023504C414345484F4C44455223202352455155495245442320617269612D6C6162656C3D222356414C55452322';
wwv_flow_imp.g_varchar2_table(176) := '20636C6173733D22223E5C6E202020203C6C6162656C20636C6173733D22752D2354595045232220666F723D22234944235F234E52232220617269612D68696464656E3D2274727565223E23444953504C415956414C5545233C2F6C6162656C3E5C6E20';
wwv_flow_imp.g_varchar2_table(177) := '203C2F6469763E5C6E272C7B706C616365686F6C646572733A7B4449523A22686F72697A6F6E74616C223D3D702E646972656374696F6E3F277374796C653D22666C6F61743A206C65667422273A22222C545950453A6E2C56414C55453A22737472696E';
wwv_flow_imp.g_varchar2_table(178) := '67223D3D747970656F6620613F617065782E7574696C2E65736361706548544D4C2861293A612C444953504C415956414C55453A22737472696E67223D3D747970656F6620613F617065782E7574696C2E65736361706548544D4C28652E617065782E65';
wwv_flow_imp.g_varchar2_table(179) := '6E756D5B615D7C7C61293A612C4E523A742B2B7D7D293B732E68746D6C2B3D225C6E3C2F6469763E5C6E227D737769746368286E297B63617365205F3A732E77726170706572747970653D22617065782D6974656D2D777261707065722D2D73656C6563';
wwv_flow_imp.g_varchar2_table(180) := '742D6C697374223B627265616B3B63617365204D3A732E77726170706572747970653D22617065782D6974656D2D777261707065722D2D726164696F67726F7570223B627265616B3B6361736520563A732E77726170706572747970653D22617065782D';
wwv_flow_imp.g_varchar2_table(181) := '6974656D2D777261707065722D2D636865636B626F78227D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F7253656C656374222C73292C737D66756E6374696F6E20636528652C';
wwv_flow_imp.g_varchar2_table(182) := '742C612C722C692C6E297B6C657420733D7B6974656D733A302C77726170706572747970653A6E756C6C2C68746D6C3A22227D3B696628652E617065783D652E617065787C7C7B7D2C652E617065782E656E756D3D652E617065782E656E756D7C7C7B7D';
wwv_flow_imp.g_varchar2_table(183) := '2C617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72537472696E67222C652C742C612C722C692C6E292C652E726561644F6E6C792973776974636828652E617065782E6974656D74797065297B63';
wwv_flow_imp.g_varchar2_table(184) := '61736520713A733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D746578742D6669656C64222C68746D6C3A275C6E3C7370616E20636C6173733D22646973706C61795F6F6E6C7920617065782D';
wwv_flow_imp.g_varchar2_table(185) := '6974656D2D646973706C61792D6F6E6C79223E5C6E20203C696D67207372633D22646174613A23494D414745233B6261736536342C2356414C554523223E5C6E3C2F7370616E3E5C6E3C696E70757420747970653D2268696464656E222069643D222349';
wwv_flow_imp.g_varchar2_table(186) := '4423222076616C75653D222356414C554523222F3E5C6E277D3B627265616B3B6361736520463A733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D7172636F6465222C68746D6C3A275C6E3C61';
wwv_flow_imp.g_varchar2_table(187) := '2D7172636F64652069643D22234944232220636C6173733D22612D5152436F64652220616A61782D6964656E7469666965723D2223414A41584944454E54494649455223222076616C75653D222356414C554523223E203C2F612D7172636F64653E5C6E';
wwv_flow_imp.g_varchar2_table(188) := '277D3B627265616B3B64656661756C743A733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D746578742D6669656C64222C68746D6C3A273C7370616E2069643D22234944235F444953504C4159';
wwv_flow_imp.g_varchar2_table(189) := '22202352455155495245442320636C6173733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C792220646174612D6573636170653D2274727565223E2356414C5545233C2F7370616E3E277D7D656C7365206966';
wwv_flow_imp.g_varchar2_table(190) := '2841727261792E6973417272617928652E656E756D29295B5F2C4D5D2E696E636C7564657328652E617065782E6974656D74797065293F733D6C6528652C742C612C722C692C652E617065782E6974656D747970652C652E61706578293A702822656E75';
wwv_flow_imp.g_varchar2_table(191) := '6D206E6F7420737570706F7274656420666F72202573222C652E617065782E6974656D74797065293B656C73652073776974636828652E666F726D6174297B6361736522656D61696C223A733D7B6974656D733A312C77726170706572747970653A2261';
wwv_flow_imp.g_varchar2_table(192) := '7065782D6974656D2D777261707065722D2D746578742D6669656C64222C68746D6C3A275C6E3C696E70757420747970653D22656D61696C222069643D222349442322206E616D653D22234944232220235245515549524544232023504C414345484F4C';
wwv_flow_imp.g_varchar2_table(193) := '4445522320235041545445524E2320636C6173733D2223414C49474E2320746578745F6669656C6420617065782D6974656D2D74657874222073697A653D2233322220234D494E4C454E4754482320234D41584C454E4754482320646174612D7472696D';
wwv_flow_imp.g_varchar2_table(194) := '2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72223E5C6E277D3B627265616B3B6361736522757269223A733D7B6974656D733A312C77726170706572747970653A226170';
wwv_flow_imp.g_varchar2_table(195) := '65782D6974656D2D777261707065722D2D746578742D6669656C64222C68746D6C3A275C6E3C696E70757420747970653D2275726C222069643D222349442322206E616D653D22234944232220235245515549524544232023504C414345484F4C444552';
wwv_flow_imp.g_varchar2_table(196) := '2320235041545445524E2320636C6173733D2223414C49474E2320746578745F6669656C6420617065782D6974656D2D74657874222073697A653D2233322220234D494E4C454E4754482320234D41584C454E4754482320646174612D7472696D2D7370';
wwv_flow_imp.g_varchar2_table(197) := '616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72223E5C6E277D3B627265616B3B6361736520413A733D617065782E656E762E415045585F56455253494F4E3E3D2232322E322E30';
wwv_flow_imp.g_varchar2_table(198) := '223F7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6170657820617065782D6974656D2D777261707065722D2D646174652D7069636B65722D617065782D706F7075';
wwv_flow_imp.g_varchar2_table(199) := '70222C68746D6C3A275C6E3C612D646174652D7069636B65722069643D2223494423222023524551554952454423206368616E67652D6D6F6E74683D227472756522206368616E67652D796561723D22747275652220646973706C61792D61733D22706F';
wwv_flow_imp.g_varchar2_table(200) := '7075702220646973706C61792D7765656B733D226E756D626572222020234D494E2320234D4158232070726576696F75732D6E6578742D64697374616E63653D226F6E652D6D6F6E7468222073686F772D646179732D6F7574736964652D6D6F6E74683D';
wwv_flow_imp.g_varchar2_table(201) := '2276697369626C65222073686F772D6F6E3D22666F6375732220746F6461792D627574746F6E3D22747275652220666F726D61743D2223464F524D415423222076616C69642D6578616D706C653D22234558414D504C45232220796561722D73656C6563';
wwv_flow_imp.g_varchar2_table(202) := '74696F6E2D72616E67653D22352220636C6173733D22617065782D6974656D2D646174657069636B65722D2D706F707570223E5C6E20203C696E70757420617269612D686173706F7075703D226469616C6F672220636C6173733D2220617065782D6974';
wwv_flow_imp.g_varchar2_table(203) := '656D2D7465787420617065782D6974656D2D646174657069636B657222206E616D653D2223494423222073697A653D22323022206D61786C656E6774683D223230222023504C414345484F4C4445522320747970653D2274657874222069643D22234944';
wwv_flow_imp.g_varchar2_table(204) := '235F696E707574222072657175697265643D222220617269612D6C6162656C6C656462793D22234944235F4C4142454C22206D61786C656E6774683D22323535222076616C75653D222356414C554523223E5C6E20203C627574746F6E20617269612D68';
wwv_flow_imp.g_varchar2_table(205) := '6173706F7075703D226469616C6F672220617269612D6C6162656C3D2223494E464F232220636C6173733D22612D427574746F6E20612D427574746F6E2D2D63616C656E6461722220746162696E6465783D222D312220747970653D22627574746F6E22';
wwv_flow_imp.g_varchar2_table(206) := '20617269612D64657363726962656462793D22234944235F4C4142454C2220617269612D636F6E74726F6C733D22234944235F696E707574223E5C6E202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D63616C656E646172223E5C';
wwv_flow_imp.g_varchar2_table(207) := '6E202020203C2F7370616E3E5C6E20203C2F627574746F6E3E5C6E3C2F612D646174652D7069636B65723E5C6E277D3A7B69746D65733A312C77726170706572747970653A22617065782D6974656D2D7772617070657220617065782D6974656D2D7772';
wwv_flow_imp.g_varchar2_table(208) := '61707065722D2D646174652D7069636B65722D6A6574222C68746D6C3A275C6E3C6F6A2D696E7075742D646174652069643D222349442322202352455155495245442320636C6173733D22617065782D6A65742D636F6D706F6E656E7420617065782D69';
wwv_flow_imp.g_varchar2_table(209) := '74656D2D646174657069636B65722D6A6574206F6A2D696E7075746461746574696D652D646174652D6F6E6C79206F6A2D636F6D706F6E656E74206F6A2D696E7075746461746574696D65206F6A2D666F726D2D636F6E74726F6C206F6A2D746578742D';
wwv_flow_imp.g_varchar2_table(210) := '6669656C64222020234D494E2320234D41582320646174612D666F726D61743D2223464F524D4154232220646174612D6D61786C656E6774683D223235352220646174612D6E616D653D22234944232220646174612D6F7261636C652D646174652D7661';
wwv_flow_imp.g_varchar2_table(211) := '6C75653D222356414C5545232220646174612D73697A653D2233322220646174612D76616C69642D6578616D706C653D22234558414D504C45232220646174652D7069636B65722E6368616E67652D6D6F6E74683D2273656C6563742220646174652D70';
wwv_flow_imp.g_varchar2_table(212) := '69636B65722E6368616E67652D796561723D2273656C6563742220646174652D7069636B65722E646179732D6F7574736964652D6D6F6E74683D2276697369626C652220646174652D7069636B65722E73686F772D6F6E3D22666F637573222064617465';
wwv_flow_imp.g_varchar2_table(213) := '2D7069636B65722E7765656B2D646973706C61793D226E6F6E652220646973706C61792D6F7074696F6E732E636F6E7665727465722D68696E743D226E6F6E652220646973706C61792D6F7074696F6E732E6D657373616765733D226E6F6E6522206469';
wwv_flow_imp.g_varchar2_table(214) := '73706C61792D6F7074696F6E732E76616C696461746F722D68696E743D226E6F6E65222074696D652D7069636B65722E74696D652D696E6372656D656E743D2230303A31353A30303A303022207472616E736C6174696F6E732E6E6578742D746578743D';
wwv_flow_imp.g_varchar2_table(215) := '224E65787422207472616E736C6174696F6E732E707265762D746578743D2250726576696F7573222076616C75653D222356414C554523223E5C6E3C2F6F6A2D696E7075742D646174653E5C6E277D3B627265616B3B6361736520493A733D617065782E';
wwv_flow_imp.g_varchar2_table(216) := '656E762E415045585F56455253494F4E3E3D2232322E322E30223F7B69746D65733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6170657820617065782D6974656D2D7772617070';
wwv_flow_imp.g_varchar2_table(217) := '65722D2D646174652D7069636B65722D617065782D706F707570222C68746D6C3A275C6E3C612D646174652D7069636B65722069643D2223494423222023524551554952454423206368616E67652D6D6F6E74683D227472756522206368616E67652D79';
wwv_flow_imp.g_varchar2_table(218) := '6561723D22747275652220646973706C61792D61733D22706F7075702220646973706C61792D7765656B733D226E756D6265722220234D494E2320234D4158232070726576696F75732D6E6578742D64697374616E63653D226F6E652D6D6F6E74682220';
wwv_flow_imp.g_varchar2_table(219) := '73686F772D646179732D6F7574736964652D6D6F6E74683D2276697369626C65222073686F772D6F6E3D22666F637573222073686F772D74696D653D2274727565222074696D652D696E6372656D656E742D6D696E7574653D2231352220746F6461792D';
wwv_flow_imp.g_varchar2_table(220) := '627574746F6E3D22747275652220666F726D61743D2223464F524D415423222076616C69642D6578616D706C653D22234558414D504C45232220796561722D73656C656374696F6E2D72616E67653D22352220636C6173733D22617065782D6974656D2D';
wwv_flow_imp.g_varchar2_table(221) := '646174657069636B65722D2D706F707570223E5C6E20203C696E70757420617269612D686173706F7075703D226469616C6F672220636C6173733D2220617065782D6974656D2D7465787420617065782D6974656D2D646174657069636B657222206E61';
wwv_flow_imp.g_varchar2_table(222) := '6D653D2223494423222073697A653D22333022206D61786C656E6774683D223330222023504C414345484F4C4445522320747970653D2274657874222069643D22234944235F696E707574222072657175697265643D222220617269612D6C6162656C6C';
wwv_flow_imp.g_varchar2_table(223) := '656462793D22234944235F4C4142454C22206D61786C656E6774683D22323535222076616C75653D222356414C554523223E5C6E20203C627574746F6E20617269612D686173706F7075703D226469616C6F672220617269612D6C6162656C3D2223494E';
wwv_flow_imp.g_varchar2_table(224) := '464F232220636C6173733D22612D427574746F6E20612D427574746F6E2D2D63616C656E6461722220746162696E6465783D222D312220747970653D22627574746F6E2220617269612D64657363726962656462793D22234944235F4C4142454C222061';
wwv_flow_imp.g_varchar2_table(225) := '7269612D636F6E74726F6C733D22234944235F696E707574223E5C6E202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D63616C656E6461722D74696D65223E5C6E202020203C2F7370616E3E5C6E20203C2F627574746F6E3E5C6E';
wwv_flow_imp.g_varchar2_table(226) := '3C2F612D646174652D7069636B65723E5C6E277D3A7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D7772617070657220617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6A6574222C68746D';
wwv_flow_imp.g_varchar2_table(227) := '6C3A275C6E3C6F6A2D696E7075742D646174652D74696D652069643D222349442322202352455155495245442320636C6173733D22617065782D6A65742D636F6D706F6E656E7420617065782D6974656D2D646174657069636B65722D6A6574206F6A2D';
wwv_flow_imp.g_varchar2_table(228) := '696E7075746461746574696D652D646174652D74696D65206F6A2D636F6D706F6E656E74206F6A2D696E7075746461746574696D65206F6A2D666F726D2D636F6E74726F6C206F6A2D746578742D6669656C642220234D494E2320234D41582320646174';
wwv_flow_imp.g_varchar2_table(229) := '612D666F726D61743D2223464F524D4154232220646174612D6D61786C656E6774683D223235352220646174612D6E616D653D22234944232220646174612D6F7261636C652D646174652D76616C75653D222356414C5545232220646174612D73697A65';
wwv_flow_imp.g_varchar2_table(230) := '3D2233322220646174612D76616C69642D6578616D706C653D22234558414D504C45232220646174652D7069636B65722E6368616E67652D6D6F6E74683D2273656C6563742220646174652D7069636B65722E6368616E67652D796561723D2273656C65';
wwv_flow_imp.g_varchar2_table(231) := '63742220646174652D7069636B65722E646179732D6F7574736964652D6D6F6E74683D2276697369626C652220646174652D7069636B65722E73686F772D6F6E3D22666F6375732220646174652D7069636B65722E7765656B2D646973706C61793D226E';
wwv_flow_imp.g_varchar2_table(232) := '6F6E652220646973706C61792D6F7074696F6E732E636F6E7665727465722D68696E743D226E6F6E652220646973706C61792D6F7074696F6E732E6D657373616765733D226E6F6E652220646973706C61792D6F7074696F6E732E76616C696461746F72';
wwv_flow_imp.g_varchar2_table(233) := '2D68696E743D226E6F6E6522207472616E736C6174696F6E732E6E6578742D746578743D224E65787422207472616E736C6174696F6E732E707265762D746578743D2250726576696F7573222076616C75653D222356414C554523223E5C6E3C2F6F6A2D';
wwv_flow_imp.g_varchar2_table(234) := '696E7075742D646174652D74696D653E5C6E277D3B627265616B3B63617365206A3A733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D746578742D6669656C64222C68746D6C3A275C6E3C696E';
wwv_flow_imp.g_varchar2_table(235) := '70757420747970653D2274696D65222069643D222349442322206E616D653D222349442322202352455155495245442320234D494E2320234D41582320636C6173733D22746578745F6669656C6420617065782D6974656D2D7465787422202023504C41';
wwv_flow_imp.g_varchar2_table(236) := '4345484F4C444552232073697A653D22352220646174612D7472696D2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72222F3E5C6E277D3B627265616B3B64656661756C74';
wwv_flow_imp.g_varchar2_table(237) := '3A73776974636828733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D746578742D6669656C64222C68746D6C3A275C6E3C696E70757420747970653D2274657874222069643D22234944232220';
wwv_flow_imp.g_varchar2_table(238) := '6E616D653D222349442322202352455155495245442320234D494E4C454E4754482320234D41584C454E475448232023504C414345484F4C4445522320235041545445524E2320636C6173733D2223414C49474E2320746578745F6669656C6420617065';
wwv_flow_imp.g_varchar2_table(239) := '782D6974656D2D74657874222073697A653D2233322220646174612D7472696D2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72223E5C6E277D2C652E617065782E697465';
wwv_flow_imp.g_varchar2_table(240) := '6D74797065297B636173652270617373776F7264223A733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D70617373776F7264222C68746D6C3A275C6E3C696E70757420747970653D2270617373';
wwv_flow_imp.g_varchar2_table(241) := '776F726422206E616D653D222349442322222073697A653D2233302220235041545445524E23202352455155495245442320234D494E4C454E4754482320234D41584C454E47544823206175746F636F6D706C6574653D2270617373776F726422207661';
wwv_flow_imp.g_varchar2_table(242) := '6C75653D22222069643D22234944232220636C6173733D2270617373776F726420617065782D6974656D2D74657874223E5C6E277D3B627265616B3B6361736520533A733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D';
wwv_flow_imp.g_varchar2_table(243) := '2D777261707065722D2D726963682D746578742D656469746F72222C68746D6C3A275C6E3C612D726963682D746578742D656469746F722069643D222349442322206E616D653D222349442322206D6F64653D226D61726B646F776E2220235245515549';
wwv_flow_imp.g_varchar2_table(244) := '5245442320726561642D6F6E6C793D2223524541444F4E4C59232220646973706C61792D76616C75652D6D6F64653D22706C61696E2D74657874222076697375616C2D6D6F64653D22696E6C696E65222076616C75653D222351554F544556414C554523';
wwv_flow_imp.g_varchar2_table(245) := '223E5C6E3C2F612D726963682D746578742D656469746F723E5C6E277D3B627265616B3B6361736520503A733D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D7465787461726561222C68746D6C';
wwv_flow_imp.g_varchar2_table(246) := '3A275C6E3C64697620636C6173733D22617065782D6974656D2D67726F757020617065782D6974656D2D67726F75702D2D7465787461726561223E5C6E20203C7465787461726561206E616D653D22234E414D45232220726F77733D2223524F57532322';
wwv_flow_imp.g_varchar2_table(247) := '20636F6C733D22313030222069643D222349442322202352455155495245442320636C6173733D22746578746172656120617065782D6974656D2D74657874617265612220646174612D726573697A61626C653D227472756522207374796C653D227265';
wwv_flow_imp.g_varchar2_table(248) := '73697A653A20626F74683B223E2351554F544556414C5545233C2F74657874617265613E5C6E3C2F6469763E5C6E20277D7D7D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72';
wwv_flow_imp.g_varchar2_table(249) := '537472696E67222C73292C737D66756E6374696F6E20646528652C742C612C692C6E2C732C6F297B6C6574206C3D7B6974656D733A302C77726170706572747970653A6E756C6C2C68746D6C3A22227D3B617065782E64656275672E747261636528223E';
wwv_flow_imp.g_varchar2_table(250) := '3E6A736F6E526567696F6E2E67656E6572617465466F724172726179222C652C742C612C692C6E2C732C6F293B6C657420633D652E6974656D737C7C7B7D3B696628743D747C7C5B5D2C41727261792E697341727261792874292969662841727261792E';
wwv_flow_imp.g_varchar2_table(251) := '6973417272617928632E656E756D29295B672C792C685D2E696E636C7564657328632E74797065293F286C2E6974656D733D312C6C3D617065782E656E762E415045585F56455253494F4E3E3D2232332E322E3022262628652E617065782E6974656D74';
wwv_flow_imp.g_varchar2_table(252) := '7970653D3D437C7C632E617065782626632E617065782E6974656D747970653D3D43293F66756E6374696F6E28652C742C612C722C692C6E297B6C657420703D7B6974656D733A302C77726170706572747970653A6E756C6C2C68746D6C3A22227D2C73';
wwv_flow_imp.g_varchar2_table(253) := '3D28747C7C5B5D292E6A6F696E28227C22293B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72436F6D626F222C652C742C612C722C692C6E292C703D7B6974656D733A312C7772617070657274';
wwv_flow_imp.g_varchar2_table(254) := '7970653A22617065782D6974656D2D777261707065722D2D636F6D626F626F7820617065782D6974656D2D777261707065722D2D636F6D626F626F782D6D616E79222C68746D6C3A617065782E7574696C2E6170706C7954656D706C61746528275C6E3C';
wwv_flow_imp.g_varchar2_table(255) := '612D636F6D626F626F782069643D222349442322206E616D653D22234944232220235245515549524544232076616C75653D222356414C5545532322206D756C74692D76616C75653D2274727565222072657475726E2D646973706C61793D2266616C73';
wwv_flow_imp.g_varchar2_table(256) := '65222076616C75652D736570617261746F72733D227C22206D61782D726573756C74733D223722206D696E2D636861726163746572732D7365617263683D223022206D617463682D747970653D22636F6E7461696E7322206D61786C656E6774683D2231';
wwv_flow_imp.g_varchar2_table(257) := '303022206D756C74692D73656C6563743D22747275652220706172656E74732D72657175697265643D2274727565223E5C6E20203C64697620636C6173733D22617065782D6974656D2D636F6D626F73656C656374223E5C6E202020203C756C20636C61';
wwv_flow_imp.g_varchar2_table(258) := '73733D22612D436869707320612D43686970732D2D6170706C69656420612D43686970732D2D777261702220726F6C653D2270726573656E746174696F6E223E5C6E272C7B706C616365686F6C646572733A7B56414C5545533A737D7D297D2C702E6874';
wwv_flow_imp.g_varchar2_table(259) := '6D6C2B3D617065782E7574696C2E6170706C7954656D706C61746528275C6E2020202020203C6C6920636C6173733D22612D4368697020612D436869702D2D696E7075742069732D656D707479223E5C6E20202020202020203C696E7075742074797065';
wwv_flow_imp.g_varchar2_table(260) := '3D22746578742220636C6173733D22617065782D6974656D2D746578742220617269612D6C6162656C6C656462793D22234944235F4C4142454C222076616C75653D222356414C55455323222023504C414345484F4C44455223206D61786C656E677468';
wwv_flow_imp.g_varchar2_table(261) := '3D223130302220726F6C653D22636F6D626F626F782220617269612D657870616E6465643D2266616C736522206175746F636F6D706C6574653D226F666622206175746F636F72726563743D226F666622206175746F6361706974616C697A653D226E6F';
wwv_flow_imp.g_varchar2_table(262) := '6E6522207370656C6C636865636B3D2266616C73652220617269612D6175746F636F6D706C6574653D226C6973742220617269612D64657363726962656462793D22234944235F646573632220617269612D627573793D2266616C7365223E5C6E202020';
wwv_flow_imp.g_varchar2_table(263) := '20202020203C7370616E20636C6173733D22612D436869702D636C656172206A732D636C656172496E707574223E3C7370616E20636C6173733D22612D49636F6E2069636F6E2D6D756C74692D72656D6F76652220617269612D68696464656E3D227472';
wwv_flow_imp.g_varchar2_table(264) := '7565223E3C2F7370616E3E3C2F7370616E3E5C6E2020202020203C2F6C693E5C6E202020203C2F756C3E5C6E20203C2F6469763E5C6E20203C612D636F6C756D6E2D6D65746164617461206E616D653D2223494423222073656172636861626C653D2274';
wwv_flow_imp.g_varchar2_table(265) := '7275652220696E6465783D2230223E3C2F612D636F6C756D6E2D6D657461646174613E5C6E272C7B706C616365686F6C646572733A7B56414C5545533A617065782E7574696C2E65736361706548544D4C2873297D7D293B666F7228636F6E7374207420';
wwv_flow_imp.g_varchar2_table(266) := '6F6620652E656E756D7C7C5B5D29702E68746D6C2B3D617065782E7574696C2E6170706C7954656D706C61746528275C6E20203C612D6F7074696F6E2076616C75653D2231223E234F5054494F4E233C612D6F7074696F6E2D636F6C756D6E2D76616C75';
wwv_flow_imp.g_varchar2_table(267) := '653E234F5054494F4E233C2F612D6F7074696F6E2D636F6C756D6E2D76616C75653E3C2F612D6F7074696F6E3E5C6E272C7B706C616365686F6C646572733A7B4F5054494F4E3A617065782E7574696C2E65736361706548544D4C2874297D7D293B7265';
wwv_flow_imp.g_varchar2_table(268) := '7475726E20702E68746D6C2B3D225C6E3C2F612D636F6D626F626F783E5C6E222C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72436F6D626F222C70292C707D28632C742C612C692C6E2C6F29';
wwv_flow_imp.g_varchar2_table(269) := '3A6C6528632C742C612C692C6E2C562C652E6170657829293A7028272274797065223A3A20226172726179222073696D706C65207479706520737472696E67207769746820656E756D206F6E6C79272C652C742C612C692C6E293B656C73657B722E6865';
wwv_flow_imp.g_varchar2_table(270) := '61646572732626286C2E68746D6C3D786528652C706528692C65292C612C21312C224352454154452229293B666F7228636F6E7374206520696E2074297B636F6E737420723D666528632C745B655D2C612C22222B652C6E2C21302C6F293B6C2E68746D';
wwv_flow_imp.g_varchar2_table(271) := '6C2B3D722E68746D6C7D7D656C73652070282264617461206D75737420626520616E206172726179222C74293B72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72417272617922';
wwv_flow_imp.g_varchar2_table(272) := '2C6C292C6C7D66756E6374696F6E206D652865297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E636865636B436F6E646974696F6E222C65293B6C657420743D226F626A656374223D3D747970656F6620652626214172';
wwv_flow_imp.g_varchar2_table(273) := '7261792E697341727261792865293B696628742626652E616C6C4F66262628743D41727261792E6973417272617928652E616C6C4F66292C742929666F7228636F6E73742061206F6620652E616C6C4F6629743D7426266D652861293B69662874262665';
wwv_flow_imp.g_varchar2_table(274) := '2E616E794F66262628743D41727261792E6973417272617928652E616E794F66292C742929666F7228636F6E73742061206F6620652E616E794F6629743D7426266D652861293B72657475726E20742626652E6E6F74262628743D226F626A656374223D';
wwv_flow_imp.g_varchar2_table(275) := '3D747970656F6620652E6E6F742C743D7426266D6528652E6E6F7429292C742626652E7265717569726564262628743D41727261792E6973417272617928652E726571756972656429292C742626652E70726F70657274696573262628743D226F626A65';
wwv_flow_imp.g_varchar2_table(276) := '6374223D3D747970656F6620652E70726F706572746965732C743D7426266D6528652E70726F7065727469657329292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E636865636B436F6E646974696F6E222C74292C747D';
wwv_flow_imp.g_varchar2_table(277) := '66756E6374696F6E20756528652C742C612C722C692C6E2C73297B6C6574206F3D7B6974656D733A302C77726170706572747970653A6E756C6C2C68746D6C3A22227D3B696628617065782E64656275672E747261636528223E3E6A736F6E526567696F';
wwv_flow_imp.g_varchar2_table(278) := '6E2E67656E6572617465466F72436F6E646974696F6E616C222C652C742C612C722C6E2C69292C226F626A656374223D3D747970656F6620652E6966296966286D6528652E696629297B696628652E7468656E2626652E7468656E2E70726F7065727469';
wwv_flow_imp.g_varchar2_table(279) := '657329666F72286C65745B6E2C705D6F66204F626A6563742E656E747269657328652E7468656E2E70726F706572746965737C7C7B7D29297B6C657420653D666528702C745B6E5D2C28613F612B543A2222292B722C6E2C692C21312C73293B6F2E6874';
wwv_flow_imp.g_varchar2_table(280) := '6D6C2B3D652E68746D6C7D696628652E656C73652626652E656C73652E70726F7065727469657329666F72286C65745B6E2C705D6F66204F626A6563742E656E747269657328652E656C73652E70726F706572746965737C7C7B7D29297B6C657420653D';
wwv_flow_imp.g_varchar2_table(281) := '666528702C745B6E5D2C28613F612B543A2222292B722C6E2C692C21312C73293B6F2E68746D6C2B3D652E68746D6C7D7D656C736520702822696E76616C696420636F6E646974696F6E222C652E6966293B72657475726E20617065782E64656275672E';
wwv_flow_imp.g_varchar2_table(282) := '747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72436F6E646974696F6E616C222C6F292C6F7D66756E6374696F6E20786528652C742C612C722C69297B617065782E64656275672E747261636528223E3E6A736F6E52656769';
wwv_flow_imp.g_varchar2_table(283) := '6F6E2E67656E6572617465536570617261746F72222C742C612C722C69293B6C6574206E3D22223B72657475726E21722626742626286E2B3D275C6E3C2F6469763E5C6E3C64697620636C6173733D22726F77206A736F6E726567696F6E223E5C6E2020';
wwv_flow_imp.g_varchar2_table(284) := '3C64697620636C6173733D22742D526567696F6E2D686561646572223E5C6E202020203C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F6E2D6865616465724974656D732D2D7469746C65223E5C6E20';
wwv_flow_imp.g_varchar2_table(285) := '20202020203C683220636C6173733D22742D526567696F6E2D7469746C65222069643D22234944235F68656164696E672220646174612D617065782D68656164696E673D22223E234C4142454C233C2F68323E5C6E202020203C2F6469763E5C6E202729';
wwv_flow_imp.g_varchar2_table(286) := '2C69262621652E726561644F6E6C793F6E2B3D275C6E202020203C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F6E2D6865616465724974656D732D2D627574746F6E73223E5C6E2020202020203C62';
wwv_flow_imp.g_varchar2_table(287) := '7574746F6E2069643D22234944235F4352454154452220747970653D22627574746F6E2220636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E206A732D69676E6F72654368616E67';
wwv_flow_imp.g_varchar2_table(288) := '65206C746F33333135333836393834383630343539325F3022207469746C653D224372656174652220617269612D6C6162656C3D22437265617465223E5C6E20202020202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D69672D61';
wwv_flow_imp.g_varchar2_table(289) := '64642D726F772220617269612D68696464656E3D2274727565223E3C2F7370616E3E5C6E2020202020203C2F627574746F6E3E5C6E202020203C2F6469763E5C6E20203C2F6469763E5C6E273A6E2B3D225C6E20203C2F6469763E5C6E222C6E2B3D275C';
wwv_flow_imp.g_varchar2_table(290) := '6E3C2F6469763E5C6E3C6469762069643D22234944235F434F4E5441494E45522220636C6173733D22726F77206A736F6E726567696F6E202343535323223E5C6E20272C6E3D617065782E7574696C2E6170706C7954656D706C617465286E2C7B706C61';
wwv_flow_imp.g_varchar2_table(291) := '6365686F6C646572733A7B4C4142454C3A742C49443A612C4353533A652E747970653D3D6D2626652E617065782E6373737C7C22227D7D292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E657261746553657061';
wwv_flow_imp.g_varchar2_table(292) := '7261746F7222292C6E7D66756E6374696F6E2062652865297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465417272617944656C657465427574746F6E222C65293B6C657420743D275C6E3C64697620';
wwv_flow_imp.g_varchar2_table(293) := '636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F6E2D6865616465724974656D732D2D627574746F6E73223E5C6E20203C627574746F6E2069643D22234944235F44454C4554452220747970653D22627574746F6E';
wwv_flow_imp.g_varchar2_table(294) := '2220636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E206A732D69676E6F72654368616E6765206C746F33333135333836393834383630343539325F3022207469746C653D224465';
wwv_flow_imp.g_varchar2_table(295) := '6C6574652220617269612D6C6162656C3D22437265617465223E5C6E202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D69672D64656C6574652220617269612D68696464656E3D2274727565223E3C2F7370616E3E5C6E20203C2F';
wwv_flow_imp.g_varchar2_table(296) := '627574746F6E3E5C6E3C2F6469763E5C6E273B72657475726E20743D617065782E7574696C2E6170706C7954656D706C61746528742C7B706C616365686F6C646572733A7B49443A657D7D292C617065782E64656275672E747261636528223C3C6A736F';
wwv_flow_imp.g_varchar2_table(297) := '6E526567696F6E2E67656E6572617465417272617944656C657465427574746F6E22292C747D66756E6374696F6E20666528652C742C692C6E2C732C6F2C6C297B652E617065783D652E617065787C7C7B7D3B6C657420633D7B6974656D733A302C7772';
wwv_flow_imp.g_varchar2_table(298) := '6170706572747970653A6E756C6C2C68746D6C3A22227D3B696628617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F724F626A656374222C652C742C692C6E2C732C6F2C6C292C2822222B6E292E73';
wwv_flow_imp.g_varchar2_table(299) := '74617274735769746828225F22292972657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F724F626A656374222C63292C633B73776974636828652E74797065297B6361736522617272';
wwv_flow_imp.g_varchar2_table(300) := '6179223A633D646528652C742C28693F692B543A2222292B6E2C6E2C732C21302C6C293B627265616B3B63617365226F626A656374223A743D747C7C227B7D222C722E68656164657273262628632E68746D6C3D786528652C7065286E2C65292C512869';
wwv_flow_imp.g_varchar2_table(301) := '2C6E292C6F2C6E756C6C29293B666F72286C65745B612C725D6F66204F626A6563742E656E747269657328652E70726F706572746965737C7C7B7D29297B733D303B6C657420653D666528722C745B615D2C28693F692B543A2222292B6E2C612C732C21';
wwv_flow_imp.g_varchar2_table(302) := '312C6C293B632E68746D6C2B3D652E68746D6C2C632E6974656D732B3D652E6974656D737D7B6C657420613D756528652C742C692C6E2C732C6F2C6C293B632E68746D6C2B3D612E68746D6C2C632E6974656D732B3D612E6974656D737D6F262621652E';
wwv_flow_imp.g_varchar2_table(303) := '726561644F6E6C79262628632E68746D6C2B3D6265285128692C6E2929293B627265616B3B6361736520673A633D636528652C742C692C6E2C732C6C293B627265616B3B6361736520793A6361736520683A633D66756E6374696F6E28652C742C612C72';
wwv_flow_imp.g_varchar2_table(304) := '2C692C6E297B6C657420703D7B6974656D733A302C77726170706572747970653A6E756C6C2C68746D6C3A22227D3B72657475726E20617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F724E756D65';
wwv_flow_imp.g_varchar2_table(305) := '726963222C652C742C612C722C69292C703D41727261792E6973417272617928652E656E756D293F6C6528652C742C612C722C692C5F2C652E61706578293A652E617065782626652E617065782E6974656D747970653D3D423F7B6974656D733A312C77';
wwv_flow_imp.g_varchar2_table(306) := '726170706572747970653A22617065782D6974656D2D777261707065722D2D7063742D6772617068222C68746D6C3A275C6E3C64697620636C6173733D22617065782D6974656D2D7063742D6772617068222069643D22234944232220646174612D7368';
wwv_flow_imp.g_varchar2_table(307) := '6F772D76616C75653D227472756522223E2356414C5545233C2F6469763E5C6E277D3A652E617065782626652E617065782E6974656D747970653D3D553F7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065';
wwv_flow_imp.g_varchar2_table(308) := '722D2D737461722D726174696E67222C68746D6C3A275C6E3C6469762069643D22234944232220636C6173733D22612D53746172526174696E6720617065782D6974656D2D73746172726174696E67223E5C6E20203C64697620636C6173733D22612D53';
wwv_flow_imp.g_varchar2_table(309) := '746172526174696E67223E5C6E202020203C696E70757420747970653D22746578742220617269612D6C6162656C6C656462793D22234944235F4C4142454C222069643D22234944235F494E505554222076616C75653D222356414C55452322206E616D';
wwv_flow_imp.g_varchar2_table(310) := '653D222349442220636C6173733D2220752D76682069732D666F63757361626C652220726F6C653D227370696E627574746F6E2220617269612D76616C75656E6F773D222356414C5545232220617269612D76616C75656D61783D22234D415823222061';
wwv_flow_imp.g_varchar2_table(311) := '7269612D76616C7565746578743D222356414C554523223E205C6E202020203C64697620636C6173733D22612D53746172526174696E672D7374617273223E205C6E202020203C2F6469763E5C6E20203C2F6469763E5C6E3C2F6469763E5C6E277D3A65';
wwv_flow_imp.g_varchar2_table(312) := '2E726561644F6E6C793F7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D746578742D6669656C64222C68746D6C3A273C7370616E2069643D22234944235F444953504C4159222023524551554952';
wwv_flow_imp.g_varchar2_table(313) := '45442320636C6173733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C792220646174612D6573636170653D2274727565223E2356414C5545233C2F7370616E3E277D3A7B6974656D733A312C77726170706572';
wwv_flow_imp.g_varchar2_table(314) := '747970653A22617065782D6974656D2D777261707065722D2D6E756D6265722D6669656C64222C68746D6C3A275C6E3C696E70757420747970653D2274657874222069643D222349442322206E616D653D22234944232220235245515549524544232023';
wwv_flow_imp.g_varchar2_table(315) := '504C414345484F4C4445522320636C6173733D2223414C49474E23206E756D6265725F6669656C6420617065782D6974656D2D7465787420617065782D6974656D2D6E756D626572222073697A653D2233302220234D494E2320234D4158232064617461';
wwv_flow_imp.g_varchar2_table(316) := '2D666F726D61743D2223464F524D4154232220696E7075746D6F64653D22646563696D616C22207374796C653D22746578742D616C69676E3A7374617274223E5C6E277D2C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E';
wwv_flow_imp.g_varchar2_table(317) := '67656E6572617465466F724E756D65726963222C70292C707D28652C742C692C6E2C73293B627265616B3B6361736520453A633D66756E6374696F6E28652C742C612C722C692C6E297B6C657420703D7B6974656D733A302C7772617070657274797065';
wwv_flow_imp.g_varchar2_table(318) := '3A6E756C6C2C68746D6C3A22227D3B73776974636828652E617065783D652E617065787C7C7B7D2C617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72426F6F6C65616E222C652C742C612C722C69';
wwv_flow_imp.g_varchar2_table(319) := '2C6E292C652E617065782E6974656D74797065297B63617365204E3A703D7B6974656D733A312C77726170706572747970653A22617065782D6974656D2D777261707065722D2D7965732D6E6F222C68746D6C3A275C6E3C7370616E20636C6173733D22';
wwv_flow_imp.g_varchar2_table(320) := '612D537769746368223E5C6E20203C696E70757420747970653D22636865636B626F78222069643D222349442322206E616D653D22234944232220636C6173733D22222076616C75653D22592220646174612D6F6E2D6C6162656C3D224F6E2220646174';
wwv_flow_imp.g_varchar2_table(321) := '612D6F66662D76616C75653D224E2220646174612D6F66662D6C6162656C3D224F6666223E5C6E20203C7370616E20636C6173733D22612D5377697463682D746F67676C65223E3C2F7370616E3E5C6E3C2F7370616E3E5C6E277D3B627265616B3B6361';
wwv_flow_imp.g_varchar2_table(322) := '7365205F3A63617365204D3A6C657420733D7B2E2E2E652E617065787D3B732E656E756D3D7B4E3A224E6F222C593A22596573227D3B6C6574206F3D6365287B747970653A22737472696E67222C697352657175697265643A652E697352657175697265';
wwv_flow_imp.g_varchar2_table(323) := '642C656E756D3A5B224E222C2259225D2C617065783A737D2C742C612C722C692C6E293B703D7B6974656D733A312C77726170706572747970653A652E617065782E6974656D747970653D3D5F3F22617065782D6974656D2D777261707065722D2D7369';
wwv_flow_imp.g_varchar2_table(324) := '6E676C652D636865636B626F78223A22617065782D6974656D2D777261707065722D2D726164696F67726F7570222C68746D6C3A6F2E68746D6C7D3B627265616B3B64656661756C743A703D7B6974656D733A312C77726170706572747970653A226170';
wwv_flow_imp.g_varchar2_table(325) := '65782D6974656D2D777261707065722D2D73696E676C652D636865636B626F78222C68746D6C3A275C6E3C64697620636C6173733D22617065782D6974656D2D73696E676C652D636865636B626F78223E5C6E20203C696E70757420747970653D226869';
wwv_flow_imp.g_varchar2_table(326) := '6464656E22206E616D653D22234944232220636C6173733D22222069643D22234944235F48494444454E56414C5545222076616C75653D222356414C554523223E5C6E20203C696E70757420747970653D22636865636B626F78222023434845434B4544';
wwv_flow_imp.g_varchar2_table(327) := '2320235245515549524544232069643D22234944232220617269612D6C6162656C3D22234C4142454C232220646174612D756E636865636B65642D76616C75653D224E222076616C75653D2259223E5C6E20203C6C6162656C20666F723D222349442322';
wwv_flow_imp.g_varchar2_table(328) := '2069643D22234944235F4C4142454C2220636C6173733D2220752D636865636B626F782220617269612D68696464656E3D2274727565223E234C4142454C233C2F6C6162656C3E5C6E3C2F6469763E5C6E277D7D72657475726E20617065782E64656275';
wwv_flow_imp.g_varchar2_table(329) := '672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72426F6F6C65616E222C70292C707D28652C742C692C6E2C732C6C293B627265616B3B6361736520766F696420303A213120696E20652626702827227479706522206973';
wwv_flow_imp.g_varchar2_table(330) := '20756E646566696E656427293B627265616B3B63617365226E756C6C223A627265616B3B64656661756C743A7028272274797065223A2022257322206E6F7420696D706C656D656E746564272C652E74797065297D696628632E77726170706572747970';
wwv_flow_imp.g_varchar2_table(331) := '65297B6C657420703D7065286E2C65293B636F6E7374206F3D66756E6374696F6E28652C742C61297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E54656D706C617465222C652C742C61293B6C657420723D7B7D';
wwv_flow_imp.g_varchar2_table(332) := '3B73776974636828612E617065782E74656D706C6174657C7C65297B636173652268696464656E223A723D7B636F6E7461696E65723A22742D466F726D2D6669656C64436F6E7461696E65722D2D68696464656E4C6162656C2072656C2D636F6C222C6C';
wwv_flow_imp.g_varchar2_table(333) := '6162656C3A22742D466F726D2D6669656C64436F6E7461696E65722D2D68696464656E4C6162656C20636F6C20636F6C2D32222C696E7075743A22636F6C20636F6C2D222B4D6174682E6D617828312C742D32292C68696464656E3A22752D5669737561';
wwv_flow_imp.g_varchar2_table(334) := '6C6C7948696464656E227D3B627265616B3B63617365226C656674223A723D7B636F6E7461696E65723A2272656C2D636F6C222C6C6162656C3A22636F6C20636F6C2D32222C696E7075743A22636F6C20636F6C2D222B4D6174682E6D617828312C742D';
wwv_flow_imp.g_varchar2_table(335) := '32292C68696464656E3A22227D3B627265616B3B636173652261626F7665223A723D7B636F6E7461696E65723A22742D466F726D2D6669656C64436F6E7461696E65722D2D737461636B6564222C6C6162656C3A22222C696E7075743A22222C68696464';
wwv_flow_imp.g_varchar2_table(336) := '656E3A22227D3B627265616B3B6361736522666C6F6174696E67223A64656661756C743A723D7B636F6E7461696E65723A22742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C222C6C6162656C3A22222C696E70';
wwv_flow_imp.g_varchar2_table(337) := '75743A22222C68696464656E3A22227D7D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E54656D706C617465222C72292C727D28722E74656D706C6174652C722E636F6C77696474682C65293B63';
wwv_flow_imp.g_varchar2_table(338) := '3D7B6974656D733A632E6974656D732C77726170706572747970653A632E77726170706572747970652C68746D6C3A617065782E7574696C2E6170706C7954656D706C61746528275C6E20203C64697620636C6173733D22636F6C20636F6C2D23434F4C';
wwv_flow_imp.g_varchar2_table(339) := '57494454482320617065782D636F6C2D6175746F2023434F4C5354415254454E4423223E5C6E202020203C646976202069643D22234944235F434F4E5441494E45522220636C6173733D22742D466F726D2D6669656C64436F6E7461696E657220234649';
wwv_flow_imp.g_varchar2_table(340) := '454C4454454D504C415445232023495352455155495245442320234353532320695F3131323931383130395F3020617065782D6974656D2D77726170706572202357524150504552545950452322203E5C6E2020202020203C64697620636C6173733D22';
wwv_flow_imp.g_varchar2_table(341) := '742D466F726D2D6C6162656C436F6E7461696E657220234C4142454C54454D504C41544523223E5C6E20202020202020203C6C6162656C20666F723D2223494423222069643D22234944235F4C4142454C2220636C6173733D22742D466F726D2D6C6162';
wwv_flow_imp.g_varchar2_table(342) := '656C20234C4142454C48494444454E23223E23544F504C4142454C233C2F6C6162656C3E5C6E2020202020203C2F6469763E5C6E2020202020203C64697620636C6173733D22742D466F726D2D696E707574436F6E7461696E65722023494E5055545445';
wwv_flow_imp.g_varchar2_table(343) := '4D504C41544523223E5C6E20202020202020203C64697620636C6173733D22742D466F726D2D6974656D52657175697265642D6D61726B65722220617269612D68696464656E3D2274727565223E3C2F6469763E5C6E20202020202020203C6469762063';
wwv_flow_imp.g_varchar2_table(344) := '6C6173733D22742D466F726D2D6974656D57726170706572223E5C6E272B632E68746D6C2B27205C6E20202020202020203C2F6469763E5C6E20202020202020203C64697620636C6173733D22742D466F726D2D6974656D417373697374616E6365223E';
wwv_flow_imp.g_varchar2_table(345) := '5C6E202020202020202020203C7370616E2069643D22234944235F6572726F725F706C616365686F6C6465722220636C6173733D22612D466F726D2D6572726F7220752D76697369626C652220646174612D74656D706C6174652D69643D222344415441';
wwv_flow_imp.g_varchar2_table(346) := '54454D504C41544523223E3C2F7370616E3E5C6E202020202020202020203C64697620636C6173733D22742D466F726D2D6974656D52657175697265642220617269612D68696464656E3D2274727565223E52657175697265643C2F6469763E5C6E2020';
wwv_flow_imp.g_varchar2_table(347) := '2020202020203C2F6469763E5C6E2020202020203C2F6469763E5C6E202020203C2F6469763E5C6E20203C2F6469763E5C6E272C7B706C616365686F6C646572733A7B57524150504552545950453A632E77726170706572747970652C434F4C57494454';
wwv_flow_imp.g_varchar2_table(348) := '483A652E617065782E636F6C5370616E3F652E617065782E636F6C5370616E3A722E636F6C77696474682C524F57533A652E617065782E6C696E65733F652E617065782E6C696E65733A352C434F4C5354415254454E443A733C303F22636F6C2D737461';
wwv_flow_imp.g_varchar2_table(349) := '7274223A733E303F22636F6C2D656E64223A22222C49443A5128692C6E292C4E414D453A5128692C6E292C4C4142454C3A702C4649454C4454454D504C4154453A6F2E636F6E7461696E65722C4C4142454C54454D504C4154453A6F2E6C6162656C2C4C';
wwv_flow_imp.g_varchar2_table(350) := '4142454C48494444454E3A6F2E68696464656E2C494E50555454454D504C4154453A6F2E696E7075742C4353533A652E617065782E6373737C7C22222C414C49474E3A585B652E617065782E616C69676E5D7C7C22222C524541444F4E4C593A652E7265';
wwv_flow_imp.g_varchar2_table(351) := '61646F6E6C793F2274727565223A2266616C7365222C5452494D5350414345533A22424F5448222C414A41584944454E5449464945523A612C4441544154454D504C4154453A722E6461746174656D706C61746545542C504C414345484F4C4445523A65';
wwv_flow_imp.g_varchar2_table(352) := '2E617065782E706C616365686F6C6465723F27706C616365686F6C6465723D22272B652E617065782E706C616365686F6C6465722B2722273A22222C464F524D41543A652E617065782E666F726D61747C7C22222C4558414D504C453A5B412C492C6A5D';
wwv_flow_imp.g_varchar2_table(353) := '2E696E636C7564657328652E666F726D6174293F656528652C617065782E646174652E746F49534F537472696E67286E65772044617465292C6C293A22222C4D494E4C454E4754483A652E6D696E4C656E6774683F226D696E6C656E6774683D222B652E';
wwv_flow_imp.g_varchar2_table(354) := '6D696E4C656E6774683A22222C4D41584C454E4754483A652E6D61784C656E6774683F226D61786C656E6774683D222B652E6D61784C656E6774683A22222C544F504C4142454C3A652E74797065213D457C7C5B5F2C4D2C4E5D2E696E636C7564657328';
wwv_flow_imp.g_varchar2_table(355) := '652E617065782E6974656D74797065293F703A22222C434845434B45443A652E747970653D3D452626743F22636865636B6564223A22222C5041545445524E3A652E7061747465726E3F277061747465726E3D22272B652E7061747465726E2B2722273A';
wwv_flow_imp.g_varchar2_table(356) := '22222C52455155495245443A652E697352657175697265643F2772657175697265643D2222273A22222C495352455155495245443A652E697352657175697265643F2269732D7265717569726564223A22222C4D494E3A226D696E696D756D22696E2065';
wwv_flow_imp.g_varchar2_table(357) := '3F285B412C492C6A5D2E696E636C7564657328652E666F726D6174293F226D696E223A22646174612D6D696E22292B273D22272B652E6D696E696D756D2B2722273A22222C4D41583A226D6178696D756D22696E20653F285B412C492C6A5D2E696E636C';
wwv_flow_imp.g_varchar2_table(358) := '7564657328652E666F726D6174293F226D6178223A22646174612D6D617822292B273D22272B652E6D6178696D756D2B2722273A22222C56414C55453A656528652C742C6C297C7C22222C51554F544556414C55453A652E747970653D3D672626743F61';
wwv_flow_imp.g_varchar2_table(359) := '7065782E7574696C2E65736361706548544D4C2822222B74293A747C7C22222C494D4147453A652E617065782E696D6167657C7C22227D7D297D7D72657475726E28652E617065782E746578744265666F72657C7C652E617065782E6E6577526F772926';
wwv_flow_imp.g_varchar2_table(360) := '2628632E68746D6C3D786528652C652E617065782E746578744265666F72652C692B225F4F424A222C6F2C6E756C6C292B632E68746D6C292C6F2626313D3D632E6974656D73262628722E68656164657273262628632E68746D6C3D786528652C706528';
wwv_flow_imp.g_varchar2_table(361) := '6E2C65292C5128692C6E292C6F2C6E756C6C292B632E68746D6C292C652E726561644F6E6C797C7C28632E68746D6C2B3D6265285128692C6E292929292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E65726174';
wwv_flow_imp.g_varchar2_table(362) := '65466F724F626A656374222C63292C637D66756E6374696F6E20676528652C74297B76617220613D242E6D617028652C2866756E6374696F6E2865297B72657475726E20613D652E656E64735769746828222E6A7322293F22736372697074223A226373';
wwv_flow_imp.g_varchar2_table(363) := '73222C723D28747C7C2222292B652C6E65772050726F6D697365282866756E6374696F6E28652C74297B617065782E64656275672E747261636528276C6F61642066696C6520282573293A2022257322272C612C72293B636F6E737420693D646F63756D';
wwv_flow_imp.g_varchar2_table(364) := '656E742E637265617465456C656D656E7428595B615D2E746167293B6C6574206E3D21313B692E747970653D595B615D2E747970652C695B595B615D2E617474725D3D722C692E72656C3D595B615D2E72656C2C692E6173796E633D21312C692E6F6E65';
wwv_flow_imp.g_varchar2_table(365) := '72726F723D66756E6374696F6E2865297B7428652C69297D2C692E6F6E6C6F61643D692E6F6E726561647973746174656368616E67653D66756E6374696F6E28297B6E7C7C746869732E72656164795374617465262622636F6D706C65746522213D7468';
wwv_flow_imp.g_varchar2_table(366) := '69732E726561647953746174653F74286E756C6C2C69293A286E3D21302C652829297D2C646F63756D656E742E626F64792E617070656E644368696C642869297D29293B76617220612C727D29293B72657475726E20612E7075736828242E4465666572';
wwv_flow_imp.g_varchar2_table(367) := '726564282866756E6374696F6E2865297B2428652E7265736F6C7665297D2929292C242E7768656E2E6170706C7928242C61297D6173796E632066756E6374696F6E2079652865297B617065782E64656275672E747261636528223E3E6A736F6E526567';
wwv_flow_imp.g_varchar2_table(368) := '696F6E2E6C6F6164526571756972656446696C6573222C65293B6C657420743D5B5D3B72657475726E20617065782E656E762E415045585F56455253494F4E3E3D2232332E322226262821637573746F6D456C656D656E74732E6765742822612D636F6D';
wwv_flow_imp.g_varchar2_table(369) := '626F626F7822292626652E6974656D747970652E636F6D626F626F782626742E7075736828226C69627261726965732F617065782F6D696E69666965642F6974656D2E436F6D626F626F782E6D696E2E6A7322292C21637573746F6D456C656D656E7473';
wwv_flow_imp.g_varchar2_table(370) := '2E6765742822612D7172636F646522292626652E6974656D747970652E7172636F64652626742E7075736828226C69627261726965732F617065782F6D696E69666965642F6974656D2E5152636F64652E6D696E2E6A7322292C652E6974656D74797065';
wwv_flow_imp.g_varchar2_table(371) := '2E7269636874657874262628637573746F6D456C656D656E74732E6765742822612D726963682D746578742D656469746F7222297C7C28742E7075736828226C69627261726965732F74696E796D63652F222B617065782E6C696256657273696F6E732E';
wwv_flow_imp.g_varchar2_table(372) := '74696E796D63652B222F736B696E732F75692F6F786964652F736B696E2E63737322292C742E7075736828226C69627261726965732F74696E796D63652F222B617065782E6C696256657273696F6E732E74696E796D63652B222F74696E796D63652E6D';
wwv_flow_imp.g_varchar2_table(373) := '696E2E6A7322292C742E7075736828226C69627261726965732F7075726966792F222B617065782E6C696256657273696F6E732E646F6D5075726966792B222F7075726966792E6D696E2E6A7322292C742E7075736828226C69627261726965732F7072';
wwv_flow_imp.g_varchar2_table(374) := '69736D6A732F222B617065782E6C696256657273696F6E732E707269736D4A732B222F707269736D2E6A7322292C742E7075736828226C69627261726965732F6D61726B65646A732F222B617065782E6C696256657273696F6E732E6D61726B65644A73';
wwv_flow_imp.g_varchar2_table(375) := '2B222F6D61726B65642E6D696E2E6A7322292C742E7075736828226C69627261726965732F7475726E646F776E2F222B617065782E6C696256657273696F6E732E7475726E646F776E2B222F7475726E646F776E2E6A7322292C742E7075736828226C69';
wwv_flow_imp.g_varchar2_table(376) := '627261726965732F617065782F6D696E69666965642F6974656D2E5269636854657874456469746F722E6D696E2E6A7322292929292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6C6F6164526571756972656446696C';
wwv_flow_imp.g_varchar2_table(377) := '657322292C676528742C617065782E656E762E415045585F46494C4553297D66756E6374696F6E2068652874297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E73686F774669656C647322293B6C657420613D66756E63';
wwv_flow_imp.g_varchar2_table(378) := '74696F6E28652C742C612C722C692C6E2C70297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465526567696F6E222C652C742C612C722C692C6E2C70293B6C657420733D666528652C742C612C722C69';
wwv_flow_imp.g_varchar2_table(379) := '2C6E2C70293B72657475726E20732E68746D6C3D275C6E3C64697620636C6173733D22726F77206A736F6E726567696F6E223E5C6E272B732E68746D6C2B225C6E3C2F6469763E222C617065782E64656275672E747261636528223C3C6A736F6E526567';
wwv_flow_imp.g_varchar2_table(380) := '696F6E2E67656E6572617465526567696F6E222C73292C737D28722E736368656D612C692C6E756C6C2C722E646174616974656D2C302C21312C2130292E68746D6C3B617065782E656E762E415045585F56455253494F4E3C2232322E3222262628612B';
wwv_flow_imp.g_varchar2_table(381) := '3D66756E6374696F6E2865297B6C657420743D22223B72657475726E20617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6C6F6164526571756972656446696C6573323231222C65292C28652E666F726D61742E646174657C';
wwv_flow_imp.g_varchar2_table(382) := '7C652E666F726D61745B22646174652D74696D65225D29262628742B3D273C6C696E6B2072656C3D227374796C6573686565742220687265663D22272B617065782E656E762E415045585F46494C45532B226C69627261726965732F6F7261636C656A65';
wwv_flow_imp.g_varchar2_table(383) := '742F222B617065782E6C696256657273696F6E732E6F7261636C656A65742B222F6373732F6C6962732F6F6A2F76222B617065782E6C696256657273696F6E732E6F7261636C656A65742B272F726564776F6F642F6F6A2D726564776F6F642D6E6F7461';
wwv_flow_imp.g_varchar2_table(384) := '672D6D696E2E6373732220747970653D22746578742F637373222F3E272C742B3D273C736372697074207372633D22272B617065782E656E762E415045585F46494C45532B226C69627261726965732F6F7261636C656A65742F222B617065782E6C6962';
wwv_flow_imp.g_varchar2_table(385) := '56657273696F6E732E6F7261636C656A65742B272F6A732F6C6962732F726571756972652F726571756972652E6A73223E3C5C2F7363726970743E272C742B3D273C736372697074207372633D22272B617065782E656E762E415045585F46494C45532B';
wwv_flow_imp.g_varchar2_table(386) := '276C69627261726965732F617065782F6D696E69666965642F726571756972656A732E6A6574436F6E6669672E6D696E2E6A73223E3C5C2F7363726970743E272C742B3D273C736372697074207372633D22272B617065782E656E762E415045585F4649';
wwv_flow_imp.g_varchar2_table(387) := '4C45532B276C69627261726965732F617065782F6D696E69666965642F6A6574436F6D6D6F6E42756E646C652E6D696E2E6A73223E3C5C2F7363726970743E272C742B3D273C736372697074207372633D22272B617065782E656E762E415045585F4649';
wwv_flow_imp.g_varchar2_table(388) := '4C45532B276C69627261726965732F617065782F6D696E69666965642F6A6574446174655069636B657242756E646C652E6D696E2E6A73223E3C5C2F7363726970743E27292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E';
wwv_flow_imp.g_varchar2_table(389) := '2E6C6F6164526571756972656446696C6573323231222C74292C747D287429292C24282223222B65292E68746D6C2861292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E73686F774669656C647322297D66756E637469';
wwv_flow_imp.g_varchar2_table(390) := '6F6E20456528652C74297B72657475726E206526262841727261792E697341727261792865293F652E666F7245616368282866756E6374696F6E28612C72297B456528655B725D2C74297D29293A747970656F6620653D3D6D2626284F626A6563742E6B';
wwv_flow_imp.g_varchar2_table(391) := '6579732865292E666F7245616368282866756E6374696F6E28612C72297B6E756C6C3D3D3D456528655B615D2C7429262664656C65746520655B615D7D29292C4F626A6563742E6B6579732865292E6C656E6774687C7C28653D6E756C6C2929292C657D';
wwv_flow_imp.g_varchar2_table(392) := '66756E6374696F6E2052652865297B72657475726E20652E736368656D613D652E736368656D617C7C7B7D2C652E736368656D612E70726F706572746965733D652E736368656D612E70726F706572746965737C7C7B7D2C652E736368656D612E617065';
wwv_flow_imp.g_varchar2_table(393) := '783D652E736368656D612E617065787C7C7B7D2C652E736368656D612E617065782E6C6162656C3D652E736368656D612E617065782E6C6162656C7C7C6E756C6C2C657D617065782E64656275672E747261636528223E3E696E69744A736F6E52656769';
wwv_flow_imp.g_varchar2_table(394) := '6F6E222C652C742C612C72292C722E686964652626617065782E6974656D28722E646174616974656D292E6869646528293B7472797B722E736368656D613D4A534F4E2E706172736528722E736368656D612E7265706C616365282F5C5C222F672C2722';
wwv_flow_imp.g_varchar2_table(395) := '27292E7265706C616365282F5C5C6E2F672C225C6E22292E7265706C616365282F5C5C722F672C225C7222292E7265706C616365282F5C5C742F672C225C742229297D63617463682865297B617065782E64656275672E6572726F7228226A736F6E2D72';
wwv_flow_imp.g_varchar2_table(396) := '6567696F6E3A20736368656D61222C652C722E736368656D61292C722E736368656D613D7B7D7D7472797B693D4A534F4E2E706172736528617065782E6974656D28722E646174616974656D292E67657456616C756528297C7C227B7D22297D63617463';
wwv_flow_imp.g_varchar2_table(397) := '682865297B617065782E64656275672E6572726F7228226A736F6E2D726567696F6E3A20646174616974656D222C722E646174616974656D2C652C722E736368656D61292C693D7B7D7D617065782E64656275672E74726163652822696E69744A736F6E';
wwv_flow_imp.g_varchar2_table(398) := '526567696F6E3A2064617461222C69293B6C65742041653D21286926264F626A6563742E6B6579732869292E6C656E677468293B696628722E67656E6572617465536368656D61297B6C657420653D7B7D3B653D66756E6374696F6E206528742C61297B';
wwv_flow_imp.g_varchar2_table(399) := '696628617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465536368656D61222C742C61292C612626226F626A656374223D3D747970656F6620612969662841727261792E69734172726179286129297B743D';
wwv_flow_imp.g_varchar2_table(400) := '7B747970653A226172726179222C6974656D733A7B7D7D3B666F7228636F6E73742072206F66206129742E6974656D733D6528742E6974656D732C72297D656C73657B742E747970653D226F626A656374222C742E70726F706572746965733D742E7072';
wwv_flow_imp.g_varchar2_table(401) := '6F706572746965737C7C7B7D3B666F7228636F6E73745B722C695D6F66204F626A6563742E656E747269657328612929742E70726F706572746965735B725D3D742E70726F706572746965735B725D7C7C7B7D2C742E70726F706572746965735B725D3D';
wwv_flow_imp.g_varchar2_table(402) := '6528742E70726F706572746965735B725D2C69297D656C73657B6C657420653D6E756C6C2C723D6E756C6C3B73776974636828747970656F662061297B6361736522626F6F6C65616E223A653D453B627265616B3B63617365226E756D626572223A653D';
wwv_flow_imp.g_varchar2_table(403) := '4E756D6265722E6973496E74656765722861293F793A683B627265616B3B6361736522737472696E67223A653D672C612E6D61746368282F5E5C647B347D5C2D5C647B327D5C2D5C647B327D242F293F723D2264617465223A612E6D61746368282F5E5C';
wwv_flow_imp.g_varchar2_table(404) := '647B347D5C2D5C647B327D5C2D5C647B327D28547C20295C647B327D285C3A5C647B327D297B312C327D285C2E5C642B293F242F293F723D22646174652D74696D65223A612E6D61746368282F5E5C647B327D285C3A5C647B327D297B312C327D285C2E';
wwv_flow_imp.g_varchar2_table(405) := '5C642B293F242F29262628723D2274696D6522293B627265616B3B64656661756C743A612626702822756E6B6E6F776E2064617461747970652025733A202573222C747970656F6620612C61292C653D677D743D7B747970653A657D2C72262628742E66';
wwv_flow_imp.g_varchar2_table(406) := '6F726D61743D72297D72657475726E20617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465536368656D61222C74292C747D28652C697C7C7B7D292C636F6E736F6C652E696E666F28222B2B2B4A534F4E2D';
wwv_flow_imp.g_varchar2_table(407) := '736368656D612B2B2B222C4A534F4E2E737472696E67696679286529292C722E736368656D613D657D28723D5265287229292E736368656D613D736528722E736368656D61292C6F6528722E736368656D612C302C722E726561646F6E6C792C21312C72';
wwv_flow_imp.g_varchar2_table(408) := '2E6B656570417474726962757465732C2131292C693D66756E6374696F6E206528742C612C72297B696628617065782E64656275672E747261636528223E3E7265666F726D617456616C756573222C74292C74262661297B73776974636828742E747970';
wwv_flow_imp.g_varchar2_table(409) := '65297B63617365226F626A656374223A6966286120696E7374616E63656F66204F626A65637429666F7228636F6E7374206920696E20742E70726F7065727469657329615B695D3D6528742E70726F706572746965735B695D2C615B695D2C72293B656C';
wwv_flow_imp.g_varchar2_table(410) := '736520617065782E64656275672E6572726F72282263616E206E6F7420646973706C617920646174613A222C612C226D75737420626520616E206F626A65637422293B627265616B3B63617365226172726179223A69662841727261792E697341727261';
wwv_flow_imp.g_varchar2_table(411) := '7928612929666F722876617220693D303B693C742E6974656D732E6C656E6774683B692B2B29615B695D3D6528742E6974656D735B695D2C615B695D2C72293B656C736520617065782E64656275672E6572726F72282263616E206E6F7420646973706C';
wwv_flow_imp.g_varchar2_table(412) := '617920646174613A222C612C226D75737420626520616E20617272617922297D696628742E6966297B696628742E7468656E29666F7228636F6E73745B692C6E5D6F66204F626A6563742E656E747269657328742E7468656E2E70726F70657274696573';
wwv_flow_imp.g_varchar2_table(413) := '292965286E2C615B695D2C72293B696628742E656C736529666F7228636F6E73745B692C6E5D6F66204F626A6563742E656E747269657328742E656C73652E70726F70657274696573292965286E2C615B695D2C72297D7D72657475726E20617065782E';
wwv_flow_imp.g_varchar2_table(414) := '64656275672E747261636528223C3C7265666F726D617456616C756573222C61292C617D28722E736368656D612C692C2130293B6C65742049653D6E756C6C3B49653D4A28722E736368656D612C4965292C6865284965292C6173796E632066756E6374';
wwv_flow_imp.g_varchar2_table(415) := '696F6E28297B66756E6374696F6E207428297B617065782E64656275672E747261636528223E3E637265617465526567696F6E22292C617065782E726567696F6E2E6973526567696F6E286529262628617065782E64656275672E747261636528224445';
wwv_flow_imp.g_varchar2_table(416) := '5354524F5920524547494F4E222C65292C617065782E726567696F6E2E64657374726F79286529292C617065782E726567696F6E2E63726561746528652C6E292C617065782E6974656D2E6174746163682824282223222B6529292C617065782E646562';
wwv_flow_imp.g_varchar2_table(417) := '75672E747261636528223C3C637265617465526567696F6E22297D617065782E64656275672E7472616365282272657175697265642066696C6573206C6F64696E672E2E2E22292C6177616974207965284965292C617065782E64656275672E74726163';
wwv_flow_imp.g_varchar2_table(418) := '65282272657175697265642066696C6573206C6F6164656422292C6177616974206173796E632066756E6374696F6E2865297B617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E7265667265736822292C617065782E646562';
wwv_flow_imp.g_varchar2_table(419) := '75672E747261636528226A736F6E526567696F6E2E72656672657368222C2264617461222C652C69292C6177616974206C28292C696528722E646174616974656D2C22222C722E736368656D612C722E726561646F6E6C792C692C65292C6428292C6170';
wwv_flow_imp.g_varchar2_table(420) := '65782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7265667265736822297D284165293B636F6E7374206E3D7B726566726573683A66756E6374696F6E28297B617065782E64656275672E747261636528223E3E63616C6C6261636B';
wwv_flow_imp.g_varchar2_table(421) := '2E726566726573683A20222C652C612C722C69292C722E697344796E616D69632626617065782E7365727665722E706C7567696E28612C7B706167654974656D733A722E71756572796974656D737D2C7B737563636573733A6173796E632066756E6374';
wwv_flow_imp.g_varchar2_table(422) := '696F6E2865297B6C657420613D21286926264F626A6563742E6B6579732869292E6C656E6774683E30293B652E24646566733D655B2722246465667322275D2C617065782E64656275672E74726163652822574F524152524F554E442024646566732229';
wwv_flow_imp.g_varchar2_table(423) := '2C722E736368656D613D652C28723D5265287229292E736368656D613D736528722E736368656D61292C6F6528722E736368656D612C302C722E726561646F6E6C792C21312C722E6B656570417474726962757465732C2131293B6C6574206E3D6E756C';
wwv_flow_imp.g_varchar2_table(424) := '6C3B6E3D4A28722E736368656D612C6E292C617065782E64656275672E74726163652822704F7074696F6E733A222C72292C6865286E292C6177616974207965286E292C6177616974206C28292C696528722E646174616974656D2C22222C722E736368';
wwv_flow_imp.g_varchar2_table(425) := '656D612C722E726561646F6E6C792C692C61292C6428292C616528722E646174616974656D2C22222C722E736368656D612C722E726561646F6E6C792C69292C7428297D7D292C617065782E64656275672E747261636528223C3C63616C6C6261636B2E';
wwv_flow_imp.g_varchar2_table(426) := '7265667265736822297D2C6265666F72655375626D69743A66756E6374696F6E28297B696628617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6265666F72655375626D6974222C652C722E646174616974656D2C722E7363';
wwv_flow_imp.g_varchar2_table(427) := '68656D61292C21722E726561646F6E6C79297B617065782E64656275672E747261636528226A736F6E526567696F6E222C72293B6C657420653D6E6528722E646174616974656D2C22222C722E736368656D612C69293B722E72656D6F76654E756C6C73';
wwv_flow_imp.g_varchar2_table(428) := '262628653D45652865292C617065782E64656275672E7472616365282272656D6F766564204E554C4C73222C6529292C617065782E64656275672E7472616365282267656E657261746564204A534F4E222C65292C617065782E6974656D28722E646174';
wwv_flow_imp.g_varchar2_table(429) := '616974656D292E73657456616C7565284A534F4E2E737472696E67696679286529297D617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6265666F72655375626D697422297D2C7375626D69743A66756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(430) := '617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E7375626D697422292C24282223222B652B2220696E70757422292E72656D6F76654174747228226E616D6522292C24282223222B652B2220746578746172656122292E7265';
wwv_flow_imp.g_varchar2_table(431) := '6D6F76654174747228226E616D6522292C24282223222B652B222073656C65637422292E72656D6F76654174747228226E616D6522292C24282223222B652B2220612D636F6D626F626F7822292E72656D6F76654174747228226E616D6522292C242822';
wwv_flow_imp.g_varchar2_table(432) := '23222B652B2220612D726963682D746578742D656469746F7222292E72656D6F76654174747228226E616D6522292C617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7375626D697422297D7D3B617065782E6A5175657279';
wwv_flow_imp.g_varchar2_table(433) := '28617065782E6750616765436F6E7465787424292E62696E642822617065786265666F7265706167657375626D6974222C2866756E6374696F6E28297B6E2E6265666F72655375626D697428297D29292C617065782E6A517565727928617065782E6750';
wwv_flow_imp.g_varchar2_table(434) := '616765436F6E7465787424292E6F6E282261706578706167657375626D6974222C2866756E6374696F6E28297B6E2E7375626D697428297D29292C617065782E6A51756572792877696E646F77292E6F6E2822617065786265666F726572656672657368';
wwv_flow_imp.g_varchar2_table(435) := '222C2866756E6374696F6E28297B617065782E64656275672E747261636528224556454E543A222C22617065786265666F72657265667265736822297D29292C617065782E6A51756572792877696E646F77292E6F6E2822617065786166746572726566';
wwv_flow_imp.g_varchar2_table(436) := '72657368222C2866756E6374696F6E28297B617065782E64656275672E747261636528224556454E543A222C226170657861667465727265667265736822297D29292C617065782E6A51756572792877696E646F77292E6F6E2822617065787265616479';
wwv_flow_imp.g_varchar2_table(437) := '656E64222C2866756E6374696F6E2865297B617065782E64656275672E747261636528224556454E543A222C22617065787265616479656E6422297D29292C617065782E6A51756572792877696E646F77292E6F6E28226170657877696E646F77726573';
wwv_flow_imp.g_varchar2_table(438) := '697A6564222C2866756E6374696F6E2865297B617065782E64656275672E747261636528224556454E543A222C226170657877696E646F77726573697A656422297D29292C24282223222B65292E7265616479282866756E6374696F6E28297B61706578';
wwv_flow_imp.g_varchar2_table(439) := '2E64656275672E747261636528224556454E543A222C224A517565727920726561647922292C616528722E646174616974656D2C22222C722E736368656D612C722E726561646F6E6C792C69297D29292C7428297D28292C617065782E64656275672E74';
wwv_flow_imp.g_varchar2_table(440) := '7261636528223C3C696E69744A736F6E526567696F6E22297D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(21651402722716333)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_file_name=>'json-region.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E6A736F6E726567696F6E207B0A20206D617267696E2D6C6566743A202D302E3572656D3B0A20206D617267696E2D72696768743A202D302E3572656D3B0A7D0A0A2E6A736F6E726567696F6E202E742D526567696F6E2D686561646572207B0A202062';
wwv_flow_imp.g_varchar2_table(2) := '6F726465722D626C6F636B2D656E642D7374796C653A206E6F6E653B0A7D0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696D67207B0A20206865696768743A20313030253B0A7D0A0A2E6A736F6E726567696F6E20';
wwv_flow_imp.g_varchar2_table(3) := '2E742D466F726D2D6974656D5772617070657220737667207B0A20206865696768743A20313030253B0A7D0A0A2E6A736F6E726567696F6E202E742D526567696F6E2D686561646572207B0A20206D617267696E2D746F703A203870783B0A20206D6172';
wwv_flow_imp.g_varchar2_table(4) := '67696E2D626F74746F6D3A203470783B0A7D0A0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D74696D655D3A3A2D7765626B69742D63616C656E6461722D7069636B65722D696E64696361';
wwv_flow_imp.g_varchar2_table(5) := '746F722C0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D646174655D3A3A2D7765626B69742D63616C656E6461722D7069636B65722D696E64696361746F722C0A2E6A736F6E726567696F';
wwv_flow_imp.g_varchar2_table(6) := '6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D6461746574696D652D6C6F63616C5D3A3A2D7765626B69742D63616C656E6461722D7069636B65722D696E64696361746F720A207B0A2020706F736974696F6E3A2072';
wwv_flow_imp.g_varchar2_table(7) := '656C61746976653B0A2020746F703A202D313070783B0A7D0A0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D74696D655D2C0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D';
wwv_flow_imp.g_varchar2_table(8) := '5772617070657220696E7075745B747970653D646174655D2C0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D6461746574696D652D6C6F63616C5D7B0A20206865696768743A203372656D';
wwv_flow_imp.g_varchar2_table(9) := '3B0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(36251414702013135)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_file_name=>'json-region.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A0A202A2041504558204A534F4E2D726567696F6E20706C7567696E0A202A20286329205577652053696D6F6E20323032332C323032340A202A20417061636865204C6963656E73652056657273696F6E20322E300A2A2F0A0A227573652073747269';
wwv_flow_imp.g_varchar2_table(2) := '6374223B0A0A0A2F2A0A202A20696E697469616C697A6520746865204A534F4E2D726567696F6E20706C7567696E2C2063616C6C20666F726D20696E7369646520504C2F53514C207768656E20706C7567696E2069737420696E697469616C697A65640A';
wwv_flow_imp.g_varchar2_table(3) := '2A2F0A2F2F206173796E632066756E6374696F6E20696E69744A736F6E526567696F6E282070526567696F6E49642C20704E616D652C2070416A61784964656E7469666965722C20704F7074696F6E7329207B0A66756E6374696F6E20696E69744A736F';
wwv_flow_imp.g_varchar2_table(4) := '6E526567696F6E282070526567696F6E49642C20704E616D652C2070416A61784964656E7469666965722C20704F7074696F6E7329207B0A20202020202020202F2F20676574207468652064617461742D74656D706C6174652D696420666F7220696E6C';
wwv_flow_imp.g_varchar2_table(5) := '696E65206572726F72732066726F6D20616E6F7468657220696E707574206669656C640A2F2F20636F6E736F6C652E6572726F72284A534F4E2E737472696E6769667928704F7074696F6E7329293B0A20206C65742020206744617461203D207B7D3B20';
wwv_flow_imp.g_varchar2_table(6) := '202F2F20686F6C647320746865204A534F4E2D6461746120617320616E206F626A65637420686965726172636869650A0A2020704F7074696F6E732E6461746174656D706C6174654554203D2024282428272E612D466F726D2D6572726F725B64617461';
wwv_flow_imp.g_varchar2_table(7) := '2D74656D706C6174652D69645D27295B305D292E617474722827646174612D74656D706C6174652D69642729207C7C202778785F4554273B0A0A20202F2A0A2020202A202073657420626F6F6C65616E2076616C3120776F2076616C32207768656E2076';
wwv_flow_imp.g_varchar2_table(8) := '616C31206973206E6F74207365740A20202A2F0A202066756E6374696F6E20626F6F6C65616E49664E6F745365742876616C312C2076616C32297B0A202020202072657475726E202828747970656F662076616C31203D3D2027626F6F6C65616E27293F';
wwv_flow_imp.g_varchar2_table(9) := '76616C313A76616C32290A20207D0A0A20202F2A0A2020202A204C6F67204A534F4E2D736368656D612072656C61746564206572726F726D657373616765730A20202A2F0A202066756E6374696F6E206C6F67536368656D614572726F72286D73672C20';
wwv_flow_imp.g_varchar2_table(10) := '2E2E2E61726773297B0A2020202069662841727261792E6973417272617928617267732920262620617267732E6C656E6774683E30297B0A202020202020617065782E64656275672E6572726F7228274A534F4E2D736368656D6120696E76616C69643A';
wwv_flow_imp.g_varchar2_table(11) := '20272B206D73672C202E2E2E61726773290A202020207D20656C7365207B0A202020202020617065782E64656275672E6572726F7228274A534F4E2D736368656D6120696E76616C69643A20272B206D7367290A202020207D0A20207D0A0A20202F2A0A';
wwv_flow_imp.g_varchar2_table(12) := '2020202A20536F6D65206861636B730A2020202A205761697420666F72205269636874746578742D456469746F7220746F20626520696E697469616C697A65640A2020202A206F746865727769736520617065782E6974656D282772696368746578742D';
wwv_flow_imp.g_varchar2_table(13) := '4954454D27292E73657456616C7565282E2E2E292077696C6C20636175736520756E646566696E6564206572726F72200A20202A2F0A202066756E6374696F6E2077616974466F72456469746F722829207B0A2020202072657475726E206E6577205072';
wwv_flow_imp.g_varchar2_table(14) := '6F6D6973652866756E6374696F6E20287265736F6C76652C2072656A65637429207B0A2020202020202020636865636B456469746F72287265736F6C7665293B0A202020207D293B0A20207D0A0A20202F2A0A2020202A20436865636B20776865746865';
wwv_flow_imp.g_varchar2_table(15) := '72207468652072696368746578742D656469746F7220697320696E697469616C697A65640A20202A2F0A202066756E6374696F6E20636865636B456469746F72287265736F6C766529207B0A202020206C657420656469746F72456C656D656E74203D20';
wwv_flow_imp.g_varchar2_table(16) := '242827612D726963682D746578742D656469746F7227293B0A20202020696620282128656469746F72456C656D656E7420262620656469746F72456C656D656E745B305D20262620656469746F72456C656D656E745B305D2E676574456469746F722829';
wwv_flow_imp.g_varchar2_table(17) := '2929207B0A20202020202073657454696D656F757428636865636B456469746F722E62696E6428746869732C207265736F6C7665292C203330293B0A202020207D2020656C7365207B0A2020202020207265736F6C766528293B0A202020207D0A20207D';
wwv_flow_imp.g_varchar2_table(18) := '0A0A20202F2A0A2020202A205761697420756E74696C207468652072696368746578742D656469746F7220697320696E697469616C697A65640A20202A2F0A20206173796E632066756E6374696F6E2072696368746578744861636B28297B0A20202020';
wwv_flow_imp.g_varchar2_table(19) := '6C657420656469746F72456C656D656E74203D20242827612D726963682D746578742D656469746F7227293B0A20202020696628656469746F72456C656D656E7420262620656469746F72456C656D656E745B305D297B0A202020202020617065782E64';
wwv_flow_imp.g_varchar2_table(20) := '656275672E74726163652028277761697420666F722072696368746578742D656469746F72206265656F6E20696E697469616C697A656427293B0A20202020202061776169742077616974466F72456469746F7228293B0A202020207D0A20207D0A0A0A';
wwv_flow_imp.g_varchar2_table(21) := '20202F2A0A2020202A20436865636B207768657468657220616E206F626A65637420697320656D7074792C20636F6E7461696E73206E6F2070726F70657274696573206F7220616C6C2070726F7065727469657320617265206E756C6C0A20202A2F0A20';
wwv_flow_imp.g_varchar2_table(22) := '2066756E6374696F6E2069734F626A656374456D7074792864617461297B0A202020206C6574206C5F656D707479203D20747275653B0A20202020617065782E64656275672E747261636528273E3E6A736F6E526567696F6E2E69734F626A656374456D';
wwv_flow_imp.g_varchar2_table(23) := '707479272C2064617461293B0A202020206966286461746120262620747970656F662064617461203D3D20276F626A65637427297B0A202020202020666F7228636F6E7374205B6C5F6B65792C206C5F646174615D206F66204F626A6563742E656E7472';
wwv_flow_imp.g_varchar2_table(24) := '696573286461746129297B0A20202020202020206966286C5F64617461297B0A202020202020202020206C5F656D707479203D2066616C73653B0A20202020202020207D0A2020202020207D0A202020207D20656C73652069662864617461297B0A2020';
wwv_flow_imp.g_varchar2_table(25) := '202020206C5F656D707479203D2066616C73653B0A202020207D0A20202020617065782E64656275672E747261636528273C3C6A736F6E526567696F6E2E69734F626A656374456D707479272C206C5F656D707479293B0A2020202072657475726E286C';
wwv_flow_imp.g_varchar2_table(26) := '5F656D707479293B0A20207D200A20202F2A0A2020202A20736F6D65204861636B7320746F206D616B652074686520706C7567696E20776F726B0A20202A2F0A202066756E6374696F6E20617065784861636B7328297B0A0A202020202F2F204861636B';
wwv_flow_imp.g_varchar2_table(27) := '20746F2061747461636820616C6C2048616E646C657220746F20746865206669656C647320696E20746865206A736F6E2D726567696F6E20200A20202020617065782E64656275672E747261636528273E3E6A736F6E526567696F6E2E61706578486163';
wwv_flow_imp.g_varchar2_table(28) := '6B7327293B0A202020202020202F2F20617065782E6974656D2E617474616368282428272327202B2070526567696F6E496429293B0A202020202020202020202F2F206861636B20746F20737570706F727420666C6F6174696E67206C61626C65732066';
wwv_flow_imp.g_varchar2_table(29) := '6F7220756E6976657273616C2D7468656D612034320A20202020696628617065782E7468656D653432297B0A202020202020617065782E64656275672E696E666F28275468656D65343220706174636827293B0A202020202020617065782E6576656E74';
wwv_flow_imp.g_varchar2_table(30) := '2E7472696767657228617065782E6750616765436F6E74657874242C2027617065787265616479656E6427293B0A202020207D0A0A20202020617065782E64656275672E747261636528273C3C6A736F6E526567696F6E2E617065784861636B7327293B';
wwv_flow_imp.g_varchar2_table(31) := '0A20207D0A0A202020202F2F204861636B20746F2072656D6F766520626F726465722066726F6D20726567696F6E0A20202428272327202B2070526567696F6E4964292E6373732822626F72646572222C20226E6F6E6522293B0A0A2020202020202020';
wwv_flow_imp.g_varchar2_table(32) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F204A534F4E202274797065223A20222E2E2E220A2020636F6E737420435F4A534F4E5F4F424A45435420202020202020202020203D2027';
wwv_flow_imp.g_varchar2_table(33) := '6F626A656374273B0A2020636F6E737420435F4A534F4E5F41525241592020202020202020202020203D20276172726179273B0A2020636F6E737420435F4A534F4E5F50524F50455254494553202020202020203D202770726F70657274696573273B0A';
wwv_flow_imp.g_varchar2_table(34) := '2020636F6E737420435F4A534F4E5F52455155495245442020202020202020203D20277265717569726564273B0A2020636F6E737420435F4A534F4E5F52454620202020202020202020202020203D202724726566273B0A2020636F6E737420435F4A53';
wwv_flow_imp.g_varchar2_table(35) := '4F4E5F535452494E4720202020202020202020203D2027737472696E67273B0A2020636F6E737420435F4A534F4E5F494E5445474552202020202020202020203D2027696E7465676572273B0A2020636F6E737420435F4A534F4E5F4E554D4245522020';
wwv_flow_imp.g_varchar2_table(36) := '2020202020202020203D20276E756D626572273B0A2020636F6E737420435F4A534F4E5F424F4F4C45414E202020202020202020203D2027626F6F6C65616E273B0A2020636F6E737420435F4A534F4E5F434F4E53542020202020202020202020203D20';
wwv_flow_imp.g_varchar2_table(37) := '27636F6E7374273B0A2020636F6E737420435F4A534F4E5F464F524D41545F444154452020202020203D202764617465273B0A2020636F6E737420435F4A534F4E5F464F524D41545F4441544554494D4520203D2027646174652D74696D65273B0A2020';
wwv_flow_imp.g_varchar2_table(38) := '636F6E737420435F4A534F4E5F464F524D41545F54494D452020202020203D202774696D65273B0A2020636F6E737420435F4A534F4E5F464F524D41545F454D41494C20202020203D2027656D61696C273B0A2020636F6E737420435F4A534F4E5F464F';
wwv_flow_imp.g_varchar2_table(39) := '524D41545F555249202020202020203D2027757269273B0A0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F20636F6E646974696F6E616C206B6579776F7264730A2020636F6E7374';
wwv_flow_imp.g_varchar2_table(40) := '20435F4A534F4E5F434F4E445F414C4C5F4F462020202020203D2027616C6C4F66273B0A2020636F6E737420435F4A534F4E5F434F4E445F414E595F4F462020202020203D2027616E794F66273B0A2020636F6E737420435F4A534F4E5F434F4E445F4E';
wwv_flow_imp.g_varchar2_table(41) := '4F542020202020202020203D20276E6F74273B0A20200A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F204A534F4E20656E636F64656420737472696E67730A2020';
wwv_flow_imp.g_varchar2_table(42) := '636F6E737420435F4A534F4E5F494D4147455F504E4720202020202020203D2027696D6167652F706E67273B0A2020636F6E737420435F4A534F4E5F494D4147455F4A504720202020202020203D2027696D6167652F6A7067273B0A2020636F6E737420';
wwv_flow_imp.g_varchar2_table(43) := '435F4A534F4E5F494D4147455F47494620202020202020203D2027696D6167652F676966273B0A2020636F6E737420435F4A534F4E5F42415345363420202020202020202020203D2027626173653634273B0A0A2020636F6E737420435F44454C494D49';
wwv_flow_imp.g_varchar2_table(44) := '5445522020202020202020203D20275F272020202020202020202020202020202020202F2F2064656C696D6974657220666F722070617468206F66206E6573746564206F626A656374730A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(45) := '20202020202020202020202020202020202020202020202020202F2F202261706578223A207B226974656D74797065223A20222E2E2E222C202E2E2E7D200A2020636F6E737420435F415045585F535749544348202020202020203D2027737769746368';
wwv_flow_imp.g_varchar2_table(46) := '273B2020202020202020202020202F2F206974656D74797065207377697463680A2020636F6E737420435F415045585F524943485445585420202020203D20277269636874657874273B202020202020202020202F2F206974656D747970652072696368';
wwv_flow_imp.g_varchar2_table(47) := '7465787420656469746F720A2020636F6E737420435F415045585F544558544152454120202020203D20277465787461726561273B0A2020636F6E737420435F415045585F434F4D424F20202020202020203D2027636F6D626F626F78273B2020202020';
wwv_flow_imp.g_varchar2_table(48) := '20202020202F2F206974656D7479706520636F6D626F626F780A2020636F6E737420435F415045585F524144494F20202020202020203D2027726164696F273B0A2020636F6E737420435F415045585F434845434B424F5820202020203D202763686563';
wwv_flow_imp.g_varchar2_table(49) := '6B626F78273B0A2020636F6E737420435F415045585F53454C454354202020202020203D202773656C656374273B2020202020202020202020202F2F206974656D747970652073656C6563740A2020636F6E737420435F415045585F50415353574F5244';
wwv_flow_imp.g_varchar2_table(50) := '20202020203D202770617373776F7264273B0A2020636F6E737420435F415045585F53544152524154494E472020203D202773746172726174696E67273B0A2020636F6E737420435F415045585F5152434F4445202020202020203D20277172636F6465';
wwv_flow_imp.g_varchar2_table(51) := '273B0A2020636F6E737420435F415045585F494D41474520202020202020203D2027696D616765273B0A2020636F6E737420435F415045585F43555252454E435920202020203D202763757272656E6379273B0A2020636F6E737420435F415045585F48';
wwv_flow_imp.g_varchar2_table(52) := '4F52495A4F4E54414C2020203D2027686F72697A6F6E74616C273B0A2020636F6E737420435F415045585F564552544943414C20202020203D2027766572746963616C273B0A2020636F6E737420435F415045585F504354475241504820202020203D20';
wwv_flow_imp.g_varchar2_table(53) := '277063746772617068273B0A2020636F6E737420435F415045585F4C4142454C20202020202020203D20276C6162656C273B0A2020636F6E737420435F415045585F414C49474E20202020202020203D2027616C69676E273B0A2020636F6E737420435F';
wwv_flow_imp.g_varchar2_table(54) := '415045585F4C4546542020202020202020203D20276C656674273B0A2020636F6E737420435F415045585F43454E544552202020202020203D202763656E746572273B0A2020636F6E737420435F415045585F524947485420202020202020203D202772';
wwv_flow_imp.g_varchar2_table(55) := '69676874273B0A0A2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F48494444454E2020203D202768696464656E273B0A2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F4C45465420202020203D20';
wwv_flow_imp.g_varchar2_table(56) := '276C656674273B0A2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F41424F5645202020203D202761626F7665273B0A2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F464C4F4154494E47203D2027';
wwv_flow_imp.g_varchar2_table(57) := '666C6F6174696E67273B0A0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F20457874656E646564204F7261636C65207479706573200A2020636F6E737420435F4F';
wwv_flow_imp.g_varchar2_table(58) := '5241434C455F54494D455354414D5020203D202774696D657374616D70273B2020202020200A0A202020202F2F206D617070696E672066726F6D2066696C652D657874696F6E73696F6E73206C696B65202E6A7320746F2068746D6C2D74616773207265';
wwv_flow_imp.g_varchar2_table(59) := '71756972656420746F206F706164207468652066696C650A2020636F6E737420634D617054797065203D207B0A2020202022736372697074223A207B7461673A2022736372697074222C2072656C3A206E756C6C2C202020202020202020617474723A20';
wwv_flow_imp.g_varchar2_table(60) := '22737263222C20207072656669783A20223F763D22202B20617065782E656E762E415045585F56455253494F4E2C20747970653A2022746578742F6A617661736372697074227D2C0A2020202022637373223A202020207B7461673A20226C696E6B222C';
wwv_flow_imp.g_varchar2_table(61) := '20202072656C3A20227374796C657368656574222C20617474723A202268726566222C207072656669783A2022222C20202020202020202020202020202020202020202020202020202020747970653A2022746578742F637373227D0A20207D3B0A0A20';
wwv_flow_imp.g_varchar2_table(62) := '20636F6E73742063416C69676E203D207B0A2020202020206C6566743A2022752D746578745374617274222C0A20202020202063656E7465723A2022752D7465787443656E746572222C0A20202020202072696768743A2022752D74657874456E64220A';
wwv_flow_imp.g_varchar2_table(63) := '20207D0A0A20202F2A0A2020202A202067656E65726174652061204A534F4E2D736368656D612066726F6D204A534F4E2D646174610A20202A2F0A202066756E6374696F6E2067656E6572617465536368656D6128736368656D612C2064617461297B0A';
wwv_flow_imp.g_varchar2_table(64) := '202020202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465536368656D61222C20736368656D612C2064617461293B0A2020202020206966286461746120262620747970656F662064617461203D3D';
wwv_flow_imp.g_varchar2_table(65) := '20276F626A65637427297B20202F2F206D75737420676F20646F776E2072656375727369766C790A202020202020202069662841727261792E69734172726179286461746129297B0A20202020202020202020736368656D61203D207B747970653A2022';
wwv_flow_imp.g_varchar2_table(66) := '6172726179222C206974656D733A207B7D7D3B0A20202020202020202020666F7228636F6E7374206C5F64617461206F66206461746129207B0A202020202020202020202020736368656D612E6974656D73203D2067656E6572617465536368656D6128';
wwv_flow_imp.g_varchar2_table(67) := '736368656D612E6974656D732C206C5F64617461293B0A202020202020202020207D0A20202020202020207D20656C7365207B20202F2F20612073696D706C65206F626A6563740A20202020202020202020736368656D612E74797065203D20226F626A';
wwv_flow_imp.g_varchar2_table(68) := '656374223B0A20202020202020202020736368656D612E70726F70657274696573203D20736368656D612E70726F70657274696573207C7C7B7D3B0A20202020202020202020666F722028636F6E7374205B6C5F6B65792C206C5F646174615D206F6620';
wwv_flow_imp.g_varchar2_table(69) := '4F626A6563742E656E7472696573286461746129297B0A202020202020202020202020736368656D612E70726F706572746965735B6C5F6B65795D203D20736368656D612E70726F706572746965735B6C5F6B65795D207C7C7B7D3B0A20202020202020';
wwv_flow_imp.g_varchar2_table(70) := '2020202020736368656D612E70726F706572746965735B6C5F6B65795D203D2067656E6572617465536368656D6128736368656D612E70726F706572746965735B6C5F6B65795D2C206C5F64617461293B0A202020202020202020207D0A202020202020';
wwv_flow_imp.g_varchar2_table(71) := '20207D0A2020202020207D20656C7365207B0A20202020202020206C6574206C5F74797065203D206E756C6C3B0A20202020202020206C6574206C5F666F726D6174203D206E756C6C3B0A202020202020202073776974636828747970656F6620646174';
wwv_flow_imp.g_varchar2_table(72) := '61297B0A20202020202020202020636173652027626F6F6C65616E273A0A2020202020202020202020206C5F74797065203D20435F4A534F4E5F424F4F4C45414E3B0A20202020202020202020627265616B3B0A20202020202020202020636173652027';
wwv_flow_imp.g_varchar2_table(73) := '6E756D626572273A0A2020202020202020202020206966284E756D6265722E6973496E7465676572286461746129297B0A20202020202020202020202020206C5F74797065203D20435F4A534F4E5F494E54454745523B0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(74) := '7D20656C7365207B0A20202020202020202020202020206C5F74797065203D20435F4A534F4E5F4E554D4245520A2020202020202020202020207D0A20202020202020202020627265616B3B0A20202020202020202020636173652027737472696E6727';
wwv_flow_imp.g_varchar2_table(75) := '3A0A2020202020202020202020206C5F74797065203D20435F4A534F4E5F535452494E473B0A202020202020202020202020202020202F2F2063616C6320666F726D617420746F6F0A202020202020202020202020696628646174612E6D61746368282F';
wwv_flow_imp.g_varchar2_table(76) := '5E5C647B347D5C2D5C647B327D5C2D5C647B327D242F29297B0A20202020202020202020202020206C5F666F726D6174203D202764617465273B0A2020202020202020202020207D20656C736520696628646174612E6D61746368282F5E5C647B347D5C';
wwv_flow_imp.g_varchar2_table(77) := '2D5C647B327D5C2D5C647B327D28547C20295C647B327D285C3A5C647B327D297B312C327D285C2E5C642B293F242F29297B0A20202020202020202020202020206C5F666F726D6174203D2027646174652D74696D65273B0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(78) := '207D20656C736520696628646174612E6D61746368282F5E5C647B327D285C3A5C647B327D297B312C327D285C2E5C642B293F242F29297B0A20202020202020202020202020206C5F666F726D6174203D202774696D65273B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(79) := '20207D0A2020202020202020202020627265616B3B0A202020202020202020202064656661756C743A0A2020202020202020202020202069662864617461297B20202F2F206E756C6C206973204F4B0A2020202020202020202020202020206C6F675363';
wwv_flow_imp.g_varchar2_table(80) := '68656D614572726F722827756E6B6E6F776E2064617461747970652025733A202573272C20747970656F6620646174612C2064617461293B0A202020202020202020202020207D0A202020202020202020202020206C5F74797065203D20435F4A534F4E';
wwv_flow_imp.g_varchar2_table(81) := '5F535452494E473B20202F2F20636F6E74696E7565206173206120737472696E670A20202020202020207D0A2020202020202020736368656D61203D207B747970653A206C5F747970657D3B0A20202020202020206966286C5F666F726D6174297B0A20';
wwv_flow_imp.g_varchar2_table(82) := '202020202020202020736368656D612E666F726D6174203D206C5F666F726D61743B0A20202020202020207D0A2020202020207D0A202020202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E65726174655363';
wwv_flow_imp.g_varchar2_table(83) := '68656D61222C20736368656D61293B0A20202020202072657475726E20736368656D613B0A20207D0A20202F2A0A2020202A206275696C6420746865206E616D65206F6620616E206974656D20696E20746865204A534F4E2D726567696F6E2066726F6D';
wwv_flow_imp.g_varchar2_table(84) := '20746861200A20202A2F0A202066756E6374696F6E2067656E4974656D6E616D6528646174616974656D2C206669656C64297B0A2020202020206C6574206C5F6E616D65203D2027273B0A202020202020696628646174616974656D29207B0A20202020';
wwv_flow_imp.g_varchar2_table(85) := '202020206C5F6E616D65203D20646174616974656D3B0A20202020202020206966286669656C64297B0A202020202020202020206C5F6E616D65202B3D20435F44454C494D49544552202B206669656C643B0A20202020202020207D0A2020202020207D';
wwv_flow_imp.g_varchar2_table(86) := '20656C7365207B0A20202020202020206C5F6E616D653D6669656C643B0A2020202020207D0A20202020202072657475726E206C5F6E616D653B0A20207D0A0A20202F2A200A2020202A206576616C7561746573207468652069662D6578707265737369';
wwv_flow_imp.g_varchar2_table(87) := '6F6E206F66206120636F6E646974696F6E616C20736368656D61207573696E67207468652076616C756573206F6620746865204A534F4E2D646174610A20202A2F0A202066756E6374696F6E206576616C45787072657373696F6E28736368656D612C20';
wwv_flow_imp.g_varchar2_table(88) := '64617461297B0A202020206C6574206C5F726574203D20747275653B0A20202020736368656D61203D20736368656D617C7C7B7D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6576616C45787072657373';
wwv_flow_imp.g_varchar2_table(89) := '696F6E222C20736368656D612C2064617461293B0A2020202020202020202020202F2F20636865636B20776865746865722076616C75657320617265206E6F7420656D7074790A20202020666F7228636F6E7374205B6C5F6669656C642C206C5F636F6D';
wwv_flow_imp.g_varchar2_table(90) := '705D206F66204F626A6563742E656E747269657328736368656D6129297B0A20202020636F6E736F6C652E6C6F6728274556414C272C206C5F6669656C642C206C5F636F6D70293B0A20202020737769746368286C5F6669656C64297B0A202020206361';
wwv_flow_imp.g_varchar2_table(91) := '736520435F4A534F4E5F52455155495245443A0A202020202020617065782E64656275672E747261636528276576616C45787072657373696F6E3A20272C20736368656D612E72657175697265642C20276E6F7420656D707479272C2064617461293B0A';
wwv_flow_imp.g_varchar2_table(92) := '20202020202069662841727261792E69734172726179286C5F636F6D7029297B0A2020202020202020666F7228636F6E7374206C5F6669656C64206F66206C5F636F6D70297B0A2020202020202020202069662828646174615B6C5F6669656C645D3D3D';
wwv_flow_imp.g_varchar2_table(93) := '6E756C6C29207C7C2028646174615B6C5F6669656C645D2E6C656E6774683D3D3029297B20202F2F206669656C6420697320656D7074790A2020202020202020202020206C5F726574203D2066616C73653B0A202020202020202020207D0A2020202020';
wwv_flow_imp.g_varchar2_table(94) := '2020207D0A2020202020207D20656C7365207B0A20202020202020206C6F67536368656D614572726F722827636F6E646974696F6E616C20736368656D61272C206C5F6669656C642C20276D75737420626520616E20617272617927293B200A20202020';
wwv_flow_imp.g_varchar2_table(95) := '20207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F434F4E445F414C4C5F4F463A0A202020202020666F7228636F6E7374206C5F656E747279206F66206C5F636F6D70297B0A20202020202020206C5F726574203D206C5F7265';
wwv_flow_imp.g_varchar2_table(96) := '74202626206576616C45787072657373696F6E286C5F656E7472792C2064617461293B0A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F434F4E445F414E595F4F463A0A202020202020617065782E6465627567';
wwv_flow_imp.g_varchar2_table(97) := '2E747261636528276576616C45787072657373696F6E3A20272C206C5F6669656C642C206C5F636F6D702C20274F5227293B0A2020202020206C6574206C5F72657432203D2066616C73653B0A202020202020666F7228636F6E7374206C5F656E747279';
wwv_flow_imp.g_varchar2_table(98) := '206F66206C5F636F6D70297B0A20202020202020206C5F72657432203D206C5F72657432207C7C206576616C45787072657373696F6E286C5F656E7472792C2064617461293B0A2020202020207D0A2020202020206C5F726574203D206C5F7265742026';
wwv_flow_imp.g_varchar2_table(99) := '26206C5F726574323B0A20202020627265616B3B0A202020206361736520435F4A534F4E5F434F4E445F4E4F543A0A202020202020617065782E64656275672E747261636528276576616C45787072657373696F6E3A20272C206C5F636F6D702C20274E';
wwv_flow_imp.g_varchar2_table(100) := '4F5427293B0A2020202020206C5F726574203D20216576616C45787072657373696F6E286C5F636F6D702C2064617461293B0A20202020627265616B3B0A202020206361736520435F4A534F4E5F50524F504552544945533A0A2020202020206C5F7265';
wwv_flow_imp.g_varchar2_table(101) := '74203D206576616C45787072657373696F6E28736368656D612E70726F706572746965732C2064617461293B0A20202020627265616B3B0A2020202064656661756C743A20202F2F20612073696D7072652070726F7065727479207769746368203D3D20';
wwv_flow_imp.g_varchar2_table(102) := '6F7220494E0A20202020202069662841727261792E69734172726179286C5F636F6D702E656E756D29297B0A2020202020202020617065782E64656275672E747261636528276576616C45787072657373696F6E3A272C206C5F6669656C642C2022696E';
wwv_flow_imp.g_varchar2_table(103) := '20222C206C5F636F6D702C20646174615B6C5F6669656C645D290A2020202020202020696628216C5F636F6D702E656E756D2E696E636C7564657328646174615B6C5F6669656C645D29297B0A2020202020202020202020206C5F7265743D66616C7365';
wwv_flow_imp.g_varchar2_table(104) := '3B0A202020202020202020207D0A20202020202020207D20656C736520696628747970656F66206C5F636F6D7020213D2027756E646566696E656427297B0A20202020202020202020617065782E64656275672E747261636528276576616C4578707265';
wwv_flow_imp.g_varchar2_table(105) := '7373696F6E3A272C206C5F6669656C642C20223D3D222C206C5F636F6D702C20646174615B6C5F6669656C645D290A202020202020202020206966286C5F636F6D702E636F6E7374213D646174615B6C5F6669656C645D297B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(106) := '20206C5F7265743D66616C73653B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E657661';
wwv_flow_imp.g_varchar2_table(107) := '6C45787072657373696F6E222C20736368656D612C206C5F726574293B0A2020202072657475726E286C5F726574293B0A20207D0A0A20202F2A0A2020202A2066696C6C2061206D6170207468696520616C6C206974656D747970657320757365642069';
wwv_flow_imp.g_varchar2_table(108) := '6E20746865204A534F4E2D536368656D610A20202A2F0A202066756E6374696F6E206765744974656D747970657328736368656D612C206974656D7479706573297B0A202020206974656D7479706573203D206974656D7479706573207C7C207B747970';
wwv_flow_imp.g_varchar2_table(109) := '653A207B7D2C206974656D747970653A207B7D2C20666F726D61743A207B7D7D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6765744974656D7479706573222C20736368656D612C206974656D74797065';
wwv_flow_imp.g_varchar2_table(110) := '73293B0A0A202020206974656D74797065732E747970655B736368656D612E747970655D3D747275653B0A2020202073776974636828736368656D612E74797065297B0A202020206361736520435F4A534F4E5F4F424A4543543A0A202020202020666F';
wwv_flow_imp.g_varchar2_table(111) := '72286C6574205B6C5F6E616D652C206C5F70726F70657274795D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A20202020202020206974656D7479706573203D206765744974656D7479706573286C';
wwv_flow_imp.g_varchar2_table(112) := '5F70726F70657274792C206974656D7479706573293B0A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F41525241593A0A2020202020206974656D7479706573203D206765744974656D74797065732873636865';
wwv_flow_imp.g_varchar2_table(113) := '6D612E6974656D732C206974656D7479706573293B0A202020202020696628736368656D612E61706578297B0A20202020202020206974656D74797065732E6974656D747970655B736368656D612E617065782E6974656D747970655D203D2074727565';
wwv_flow_imp.g_varchar2_table(114) := '3B0A2020202020207D0A20202020627265616B3B0A2020202064656661756C743A0A202020202020696628736368656D612E666F726D6174297B0A20202020202020206974656D74797065732E666F726D61745B736368656D612E666F726D61745D203D';
wwv_flow_imp.g_varchar2_table(115) := '20747275653B0A2020202020207D0A202020202020696628736368656D612E61706578297B0A20202020202020206974656D74797065732E6974656D747970655B736368656D612E617065782E6974656D747970655D203D20747275653B0A2020202020';
wwv_flow_imp.g_varchar2_table(116) := '207D0A20202020627265616B3B0A202020207D0A200A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6765744974656D7479706573222C206974656D7479706573293B0A2020202072657475726E286974656D74';
wwv_flow_imp.g_varchar2_table(117) := '79706573293B0A20207D0A0A20202F2A0A2020202A207365742073686F772F6869646520617474726962757465206279206D6F646520666F7220616C6C206669656C7320696E20736368656D612C20746F2073686F772F6869646520636F6E646974696F';
wwv_flow_imp.g_varchar2_table(118) := '6E616C207061727473206F66207468652055490A20202A2F0A202066756E6374696F6E2070726F70616761746553686F7728646174616974656D2C20736368656D612C206D6F6465297B0A20202020617065782E64656275672E747261636528223E3E6A';
wwv_flow_imp.g_varchar2_table(119) := '736F6E526567696F6E2E70726F70616761746553686F77222C20646174616974656D2C20736368656D612C206D6F6465293B0A20202020696628736368656D612E747970653D3D435F4A534F4E5F4F424A454354297B0A202020202020666F72286C6574';
wwv_flow_imp.g_varchar2_table(120) := '205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A2020202020202020696628704F7074696F6E732E68656164657273297B0A2020202020202020202020202F';
wwv_flow_imp.g_varchar2_table(121) := '2F20636F6E736F6C652E6C6F6728277377697463682068656164657273272C20646174616974656D293B0A2020202020202020202020206966286D6F64653D3D747275652920207B200A20202020202020202020202020202428272327202B2064617461';
wwv_flow_imp.g_varchar2_table(122) := '6974656D202B20275F68656164696E6727292E73686F7728293B200A2020202020202020202020207D0A2020202020202020202020206966286D6F64653D3D66616C736529207B200A20202020202020202020202020202428272327202B206461746169';
wwv_flow_imp.g_varchar2_table(123) := '74656D202B20275F68656164696E6727292E6869646528293B200A2020202020202020202020207D0A20202020202020207D0A202020202020202070726F70616761746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D';
wwv_flow_imp.g_varchar2_table(124) := '65292C206C5F6974656D2C206D6F6465293B0A2020202020207D0A202020207D20656C7365207B0A2020202020206966286D6F64653D3D747275652920207B200A20202020202020202428272327202B20646174616974656D202B20275F434F4E544149';
wwv_flow_imp.g_varchar2_table(125) := '4E455227292E73686F7728293B200A20202020202020202428272327202B20646174616974656D292E70726F7028277265717569726564272C736368656D612E69735265717569726564293B202020202020202020200A2020202020207D0A2020202020';
wwv_flow_imp.g_varchar2_table(126) := '206966286D6F64653D3D66616C736529207B200A20202020202020202428272327202B20646174616974656D202B20275F434F4E5441494E455227292E6869646528293B200A20202020202020202428272327202B20646174616974656D292E70726F70';
wwv_flow_imp.g_varchar2_table(127) := '28277265717569726564272C66616C7365293B0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E70726F70616761746553686F7722293B0A20207D0A0A20202F2A0A20202A20';
wwv_flow_imp.g_varchar2_table(128) := '736574207468652072657175697265642061747472696275746520616E64205549206D61726B657220666F7220612055492D6974656D0A20202A2F0A202066756E6374696F6E2070726F706167617465526571756972656428646174616974656D2C2073';
wwv_flow_imp.g_varchar2_table(129) := '6368656D612C206D6F6465297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F7061676174655265717569726564222C20646174616974656D2C20736368656D612C206D6F6465293B0A202020206C65';
wwv_flow_imp.g_varchar2_table(130) := '74206974656D203D202428272327202B20646174616974656D293B0A202020206974656D2E70726F7028227265717569726564222C6D6F6465293B0A202020206966286D6F64653D3D74727565297B0A2020202020206974656D2E636C6F736573742822';
wwv_flow_imp.g_varchar2_table(131) := '2E742D466F726D2D6669656C64436F6E7461696E657222292E616464436C617373282269732D726571756972656422293B0A202020207D20656C7365207B0A2020202020206974656D2E636C6F7365737428222E742D466F726D2D6669656C64436F6E74';
wwv_flow_imp.g_varchar2_table(132) := '61696E657222292E72656D6F7665436C617373282269732D726571756972656422293B0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E70726F706167617465526571756972656422293B0A2020';
wwv_flow_imp.g_varchar2_table(133) := '7D0A0A20202F2A0A2020202A20636F6E7665727420616E206974656D2D76616C7565206F662074686520415045582D554920696E746F206A736F6E2D76616C7565206E656564656420666F722073746F72696E672069740A20202A2F0A202066756E6374';
wwv_flow_imp.g_varchar2_table(134) := '696F6E206974656D56616C7565324A736F6E28736368656D612C2076616C7565297B0A2020202069662876616C7565203D3D3D20222229207B2076616C75653D6E756C6C3B207D3B0A20202020617065782E64656275672E747261636528223E3E6A736F';
wwv_flow_imp.g_varchar2_table(135) := '6E526567696F6E2E6974656D56616C7565324A736F6E222C20736368656D612C2076616C7565293B202020200A202020206C6574206C5F76616C7565203D2076616C75653B0A2020202069662876616C7565213D6E756C6C297B0A202020202020747279';
wwv_flow_imp.g_varchar2_table(136) := '7B0A202020202020202073776974636828736368656D612E74797065297B0A202020202020202020206361736520435F4A534F4E5F535452494E473A0A20202020202020202020202073776974636828736368656D612E666F726D6174297B0A20202020';
wwv_flow_imp.g_varchar2_table(137) := '202020202020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A202020202020202020202020202020206C5F76616C7565203D20617065782E646174652E746F49534F537472696E6728617065782E646174652E70617273652876';
wwv_flow_imp.g_varchar2_table(138) := '616C75652C20617065782E6C6F63616C652E67657444617465466F726D6174282929292E737562737472696E6728302C3130293B0A2020202020202020202020202020627265616B3B0A20202020202020202020202020206361736520435F4A534F4E5F';
wwv_flow_imp.g_varchar2_table(139) := '464F524D41545F4441544554494D453A0A202020202020202020202020202020206C5F76616C7565203D20617065782E646174652E746F49534F537472696E6728617065782E646174652E70617273652876616C75652C20617065782E6C6F63616C652E';
wwv_flow_imp.g_varchar2_table(140) := '67657444617465466F726D617428292B2720484832343A4D493A53532729293B0A2020202020202020202020202020627265616B3B20200A20202020202020202020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A2020202020';
wwv_flow_imp.g_varchar2_table(141) := '20202020202020202020206C5F76616C7565203D2076616C75653B0A2020202020202020202020202020627265616B3B0A2020202020202020202020207D0A2020202020202020202020206C5F76616C7565203D206C5F76616C75652E6C656E6774683E';
wwv_flow_imp.g_varchar2_table(142) := '303F6C5F76616C75653A6E756C6C3B0A20202020202020202020627265616B3B20200A202020202020202020206361736520435F4A534F4E5F424F4F4C45414E3A0A2020202020202020202020206C5F76616C7565203D202876616C75653D3D22592229';
wwv_flow_imp.g_varchar2_table(143) := '3B0A20202020202020202020627265616B3B0A202020202020202020206361736520435F4A534F4E5F494E54454745523A0A202020202020202020206361736520435F4A534F4E5F4E554D4245523A0A20202020202020202020202069662876616C7565';
wwv_flow_imp.g_varchar2_table(144) := '213D6E756C6C29207B0A2020202020202020202020202020696628736368656D612E617065782E666F726D6174297B0A202020202020202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E746F4E756D6265722876616C7565';
wwv_flow_imp.g_varchar2_table(145) := '2C20736368656D612E617065782E666F726D6174293B0A20202020202020202020202020207D20656C7365207B0A202020202020202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E746F4E756D6265722876616C7565293B';
wwv_flow_imp.g_varchar2_table(146) := '0A20202020202020202020202020207D0A2020202020202020202020207D0A20202020202020202020627265616B3B20200A20202020202020207D0A2020202020207D2063617463682865297B0A2020202020202020617065782E64656275672E657272';
wwv_flow_imp.g_varchar2_table(147) := '6F722827496E76616C696420696E7075742064617461272C20736368656D612E617065782E666F726D61742C2076616C75652C2065293B0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E5265';
wwv_flow_imp.g_varchar2_table(148) := '67696F6E2E6974656D56616C7565324A736F6E222C206C5F76616C7565293B0A2020202072657475726E206C5F76616C75653B0A20207D0A0A20202F2A0A2020202A20676574207468652056616C7565206F66206120636F6E7374616E742022636F6E73';
wwv_flow_imp.g_varchar2_table(149) := '74223A202E2E2E0A2020202A207573656420746F20636F6E766572742074686520636F6E7374616E74204E4F572F6E657720696E7420746F2063757272656E7420646174652F6461746574696D650A20202A2F0A202066756E6374696F6E20676574436F';
wwv_flow_imp.g_varchar2_table(150) := '6E7374616E7428666F726D61742C207374722C20697344656661756C74297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E676574436F6E7374616E74222C20666F726D61742C207374722C20697344656661';
wwv_flow_imp.g_varchar2_table(151) := '756C74293B0A202020206C6574206C5F76616C7565203D207374723B0A2020202069662828747970656F6628737472293D3D27737472696E67272920262620287374722E746F5570706572436173652829203D3D20274E4F572729297B0A202020202020';
wwv_flow_imp.g_varchar2_table(152) := '73776974636828666F726D6174297B0A2020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A202020202020202020206C5F76616C7565203D20617065782E646174652E666F726D6174286E6577204461746528292C2027595959';
wwv_flow_imp.g_varchar2_table(153) := '592D4D4D2D444427293B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A202020202020202020206C5F76616C7565203D20617065782E646174652E666F726D6174286E657720';
wwv_flow_imp.g_varchar2_table(154) := '4461746528292C2027595959592D4D4D2D444454484832343A4D493A535327293B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A202020202020202020206C5F76616C7565203D206170';
wwv_flow_imp.g_varchar2_table(155) := '65782E646174652E666F726D6174286E6577204461746528292C2027484832343A4D4927293B0A202020202020627265616B3B0A20202020202064656661756C743A0A202020202020202020206C5F76616C7565203D207374723B0A2020202020206272';
wwv_flow_imp.g_varchar2_table(156) := '65616B3B0A2020202020207D0A20202020202069662821697344656661756C7420262620666F726D61743D3D435F4A534F4E5F464F524D41545F4441544529207B20200A202020202020202020202F2F20616C7761797320616464202068683A6D6D3A73';
wwv_flow_imp.g_varchar2_table(157) := '7320746F2064617465207768656E206E6F742064656661756C740A20202020202020206C5F76616C7565202B3D20275430303A30303A3030273B0A2020202020207D0A200A202020207D0A20202020617065782E64656275672E747261636528223C3C6A';
wwv_flow_imp.g_varchar2_table(158) := '736F6E526567696F6E2E676574436F6E7374616E74222C206C5F76616C7565293B0A2020202072657475726E20286C5F76616C7565293B0A20207D0A0A20202F2A0A2020202A20636F6E76657274206A736F6E2D76616C756520696E746F206974656D2D';
wwv_flow_imp.g_varchar2_table(159) := '76616C756520726571756972656420696E2074686520415045582D55490A20202A2F0A202066756E6374696F6E206A736F6E56616C7565324974656D28736368656D612C2076616C75652C206E65774974656D297B0A202020206C6574206C5F76616C75';
wwv_flow_imp.g_varchar2_table(160) := '65203D2076616C75653B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6A736F6E56616C7565324974656D222C20736368656D61293B0A202020206966286E65774974656D202626202176616C756520262620';
wwv_flow_imp.g_varchar2_table(161) := '736368656D612E64656661756C7429207B0A2020202020202F2F205768656E20612064656661756C7420697320636F6E666967757265642C2075736520697420666F72207768656E2061206E6577206974656D20697320696E207573650A202020202020';
wwv_flow_imp.g_varchar2_table(162) := '76616C7565203D20676574436F6E7374616E7428736368656D612E666F726D61742C20736368656D612E64656661756C742C2074727565293B0A202020207D0A0A20202020696628736368656D612E77726974654F6E6C79297B2020202F2F20646F206E';
wwv_flow_imp.g_varchar2_table(163) := '6F742073686F77207468652063757272656E742076616C7565207768656E20697420697320612077726974654F6E6C792055492D6974656D0A20202020202076616C7565203D206E756C6C3B0A2020202020206C5F76616C7565203D20206E756C6C3B0A';
wwv_flow_imp.g_varchar2_table(164) := '202020207D0A0A2020202069662876616C7565207C7C2076616C75653D3D66616C7365207C7C2076616C75653D3D30207C7C2076616C75653D3D302E30297B0A2020202020206C5F76616C7565203D2076616C75653B0A202020202020747279207B2020';
wwv_flow_imp.g_varchar2_table(165) := '20200A202020202020202073776974636828736368656D612E74797065297B0A202020202020202020206361736520435F4A534F4E5F494E54454745523A0A202020202020202020206361736520435F4A534F4E5F4E554D4245523A0A20202020202020';
wwv_flow_imp.g_varchar2_table(166) := '2020202020696628736368656D612E617065782E666F726D6174297B0A202020202020202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E666F726D61744E756D626572286C5F76616C75652C20736368656D612E61706578';
wwv_flow_imp.g_varchar2_table(167) := '2E666F726D6174293B0A2020202020202020202020207D20656C7365207B0A202020202020202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E666F726D61744E756D626572286C5F76616C7565293B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(168) := '202020207D0A20202020202020202020627265616B3B0A202020202020202020206361736520435F4A534F4E5F535452494E473A0A20202020202020202020202073776974636828736368656D612E666F726D6174297B0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(169) := '20206361736520435F4A534F4E5F464F524D41545F444154453A0A20202020202020202020202020202020696628617065782E656E762E415045585F56455253494F4E3E3D2732322E322E3027297B0A2020202020202020202020202020202020206C5F';
wwv_flow_imp.g_varchar2_table(170) := '76616C7565203D20617065782E646174652E666F726D617428617065782E646174652E70617273652876616C75652C27595959592D4D4D2D444427292C20617065782E6C6F63616C652E67657444617465466F726D61742829293B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(171) := '20202020202020207D0A2020202020202020202020202020627265616B3B0A20202020202020202020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A2020202020202020202020202020202076616C7565203D207661';
wwv_flow_imp.g_varchar2_table(172) := '6C75652E7265706C616365282720272C20275427293B202F2F20657863657074206461746574696D65207769746820222022206F7220225422206265747765656E206461746520616E642074696D65200A20202020202020202020202020202020696628';
wwv_flow_imp.g_varchar2_table(173) := '617065782E656E762E415045585F56455253494F4E3E3D2732322E322E3027297B0A2020202020202020202020202020202020206C5F76616C7565203D20617065782E646174652E666F726D617428617065782E646174652E70617273652876616C7565';
wwv_flow_imp.g_varchar2_table(174) := '2C27595959592D4D4D2D444454484832343A4D4927292C20617065782E6C6F63616C652E67657444617465466F726D617428292B2720484832343A4D493A535327293B0A202020202020202020202020202020207D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(175) := '627265616B3B0A20202020202020202020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A202020202020202020202020202020206C5F76616C7565203D2076616C75652E737562737472696E6728302C35293B0A202020202020';
wwv_flow_imp.g_varchar2_table(176) := '2020202020202020627265616B3B0A202020202020202020202020202064656661756C743A0A20202020202020202020202020202020696628736368656D612E726561644F6E6C79297B0A20202020202020202020202020202020202073776974636828';
wwv_flow_imp.g_varchar2_table(177) := '736368656D612E617065782E6974656D74797065297B0A2020202020202020202020202020202020206361736520435F415045585F54455854415245413A0A20202020202020202020202020202020202020206C5F76616C75653D206C5F76616C75653F';
wwv_flow_imp.g_varchar2_table(178) := '6C5F76616C75652E7265706C616365416C6C28273C272C2027266C743B27292E7265706C616365416C6C28275C6E272C20273C62722F3E27293A27273B0A202020202020202020202020202020202020627265616B3B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(179) := '20202020206361736520435F415045585F52494348544558543A0A20202020202020202020202020202020202020206C5F76616C7565203D2077696E646F772E6D61726B65642E706172736528206C5F76616C75652C207B0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(180) := '2020202020202020202020202020202020202067666D3A20747275652C0A202020202020202020202020202020202020202020202020202020202020627265616B733A20747275652C0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(181) := '202020207461626C65733A20747275652C0A2020202020202020202020202020202020202020202020202020202020206D616E676C653A2066616C73652C0A2020202020202020202020202020202020202020202020202020202020207868746D6C3A20';
wwv_flow_imp.g_varchar2_table(182) := '66616C73652C0A2020202020202020202020202020202020202020202020202020202020206865616465724964733A2066616C73650A202020202020202020202020202020202020202020202020202020207D293B0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(183) := '20202020627265616B3B202020200A2020202020202020202020202020202020207D20200A202020202020202020202020202020207D20200A2020202020202020202020207D0A20202020202020202020627265616B3B20200A20202020202020202020';
wwv_flow_imp.g_varchar2_table(184) := '6361736520435F4A534F4E5F424F4F4C45414E3A0A2020202020202020202020206C5F76616C7565203D202876616C75653F2259223A224E22293B0A20202020202020202020627265616B3B0A202020202020202020206361736520435F4A534F4E5F49';
wwv_flow_imp.g_varchar2_table(185) := '4E54454745523A0A202020202020202020206361736520435F4A534F4E5F4E554D4245523A0A20202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E666F726D61744E756D6265722876616C75652C20736368656D612E6170';
wwv_flow_imp.g_varchar2_table(186) := '657820262620736368656D612E617065782E666F726D6174207C7C6E756C6C293B0A20202020202020202020627265616B3B0A20202020202020207D0A2020202020207D2063617463682865297B0A2020202020202020617065782E64656275672E6572';
wwv_flow_imp.g_varchar2_table(187) := '726F722827496E76616C6964204A534F4E2D64617461272C2076616C75652C2065293B0A2020202020207D0A202020207D20200A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6A736F6E56616C756532497465';
wwv_flow_imp.g_varchar2_table(188) := '6D222C206C5F76616C7565293B0A2020202072657475726E286C5F76616C7565293B0A20207D0A0A20202F2A0A2020202A2020616464206120726F7720746F20616E2061727261790A20202A2F0A202066756E6374696F6E2064656C4172726179526F77';
wwv_flow_imp.g_varchar2_table(189) := '28646174616974656D297B0A202020206C6574206C5F726F776964203D202827272B646174616974656D292E7265706C616365282F44454C455445242F2C2027434F4E5441494E455227290A20202020617065782E64656275672E747261636528223E3E';
wwv_flow_imp.g_varchar2_table(190) := '6A736F6E526567696F6E2E64656C4172726179526F77222C20646174616974656D2C206C5F726F776964293B0A202020202428272327202B206C5F726F776964292E72656D6F766528290A20202020617065782E64656275672E747261636528223C3C6A';
wwv_flow_imp.g_varchar2_table(191) := '736F6E526567696F6E2E64656C4172726179526F7722293B0A20207D0A0A20202F2A0A2020202A2020616464206120726F7720746F20616E2061727261790A20202A2F0A202066756E6374696F6E206164644172726179526F7728646174616974656D2C';
wwv_flow_imp.g_varchar2_table(192) := '20736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6164644172726179526F77222C20646174616974656D2C20736368656D61293B0A202020206C6574206C5F6974656D73203D2024282223';
wwv_flow_imp.g_varchar2_table(193) := '22202B2070526567696F6E4964202B2027205B69645E3D2227202B20646174616974656D202B20275F225D2E726F7727293B0A20202020636F6E7374206C5F6964203D206C5F6974656D732E6C656E6774682D310A20202020636F6E7374206C5F697465';
wwv_flow_imp.g_varchar2_table(194) := '6D203D206C5F6974656D735B6C5F69645D2E69643B0A202020206C6574206C5F67656E657261746564203D2067656E6572617465466F724F626A65637428736368656D612E6974656D732C207B7D2C20646174616974656D2C2027272B6C5F69642C2066';
wwv_flow_imp.g_varchar2_table(195) := '616C73652C20747275652C2074727565293B0A202020206C5F67656E6572617465642E68746D6C203D20273C64697620636C6173733D22726F77206A736F6E726567696F6E223E27202B206C5F67656E6572617465642E68746D6C202B20273C2F646976';
wwv_flow_imp.g_varchar2_table(196) := '3E273B0A202020202428272327202B206C5F6974656D20292E6166746572286C5F67656E6572617465642E68746D6C293B0A202020206174746163684F626A65637428646174616974656D202B20275F27202B206C5F69642C2027272C20736368656D61';
wwv_flow_imp.g_varchar2_table(197) := '2E6974656D732C2066616C73652C207B7D2C2074727565293B0A20202020617065782E6974656D2E617474616368282428272327202B2070526567696F6E496429293B0A20202020617065784861636B7328293B0A20202020617065782E64656275672E';
wwv_flow_imp.g_varchar2_table(198) := '747261636528223C3C6A736F6E526567696F6E2E6164644172726179526F7722293B0A20207D0A20202F2A0A2020202A20617474616368207468652067656E657261746564206669656C6473206F6620616E20617272617920696E20746865204A534F4E';
wwv_flow_imp.g_varchar2_table(199) := '2D736368656D6120746F20415045580A20202A2F0A202066756E6374696F6E20617474616368417272617928646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C20646174612C206E65774974656D297B200A20';
wwv_flow_imp.g_varchar2_table(200) := '202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6174746163684172726179222C20646174616974656D2C20736368656D612C20726561646F6E6C792C2064617461293B0A202020206C6574206C5F76616C7565203D';
wwv_flow_imp.g_varchar2_table(201) := '206A736F6E56616C7565324974656D28736368656D612C20646174612C206E65774974656D293B0A20202020736368656D61203D20736368656D617C7C7B7D3B0A20202020736368656D612E61706578203D20736368656D612E61706578207C7C207B7D';
wwv_flow_imp.g_varchar2_table(202) := '3B0A202020206C6574206974656D203D20736368656D612E6974656D737C7C7B7D3B0A2020202069662841727261792E69734172726179286974656D2E656E756D29297B20202F2F5B435F4A534F4E5F535452494E472C20435F4A534F4E5F494E544547';
wwv_flow_imp.g_varchar2_table(203) := '45522C20435F4A534F4E5F4E554D4245525D2E696E636C75646573286974656D2E7479706529297B0A202020202020696628617065782E656E762E415045585F56455253494F4E203E3D2732332E322E30272026262028736368656D612E617065782E69';
wwv_flow_imp.g_varchar2_table(204) := '74656D74797065203D3D20435F415045585F434F4D424F207C7C20286974656D2E61706578202626206974656D2E617065782E6974656D74797065203D3D20435F415045585F434F4D424F2929297B0A2020202020202020617065782E6974656D2E6372';
wwv_flow_imp.g_varchar2_table(205) := '6561746528646174616974656D2C207B6974656D5F747970653A2027636F6D626F626F78277D293B0A2020202020207D20656C7365207B0A2020202020202020617065782E7769646765742E636865636B626F78416E64526164696F282723272B206461';
wwv_flow_imp.g_varchar2_table(206) := '74616974656D2C27636865636B626F7827293B0A2020202020207D3B0A202020207D20656C7365207B0A20202020202064617461203D2064617461207C7C205B5D3B0A20202020202069662841727261792E69734172726179286461746129297B0A2020';
wwv_flow_imp.g_varchar2_table(207) := '2020202020202428272327202B20646174616974656D202B20275F43524541544527292E6F6E2827636C69636B272C2066756E6374696F6E286576297B206164644172726179526F7728646174616974656D2C20736368656D61293B7D293B0A20202020';
wwv_flow_imp.g_varchar2_table(208) := '20202020666F7228636F6E7374206920696E2064617461297B0A202020202020202020206174746163684F626A65637428646174616974656D202B20435F44454C494D49544552202B2069202C20707265766974656D2C206974656D2C20726561646F6E';
wwv_flow_imp.g_varchar2_table(209) := '6C792C20646174615B695D2C206E65774974656D29200A20202020202020207D0A2020202020202020202020202F2F2044656C65746520627574746F6E7320666F7220657665727920726F770A20202020202020202428275B69645E3D2227202B206461';
wwv_flow_imp.g_varchar2_table(210) := '74616974656D202B20275F225D20627574746F6E27292E6F6E2827636C69636B272C2066756E6374696F6E286576297B2064656C4172726179526F7728242874686973295B305D2E6964293B207D293B0A2020202020207D0A202020207D0A2020202069';
wwv_flow_imp.g_varchar2_table(211) := '6628726561646F6E6C7929207B0A202020202020617065782E6974656D28646174616974656D292E64697361626C6528293B200A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E61747461636841';
wwv_flow_imp.g_varchar2_table(212) := '7272617922293B0A20207D0A0A20202F2A0A2020202A20736574207468652056616C756573206F6620616E20617272617920696E20746865204A534F4E2D736368656D610A20202A2F0A202066756E6374696F6E20736574417272617956616C75657328';
wwv_flow_imp.g_varchar2_table(213) := '646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C2064617461297B200A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E736574417272617956616C756573222C206461';
wwv_flow_imp.g_varchar2_table(214) := '74616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C2064617461293B0A202020206C6574206C5F76616C7565203D206A736F6E56616C7565324974656D28736368656D612C20646174612C206E65774974656D293B0A';
wwv_flow_imp.g_varchar2_table(215) := '20202020736368656D612E61706578203D20736368656D612E61706578207C7C207B7D3B0A202020206C6574206974656D203D20736368656D612E6974656D737C7C7B7D3B0A2020202064617461203D20646174617C7C5B5D3B0A202020206966284172';
wwv_flow_imp.g_varchar2_table(216) := '7261792E69734172726179286461746129297B0A2020202020206966282041727261792E69734172726179286974656D2E656E756D29297B20202F2F207768656E20746865726520697320616E20656E756D2C207468697320617272617920666F722061';
wwv_flow_imp.g_varchar2_table(217) := '206D756C746973656C656374696F6E0A20202020202020206966285B435F4A534F4E5F535452494E472C20435F4A534F4E5F494E54454745522C20435F4A534F4E5F4E554D4245525D2E696E636C75646573286974656D2E7479706529297B0A20202020';
wwv_flow_imp.g_varchar2_table(218) := '202020202020617065782E64656275672E74726163652827736574417272617956616C7565733A272C206C5F76616C7565293B0A20202020202020202020617065782E6974656D28646174616974656D292E73657456616C7565286C5F76616C75657C7C';
wwv_flow_imp.g_varchar2_table(219) := '5B5D293B0A20202020202020202020696628726561646F6E6C7929207B0A202020202020202020202020617065782E6974656D28646174616974656D292E64697361626C6528293B0A202020202020202020207D200A20202020202020207D0A20202020';
wwv_flow_imp.g_varchar2_table(220) := '20207D20656C7365207B0A2020202020202020666F7228636F6E7374206920696E2064617461297B0A202020202020202020207365744F626A65637456616C75657328646174616974656D202B20435F44454C494D49544552202B20692C207072657669';
wwv_flow_imp.g_varchar2_table(221) := '74656D2C206974656D2C20726561646F6E6C792C20646174615B695D293B0A20202020202020207D0A2020202020207D0A202020207D20656C7365207B0A2020202020206C6F67536368656D614572726F72282764617461206D75737420626520616E20';
wwv_flow_imp.g_varchar2_table(222) := '6172726179272C2064617461293B0A202020207D0A0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E736574417272617956616C75657322293B0A20207D0A0A20202F2A0A2020202A2073657420746865205661';
wwv_flow_imp.g_varchar2_table(223) := '6C756573206F66206120616C6C206669656C647320696E20746865204A534F4E2D736368656D610A20202A2F0A202066756E6374696F6E207365744F626A65637456616C75657328646174616974656D2C20707265766974656D2C20736368656D612C20';
wwv_flow_imp.g_varchar2_table(224) := '726561646F6E6C792C2064617461297B200A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E7365744F626A65637456616C756573222C20646174616974656D2C20707265766974656D2C20736368656D612C2072';
wwv_flow_imp.g_varchar2_table(225) := '6561646F6E6C792C2064617461293B0A20202020736368656D612E61706578203D20736368656D612E61706578207C7C207B7D3B0A202020206C6574206C5F76616C7565203D206A736F6E56616C7565324974656D28736368656D612C20646174612C20';
wwv_flow_imp.g_varchar2_table(226) := '6E65774974656D293B0A2020202073776974636828736368656D612E74797065297B0A2020202063617365206E756C6C3A0A202020206361736520756E646566696E65643A0A2020202020206C6F67536368656D614572726F7228276D697373696E6720';
wwv_flow_imp.g_varchar2_table(227) := '2274797065222061742022257322272C20646174616974656D293B0A20202020627265616B3B0A202020206361736520435F4A534F4E5F4F424A4543543A0A202020202020696628747970656F6620736368656D612E70726F70657274696573203D3D20';
wwv_flow_imp.g_varchar2_table(228) := '276F626A65637427297B0A202020202020202064617461203D2064617461207C7C7B7D3B0A2020202020202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E70726F';
wwv_flow_imp.g_varchar2_table(229) := '7065727469657329297B0A20202020202020202020696628212827272B6C5F6E616D65292E7374617274735769746828275F2729297B2020202F2F2069676E6F72652070726F7065727469657320686176696E67206E616D6573207374617274696E6720';
wwv_flow_imp.g_varchar2_table(230) := '7769746820225F220A2020202020202020202020207365744F626A65637456616C7565732867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C20646174616974656D2C206C5F736368656D612C20736368656D612E726561644F';
wwv_flow_imp.g_varchar2_table(231) := '6E6C792C20646174615B6C5F6E616D655D293B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F41525241593A2020200A20202020202073657441727261';
wwv_flow_imp.g_varchar2_table(232) := '7956616C75657328646174616974656D2C20646174616974656D2C20736368656D612C20736368656D612E726561644F6E6C792C2064617461293B0A20202020627265616B3B0A20202020636173652027636F6E7374273A20202F2F206120636F6E7374';
wwv_flow_imp.g_varchar2_table(233) := '2076616C75650A202020206361736520276E756C6C273A20202F2F20656D707479206F626A65637420646F206E6F7468696E670A20202020627265616B3B0A202020206361736520435F4A534F4E5F424F4F4C45414E3A0A202020202020617065782E69';
wwv_flow_imp.g_varchar2_table(234) := '74656D28646174616974656D292E73657456616C7565286C5F76616C7565293B0A202020202020696628736368656D612E726561644F6E6C7929207B0A2020202020202020617065782E6974656D28646174616974656D292E64697361626C6528293B20';
wwv_flow_imp.g_varchar2_table(235) := '0A2020202020207D0A20202020627265616B3B0A2020202064656661756C743A0A202020202020696628736368656D612E726561644F6E6C79202626205B435F415045585F53544152524154494E475D2E696E636C7564657328736368656D612E617065';
wwv_flow_imp.g_varchar2_table(236) := '782E6974656D747970652929207B0A2020202020202020617065782E6974656D28646174616974656D292E64697361626C6528293B0A2020202020207D0A20202020202069662821736368656D612E726561644F6E6C79207C7C205B435F415045585F51';
wwv_flow_imp.g_varchar2_table(237) := '52434F44455D2E696E636C7564657328736368656D612E617065782E6974656D7479706529297B0A2020202020202020696628617065782E656E762E415045585F56455253494F4E3E3D2732322E322E3027207C7C20215B435F4A534F4E5F464F524D41';
wwv_flow_imp.g_varchar2_table(238) := '545F4441544554494D452C20435F4A534F4E5F464F524D41545F444154455D2E696E636C7564657328736368656D612E666F726D617429297B20202F2F206861636B20666F72206F6C64206A65742D646174612D7069636B65720A202020202020202020';
wwv_flow_imp.g_varchar2_table(239) := '20617065782E6974656D28646174616974656D292E73657456616C7565286C5F76616C7565293B0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020207D0A0A20202020696628736368656D612E6966297B0A2020202020';
wwv_flow_imp.g_varchar2_table(240) := '20696628736368656D612E7468656E29207B20202F2F20636F6E646974696F6E616C20736368656D61207468656E0A20202020202020206C65742070726F70657274696573203D20736368656D612E7468656E2E70726F706572746965737C7C7B7D3B0A';
wwv_flow_imp.g_varchar2_table(241) := '20202020202020207365744F626A65637456616C75657328646174616974656D2C20646174616974656D2C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C20736368656D612E7265';
wwv_flow_imp.g_varchar2_table(242) := '61644F6E6C792C2064617461293B0A2020202020207D0A0A202020202020696628736368656D612E656C736529207B202F2F20636F6E646974696F6E616C20736368656D6120656C73650A20202020202020206C65742070726F70657274696573203D20';
wwv_flow_imp.g_varchar2_table(243) := '736368656D612E656C73652E70726F706572746965737C7C7B7D3B0A20202020202020207365744F626A65637456616C75657328646174616974656D2C20646174616974656D2C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572';
wwv_flow_imp.g_varchar2_table(244) := '746965733A2070726F706572746965737D2C20736368656D612E726561644F6E6C792C2064617461293B0A2020202020207D0A202020207D0A0A0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7365744F626A';
wwv_flow_imp.g_varchar2_table(245) := '65637456616C75657322293B0A20207D0A0A20202F2A0A2020202A20204275696C642072656375736976656C792061206C697374206F6620616C6C206974656D73207573656420696E2074686520736368656D612E69662070726F70657274790A20202A';
wwv_flow_imp.g_varchar2_table(246) := '2F0A202066756E6374696F6E20676574436F6E646974696F6E616C4974656D7328636F6E646974696F6E297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E676574436F6E646974696F6E616C4974656D7322';
wwv_flow_imp.g_varchar2_table(247) := '2C20636F6E646974696F6E293B0A202020206C6574206C5F6974656D73203D205B5D3B0A20202020666F7228636F6E7374205B6C5F6669656C642C206C5F636F6D705D206F66204F626A6563742E656E747269657328636F6E646974696F6E29297B0A20';
wwv_flow_imp.g_varchar2_table(248) := '2020202020737769746368286C5F6669656C64297B0A2020202020206361736520435F4A534F4E5F52455155495245443A0A202020202020202069662841727261792E69734172726179286C5F636F6D7029297B0A202020202020202020206C5F697465';
wwv_flow_imp.g_varchar2_table(249) := '6D73203D206C5F636F6D703B0A20202020202020207D20656C7365207B0A20202020202020202020206C6F67536368656D614572726F722827636F6E646974696F6E616C20736368656D61272C206C5F6669656C642C20276D75737420626520616E2061';
wwv_flow_imp.g_varchar2_table(250) := '7272617927293B200A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F434F4E445F414C4C5F4F463A0A2020202020206361736520435F4A534F4E5F434F4E445F414E595F4F463A0A202020202020';
wwv_flow_imp.g_varchar2_table(251) := '2020666F7228636F6E7374206C5F736368656D61206F66206C5F636F6D70297B0A202020202020202020206C5F6974656D73203D206C5F6974656D732E636F6E63617428676574436F6E646974696F6E616C4974656D73286C5F736368656D6129293B0A';
wwv_flow_imp.g_varchar2_table(252) := '20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F434F4E445F4E4F543A0A2020202020206361736520435F4A534F4E5F50524F504552544945533A0A20202020202020206C5F6974656D73203D206C';
wwv_flow_imp.g_varchar2_table(253) := '5F6974656D732E636F6E63617428676574436F6E646974696F6E616C4974656D7328636F6E646974696F6E5B6C5F6669656C645D29293B0A202020202020627265616B3B0A20202020202064656661756C743A20202F2F20612073696D7072652070726F';
wwv_flow_imp.g_varchar2_table(254) := '7065727479207769746368203D3D206F7220494E0A20202020202020206C5F6974656D732E70757368286C5F6669656C64293B0A202020202020627265616B3B0A2020202020207D0A202020207D0A0A202020206C5F6974656D73203D2041727261792E';
wwv_flow_imp.g_varchar2_table(255) := '66726F6D286E657720536574286C5F6974656D7329293B202F2F2072656D6F7665206475706C6963617465730A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E676574436F6E646974696F6E616C4974656D7322';
wwv_flow_imp.g_varchar2_table(256) := '2C206C5F6974656D73293B0A2020202072657475726E286C5F6974656D73293B0A20207D0A20202F2A0A2020202A20617474616368207468652067656E657261746564206669656C6473206F6620746865204A534F4E2D7363686D6120746F2041504558';
wwv_flow_imp.g_varchar2_table(257) := '0A20202A2F0A202066756E6374696F6E206174746163684F626A65637428646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C20646174612C206E65774974656D297B200A20202020617065782E64656275672E';
wwv_flow_imp.g_varchar2_table(258) := '747261636528223E3E6A736F6E526567696F6E2E6174746163684F626A656374222C20646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C20646174612C206E65774974656D293B0A20202020736368656D6120';
wwv_flow_imp.g_varchar2_table(259) := '3D20736368656D617C7C7B7D3B0A20202020736368656D612E61706578203D20736368656D612E61706578207C7C207B7D3B0A0A2020202073776974636828736368656D612E74797065297B0A2020202063617365206E756C6C3A0A2020202063617365';
wwv_flow_imp.g_varchar2_table(260) := '20756E646566696E65643A0A2020202020206C6F67536368656D614572726F7228276D697373696E67202274797065222061742022257322272C20646174616974656D293B0A20202020627265616B3B0A202020206361736520435F4A534F4E5F4F424A';
wwv_flow_imp.g_varchar2_table(261) := '4543543A0A202020202020696628747970656F6620736368656D612E70726F70657274696573203D3D20276F626A65637427297B0A202020202020202064617461203D2064617461207C7C7B7D3B0A2020202020202020666F72286C6574205B6C5F6E61';
wwv_flow_imp.g_varchar2_table(262) := '6D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A20202020202020202020696628212827272B6C5F6E616D65292E7374617274735769746828275F2729297B2020202F';
wwv_flow_imp.g_varchar2_table(263) := '2F2069676E6F72652070726F7065727469657320686176696E67206E616D6573207374617274696E67207769746820225F220A2020202020202020202020206174746163684F626A6563742867656E4974656D6E616D6528646174616974656D2C206C5F';
wwv_flow_imp.g_varchar2_table(264) := '6E616D65292C20646174616974656D2C206C5F736368656D612C20736368656D612E726561644F6E6C792C20646174615B6C5F6E616D655D2C206E65774974656D293B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A2020';
wwv_flow_imp.g_varchar2_table(265) := '2020627265616B3B0A202020206361736520435F4A534F4E5F41525241593A2020200A202020202020617474616368417272617928646174616974656D2C20646174616974656D2C20736368656D612C20736368656D612E726561644F6E6C792C206461';
wwv_flow_imp.g_varchar2_table(266) := '74612C206E65774974656D293B0A20202020627265616B3B0A202020206361736520276E756C6C273A20202F2F20656D707479206F626A65637420646F206E6F7468696E670A20202020627265616B3B0A202020206361736520435F4A534F4E5F535452';
wwv_flow_imp.g_varchar2_table(267) := '494E473A0A20202020202069662821736368656D612E726561644F6E6C79297B0A20202020202020207377697463682028736368656D612E617065782E6974656D74797065297B0A20202020202020206361736520435F415045585F524144494F3A0A20';
wwv_flow_imp.g_varchar2_table(268) := '202020202020202020617065782E7769646765742E636865636B626F78416E64526164696F282723272B20646174616974656D2C27726164696F27293B0A2020202020202020627265616B3B0A20202020202020206361736520435F415045585F494D41';
wwv_flow_imp.g_varchar2_table(269) := '47453A20202F2F20646973706C6179206F6E6C790A20202020202020206361736520435F415045585F5152434F44453A202F2F20646973706C6179206F6E6C790A2020202020202020627265616B3B0A202020202020202064656661756C743A0A202020';
wwv_flow_imp.g_varchar2_table(270) := '20202020202020617065782E6974656D2E63726561746528646174616974656D2C207B7D293B0A2020202020202020627265616B3B0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F42';
wwv_flow_imp.g_varchar2_table(271) := '4F4F4C45414E3A0A20202020202073776974636828736368656D612E617065782E6974656D74797065297B0A2020202020206361736520435F415045585F5357495443483A0A2020202020202020617065782E7769646765742E7965734E6F2864617461';
wwv_flow_imp.g_varchar2_table(272) := '6974656D2C20275357495443485F434227293B200A202020202020627265616B3B0A2020202020206361736520435F415045585F524144494F3A0A2020202020202020617065782E7769646765742E636865636B626F78416E64526164696F282723272B';
wwv_flow_imp.g_varchar2_table(273) := '20646174616974656D2C27726164696F27293B0A202020202020627265616B3B0A2020202020206361736520435F415045585F53454C4543543A0A2020202020202020617065782E6974656D2E63726561746528646174616974656D2C207B7D293B200A';
wwv_flow_imp.g_varchar2_table(274) := '202020202020627265616B3B0A20202020202064656661756C743A0A2020202020202020617065782E6974656D2E63726561746528646174616974656D2C207B7D293B200A202020202020627265616B3B0A2020202020207D0A0A202020202020696628';
wwv_flow_imp.g_varchar2_table(275) := '736368656D612E726561644F6E6C7929207B0A2020202020202020617065782E6974656D28646174616974656D292E64697361626C6528293B200A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F4E554D424552';
wwv_flow_imp.g_varchar2_table(276) := '3A0A202020206361736520435F4A534F4E5F494E54454745523A0A20202020202073776974636828736368656D612E617065782E6974656D74797065297B0A2020202020206361736520435F415045585F50435447524150483A20202F2F20646F206E6F';
wwv_flow_imp.g_varchar2_table(277) := '74206174746163682070637467726170682C2069742077696C6C2064697374726F792074686520646973706C61790A202020202020627265616B3B0A2020202020206361736520435F415045585F53544152524154494E473A0A20202020202020206170';
wwv_flow_imp.g_varchar2_table(278) := '65782E7769646765742E73746172526174696E6728646174616974656D2C207B73686F77436C656172427574746F6E3A2066616C73652C206E756D53746172733A20736368656D612E6D6178696D756D7D293B200A0A202020202020627265616B3B0A20';
wwv_flow_imp.g_varchar2_table(279) := '202020202064656661756C743A202020202020200A202020202020202069662821736368656D612E726561644F6E6C79297B0A20202020202020202020617065782E6974656D2E63726561746528646174616974656D2C207B7D293B0A20202020202020';
wwv_flow_imp.g_varchar2_table(280) := '207D0A202020202020627265616B3B0A2020202020207D0A20202020627265616B3B0A2020202064656661756C743A0A20202020202069662821435F4A534F4E5F434F4E535420696E20736368656D6129207B20202F2F206120636F6E73742076616C75';
wwv_flow_imp.g_varchar2_table(281) := '6520646F6573206E2774206E656564206120747970652C200A2020202020202020617065782E64656275672E6572726F7228276974656D207769746820756E646566696E65642074797065272C20646174616974656D2C20736368656D612E7479706529';
wwv_flow_imp.g_varchar2_table(282) := '3B0A2020202020207D0A20202020627265616B3B0A202020207D0A0A20202020696628736368656D612E6966297B0A2020202020206C6574206C5F6576616C203D206576616C45787072657373696F6E28736368656D612E69662C2064617461293B0A20';
wwv_flow_imp.g_varchar2_table(283) := '2020202020696628736368656D612E7468656E29207B20202F2F20636F6E646974696F6E616C20736368656D61207468656E0A20202020202020206C65742070726F70657274696573203D20736368656D612E7468656E2E70726F706572746965737C7C';
wwv_flow_imp.g_varchar2_table(284) := '7B7D3B0A20202020202020206174746163684F626A65637428646174616974656D2C20646174616974656D2C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C20736368656D612E72';
wwv_flow_imp.g_varchar2_table(285) := '6561644F6E6C792C20646174612C206E65774974656D293B0A2020202020202020666F7228636F6E7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E74726965732870726F7065727469657329297B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(286) := '202070726F70616761746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6974656D2C206C5F6576616C3D3D3D74727565293B0A20202020202020207D0A2020202020207D0A0A20202020202069662873';
wwv_flow_imp.g_varchar2_table(287) := '6368656D612E656C736529207B202F2F20636F6E646974696F6E616C20736368656D6120656C73650A20202020202020206C65742070726F70657274696573203D20736368656D612E656C73652E70726F706572746965737C7C7B7D3B0A202020202020';
wwv_flow_imp.g_varchar2_table(288) := '20206174746163684F626A65637428646174616974656D2C20646174616974656D2C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C20736368656D612E726561644F6E6C792C2064';
wwv_flow_imp.g_varchar2_table(289) := '6174612C206E65774974656D293B0A2020202020202020666F7228636F6E7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E74726965732870726F7065727469657329297B0A2020202020202020202070726F7061676174';
wwv_flow_imp.g_varchar2_table(290) := '6553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6974656D2C206C5F6576616C3D3D3D66616C7365293B0A20202020202020207D0A2020202020207D0A202020207D0A0A20202020696628736368656D61';
wwv_flow_imp.g_varchar2_table(291) := '2E6966297B20202F2F20636F6E646974696F6E616C20736368656D612C20616464206576656E74206F6E206974656D730A2020202020206C6574206C5F646570656E644F6E203D20676574436F6E646974696F6E616C4974656D7328736368656D612E69';
wwv_flow_imp.g_varchar2_table(292) := '66293B0A2020202020202F2F204F626A6563742E6B65797328736368656D612E69662E70726F70657274696573293B0A202020202020666F72286C6574206C5F6E616D65206F66206C5F646570656E644F6E297B0A2020202020202020636F6E736F6C65';
wwv_flow_imp.g_varchar2_table(293) := '2E6C6F6728276F6E4368616E6765272C20646174616974656D2C206C5F6E616D65293B0A20202020202020202428222322202B2067656E4974656D6E616D6528646174616974656D2C206C5F6E616D6529292E6F6E28276368616E6765272C2066756E63';
wwv_flow_imp.g_varchar2_table(294) := '74696F6E28297B0A20202020202020202020636F6E736F6C652E6C6F672827636C69636B6564206F6E272C20646174616974656D2C206C5F6E616D65293B0A20202020202020202020696628736368656D612E6966297B20202F2F20636C69636B206F6E';
wwv_flow_imp.g_varchar2_table(295) := '206120636F6E646974696F6E616C206974656D0A2020202020202020202020206C6574206C5F6A736F6E203D206765744461746128646174616974656D2C2027272C20736368656D612C207B7D293B0A202020202020202020202020636F6E736F6C652E';
wwv_flow_imp.g_varchar2_table(296) := '6C6F6728274556414C272C206C5F6A736F6E293B0A2020202020202020202020206C6574206C5F6576616C203D206576616C45787072657373696F6E28736368656D612E69662C206C5F6A736F6E293B0A20202020202020202020202069662873636865';
wwv_flow_imp.g_varchar2_table(297) := '6D612E7468656E297B200A20202020202020202020202020206C65742070726F70657274696573203D20736368656D612E7468656E2E70726F706572746965737C7C7B7D3B0A2020202020202020202020202020666F7228636F6E7374205B6C5F6E616D';
wwv_flow_imp.g_varchar2_table(298) := '652C6C5F6974656D5D206F66204F626A6563742E656E74726965732870726F7065727469657329297B0A2020202020202020202020202020202070726F70616761746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65';
wwv_flow_imp.g_varchar2_table(299) := '292C206C5F6974656D2C206C5F6576616C3D3D74727565293B0A20202020202020202020202020207D0A2020202020202020202020207D0A0A202020202020202020202020696628736368656D612E656C7365297B200A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(300) := '206C65742070726F70657274696573203D20736368656D612E656C73652E70726F706572746965737C7C7B7D3B0A2020202020202020202020202020666F7228636F6E7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E74';
wwv_flow_imp.g_varchar2_table(301) := '726965732870726F7065727469657329297B0A2020202020202020202020202020202070726F70616761746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6974656D2C206C5F6576616C3D3D66616C73';
wwv_flow_imp.g_varchar2_table(302) := '65293B0A20202020202020202020202020207D0A2020202020202020202020207D2020202020202020202020202020202020202020202020202020202020200A202020202020202020207D0A20202020202020207D293B0A2020202020207D0A20202020';
wwv_flow_imp.g_varchar2_table(303) := '7D0A2020202069662841727261792E6973417272617928736368656D612E646570656E64656E7452657175697265642929207B200A2020202020202020202020202F2F20746865206974656D2068617320646570656E64656E74206974656D732C20736F';
wwv_flow_imp.g_varchar2_table(304) := '206164642063616C6C6261636B206F6E2064617461206368616E67650A2020202020202020666F7228636F6E7374206974656D206F6620736368656D612E646570656E64656E74526571756972656429207B0A202020202020202020206C6574206C5F69';
wwv_flow_imp.g_varchar2_table(305) := '74656D203D2067656E4974656D6E616D6528707265766974656D2C206974656D293B0A202020202020202020206C6574206C5F76616C7565203D20646174613B0A2020202020202020202070726F7061676174655265717569726564286C5F6974656D2C';
wwv_flow_imp.g_varchar2_table(306) := '20736368656D615B6974656D5D2C206C5F76616C7565202626206C5F76616C75652E6C656E6774683E30293B0A20202020202020207D0A20202020202020202428222322202B20646174616974656D292E6F6E28276368616E6765272C2066756E637469';
wwv_flow_imp.g_varchar2_table(307) := '6F6E28297B0A20202020202020202020666F7228636F6E7374206974656D206F6620736368656D612E646570656E64656E74526571756972656429207B0A2020202020202020202020206C6574206C5F6974656D203D2067656E4974656D6E616D652870';
wwv_flow_imp.g_varchar2_table(308) := '7265766974656D2C206974656D290A2020202020202020202020206C6574206C5F76616C7565203D20242874686973292E76616C28293B0A202020202020202020202020636F6E736F6C652E7761726E2827646570656E6473272C20736368656D615B69';
wwv_flow_imp.g_varchar2_table(309) := '74656D5D2C206C5F76616C7565293B0A20202020202020202020202070726F7061676174655265717569726564286C5F6974656D2C20736368656D615B6974656D5D2C206C5F76616C7565202626206C5F76616C75652E6C656E6774683E30293B0A2020';
wwv_flow_imp.g_varchar2_table(310) := '20202020202020207D3B0A20202020202020207D293B0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6174746163684F626A65637422293B0A20207D0A0A20202F2A0A2020202A207265747269';
wwv_flow_imp.g_varchar2_table(311) := '657665206461746120666F722055492D6669656C6473206F66204A534F4E2D736368656D6120616E64206275696C64204A534F4E2C206F6C644A736F6E20697320726571756972656420746F20737570706F7274206669656C647769736520726561646F';
wwv_flow_imp.g_varchar2_table(312) := '6E6C790A20202A2F0A202066756E6374696F6E206765744461746128646174616974656D2C206E616D652C20736368656D612C206F6C644A736F6E297B200A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6765';
wwv_flow_imp.g_varchar2_table(313) := '7444617461222C20646174616974656D2C206E616D652C20736368656D612C206F6C644A736F6E293B0A202020206C6574206C5F6A736F6E203D207B7D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A2020';
wwv_flow_imp.g_varchar2_table(314) := '2020696628215B435F4A534F4E5F41525241592C20435F4A534F4E5F4F424A4543545D2E696E636C7564657328736368656D612E747970652920262620736368656D612E726561644F6E6C79297B202F2F207768656E2073696D706C6520617474726962';
wwv_flow_imp.g_varchar2_table(315) := '75746520616D6E6420726561646F6E6C79206E6F206461746120636F756C6420626520726561642C206B65657020746865206F6C6420646174610A2020202020206C5F6A736F6E203D206F6C644A736F6E3B0A202020207D20656C7365207B0A20202020';
wwv_flow_imp.g_varchar2_table(316) := '20206C5F6A736F6E203D20736368656D612E6164646974696F6E616C50726F706572746965733F6F6C644A736F6E3A7B7D3B20202F2F207768656E20746865726520617265206164646974696F6E616C50726F706572746965732C206B65657020746865';
wwv_flow_imp.g_varchar2_table(317) := '72652076616C7565730A20202020202073776974636828736368656D612E74797065297B0A2020202020206361736520435F4A534F4E5F4F424A4543543A0A202020202020202069662821286F6C644A736F6E20696E7374616E63656F66204F626A6563';
wwv_flow_imp.g_varchar2_table(318) := '742929207B0A20202020202020202020617065782E64656275672E74726163652827536368656D61206D69736D617463683A272C20736368656D612E747970652C20274A534F4E3A272C206F6C644A736F6E2C20276D75737420626520616E206F626A65';
wwv_flow_imp.g_varchar2_table(319) := '637427293B0A202020202020202020206C5F6A736F6E203D207B7D3B0A202020202020202020206F6C644A736F6E203D7B7D3B0A20202020202020207D0A2020202020202020696628736368656D612E70726F70657274696573297B0A20202020202020';
wwv_flow_imp.g_varchar2_table(320) := '202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A2020202020202020202020206C5F6A736F6E5B6C5F6E616D655D3D67657444';
wwv_flow_imp.g_varchar2_table(321) := '6174612867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6E616D652C206C5F736368656D612C206F6C644A736F6E5B6C5F6E616D655D293B0A202020202020202020207D0A20202020202020207D0A20202020202062';
wwv_flow_imp.g_varchar2_table(322) := '7265616B3B0A2020202020206361736520276E756C6C273A0A20202020202020206C5F6A736F6E203D206E756C6C3B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F41525241593A207B200A2020202020202020202073';
wwv_flow_imp.g_varchar2_table(323) := '6368656D612E6974656D73203D20736368656D612E6974656D73207C7C207B7D3B0A202020202020202069662841727261792E6973417272617928736368656D612E6974656D732E656E756D29297B20202F2F20617272617920666F72206D756C746970';
wwv_flow_imp.g_varchar2_table(324) := '6C652073656C656374696F6E0A202020202020202020206C6574206C5F64617461203D20617065782E6974656D28646174616974656D292E67657456616C756528293B0A202020202020202020206C5F6A736F6E203D206974656D56616C7565324A736F';
wwv_flow_imp.g_varchar2_table(325) := '6E28736368656D612C206C5F64617461293B0A20202020202020207D20656C7365207B0A202020202020202020206C657420693D303B0A202020202020202020206C6574206C5F666F756E64203D2066616C73653B0A202020202020202020206C5F6A73';
wwv_flow_imp.g_varchar2_table(326) := '6F6E203D205B5D3B0A202020202020202020206F6C644A736F6E203D206F6C644A736F6E7C7C5B5D3B0A202020202020202020206C6574206C5F726F7773203D202428222322202B2070526567696F6E4964202B2027205B69645E3D2227202B20646174';
wwv_flow_imp.g_varchar2_table(327) := '616974656D202B20275F225D2E726F7727293B0A20202020202020202020666F7228636F6E7374206C5F726F77206F66206C5F726F7773297B0A202020202020202020202020636F6E7374206C5F6964203D2024286C5F726F77295B305D2E69642E7265';
wwv_flow_imp.g_varchar2_table(328) := '706C616365282F5F434F4E5441494E4552242F2C2727293B0A202020202020202020202020636F6E7374206C5F64617461203D2067657444617461286C5F69642C2027272C20736368656D612E6974656D732C207B7D293B0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(329) := '206966282169734F626A656374456D707479286C5F6461746129297B20202F2F20646F6E27742061646420656D70747920726F77730A20202020202020202020202020206C5F6A736F6E2E70757368286C5F64617461293B0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(330) := '207D0A202020202020202020207D0A20202020202020207D0A2020202020207D0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F535452494E473A0A2020202020206361736520435F4A534F4E5F494E54454745523A0A20';
wwv_flow_imp.g_varchar2_table(331) := '20202020206361736520435F4A534F4E5F4E554D4245523A0A2020202020206361736520435F4A534F4E5F424F4F4C45414E3A7B0A20202020202020206C6574206C5F64617461203D20617065782E6974656D28646174616974656D292E67657456616C';
wwv_flow_imp.g_varchar2_table(332) := '756528293B0A20202020202020206C6574206C5F76616C7565203D206974656D56616C7565324A736F6E28736368656D612C206C5F64617461293B0A20202020202020206966286C5F76616C7565213D6E756C6C297B0A202020202020202020206C5F6A';
wwv_flow_imp.g_varchar2_table(333) := '736F6E203D206C5F76616C75653B0A20202020202020207D20656C7365207B0A202020202020202020206C5F6A736F6E203D206E756C6C3B0A20202020202020207D0A2F2F202D2D2D2D204841434B20202D2D2D2D2D2D2D0A2020202020202020696628';
wwv_flow_imp.g_varchar2_table(334) := '2827272B6E616D65292E7374617274735769746828275F2729297B0A202020202020202020206C5F6A736F6E203D206F6C644A736F6E3B200A20202020202020207D0A2020202020207D0A202020202020627265616B3B0A20202020202064656661756C';
wwv_flow_imp.g_varchar2_table(335) := '743A0A2020202020202020696628435F4A534F4E5F434F4E535420696E20736368656D6129207B20202F2F206120636F6E737420646F65736E277420686176652061206974656D20696E207468652055490A202020202020202020206C5F6A736F6E203D';
wwv_flow_imp.g_varchar2_table(336) := '20736368656D612E636F6E73743B0A20202020202020207D0A202020202020627265616B3B0A2020202020207D0A202020207D0A0A20202020696628736368656D612E6966297B20202F2F207468657265206973206120636F6E646974696F6E616C2073';
wwv_flow_imp.g_varchar2_table(337) := '6368656D610A20202020202020202F2F2067657474696E6720746865206461746120646570656E6473206F6E20746865206576616C756174696F6E206F662074686520696620636C617573652E0A2020202020206C6574206C5F6576616C203D20657661';
wwv_flow_imp.g_varchar2_table(338) := '6C45787072657373696F6E28736368656D612E69662C206C5F6A736F6E293B0A202020202020696628736368656D612E7468656E202626206C5F6576616C3D3D74727565297B0A20202020202020206C65742070726F70657274696573203D2073636865';
wwv_flow_imp.g_varchar2_table(339) := '6D612E7468656E2E70726F706572746965737C7C7B7D3B0A20202020202020206C6574206C5F6E65774A736F6E203D206765744461746128646174616974656D2C2027272C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F7065727469';
wwv_flow_imp.g_varchar2_table(340) := '65733A2070726F706572746965737D2C206F6C644A736F6E293B0A20202020202020202F2F20636F6E736F6C652E646972286C5F6E65774A736F6E293B0A20202020202020202F2F206D6572676520636F6E646974696F6E616C20696E70757420696E74';
wwv_flow_imp.g_varchar2_table(341) := '6F2063757272656E7420726573756C740A20202020202020206C5F6A736F6E203D207B2E2E2E6C5F6A736F6E2C202E2E2E6C5F6E65774A736F6E7D3B0A2020202020207D0A0A202020202020696628736368656D612E656C7365202626206C5F6576616C';
wwv_flow_imp.g_varchar2_table(342) := '3D3D66616C7365297B0A20202020202020206C65742070726F70657274696573203D20736368656D612E656C73652E70726F706572746965737C7C7B7D3B0A20202020202020206C6574206C5F6E65774A736F6E203D2067657444617461286461746169';
wwv_flow_imp.g_varchar2_table(343) := '74656D2C2027272C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C206F6C644A736F6E293B0A20202020202020202F2F20636F6E736F6C652E646972286C5F6E65774A736F6E293B';
wwv_flow_imp.g_varchar2_table(344) := '0A20202020202020202F2F206D6572676520636F6E646974696F6E616C20696E70757420696E746F2063757272656E7420726573756C740A20202020202020206C5F6A736F6E203D207B2E2E2E6C5F6A736F6E2C202E2E2E6C5F6E65774A736F6E7D3B0A';
wwv_flow_imp.g_varchar2_table(345) := '2020202020207D0A0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67657444617461222C206C5F6A736F6E293B0A2020202072657475726E286C5F6A736F6E293B0A20207D0A0A20202F2A0A20';
wwv_flow_imp.g_varchar2_table(346) := '20202A2067656E65726174657320746865206C6162656C2066726F6D20746865206F626A6563746E616D65206F722075736520616E206578697374696E67206C6162656C0A20202A2F0A202066756E6374696F6E2067656E65726174654C6162656C286E';
wwv_flow_imp.g_varchar2_table(347) := '616D652C20736368656D61297B0A202020206C6574206C5F6C6162656C3D27273B0A20202020696628736368656D612E6170657820262620435F415045585F4C4142454C20696E20736368656D612E61706578297B0A2020202020206C5F6C6162656C20';
wwv_flow_imp.g_varchar2_table(348) := '3D20736368656D612E617065782E6C6162656C7C7C27273B0A202020207D20656C7365207B20200A2020202020202F2F20666F722064656661756C74206C6162656C207265706C616365202D5F206279206120626C616E6B20616E642073657420666972';
wwv_flow_imp.g_varchar2_table(349) := '73742063686172206F66206561636820776F726420696E207570706572636173650A2020202020206C5F6C6162656C203D20206E616D652E746F4C6F7765724361736528290A2020202020202020202020202020202020202020202E73706C6974282F20';
wwv_flow_imp.g_varchar2_table(350) := '7C5C2D7C5F2F290A2020202020202020202020202020202020202020202E6D617028287329203D3E20732E6368617241742830292E746F5570706572436173652829202B20732E737562737472696E67283129290A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(351) := '2020202020202E6A6F696E28272027293B0A202020207D0A2020202072657475726E286C5F6C6162656C293B0A20207D0A0A20202F2A0A2020202A2070726F7061676174652074686520737562736368656D617320666F72202224726566220A20202A2F';
wwv_flow_imp.g_varchar2_table(352) := '0A202066756E6374696F6E2070726F7061676174655265667328736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F70616761746552656673222C20736368656D61293B0A2020202069';
wwv_flow_imp.g_varchar2_table(353) := '6628736368656D6120262620747970656F6620736368656D61203D3D20276F626A65637427297B0A202020202020696628736368656D615B435F4A534F4E5F5245465D20262620747970656F6620736368656D615B435F4A534F4E5F5245465D203D3D20';
wwv_flow_imp.g_varchar2_table(354) := '27737472696E6727297B0A20202020202020206C6574206A736F6E706174683D736368656D615B435F4A534F4E5F5245465D3B0A20202020202020206966286A736F6E706174682E737562737472696E6728302C3229203D3D27232F27297B0A20202020';
wwv_flow_imp.g_varchar2_table(355) := '2020202020206C65742067657456616C7565203D20286F2C207029203D3E20702E7265706C6163652827232F272C2727292E73706C697428272F27292E7265647563652828722C206B29203D3E20725B6B5D2C206F293B0A202020202020202020207472';
wwv_flow_imp.g_varchar2_table(356) := '797B0A2020202020202020202020206C6574206E6577536368656D61203D2067657456616C756528704F7074696F6E732E736368656D612C206A736F6E70617468293B0A2020202020202020202020206966286E6577536368656D61297B0A2020202020';
wwv_flow_imp.g_varchar2_table(357) := '2020202020202020204F626A6563742E61737369676E28736368656D612C206E6577536368656D61293B0A2020202020202020202020207D20656C7365207B0A20202020202020202020202020206C6F67536368656D614572726F722827756E6B6E6F77';
wwv_flow_imp.g_varchar2_table(358) := '6E272C20435F4A534F4E5F5245462C20736368656D615B435F4A534F4E5F5245465D290A2020202020202020202020207D0A20202020202020202020202064656C65746528736368656D615B435F4A534F4E5F5245465D293B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(359) := '7D2063617463682865297B0A202020202020202020202020617065782E64656275672E6572726F7228272464656673206E6F7420666F756E643A20272C206A736F6E70617468293B0A202020202020202020207D0A20202020202020207D0A2020202020';
wwv_flow_imp.g_varchar2_table(360) := '207D20656C7365207B0A20202020202020202F2F2070726F63657373207265637572736976656C79200A202020202020202069662841727261792E6973417272617928736368656D6129297B200A20202020202020202020666F7228636F6E7374206920';
wwv_flow_imp.g_varchar2_table(361) := '696E20736368656D61297B0A202020202020202020202020736368656D615B695D203D2070726F7061676174655265667328736368656D615B695D293B0A202020202020202020207D2020200A20202020202020207D20656C7365207B0A202020202020';
wwv_flow_imp.g_varchar2_table(362) := '20202020666F7228636F6E7374205B6C5F6B65792C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D6129297B0A202020202020202020202020736368656D615B6C5F6B65795D203D2070726F706167617465526566';
wwv_flow_imp.g_varchar2_table(363) := '73286C5F736368656D61293B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E70726F70616761746552656673222C20';
wwv_flow_imp.g_varchar2_table(364) := '4A534F4E2E737472696E6769667928736368656D6129293B0A2020202072657475726E20736368656D613B0A20207D0A20202F2A0A2020202A2070726F7061676174652076616C756573206F66204A534F4E2D736368656D612070726F70657274696573';
wwv_flow_imp.g_varchar2_table(365) := '20726563757369766520696E746F2070726F706572746965732F6974656D730A2020202A2053657420736F6D652070726F7065727469657320646570656E64696E67206F6E206F74686572730A2020202A20536574206D697373696E672070726F706572';
wwv_flow_imp.g_varchar2_table(366) := '7469657320746F20726561736F6E61626C652076616C75657320746F2061766F6964206572726F727320696E206C61746572207374616765730A20202A2F0A202066756E6374696F6E2070726F70616761746550726F7065727469657328736368656D61';
wwv_flow_imp.g_varchar2_table(367) := '2C206C6576656C2C20726561646F6E6C792C2077726974656F6E6C792C206164646974696F6E616C50726F706572746965732C20636F6E646974696F6E616C297B200A20202020736368656D61203D20736368656D61207C7C207B7D3B0A202020207363';
wwv_flow_imp.g_varchar2_table(368) := '68656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020736368656D612E617065782E636F6E646974696F6E616C203D20636F6E646974696F6E616C3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E';
wwv_flow_imp.g_varchar2_table(369) := '526567696F6E2E70726F70616761746550726F70657274696573222C206C6576656C2C20736368656D612C20726561646F6E6C792C2077726974656F6E6C792C206164646974696F6E616C50726F706572746965732C20636F6E646974696F6E616C293B';
wwv_flow_imp.g_varchar2_table(370) := '0A202020206C6576656C2B2B3B0A202020206966286C6576656C3E3230297B0A202020202020617065782E64656275672E6572726F72282770726F70616761746550726F7065727469657320726563757273696F6E272C206C6576656C2C2027746F2064';
wwv_flow_imp.g_varchar2_table(371) := '65657027290A20202020202072657475726E3B0A202020207D0A0A20202020696628736368656D612E646570656E64656E74536368656D6173297B202F2F20636F6E7665727420646570656E64656E7420736368656D617320746F2049462F454C53452C';
wwv_flow_imp.g_varchar2_table(372) := '2072657175697265642070726F706572747920746F20646570656E64656E7452657175697265640A2020202020206C6574206C5F6B657973203D204F626A6563742E6B65797328736368656D612E646570656E64656E74536368656D6173293B0A202020';
wwv_flow_imp.g_varchar2_table(373) := '2020206966286C5F6B6579732E6C656E6774683D3D31297B0A2020202020202020736368656D612E6966203D207B202270726F70657274696573223A207B7D7D3B0A2020202020202020736368656D612E69662E70726F706572746965735B6C5F6B6579';
wwv_flow_imp.g_varchar2_table(374) := '735B305D5D203D207B22636F6E7374223A206E756C6C7D3B0A2020202020202020736368656D612E656C7365203D207B202270726F70657274696573223A207B7D7D3B0A2020202020202020736368656D612E656C73652E70726F70657274696573203D';
wwv_flow_imp.g_varchar2_table(375) := '20736368656D612E646570656E64656E74536368656D61735B6C5F6B6579735B305D5D2E70726F706572746965733B0A2020202020202020636F6E7374206C5F7265717569726564203D20736368656D612E646570656E64656E74536368656D61735B6C';
wwv_flow_imp.g_varchar2_table(376) := '5F6B6579735B305D5D2E72657175697265643B0A202020202020202069662841727261792E69734172726179286C5F726571756972656429297B0A20202020202020202020736368656D612E646570656E64656E7452657175697265643D5B5D3B0A2020';
wwv_flow_imp.g_varchar2_table(377) := '2020202020202020736368656D612E646570656E64656E7452657175697265645B6C5F6B6579735B305D5D203D206C5F72657175697265643B0A20202020202020207D0A202020202020202064656C65746520736368656D612E646570656E64656E7453';
wwv_flow_imp.g_varchar2_table(378) := '6368656D61733B0A2020202020207D20656C7365207B0A2020202020202020617065782E64656275672E6572726F722827646570656E64656E74536368656D61733A206E756D626572206F66206F626A6563747320213D203127293B0A2020202020207D';
wwv_flow_imp.g_varchar2_table(379) := '0A202020207D0A0A20202020202020202F2F2070726F7061676174652074686520646570656E64656E745265717569726564206469726563746C7920746F207468652070726F70657274696573200A20202020696628736368656D612E747970653D3D43';
wwv_flow_imp.g_varchar2_table(380) := '5F4A534F4E5F4152524159297B200A202020202020696628736368656D612E6974656D73297B0A2020202020202020206966284F626A6563742E6B65797328736368656D612E6974656D73292E6C656E6774683D3D30297B20202F2F206974656D732073';
wwv_flow_imp.g_varchar2_table(381) := '686F756C642068617665206174206C65617374206F6E6520656E7472790A2020202020202020202020617065782E64656275672E7761726E282761727261792073686F756C642068617665206174206C656173742031206974656D7327290A2020202020';
wwv_flow_imp.g_varchar2_table(382) := '202020207D0A202020202020207D20656C7365207B0A20202020202020206C6F67536368656D614572726F7228276D697373696E6720226974656D732220666F72202274797065223A2022617272617922272920200A2020202020202020736368656D61';
wwv_flow_imp.g_varchar2_table(383) := '2E6974656D733D7B7D3B0A2020202020207D0A202020207D0A0A20202020202020202F2F2070726F7061676174652074686520646570656E64656E745265717569726564206469726563746C7920746F207468652070726F70657274696573200A202020';
wwv_flow_imp.g_varchar2_table(384) := '20696628736368656D612E747970653D3D435F4A534F4E5F4F424A454354297B200A202020202020696628736368656D612E70726F70657274696573297B0A20202020202020206966284F626A6563742E6B65797328736368656D612E70726F70657274';
wwv_flow_imp.g_varchar2_table(385) := '696573292E6C656E6774683D3D30297B20202F2F206974656D732073686F756C642068617665206174206C65617374206F6E6520656E7472790A20202020202020202020617065782E64656275672E7761726E28276F626A6563742073686F756C642068';
wwv_flow_imp.g_varchar2_table(386) := '617665206174206C6561737420312070726F706572747927290A20202020202020207D0A2020202020207D20656C7365207B0A20202020202020206C6F67536368656D614572726F7228276D697373696E67202270726F706572746965732220666F7220';
wwv_flow_imp.g_varchar2_table(387) := '2274797065223A20226F626A6563742227293B0A2020202020202020736368656D612E70726F706572746965733D7B7D3B200A2020202020207D0A202020202020736368656D612E6164646974696F6E616C50726F70657274696573203D20626F6F6C65';
wwv_flow_imp.g_varchar2_table(388) := '616E49664E6F7453657428736368656D612E6164646974696F6E616C50726F706572746965732C206164646974696F6E616C50726F70657274696573293B0A202020202020696628736368656D612E646570656E64656E745265717569726564297B0A20';
wwv_flow_imp.g_varchar2_table(389) := '20202020202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E646570656E64656E74526571756972656429297B0A202020202020202020207472797B0A2020202020';
wwv_flow_imp.g_varchar2_table(390) := '20202020202020736368656D612E70726F706572746965735B6C5F6E616D655D2E646570656E64656E745265717569726564203D206C5F736368656D613B0A202020202020202020207D63617463682865297B0A20202020202020202020202061706578';
wwv_flow_imp.g_varchar2_table(391) := '2E64656275672E6572726F722827646570656E64656E745265717569726564206E6F7420666F756E643A20272C206C5F6E616D652C2065293B2020202020202020202020200A202020202020202020207D0A20202020202020207D0A2020202020207D20';
wwv_flow_imp.g_varchar2_table(392) := '200A202020207D0A0A0A202020202F2F2063616C63206D696E696D756D2F6D6178696D756D0A20202020696628736368656D612E6D696E696D756D297B0A202020202020736368656D612E6D696E696D756D203D20676574436F6E7374616E7428736368';
wwv_flow_imp.g_varchar2_table(393) := '656D612E666F726D61742C20736368656D612E6D696E696D756D2C2066616C7365293B0A202020207D0A20202020696628736368656D612E6D6178696D756D297B0A202020202020736368656D612E6D6178696D756D203D20676574436F6E7374616E74';
wwv_flow_imp.g_varchar2_table(394) := '28736368656D612E666F726D61742C20736368656D612E6D6178696D756D2C2066616C7365293B0A202020207D0A202020200A20202020696628736368656D612E7061747465726E20262621736368656D612E7479706529207B20202F2F207768656E20';
wwv_flow_imp.g_varchar2_table(395) := '7061747465726E206973207365742074797065207468652064656661756C74206973202274797065223A2022737472696E67220A202020202020736368656D612E74797065203D20435F4A534F4E5F535452494E473B0A202020207D0A0A202020202F2F';
wwv_flow_imp.g_varchar2_table(396) := '204F7261636C6520737065636966696320534348454D4120657874656E73696F6E730A20202020696628736368656D612E70726F7065727469657320262620736368656D612E70726F706572746965732E64625072696D6172794B6579297B20202F2F20';
wwv_flow_imp.g_varchar2_table(397) := '72656D6F76652064625072696D6172794B65792C206974277320612070726F706572747920616E6420776F756C6420736F2062652068616E646C656420617320656E20696E707574206974656D0A20202020202064656C65746520736368656D612E7072';
wwv_flow_imp.g_varchar2_table(398) := '6F706572746965732E64625072696D6172794B65793B0A202020207D0A0A20202020696628736368656D612E657874656E6465645479706529207B2020202F2F204F7261636C652073706563696669632064617461747970650A20202020202069662841';
wwv_flow_imp.g_varchar2_table(399) := '727261792E6973417272617928736368656D612E657874656E6465645479706529297B202020202F2F20666F72206E756C6C61626C65202070726F70657274696573206974206973205B2274797065222C206E756C6C5D0A202020202020202069662873';
wwv_flow_imp.g_varchar2_table(400) := '6368656D612E657874656E646564547970652E696E636C75646573286E756C6C29297B20202F2F200A202020202020202020202F2F20636F6E736F6C652E6C6F67282752656D6F7665206E756C6C2066726F6D272C20736368656D612E657874656E6465';
wwv_flow_imp.g_varchar2_table(401) := '6454797065293B0A20202020202020207D0A2020202020202020696628736368656D612E657874656E646564547970652E6C656E677468203D3D2031297B0A20202020202020202020736368656D612E657874656E64656454797065203D20736368656D';
wwv_flow_imp.g_varchar2_table(402) := '612E657874656E646564547970655B305D3B0A20202020202020207D0A2020202020207D0A2020202020207377697463682028736368656D612E657874656E6465645479706529207B2020202F2F204F7261636C652D7370636966696320657874656E73';
wwv_flow_imp.g_varchar2_table(403) := '696F6E2C20636F6E7665727420696E746F206A736F6E2D736368656D61207265706573656E746174696F6E0A2020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A2020202020202020736368656D612E74797065203D20435F4A';
wwv_flow_imp.g_varchar2_table(404) := '534F4E5F535452494E473B0A2020202020202020736368656D612E666F726D61743D20736368656D612E666F726D61747C7C20435F4A534F4E5F464F524D41545F444154453B202F2F20646F206E6F74206F7665727772697465206578697374696E6720';
wwv_flow_imp.g_varchar2_table(405) := '666F726D6174730A202020202020627265616B3B0A2020202020206361736520435F4F5241434C455F54494D455354414D503A0A2020202020202020736368656D612E74797065203D20435F4A534F4E5F535452494E473B0A2020202020202020736368';
wwv_flow_imp.g_varchar2_table(406) := '656D612E666F726D61743D736368656D612E666F726D61747C7C20435F4A534F4E5F464F524D41545F4441544554494D453B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F535452494E473A0A20202020202063617365';
wwv_flow_imp.g_varchar2_table(407) := '20435F4A534F4E5F424F4F4C45414E3A0A2020202020202020736368656D612E74797065203D20736368656D612E657874656E646564547970653B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F494E54454745523A0A';
wwv_flow_imp.g_varchar2_table(408) := '2020202020206361736520435F4A534F4E5F4E554D4245523A0A2020202020202020696628736368656D612E73716C5363616C653D3D30297B20202F2F206E6F20646967697420626568696E6420222E222C20736F20696E74656765720A202020202020';
wwv_flow_imp.g_varchar2_table(409) := '20202020736368656D612E74797065203D20435F4A534F4E5F494E54454745523B0A20202020202020207D20656C7365207B0A20202020202020202020736368656D612E74797065203D20736368656D612E657874656E646564547970653B0A20202020';
wwv_flow_imp.g_varchar2_table(410) := '202020207D0A202020202020627265616B3B0A20202020202064656661756C743A0A2020202020202020617065782E64656275672E6572726F722827536368656D6120636F6E7461696E7320756E737570706F727420657874656E646564547970652025';
wwv_flow_imp.g_varchar2_table(411) := '73272C20736368656D612E657874656E64656454797065293B0A2020202020207D0A202020207D0A0A2020202020202F2F2064656661756C742066C3BC722022656E756D220A20202020696628736368656D612E656E756D297B0A202020202020736368';
wwv_flow_imp.g_varchar2_table(412) := '656D612E617065782E6974656D74797065203D20736368656D612E617065782E6974656D747970657C7C20435F415045585F53454C4543543B0A202020207D0A0A20202020736368656D612E617065782E726561646F6E6C79203D20626F6F6C65616E49';
wwv_flow_imp.g_varchar2_table(413) := '664E6F7453657428736368656D612E617065782E726561646F6E6C792C20726561646F6E6C79293B0A20202020736368656D612E726561644F6E6C79203D20626F6F6C65616E49664E6F7453657428736368656D612E726561644F6E6C792C2073636865';
wwv_flow_imp.g_varchar2_table(414) := '6D612E617065782E726561646F6E6C79293B0A20202020736368656D612E77726974654F6E6C79203D20626F6F6C65616E49664E6F7453657428736368656D612E77726974654F6E6C792C2077726974656F6E6C79293B0A0A2020202073776974636828';
wwv_flow_imp.g_varchar2_table(415) := '736368656D612E74797065297B0A2020202020206361736520435F4A534F4E5F4E554D4245523A0A2020202020202020736368656D612E617065782E666F726D6174203D2028736368656D612E617065782E666F726D61743D3D435F415045585F435552';
wwv_flow_imp.g_varchar2_table(416) := '52454E4359293F27464D4C39393947393939473939394739393947393939443939273A28736368656D612E617065782E666F726D6174293B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F494E54454745523A0A202020';
wwv_flow_imp.g_varchar2_table(417) := '2020202020736368656D612E617065782E666F726D6174203D2028736368656D612E617065782E666F726D61743D3D435F415045585F43555252454E4359293F27464D4C39393947393939473939394739393947393939273A28736368656D612E617065';
wwv_flow_imp.g_varchar2_table(418) := '782E666F726D61747C7C27393939393939393939393939393939393939393939393927293B0A2020202020202020696628736368656D612E617065782E6974656D747970653D3D435F415045585F5043544752415048297B0A2020202020202020202073';
wwv_flow_imp.g_varchar2_table(419) := '6368656D612E726561644F6E6C79203D20747275653B0A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F535452494E473A0A2020202020202020696628736368656D612E617065782E6974656D74';
wwv_flow_imp.g_varchar2_table(420) := '7970653D3D435F415045585F5152434F4445207C7C20736368656D612E636F6E74656E74456E636F64696E67203D3D20435F4A534F4E5F424153453634297B0A20202020202020202020736368656D612E726561644F6E6C79203D20747275653B20202F';
wwv_flow_imp.g_varchar2_table(421) := '2F2063616E206E6F74206265206368616E6765640A20202020202020202020736368656D612E69735265717569726564202020203D2066616C73653B202F2F206E6F742072657175697265640A20202020202020207D3B0A0A2020202020202020696628';
wwv_flow_imp.g_varchar2_table(422) := '736368656D612E636F6E74656E74456E636F64696E67297B2020202F2F20656E636F64656420737472696E670A20202020202020202020696628736368656D612E636F6E74656E74456E636F64696E673D3D20435F4A534F4E5F424153453634297B0A20';
wwv_flow_imp.g_varchar2_table(423) := '2020202020202020202020736368656D612E617065782E696D6167653D736368656D612E636F6E74656E744D65646961547970653B0A202020202020202020202020736368656D612E617065782E6974656D74797065203D20435F415045585F494D4147';
wwv_flow_imp.g_varchar2_table(424) := '453B0A202020202020202020202020696628215B435F4A534F4E5F494D4147455F4749462C20435F4A534F4E5F494D4147455F4A50472C20435F4A534F4E5F494D4147455F504E475D2E696E636C7564657328736368656D612E636F6E74656E744D6564';
wwv_flow_imp.g_varchar2_table(425) := '69615479706529297B20202F2F0A2020202020202020202020202020617065782E64656275672E6572726F722827756E6B6E6F776E20737472696E6720636F6E74656E744D65646961547970652022257322272C20736368656D612E636F6E74656E744D';
wwv_flow_imp.g_varchar2_table(426) := '6564696154797065293B0A20202020202020202020202020202F2F2064656661756C74206973204A50470A2020202020202020202020202020736368656D612E636F6E74656E744D6564696154797065203D20435F4A534F4E5F494D4147455F4A50473B';
wwv_flow_imp.g_varchar2_table(427) := '0A2020202020202020202020207D0A202020202020202020207D20656C7365207B0A202020202020202020202020617065782E64656275672E6572726F722827756E6B6E6F776E20737472696E6720656E636F64696E672022257322272C20736368656D';
wwv_flow_imp.g_varchar2_table(428) := '612E636F6E74656E74456E636F64696E67293B20200A202020202020202020202020736368656D612E636F6E74656E74456E636F64696E67203D20435F4A534F4E5F4241534536343B0A202020202020202020207D0A20202020202020207D20656C7365';
wwv_flow_imp.g_varchar2_table(429) := '207B20202F2F20706C61696E20737472696E672C20636865636B20666F726D6174730A2020202020202020202073776974636828736368656D612E666F726D6174297B0A20202020202020202020206361736520435F4A534F4E5F464F524D41545F4441';
wwv_flow_imp.g_varchar2_table(430) := '54453A0A20202020202020202020202020736368656D612E617065782E666F726D6174203D2028736368656D612E617065782E666F726D61743F736368656D612E617065782E666F726D61743A617065782E6C6F63616C652E67657444617465466F726D';
wwv_flow_imp.g_varchar2_table(431) := '61742829293B0A2020202020202020202020627265616B3B0A20202020202020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A20202020202020202020202020736368656D612E617065782E666F726D6174203D2028';
wwv_flow_imp.g_varchar2_table(432) := '736368656D612E617065782E666F726D61743F736368656D612E617065782E666F726D61743A617065782E6C6F63616C652E67657444617465466F726D61742829202B202720484832343A4D493A535327293B0A2020202020202020202020627265616B';
wwv_flow_imp.g_varchar2_table(433) := '3B0A20202020202020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A20202020202020202020202020736368656D612E617065782E666F726D6174203D2027484832343A4D49273B0A2020202020202020202020627265616B3B';
wwv_flow_imp.g_varchar2_table(434) := '0A202020202020202020202064656661756C743A0A20202020202020202020202020696628736368656D612E6D61784C656E67746820262620736368656D612E6D61784C656E6774683E704F7074696F6E732E7465787461726561776964746820262620';
wwv_flow_imp.g_varchar2_table(435) := '736368656D612E617065782E6974656D7479706520213D435F415045585F5249434854455854297B0A202020202020202020202020202020736368656D612E617065782E6974656D747970653D435F415045585F54455854415245413B20200A20202020';
wwv_flow_imp.g_varchar2_table(436) := '2020202020202020207D0A2020202020202020202020627265616B3B2020200A202020202020202020207D0A20202020202020207D0A202020202020627265616B3B202020200A202020207D0A0A20202020202020202F2F2073657420617065782E666F';
wwv_flow_imp.g_varchar2_table(437) := '726D6174730A20202020696628617065782E656E762E415045585F56455253494F4E203C2732332E3227297B202F2F20636865636B20666F72206E6577206974657479706520696E206F6C642072656C65617365732C2072656D6F7665207468656D2061';
wwv_flow_imp.g_varchar2_table(438) := '6E64206C6F67206572726F720A2020202020206966285B435F415045585F5152434F44452C20435F415045585F52494348544558542C20435F415045585F434F4D424F2C205D2E696E636C7564657328736368656D612E617065782E6974656D74797065';
wwv_flow_imp.g_varchar2_table(439) := '29297B0A20202020202020206C6F67536368656D614572726F7228276974656D747970652022257322206E6F7420737570706F7274656420696E2022257322272C20736368656D612E617065782E6974656D747970652C20617065782E656E762E415045';
wwv_flow_imp.g_varchar2_table(440) := '585F56455253494F4E293B0A2020202020202020696628736368656D612E617065782E6974656D74797065203D3D20435F415045585F5249434854455854297B20202F2F207573652074657874617265610A20202020202020202020736368656D612E61';
wwv_flow_imp.g_varchar2_table(441) := '7065782E6974656D74797065203D20435F415045585F54455854415245413B0A20202020202020207D20656C7365207B0A2020202020202020202064656C65746520736368656D612E617065782E6974656D747970653B0A20202020202020207D0A2020';
wwv_flow_imp.g_varchar2_table(442) := '202020207D0A202020207D0A0A20202020202020202F2F2070726F70616761746520726571756972656420746F20656163682070726F706572746965730A2020202069662841727261792E6973417272617928736368656D612E72657175697265642929';
wwv_flow_imp.g_varchar2_table(443) := '7B0A202020202020666F72286C6574206C5F736368656D61206F6620736368656D612E7265717569726564297B0A2020202020202020696628736368656D612E70726F7065727469657320262620736368656D612E70726F706572746965735B6C5F7363';
wwv_flow_imp.g_varchar2_table(444) := '68656D615D297B0A20202020202020202020736368656D612E70726F706572746965735B6C5F736368656D615D2E697352657175697265643D747275653B0A20202020202020207D0A2020202020202020696628736368656D612E6974656D7320262620';
wwv_flow_imp.g_varchar2_table(445) := '736368656D612E6974656D735B6C5F736368656D615D297B0A20202020202020202020736368656D612E6974656D735B6C5F736368656D615D2E697352657175697265643D747275653B0A20202020202020207D0A2020202020207D0A202020207D0A0A';
wwv_flow_imp.g_varchar2_table(446) := '20202020696628736368656D612E7468656E297B0A20202020202070726F70616761746550726F70657274696573287B747970653A20435F4A534F4E5F4F424A4543542C2072657175697265643A20736368656D612E7468656E2E72657175697265647C';
wwv_flow_imp.g_varchar2_table(447) := '7C5B5D2C2070726F706572746965733A20736368656D612E7468656E2E70726F706572746965737D2C206C6576656C2C20736368656D612E726561644F6E6C792C20736368656D612E77726974654F6E6C792C20736368656D612E6164646974696F6E61';
wwv_flow_imp.g_varchar2_table(448) := '6C50726F706572746965732C2074727565293B0A202020207D0A0A20202020696628736368656D612E656C7365297B0A20202020202070726F70616761746550726F70657274696573287B747970653A20435F4A534F4E5F4F424A4543542C2072657175';
wwv_flow_imp.g_varchar2_table(449) := '697265643A20736368656D612E656C73652E72657175697265647C7C5B5D2C2070726F706572746965733A20736368656D612E656C73652E70726F706572746965737D2C206C6576656C2C20736368656D612E726561644F6E6C792C20736368656D612E';
wwv_flow_imp.g_varchar2_table(450) := '77726974654F6E6C792C20736368656D612E6164646974696F6E616C50726F706572746965732C2074727565293B0A202020207D0A0A20202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269';
wwv_flow_imp.g_varchar2_table(451) := '657328736368656D612E70726F706572746965737C7C7B7D29297B0A20202020202070726F70616761746550726F70657274696573286C5F736368656D612C206C6576656C2C20736368656D612E726561644F6E6C792C20736368656D612E7772697465';
wwv_flow_imp.g_varchar2_table(452) := '4F6E6C792C20736368656D612E6164646974696F6E616C50726F706572746965732C2066616C7365293B0A202020207D0A0A20202020696628736368656D612E6974656D73297B20202F2F20746865726520697320616E206974656D20646566696E6974';
wwv_flow_imp.g_varchar2_table(453) := '696F6E2C2070726F6365737320746869730A202020202020736368656D612E6974656D732E6164646974696F6E616C50726F70657274696573203D20626F6F6C65616E49664E6F7453657428736368656D612E6974656D732E6164646974696F6E616C50';
wwv_flow_imp.g_varchar2_table(454) := '726F706572746965732C206164646974696F6E616C50726F70657274696573293B0A20202020202070726F70616761746550726F7065727469657328736368656D612E6974656D732C206C6576656C2C20736368656D612E726561644F6E6C792C207363';
wwv_flow_imp.g_varchar2_table(455) := '68656D612E77726974654F6E6C792C20736368656D612E6164646974696F6E616C50726F706572746965732C2066616C7365293B0A202020207D0A0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E70726F7061';
wwv_flow_imp.g_varchar2_table(456) := '6761746550726F70657274696573222C206C6576656C293B0A20207D0A0A20202F2A0A2020202A2067656E6572617465207468652055492048544D4C20666F722032332E3220436F6D626F626F78200A2020202A2072657475726E73207B6974656D733A';
wwv_flow_imp.g_varchar2_table(457) := '20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E6572617465466F72436F6D626F28736368656D612C20646174612C207072656669782C206E616D652C207374';
wwv_flow_imp.g_varchar2_table(458) := '617274656E642C20636865636B626F78297B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A202020206C6574206C5F76616C756573203D';
wwv_flow_imp.g_varchar2_table(459) := '2028646174617C7C5B5D292E6A6F696E28277C27293B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72436F6D626F222C20736368656D612C20646174612C207072656669782C206E';
wwv_flow_imp.g_varchar2_table(460) := '616D652C207374617274656E642C20636865636B626F78293B0A202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20202020202020312C0A202020202020202077726170706572747970653A2027617065782D697465';
wwv_flow_imp.g_varchar2_table(461) := '6D2D777261707065722D2D636F6D626F626F7820617065782D6974656D2D777261707065722D2D636F6D626F626F782D6D616E79272C0A202020202020202068746D6C3A2020202020202020617065782E7574696C2E6170706C7954656D706C61746528';
wwv_flow_imp.g_varchar2_table(462) := '600A3C612D636F6D626F626F782069643D222349442322206E616D653D22234944232220235245515549524544232076616C75653D222356414C5545532322206D756C74692D76616C75653D2274727565222072657475726E2D646973706C61793D2266';
wwv_flow_imp.g_varchar2_table(463) := '616C7365222076616C75652D736570617261746F72733D227C22206D61782D726573756C74733D223722206D696E2D636861726163746572732D7365617263683D223022206D617463682D747970653D22636F6E7461696E7322206D61786C656E677468';
wwv_flow_imp.g_varchar2_table(464) := '3D2231303022206D756C74692D73656C6563743D22747275652220706172656E74732D72657175697265643D2274727565223E0A20203C64697620636C6173733D22617065782D6974656D2D636F6D626F73656C656374223E0A202020203C756C20636C';
wwv_flow_imp.g_varchar2_table(465) := '6173733D22612D436869707320612D43686970732D2D6170706C69656420612D43686970732D2D777261702220726F6C653D2270726573656E746174696F6E223E0A602C0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(466) := '20202020202020202020202020202020207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(467) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202256414C554553223A206C5F76616C7565730A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(468) := '20202020202020202020207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D290A202020207D3B0A0A202020206C5F67656E6572617465642E68746D6C202B3D2061706578';
wwv_flow_imp.g_varchar2_table(469) := '2E7574696C2E6170706C7954656D706C61746528600A2020202020203C6C6920636C6173733D22612D4368697020612D436869702D2D696E7075742069732D656D707479223E0A20202020202020203C696E70757420747970653D22746578742220636C';
wwv_flow_imp.g_varchar2_table(470) := '6173733D22617065782D6974656D2D746578742220617269612D6C6162656C6C656462793D22234944235F4C4142454C222076616C75653D222356414C55455323222023504C414345484F4C44455223206D61786C656E6774683D223130302220726F6C';
wwv_flow_imp.g_varchar2_table(471) := '653D22636F6D626F626F782220617269612D657870616E6465643D2266616C736522206175746F636F6D706C6574653D226F666622206175746F636F72726563743D226F666622206175746F6361706974616C697A653D226E6F6E6522207370656C6C63';
wwv_flow_imp.g_varchar2_table(472) := '6865636B3D2266616C73652220617269612D6175746F636F6D706C6574653D226C6973742220617269612D64657363726962656462793D22234944235F646573632220617269612D627573793D2266616C7365223E0A20202020202020203C7370616E20';
wwv_flow_imp.g_varchar2_table(473) := '636C6173733D22612D436869702D636C656172206A732D636C656172496E707574223E3C7370616E20636C6173733D22612D49636F6E2069636F6E2D6D756C74692D72656D6F76652220617269612D68696464656E3D2274727565223E3C2F7370616E3E';
wwv_flow_imp.g_varchar2_table(474) := '3C2F7370616E3E0A2020202020203C2F6C693E0A202020203C2F756C3E0A20203C2F6469763E0A20203C612D636F6C756D6E2D6D65746164617461206E616D653D2223494423222073656172636861626C653D22747275652220696E6465783D2230223E';
wwv_flow_imp.g_varchar2_table(475) := '3C2F612D636F6C756D6E2D6D657461646174613E0A602C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207B0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(476) := '2020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202256414C';
wwv_flow_imp.g_varchar2_table(477) := '554553223A20617065782E7574696C2E65736361706548544D4C286C5F76616C756573290A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(478) := '20202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A20202020666F7228636F6E7374206C5F6F7074696F6E206F6620736368656D612E656E756D207C7C5B5D297B0A2020202020206C5F67656E6572';
wwv_flow_imp.g_varchar2_table(479) := '617465642E68746D6C202B3D20617065782E7574696C2E6170706C7954656D706C61746528600A20203C612D6F7074696F6E2076616C75653D2231223E234F5054494F4E233C612D6F7074696F6E2D636F6C756D6E2D76616C75653E234F5054494F4E23';
wwv_flow_imp.g_varchar2_table(480) := '3C2F612D6F7074696F6E2D636F6C756D6E2D76616C75653E3C2F612D6F7074696F6E3E0A602C202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207B0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(481) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(482) := '2020202020202020202020224F5054494F4E223A20617065782E7574696C2E65736361706548544D4C286C5F6F7074696F6E290A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(483) := '2020207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A202020207D0A202020206C5F67656E6572617465642E68746D6C202B3D20600A3C2F612D636F6D626F626F';
wwv_flow_imp.g_varchar2_table(484) := '783E0A603B0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72436F6D626F222C206C5F67656E657261746564293B0A2020202072657475726E286C5F67656E657261746564293B0A20';
wwv_flow_imp.g_varchar2_table(485) := '207D0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F7220612070756C6C646F776E2F726164696F2F636865636B626F782070726F706572747920646570656E64696E67206F6E206974656D747970650A2020202A';
wwv_flow_imp.g_varchar2_table(486) := '2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E6572617465466F7253656C65637428736368656D612C20646174612C';
wwv_flow_imp.g_varchar2_table(487) := '207072656669782C206E616D652C207374617274656E642C206974656D747970652C20736368656D6141706578297B0A202020206C6574206C5F67656E657261746564203D207B206974656D733A302C2077726170706572747970653A206E756C6C2C20';
wwv_flow_imp.g_varchar2_table(488) := '68746D6C3A2027277D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020736368656D612E617065782E656E756D203D20736368656D612E617065782E656E756D7C7C7B7D3B0A20202020617065782E';
wwv_flow_imp.g_varchar2_table(489) := '64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F7253656C656374222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206974656D74797065293B0A2020202069';
wwv_flow_imp.g_varchar2_table(490) := '66286974656D74797065203D3D20435F415045585F53454C454354297B0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202068746D6C3A20600A3C73656C6563742069643D222349';
wwv_flow_imp.g_varchar2_table(491) := '442322206E616D653D222349442322202352455155495245442320636C6173733D2273656C6563746C69737420617065782D6974656D2D73656C6563742220646174612D6E61746976652D6D656E753D2266616C7365222073697A653D2231223E0A607D';
wwv_flow_imp.g_varchar2_table(492) := '3B20202020202020202020200A20202020202069662821736368656D612E6973526571756972656429207B0A20202020202020206C5F67656E6572617465642E68746D6C2B3D273C6F7074696F6E2076616C75653D22223E3C2F6F7074696F6E3E273B0A';
wwv_flow_imp.g_varchar2_table(493) := '2020202020207D0A202020202020666F7228636F6E7374206C5F76616C7565206F6620736368656D612E656E756D297B0A20202020202020206C5F67656E6572617465642E68746D6C202B3D20617065782E7574696C2E6170706C7954656D706C617465';
wwv_flow_imp.g_varchar2_table(494) := '28600A20203C6F7074696F6E2076616C75653D222356414C554523223E23444953504C415956414C5545233C2F6F7074696F6E3E0A602C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(495) := '202020207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(496) := '202020202020202020202020202020202020202020202020202020202256414C5545223A206C5F76616C75652C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(497) := '22444953504C415956414C5545223A20736368656D612E617065782E656E756D5B6C5F76616C75655D7C7C6C5F76616C75650A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(498) := '20207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A2020202020207D0A2020202020206C5F67656E6572617465642E68746D6C202B3D0A600A3C2F73656C656374';
wwv_flow_imp.g_varchar2_table(499) := '3E0A603B0A202020207D20656C7365207B0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202068746D6C3A20617065782E7574696C2E6170706C7954656D706C61746528600A3C64';
wwv_flow_imp.g_varchar2_table(500) := '697620746162696E6465783D222D31222069643D22234944232220617269612D6C6162656C6C656462793D22234944235F4C4142454C22202352455155495245442320636C6173733D22202354595045235F67726F757020617065782D6974656D2D6772';
wwv_flow_imp.g_varchar2_table(501) := '6F757020617065782D6974656D2D67726F75702D2D726320617065782D6974656D2D2354595045232220726F6C653D2223545950452367726F7570223E0A602C0A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(502) := '202020202020202020202020207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(503) := '202020202020202020202020202020202020202020202020202020202020202020202020202254595045223A20206974656D747970650A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(504) := '2020202020207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D290A2020202020207D3B0A2020202020206C6574206C5F6E723D303B0A2020202020200A20202020202066';
wwv_flow_imp.g_varchar2_table(505) := '6F7228636F6E7374206C5F76616C7565206F6620736368656D612E656E756D297B0A20202020202020206C5F67656E6572617465642E68746D6C202B3D20617065782E7574696C2E6170706C7954656D706C61746528600A20203C64697620636C617373';
wwv_flow_imp.g_varchar2_table(506) := '3D22617065782D6974656D2D6F7074696F6E222023444952233E0A202020203C696E70757420747970653D22235459504523222069643D22234944235F234E522322206E616D653D22234944232220646174612D646973706C61793D222356414C554523';
wwv_flow_imp.g_varchar2_table(507) := '222076616C75653D222356414C554523222023504C414345484F4C44455223202352455155495245442320617269612D6C6162656C3D222356414C5545232220636C6173733D22223E0A202020203C6C6162656C20636C6173733D22752D235459504523';
wwv_flow_imp.g_varchar2_table(508) := '2220666F723D22234944235F234E52232220617269612D68696464656E3D2274727565223E23444953504C415956414C5545233C2F6C6162656C3E0A20203C2F6469763E0A602C0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(509) := '20202020202020202020202020202020202020207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(510) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022444952223A2020202020202020202028736368656D61417065782E646972656374696F6E3D3D435F415045585F484F52495A4F4E54414C';
wwv_flow_imp.g_varchar2_table(511) := '293F277374796C653D22666C6F61743A206C65667422273A22222C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202254595045223A2020202020202020206974';
wwv_flow_imp.g_varchar2_table(512) := '656D747970652C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202256414C5545223A2020202020202020747970656F66286C5F76616C7565293D3D2773747269';
wwv_flow_imp.g_varchar2_table(513) := '6E67273F617065782E7574696C2E65736361706548544D4C286C5F76616C7565293A6C5F76616C75652C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224449';
wwv_flow_imp.g_varchar2_table(514) := '53504C415956414C5545223A20747970656F66286C5F76616C7565293D3D27737472696E67273F28617065782E7574696C2E65736361706548544D4C28736368656D612E617065782E656E756D5B6C5F76616C75655D7C7C6C5F76616C756529293A6C5F';
wwv_flow_imp.g_varchar2_table(515) := '76616C75652C2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(516) := '202020202020202020202020202020224E52223A20202020202020202020206C5F6E722B2B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(517) := '2020202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A2020202020207D0A0A2020202020206C5F67656E6572617465642E68746D6C202B3D20600A3C2F6469763E0A603B0A202020207D0A20202020';
wwv_flow_imp.g_varchar2_table(518) := '73776974636820286974656D74797065297B0A202020206361736520435F415045585F53454C4543543A200A2020202020206C5F67656E6572617465642E7772617070657274797065203D2027617065782D6974656D2D777261707065722D2D73656C65';
wwv_flow_imp.g_varchar2_table(519) := '63742D6C697374273B0A20202020627265616B3B0A202020206361736520435F415045585F524144494F3A0A2020202020206C5F67656E6572617465642E7772617070657274797065203D2027617065782D6974656D2D777261707065722D2D72616469';
wwv_flow_imp.g_varchar2_table(520) := '6F67726F7570273B0A20202020627265616B3B0A202020206361736520435F415045585F434845434B424F583A0A2020202020206C5F67656E6572617465642E7772617070657274797065203D2027617065782D6974656D2D777261707065722D2D6368';
wwv_flow_imp.g_varchar2_table(521) := '65636B626F78273B0A20202020627265616B3B0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F7253656C656374222C206C5F67656E657261746564293B0A2020202072';
wwv_flow_imp.g_varchar2_table(522) := '657475726E286C5F67656E657261746564293B0A20207D0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F72206120737472696E672070726F706572747920646570656E64696E67206F6E20666F726D61742C202E';
wwv_flow_imp.g_varchar2_table(523) := '2E2E0A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E6572617465466F72537472696E6728736368656D61';
wwv_flow_imp.g_varchar2_table(524) := '2C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D297B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027';
wwv_flow_imp.g_varchar2_table(525) := '277D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020736368656D612E617065782E656E756D203D20736368656D612E617065782E656E756D7C7C7B7D3B0A20202020617065782E64656275672E74';
wwv_flow_imp.g_varchar2_table(526) := '7261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72537472696E67222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A20202020696628736368656D61';
wwv_flow_imp.g_varchar2_table(527) := '2E726561644F6E6C79297B0A20202020202073776974636828736368656D612E617065782E6974656D74797065297B0A2020202020206361736520435F415045585F494D4147453A0A20202020202020206C5F67656E657261746564203D207B0A202020';
wwv_flow_imp.g_varchar2_table(528) := '202020202020206974656D733A20312C0A2020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A2020202020202020202068746D6C3A20600A3C7370616E20636C61';
wwv_flow_imp.g_varchar2_table(529) := '73733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C79223E0A20203C696D67207372633D22646174613A23494D414745233B6261736536342C2356414C554523223E0A3C2F7370616E3E0A3C696E7075742074';
wwv_flow_imp.g_varchar2_table(530) := '7970653D2268696464656E222069643D2223494423222076616C75653D222356414C554523222F3E0A607D3B0A202020202020627265616B3B0A2020202020206361736520435F415045585F5152434F44453A0A20202020202020206C5F67656E657261';
wwv_flow_imp.g_varchar2_table(531) := '746564203D207B0A202020202020202020206974656D733A20312C0A2020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D7172636F6465272C0A2020202020202020202068746D6C3A20600A3C61';
wwv_flow_imp.g_varchar2_table(532) := '2D7172636F64652069643D22234944232220636C6173733D22612D5152436F64652220616A61782D6964656E7469666965723D2223414A41584944454E54494649455223222076616C75653D222356414C554523223E203C2F612D7172636F64653E0A60';
wwv_flow_imp.g_varchar2_table(533) := '7D3B0A202020202020627265616B3B0A20202020202064656661756C743A0A20202020202020206C5F67656E657261746564203D207B0A202020202020202020206974656D733A20312C0A2020202020202020202077726170706572747970653A202761';
wwv_flow_imp.g_varchar2_table(534) := '7065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A2020202020202020202068746D6C3A20273C7370616E2069643D22234944235F444953504C415922202352455155495245442320636C6173733D22646973706C61795F6F6E';
wwv_flow_imp.g_varchar2_table(535) := '6C7920617065782D6974656D2D646973706C61792D6F6E6C792220646174612D6573636170653D2274727565223E2356414C5545233C2F7370616E3E270A20202020202020207D3B0A202020202020627265616B3B0A2020202020207D0A202020207D20';
wwv_flow_imp.g_varchar2_table(536) := '656C7365207B0A20202020202069662841727261792E6973417272617928736368656D612E656E756D29297B0A20202020202020206966285B435F415045585F53454C4543542C20435F415045585F524144494F5D2E696E636C7564657328736368656D';
wwv_flow_imp.g_varchar2_table(537) := '612E617065782E6974656D7479706529297B0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F7253656C65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C2073';
wwv_flow_imp.g_varchar2_table(538) := '6368656D612E617065782E6974656D747970652C20736368656D612E61706578293B0A20202020202020207D20656C7365207B0A202020202020202020206C6F67536368656D614572726F722827656E756D206E6F7420737570706F7274656420666F72';
wwv_flow_imp.g_varchar2_table(539) := '202573272C20736368656D612E617065782E6974656D74797065293B20200A20202020202020207D0A2020202020207D20656C7365207B0A202020202020202073776974636828736368656D612E666F726D6174297B0A20202020202020206361736520';
wwv_flow_imp.g_varchar2_table(540) := '435F4A534F4E5F464F524D41545F454D41494C3A0A202020202020202020206C5F67656E657261746564203D207B0A2020202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D';
wwv_flow_imp.g_varchar2_table(541) := '6974656D2D777261707065722D2D746578742D6669656C64272C0A20202020202020202020202068746D6C3A20600A3C696E70757420747970653D22656D61696C222069643D222349442322206E616D653D222349442322202352455155495245442320';
wwv_flow_imp.g_varchar2_table(542) := '23504C414345484F4C4445522320235041545445524E2320636C6173733D2223414C49474E2320746578745F6669656C6420617065782D6974656D2D74657874222073697A653D2233322220234D494E4C454E4754482320234D41584C454E4754482320';
wwv_flow_imp.g_varchar2_table(543) := '646174612D7472696D2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72223E0A607D3B0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F';
wwv_flow_imp.g_varchar2_table(544) := '4E5F464F524D41545F5552493A0A202020202020202020206C5F67656E657261746564203D207B0A2020202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D6974656D2D7772';
wwv_flow_imp.g_varchar2_table(545) := '61707065722D2D746578742D6669656C64272C0A20202020202020202020202068746D6C3A20600A3C696E70757420747970653D2275726C222069643D222349442322206E616D653D22234944232220235245515549524544232023504C414345484F4C';
wwv_flow_imp.g_varchar2_table(546) := '4445522320235041545445524E2320636C6173733D2223414C49474E2320746578745F6669656C6420617065782D6974656D2D74657874222073697A653D2233322220234D494E4C454E4754482320234D41584C454E4754482320646174612D7472696D';
wwv_flow_imp.g_varchar2_table(547) := '2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72223E0A607D3B0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F464F524D41545F';
wwv_flow_imp.g_varchar2_table(548) := '444154453A0A20202020202020202020696628617065782E656E762E415045585F56455253494F4E203E3D2732322E322E3027297B0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D';
wwv_flow_imp.g_varchar2_table(549) := '733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6170657820617065782D6974656D2D777261707065722D2D646174652D7069636B6572';
wwv_flow_imp.g_varchar2_table(550) := '2D617065782D706F707570272C0A202020202020202020202020202068746D6C3A20600A3C612D646174652D7069636B65722069643D2223494423222023524551554952454423206368616E67652D6D6F6E74683D227472756522206368616E67652D79';
wwv_flow_imp.g_varchar2_table(551) := '6561723D22747275652220646973706C61792D61733D22706F7075702220646973706C61792D7765656B733D226E756D626572222020234D494E2320234D4158232070726576696F75732D6E6578742D64697374616E63653D226F6E652D6D6F6E746822';
wwv_flow_imp.g_varchar2_table(552) := '2073686F772D646179732D6F7574736964652D6D6F6E74683D2276697369626C65222073686F772D6F6E3D22666F6375732220746F6461792D627574746F6E3D22747275652220666F726D61743D2223464F524D415423222076616C69642D6578616D70';
wwv_flow_imp.g_varchar2_table(553) := '6C653D22234558414D504C45232220796561722D73656C656374696F6E2D72616E67653D22352220636C6173733D22617065782D6974656D2D646174657069636B65722D2D706F707570223E0A20203C696E70757420617269612D686173706F7075703D';
wwv_flow_imp.g_varchar2_table(554) := '226469616C6F672220636C6173733D2220617065782D6974656D2D7465787420617065782D6974656D2D646174657069636B657222206E616D653D2223494423222073697A653D22323022206D61786C656E6774683D223230222023504C414345484F4C';
wwv_flow_imp.g_varchar2_table(555) := '4445522320747970653D2274657874222069643D22234944235F696E707574222072657175697265643D222220617269612D6C6162656C6C656462793D22234944235F4C4142454C22206D61786C656E6774683D22323535222076616C75653D22235641';
wwv_flow_imp.g_varchar2_table(556) := '4C554523223E0A20203C627574746F6E20617269612D686173706F7075703D226469616C6F672220617269612D6C6162656C3D2223494E464F232220636C6173733D22612D427574746F6E20612D427574746F6E2D2D63616C656E646172222074616269';
wwv_flow_imp.g_varchar2_table(557) := '6E6465783D222D312220747970653D22627574746F6E2220617269612D64657363726962656462793D22234944235F4C4142454C2220617269612D636F6E74726F6C733D22234944235F696E707574223E0A202020203C7370616E20636C6173733D2261';
wwv_flow_imp.g_varchar2_table(558) := '2D49636F6E2069636F6E2D63616C656E646172223E0A202020203C2F7370616E3E0A20203C2F627574746F6E3E0A3C2F612D646174652D7069636B65723E0A607D3B0A202020202020202020207D20656C7365207B0A202020202020202020206C5F6765';
wwv_flow_imp.g_varchar2_table(559) := '6E657261746564203D207B0A20202020202020202020202069746D65733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D6974656D2D7772617070657220617065782D6974656D2D777261707065722D2D646174';
wwv_flow_imp.g_varchar2_table(560) := '652D7069636B65722D6A6574272C0A20202020202020202020202068746D6C3A20600A3C6F6A2D696E7075742D646174652069643D222349442322202352455155495245442320636C6173733D22617065782D6A65742D636F6D706F6E656E7420617065';
wwv_flow_imp.g_varchar2_table(561) := '782D6974656D2D646174657069636B65722D6A6574206F6A2D696E7075746461746574696D652D646174652D6F6E6C79206F6A2D636F6D706F6E656E74206F6A2D696E7075746461746574696D65206F6A2D666F726D2D636F6E74726F6C206F6A2D7465';
wwv_flow_imp.g_varchar2_table(562) := '78742D6669656C64222020234D494E2320234D41582320646174612D666F726D61743D2223464F524D4154232220646174612D6D61786C656E6774683D223235352220646174612D6E616D653D22234944232220646174612D6F7261636C652D64617465';
wwv_flow_imp.g_varchar2_table(563) := '2D76616C75653D222356414C5545232220646174612D73697A653D2233322220646174612D76616C69642D6578616D706C653D22234558414D504C45232220646174652D7069636B65722E6368616E67652D6D6F6E74683D2273656C6563742220646174';
wwv_flow_imp.g_varchar2_table(564) := '652D7069636B65722E6368616E67652D796561723D2273656C6563742220646174652D7069636B65722E646179732D6F7574736964652D6D6F6E74683D2276697369626C652220646174652D7069636B65722E73686F772D6F6E3D22666F637573222064';
wwv_flow_imp.g_varchar2_table(565) := '6174652D7069636B65722E7765656B2D646973706C61793D226E6F6E652220646973706C61792D6F7074696F6E732E636F6E7665727465722D68696E743D226E6F6E652220646973706C61792D6F7074696F6E732E6D657373616765733D226E6F6E6522';
wwv_flow_imp.g_varchar2_table(566) := '20646973706C61792D6F7074696F6E732E76616C696461746F722D68696E743D226E6F6E65222074696D652D7069636B65722E74696D652D696E6372656D656E743D2230303A31353A30303A303022207472616E736C6174696F6E732E6E6578742D7465';
wwv_flow_imp.g_varchar2_table(567) := '78743D224E65787422207472616E736C6174696F6E732E707265762D746578743D2250726576696F7573222076616C75653D222356414C554523223E0A3C2F6F6A2D696E7075742D646174653E0A607D3B0A202020202020202020207D0A202020202020';
wwv_flow_imp.g_varchar2_table(568) := '2020627265616B3B0A20202020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A20202020202020202020696628617065782E656E762E415045585F56455253494F4E203E3D2732322E322E3027297B0A202020202020';
wwv_flow_imp.g_varchar2_table(569) := '2020202020206C5F67656E657261746564203D207B0A202020202020202020202020202069746D65733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D646174652D7069';
wwv_flow_imp.g_varchar2_table(570) := '636B65722D6170657820617065782D6974656D2D777261707065722D2D646174652D7069636B65722D617065782D706F707570272C0A202020202020202020202020202068746D6C3A20600A3C612D646174652D7069636B65722069643D222349442322';
wwv_flow_imp.g_varchar2_table(571) := '2023524551554952454423206368616E67652D6D6F6E74683D227472756522206368616E67652D796561723D22747275652220646973706C61792D61733D22706F7075702220646973706C61792D7765656B733D226E756D6265722220234D494E232023';
wwv_flow_imp.g_varchar2_table(572) := '4D4158232070726576696F75732D6E6578742D64697374616E63653D226F6E652D6D6F6E7468222073686F772D646179732D6F7574736964652D6D6F6E74683D2276697369626C65222073686F772D6F6E3D22666F637573222073686F772D74696D653D';
wwv_flow_imp.g_varchar2_table(573) := '2274727565222074696D652D696E6372656D656E742D6D696E7574653D2231352220746F6461792D627574746F6E3D22747275652220666F726D61743D2223464F524D415423222076616C69642D6578616D706C653D22234558414D504C452322207965';
wwv_flow_imp.g_varchar2_table(574) := '61722D73656C656374696F6E2D72616E67653D22352220636C6173733D22617065782D6974656D2D646174657069636B65722D2D706F707570223E0A20203C696E70757420617269612D686173706F7075703D226469616C6F672220636C6173733D2220';
wwv_flow_imp.g_varchar2_table(575) := '617065782D6974656D2D7465787420617065782D6974656D2D646174657069636B657222206E616D653D2223494423222073697A653D22333022206D61786C656E6774683D223330222023504C414345484F4C4445522320747970653D22746578742220';
wwv_flow_imp.g_varchar2_table(576) := '69643D22234944235F696E707574222072657175697265643D222220617269612D6C6162656C6C656462793D22234944235F4C4142454C22206D61786C656E6774683D22323535222076616C75653D222356414C554523223E0A20203C627574746F6E20';
wwv_flow_imp.g_varchar2_table(577) := '617269612D686173706F7075703D226469616C6F672220617269612D6C6162656C3D2223494E464F232220636C6173733D22612D427574746F6E20612D427574746F6E2D2D63616C656E6461722220746162696E6465783D222D312220747970653D2262';
wwv_flow_imp.g_varchar2_table(578) := '7574746F6E2220617269612D64657363726962656462793D22234944235F4C4142454C2220617269612D636F6E74726F6C733D22234944235F696E707574223E0A202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D63616C656E64';
wwv_flow_imp.g_varchar2_table(579) := '61722D74696D65223E0A202020203C2F7370616E3E0A20203C2F627574746F6E3E0A3C2F612D646174652D7069636B65723E0A607D3B0A202020202020202020207D20656C7365207B0A2020202020202020202020206C5F67656E657261746564203D20';
wwv_flow_imp.g_varchar2_table(580) := '7B0A20202020202020202020202020206974656D733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D7772617070657220617065782D6974656D2D777261707065722D2D646174652D7069636B';
wwv_flow_imp.g_varchar2_table(581) := '65722D6A6574272C0A202020202020202020202020202068746D6C3A20600A3C6F6A2D696E7075742D646174652D74696D652069643D222349442322202352455155495245442320636C6173733D22617065782D6A65742D636F6D706F6E656E74206170';
wwv_flow_imp.g_varchar2_table(582) := '65782D6974656D2D646174657069636B65722D6A6574206F6A2D696E7075746461746574696D652D646174652D74696D65206F6A2D636F6D706F6E656E74206F6A2D696E7075746461746574696D65206F6A2D666F726D2D636F6E74726F6C206F6A2D74';
wwv_flow_imp.g_varchar2_table(583) := '6578742D6669656C642220234D494E2320234D41582320646174612D666F726D61743D2223464F524D4154232220646174612D6D61786C656E6774683D223235352220646174612D6E616D653D22234944232220646174612D6F7261636C652D64617465';
wwv_flow_imp.g_varchar2_table(584) := '2D76616C75653D222356414C5545232220646174612D73697A653D2233322220646174612D76616C69642D6578616D706C653D22234558414D504C45232220646174652D7069636B65722E6368616E67652D6D6F6E74683D2273656C6563742220646174';
wwv_flow_imp.g_varchar2_table(585) := '652D7069636B65722E6368616E67652D796561723D2273656C6563742220646174652D7069636B65722E646179732D6F7574736964652D6D6F6E74683D2276697369626C652220646174652D7069636B65722E73686F772D6F6E3D22666F637573222064';
wwv_flow_imp.g_varchar2_table(586) := '6174652D7069636B65722E7765656B2D646973706C61793D226E6F6E652220646973706C61792D6F7074696F6E732E636F6E7665727465722D68696E743D226E6F6E652220646973706C61792D6F7074696F6E732E6D657373616765733D226E6F6E6522';
wwv_flow_imp.g_varchar2_table(587) := '20646973706C61792D6F7074696F6E732E76616C696461746F722D68696E743D226E6F6E6522207472616E736C6174696F6E732E6E6578742D746578743D224E65787422207472616E736C6174696F6E732E707265762D746578743D2250726576696F75';
wwv_flow_imp.g_varchar2_table(588) := '73222076616C75653D222356414C554523223E0A3C2F6F6A2D696E7075742D646174652D74696D653E0A607D3B0A202020202020202020207D0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F464F524D41545F';
wwv_flow_imp.g_varchar2_table(589) := '54494D453A0A202020202020202020206C5F67656E657261746564203D207B0A2020202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D74';
wwv_flow_imp.g_varchar2_table(590) := '6578742D6669656C64272C0A20202020202020202020202068746D6C3A20600A3C696E70757420747970653D2274696D65222069643D222349442322206E616D653D222349442322202352455155495245442320234D494E2320234D41582320636C6173';
wwv_flow_imp.g_varchar2_table(591) := '733D22746578745F6669656C6420617065782D6974656D2D7465787422202023504C414345484F4C444552232073697A653D22352220646174612D7472696D2D7370616365733D22235452494D535041434553232220617269612D646573637269626564';
wwv_flow_imp.g_varchar2_table(592) := '62793D22234944235F6572726F72222F3E0A607D3B0A2020202020202020627265616B3B0A202020202020202064656661756C743A0A202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020206974656D733A20312C';
wwv_flow_imp.g_varchar2_table(593) := '0A202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A202020202020202020202068746D6C3A20600A3C696E70757420747970653D2274657874222069643D22';
wwv_flow_imp.g_varchar2_table(594) := '2349442322206E616D653D222349442322202352455155495245442320234D494E4C454E4754482320234D41584C454E475448232023504C414345484F4C4445522320235041545445524E2320636C6173733D2223414C49474E2320746578745F666965';
wwv_flow_imp.g_varchar2_table(595) := '6C6420617065782D6974656D2D74657874222073697A653D2233322220646174612D7472696D2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72223E0A607D3B0A20202020';
wwv_flow_imp.g_varchar2_table(596) := '2020202020207377697463682028736368656D612E617065782E6974656D74797065297B0A202020202020202020206361736520435F415045585F50415353574F52443A0A2020202020202020202020206C5F67656E657261746564203D207B0A202020';
wwv_flow_imp.g_varchar2_table(597) := '20202020202020202020206974656D733A20312C202020202020202020202020202020200A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D70617373776F7264272C0A2020202020';
wwv_flow_imp.g_varchar2_table(598) := '20202020202020202068746D6C3A20600A3C696E70757420747970653D2270617373776F726422206E616D653D222349442322222073697A653D2233302220235041545445524E23202352455155495245442320234D494E4C454E4754482320234D4158';
wwv_flow_imp.g_varchar2_table(599) := '4C454E47544823206175746F636F6D706C6574653D2270617373776F7264222076616C75653D22222069643D22234944232220636C6173733D2270617373776F726420617065782D6974656D2D74657874223E0A607D3B0A202020202020202020206272';
wwv_flow_imp.g_varchar2_table(600) := '65616B3B202020200A202020202020202020206361736520435F415045585F52494348544558543A0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C0A20202020202020';
wwv_flow_imp.g_varchar2_table(601) := '2020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D726963682D746578742D656469746F72272C0A202020202020202020202020202068746D6C3A20600A3C612D726963682D746578742D656469746F72';
wwv_flow_imp.g_varchar2_table(602) := '2069643D222349442322206E616D653D222349442322206D6F64653D226D61726B646F776E22202352455155495245442320726561642D6F6E6C793D2223524541444F4E4C59232220646973706C61792D76616C75652D6D6F64653D22706C61696E2D74';
wwv_flow_imp.g_varchar2_table(603) := '657874222076697375616C2D6D6F64653D22696E6C696E65222076616C75653D222351554F544556414C554523223E0A3C2F612D726963682D746578742D656469746F723E0A607D3B0A202020202020202020627265616B3B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(604) := '6361736520435F415045585F54455854415245413A0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C0A202020202020202020202020202077726170706572747970653A';
wwv_flow_imp.g_varchar2_table(605) := '2027617065782D6974656D2D777261707065722D2D7465787461726561272C0A202020202020202020202020202068746D6C3A20600A3C64697620636C6173733D22617065782D6974656D2D67726F757020617065782D6974656D2D67726F75702D2D74';
wwv_flow_imp.g_varchar2_table(606) := '65787461726561223E0A20203C7465787461726561206E616D653D22234E414D45232220726F77733D2223524F5753232220636F6C733D22313030222069643D222349442322202352455155495245442320636C6173733D227465787461726561206170';
wwv_flow_imp.g_varchar2_table(607) := '65782D6974656D2D74657874617265612220646174612D726573697A61626C653D227472756522207374796C653D22726573697A653A20626F74683B223E2351554F544556414C5545233C2F74657874617265613E0A3C2F6469763E0A20607D3B0A2020';
wwv_flow_imp.g_varchar2_table(608) := '2020202020202020627265616B3B0A202020202020202020207D0A2020202020202020627265616B3B0A20202020202020207D0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E';
wwv_flow_imp.g_varchar2_table(609) := '2E67656E6572617465466F72537472696E67222C206C5F67656E657261746564293B0A2020202072657475726E286C5F67656E657261746564293B0A20207D3B0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F72';
wwv_flow_imp.g_varchar2_table(610) := '206120696E74656765722F6E756D6265722070726F706572747920646570656E64696E67206F6E20666F726D61742C202E2E2E0A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C';
wwv_flow_imp.g_varchar2_table(611) := '3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E6572617465466F724E756D6572696328736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D297B0A202020206C657420';
wwv_flow_imp.g_varchar2_table(612) := '6C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F';
wwv_flow_imp.g_varchar2_table(613) := '724E756D65726963222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E64293B0A2020202069662841727261792E6973417272617928736368656D612E656E756D29297B20202F2F206E756D65726963205075';
wwv_flow_imp.g_varchar2_table(614) := '6C6C646F776E0A2020202020206C5F67656E657261746564203D2067656E6572617465466F7253656C65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20435F415045585F53454C4543542C207363';
wwv_flow_imp.g_varchar2_table(615) := '68656D612E61706578293B0A202020207D20656C7365207B0A20202020202020202020696628736368656D612E6170657820262620736368656D612E617065782E6974656D747970653D3D435F415045585F5043544752415048297B0A20202020202020';
wwv_flow_imp.g_varchar2_table(616) := '20202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D7063742D67726170';
wwv_flow_imp.g_varchar2_table(617) := '68272C0A202020202020202020202020202068746D6C3A600A3C64697620636C6173733D22617065782D6974656D2D7063742D6772617068222069643D22234944232220646174612D73686F772D76616C75653D227472756522223E2356414C5545233C';
wwv_flow_imp.g_varchar2_table(618) := '2F6469763E0A607D3B0A202020202020202020207D20656C736520696628736368656D612E6170657820262620736368656D612E617065782E6974656D747970653D3D435F415045585F53544152524154494E47297B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(619) := '206C5F67656E657261746564203D207B0A202020202020202020202020202020206974656D733A20312C0A2020202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D737461722D726174';
wwv_flow_imp.g_varchar2_table(620) := '696E67272C0A2020202020202020202020202020202068746D6C3A20600A3C6469762069643D22234944232220636C6173733D22612D53746172526174696E6720617065782D6974656D2D73746172726174696E67223E0A20203C64697620636C617373';
wwv_flow_imp.g_varchar2_table(621) := '3D22612D53746172526174696E67223E0A202020203C696E70757420747970653D22746578742220617269612D6C6162656C6C656462793D22234944235F4C4142454C222069643D22234944235F494E505554222076616C75653D222356414C55452322';
wwv_flow_imp.g_varchar2_table(622) := '206E616D653D222349442220636C6173733D2220752D76682069732D666F63757361626C652220726F6C653D227370696E627574746F6E2220617269612D76616C75656E6F773D222356414C5545232220617269612D76616C75656D61783D22234D4158';
wwv_flow_imp.g_varchar2_table(623) := '232220617269612D76616C7565746578743D222356414C554523223E200A202020203C64697620636C6173733D22612D53746172526174696E672D7374617273223E200A202020203C2F6469763E0A20203C2F6469763E0A3C2F6469763E0A607D3B0A20';
wwv_flow_imp.g_varchar2_table(624) := '2020202020202020207D20656C7365207B0A202020202020202020202020696628736368656D612E726561644F6E6C79297B0A20202020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020202020697465';
wwv_flow_imp.g_varchar2_table(625) := '6D733A20312C0A2020202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A2020202020202020202020202020202068746D6C3A20273C7370616E206964';
wwv_flow_imp.g_varchar2_table(626) := '3D22234944235F444953504C415922202352455155495245442320636C6173733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C792220646174612D6573636170653D2274727565223E2356414C5545233C2F73';
wwv_flow_imp.g_varchar2_table(627) := '70616E3E277D3B0A2020202020202020202020207D20656C7365207B0A20202020202020202020202020206C5F67656E657261746564203D207B0A202020202020202020202020202020206974656D733A20312C0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(628) := '2077726170706572747970653A2027617065782D6974656D2D777261707065722D2D6E756D6265722D6669656C64272C0A2020202020202020202020202020202068746D6C3A20600A3C696E70757420747970653D2274657874222069643D2223494423';
wwv_flow_imp.g_varchar2_table(629) := '22206E616D653D22234944232220235245515549524544232023504C414345484F4C4445522320636C6173733D2223414C49474E23206E756D6265725F6669656C6420617065782D6974656D2D7465787420617065782D6974656D2D6E756D6265722220';
wwv_flow_imp.g_varchar2_table(630) := '73697A653D2233302220234D494E2320234D41582320646174612D666F726D61743D2223464F524D4154232220696E7075746D6F64653D22646563696D616C22207374796C653D22746578742D616C69676E3A7374617274223E0A607D3B0A2020202020';
wwv_flow_imp.g_varchar2_table(631) := '20202020207D0A20202020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F724E756D65726963222C206C5F67656E657261746564293B0A20202020726574';
wwv_flow_imp.g_varchar2_table(632) := '75726E286C5F67656E657261746564293B0A20207D3B0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F72206120737472696E672070726F706572747920646570656E64696E67206F6E206974656D747970652E0A';
wwv_flow_imp.g_varchar2_table(633) := '2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F202020200A202066756E6374696F6E2067656E6572617465466F72426F6F6C65616E2873636865';
wwv_flow_imp.g_varchar2_table(634) := '6D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D297B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C';
wwv_flow_imp.g_varchar2_table(635) := '3A2027277D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72426F6F6C65616E222C207363';
wwv_flow_imp.g_varchar2_table(636) := '68656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A2020202073776974636828736368656D612E617065782E6974656D74797065297B0A202020206361736520435F415045585F53574954';
wwv_flow_imp.g_varchar2_table(637) := '43483A0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D7965732D6E6F272C0A202020202020';
wwv_flow_imp.g_varchar2_table(638) := '202068746D6C3A20600A3C7370616E20636C6173733D22612D537769746368223E0A20203C696E70757420747970653D22636865636B626F78222069643D222349442322206E616D653D22234944232220636C6173733D22222076616C75653D22592220';
wwv_flow_imp.g_varchar2_table(639) := '646174612D6F6E2D6C6162656C3D224F6E2220646174612D6F66662D76616C75653D224E2220646174612D6F66662D6C6162656C3D224F6666223E0A20203C7370616E20636C6173733D22612D5377697463682D746F67676C65223E3C2F7370616E3E0A';
wwv_flow_imp.g_varchar2_table(640) := '3C2F7370616E3E0A607D3B20200A20202020627265616B3B0A202020206361736520435F415045585F53454C4543543A0A202020206361736520435F415045585F524144494F3A0A2020202020206C6574206C5F61706578203D207B2E2E2E736368656D';
wwv_flow_imp.g_varchar2_table(641) := '612E617065787D3B0A2020202020206C5F617065782E656E756D203D207B4E3A20224E6F222C20593A2022596573227D3B0A2020202020206C6574206C5F67656E203D2067656E6572617465466F72537472696E67287B2274797065223A202273747269';
wwv_flow_imp.g_varchar2_table(642) := '6E67222C202269735265717569726564223A20736368656D612E697352657175697265642C2022656E756D223A205B224E222C202259225D2C202261706578223A206C5F617065787D2C20646174612C207072656669782C206E616D652C207374617274';
wwv_flow_imp.g_varchar2_table(643) := '656E642C206E65774974656D293B0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202077726170706572747970653A2028736368656D612E617065782E6974656D747970653D3D43';
wwv_flow_imp.g_varchar2_table(644) := '5F415045585F53454C454354293F27617065782D6974656D2D777261707065722D2D73696E676C652D636865636B626F78273A27617065782D6974656D2D777261707065722D2D726164696F67726F7570272C0A202020202020202068746D6C3A206C5F';
wwv_flow_imp.g_varchar2_table(645) := '67656E2E68746D6C0A2020202020207D3B0A20202020627265616B3B0A2020202064656661756C743A0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202077726170706572747970';
wwv_flow_imp.g_varchar2_table(646) := '653A2027617065782D6974656D2D777261707065722D2D73696E676C652D636865636B626F78272C0A202020202020202068746D6C3A20600A3C64697620636C6173733D22617065782D6974656D2D73696E676C652D636865636B626F78223E0A20203C';
wwv_flow_imp.g_varchar2_table(647) := '696E70757420747970653D2268696464656E22206E616D653D22234944232220636C6173733D22222069643D22234944235F48494444454E56414C5545222076616C75653D222356414C554523223E0A20203C696E70757420747970653D22636865636B';
wwv_flow_imp.g_varchar2_table(648) := '626F78222023434845434B45442320235245515549524544232069643D22234944232220617269612D6C6162656C3D22234C4142454C232220646174612D756E636865636B65642D76616C75653D224E222076616C75653D2259223E0A20203C6C616265';
wwv_flow_imp.g_varchar2_table(649) := '6C20666F723D2223494423222069643D22234944235F4C4142454C2220636C6173733D2220752D636865636B626F782220617269612D68696464656E3D2274727565223E234C4142454C233C2F6C6162656C3E0A3C2F6469763E0A607D3B202020200A20';
wwv_flow_imp.g_varchar2_table(650) := '2020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72426F6F6C65616E222C206C5F67656E657261746564293B0A2020202072657475726E20286C5F67656E657261746564293B';
wwv_flow_imp.g_varchar2_table(651) := '0A20207D0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F72206120737472696E672070726F706572747920646570656E64696E67206F6E206974656D747970652E0A2020202A2043757272656E746C79206F6E6C';
wwv_flow_imp.g_varchar2_table(652) := '7920617272617973206F662073696D706C6520747970657320776974682022656E756D220A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D200A20202A2F20';
wwv_flow_imp.g_varchar2_table(653) := '200A202066756E6374696F6E2067656E6572617465466F72417272617928736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D297B0A202020206C6574206C5F67656E';
wwv_flow_imp.g_varchar2_table(654) := '657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F7241727261';
wwv_flow_imp.g_varchar2_table(655) := '79222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A202020206C6574206974656D203D20736368656D612E6974656D737C7C7B7D3B0A202020206461';
wwv_flow_imp.g_varchar2_table(656) := '7461203D2064617461207C7C205B5D3B0A2020202069662841727261792E69734172726179286461746129297B0A2020202020206966282041727261792E69734172726179286974656D2E656E756D29297B20202F2F207768656E207468657265206973';
wwv_flow_imp.g_varchar2_table(657) := '20616E20656E756D2C207468697320617272617920666F722061206D756C746973656C656374696F6E0A20202020202020206966285B435F4A534F4E5F535452494E472C20435F4A534F4E5F494E54454745522C20435F4A534F4E5F4E554D4245525D2E';
wwv_flow_imp.g_varchar2_table(658) := '696E636C75646573286974656D2E7479706529297B0A202020202020202020206C5F67656E6572617465642E6974656D73203D313B0A20202020202020202020696628617065782E656E762E415045585F56455253494F4E203E3D2732332E322E302720';
wwv_flow_imp.g_varchar2_table(659) := '26262028736368656D612E617065782E6974656D747970653D3D435F415045585F434F4D424F207C7C20286974656D2E61706578202626206974656D2E617065782E6974656D747970653D3D435F415045585F434F4D424F2929297B0A20202020202020';
wwv_flow_imp.g_varchar2_table(660) := '20202020206C5F67656E657261746564203D2067656E6572617465466F72436F6D626F286974656D2C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A202020202020202020207D20656C7365207B';
wwv_flow_imp.g_varchar2_table(661) := '0A2020202020202020202020206C5F67656E657261746564203D202067656E6572617465466F7253656C656374286974656D2C20646174612C207072656669782C206E616D652C207374617274656E642C20435F415045585F434845434B424F582C2073';
wwv_flow_imp.g_varchar2_table(662) := '6368656D612E61706578293B0A202020202020202020207D0A20202020202020207D20656C7365207B0A202020202020202020206C6F67536368656D614572726F7228272274797065223A3A20226172726179222073696D706C65207479706520737472';
wwv_flow_imp.g_varchar2_table(663) := '696E67207769746820656E756D206F6E6C79272C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E64293B0A20202020202020207D0A2020202020207D20656C7365207B20202F2F206C6F6F70207468726F7567';
wwv_flow_imp.g_varchar2_table(664) := '682074686520617272617920616E642067656E657261746520616E206F626A65637420666F72206561636820726F770A2020202020202020696628704F7074696F6E732E68656164657273297B0A202020202020202020206C5F67656E6572617465642E';
wwv_flow_imp.g_varchar2_table(665) := '68746D6C203D2067656E6572617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C207072656669782C2066616C73652C202743524541544527293B0A20202020202020207D0A2020';
wwv_flow_imp.g_varchar2_table(666) := '202020202020666F7228636F6E737420206920696E206461746129207B0A20202020202020202020636F6E7374206C5F67656E203D2067656E6572617465466F724F626A656374286974656D2C20646174615B695D2C207072656669782C202727202B69';
wwv_flow_imp.g_varchar2_table(667) := '2C207374617274656E642C20747275652C206E65774974656D293B0A202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A20202020202020207D0A0A0A2020202020207D0A202020207D20656C7365';
wwv_flow_imp.g_varchar2_table(668) := '207B0A2020202020206C6F67536368656D614572726F72282764617461206D75737420626520616E206172726179272C2064617461293B0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E';
wwv_flow_imp.g_varchar2_table(669) := '6572617465466F724172726179222C206C5F67656E657261746564293B2020200A2020202072657475726E286C5F67656E657261746564293B0A20207D0A0A0A20202F2A0A2020202A0A20202A2F0A202066756E6374696F6E20636865636B436F6E6469';
wwv_flow_imp.g_varchar2_table(670) := '74696F6E28736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E636865636B436F6E646974696F6E222C20736368656D61293B0A0A202020206C6574206C5F726574203D2028747970656F6620';
wwv_flow_imp.g_varchar2_table(671) := '736368656D61203D3D276F626A65637427202626202141727261792E6973417272617928736368656D6129293B0A202020206966286C5F72657420262620736368656D612E616C6C4F66297B202020200A2020202020206C5F726574203D204172726179';
wwv_flow_imp.g_varchar2_table(672) := '2E6973417272617928736368656D612E616C6C4F66293B0A2020202020206966286C5F726574297B202020202F2F20616C6C4F6620697320646566696E656420616E6420616E2061727261790A2020202020202020666F7228636F6E7374206C5F736368';
wwv_flow_imp.g_varchar2_table(673) := '656D61206F6620736368656D612E616C6C4F66297B0A202020202020202020206C5F726574203D206C5F72657420262620636865636B436F6E646974696F6E286C5F736368656D61293B0A20202020202020207D20200A2020202020207D2020200A2020';
wwv_flow_imp.g_varchar2_table(674) := '20207D0A202020206966286C5F72657420262620736368656D612E616E794F66297B202020200A2020202020206C5F726574203D2041727261792E6973417272617928736368656D612E616E794F66293B2020200A2020202020206966286C5F72657429';
wwv_flow_imp.g_varchar2_table(675) := '7B20202020202F2F20616E794F6620697320646566696E656420616E6420616E2061727261790A2020202020202020666F7228636F6E7374206C5F736368656D61206F6620736368656D612E616E794F66297B0A202020202020202020206C5F72657420';
wwv_flow_imp.g_varchar2_table(676) := '3D206C5F72657420262620636865636B436F6E646974696F6E286C5F736368656D61293B0A20202020202020207D0A2020202020207D20200A202020207D0A0A202020206966286C5F72657420262620736368656D612E6E6F74297B20202F2F206E6F74';
wwv_flow_imp.g_varchar2_table(677) := '20697320646566696E656420616E6420616E206F626A656374200A2020202020206C5F726574203D2028747970656F6620736368656D612E6E6F74203D3D20276F626A65637427293B2020200A2020202020206C5F726574203D206C5F72657420262620';
wwv_flow_imp.g_varchar2_table(678) := '636865636B436F6E646974696F6E28736368656D612E6E6F74293B200A202020207D0A202020200A202020206966286C5F72657420262620736368656D612E7265717569726564297B20202F2F20726571756972656420697320646566696E656420616E';
wwv_flow_imp.g_varchar2_table(679) := '6420616E206172726179200A2020202020206C5F726574203D202841727261792E6973417272617928736368656D612E726571756972656429293B2020200A202020207D0A0A202020206966286C5F72657420262620736368656D612E70726F70657274';
wwv_flow_imp.g_varchar2_table(680) := '696573297B20202F2F206E6F7420697320646566696E656420616E6420616E206F626A656374200A2020202020206C5F726574203D2028747970656F6620736368656D612E70726F70657274696573203D3D20276F626A65637427293B200A2020202020';
wwv_flow_imp.g_varchar2_table(681) := '206C5F726574203D206C5F72657420262620636865636B436F6E646974696F6E28736368656D612E70726F70657274696573293B20200A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E63686563';
wwv_flow_imp.g_varchar2_table(682) := '6B436F6E646974696F6E222C206C5F726574293B0A2020202072657475726E206C5F7265743B0A20207D0A0A20202F2A0A2020202A2067656E657261746520554920666F7220636F6E646974696F6E616C20736368656D6120776974682069662F746865';
wwv_flow_imp.g_varchar2_table(683) := '6E2F656C73650A2020202A2072657475726E73207B6974656D733A302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D200A20202A2F0A202066756E6374696F6E2067656E6572617465466F72436F6E646974696F6E';
wwv_flow_imp.g_varchar2_table(684) := '616C28736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D297B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572';
wwv_flow_imp.g_varchar2_table(685) := '747970653A206E756C6C2C2068746D6C3A2027277D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72436F6E646974696F6E616C222C20736368656D612C20646174612C20707265';
wwv_flow_imp.g_varchar2_table(686) := '6669782C206E616D652C20696E41727261792C207374617274656E64293B0A0A20202020696628747970656F6620736368656D612E6966203D3D20276F626A65637427297B20202F2F207468657265206973206120636F6E646974696F6E616C20736368';
wwv_flow_imp.g_varchar2_table(687) := '656D610A2020202020202F2F2055492069732067656E65726174656420666F72205448454E20616E6420454C53452C2073657420746F2068696464656E20646570656E64696E67206F6E2069662D636C617573650A202020202020696628636865636B43';
wwv_flow_imp.g_varchar2_table(688) := '6F6E646974696F6E28736368656D612E696629297B0A2020202020202020696628736368656D612E7468656E297B0A20202020202020202020696628736368656D612E7468656E2E70726F70657274696573297B0A202020202020202020202020666F72';
wwv_flow_imp.g_varchar2_table(689) := '286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E7468656E2E70726F706572746965737C7C7B7D29297B0A20202020202020202020202020206C6574206C5F67656E203D206765';
wwv_flow_imp.g_varchar2_table(690) := '6E6572617465466F724F626A656374286C5F736368656D612C20646174615B6C5F6E616D655D2C20287072656669783F7072656669782B435F44454C494D495445523A2727292B6E616D652C206C5F6E616D652C207374617274656E642C2066616C7365';
wwv_flow_imp.g_varchar2_table(691) := '2C206E65774974656D293B0A20202020202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A2020202020202020202020207D0A202020202020202020207D0A20202020202020207D0A0A2020202020';
wwv_flow_imp.g_varchar2_table(692) := '202020696628736368656D612E656C7365297B20202F2F207769746820656C73650A20202020202020202020696628736368656D612E656C73652E70726F70657274696573297B0A202020202020202020202020666F72286C6574205B6C5F6E616D652C';
wwv_flow_imp.g_varchar2_table(693) := '206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E656C73652E70726F706572746965737C7C7B7D29297B0A20202020202020202020202020206C6574206C5F67656E203D2067656E6572617465466F724F626A65';
wwv_flow_imp.g_varchar2_table(694) := '6374286C5F736368656D612C20646174615B6C5F6E616D655D2C20287072656669783F7072656669782B435F44454C494D495445523A2727292B6E616D652C206C5F6E616D652C207374617274656E642C2066616C73652C206E65774974656D293B0A20';
wwv_flow_imp.g_varchar2_table(695) := '202020202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A2020202020202020202020207D0A202020202020202020207D0A20202020202020207D0A2020202020207D20656C7365207B0A20202020';
wwv_flow_imp.g_varchar2_table(696) := '202020206C6F67536368656D614572726F722827696E76616C696420636F6E646974696F6E272C20736368656D612E69662920200A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F';
wwv_flow_imp.g_varchar2_table(697) := '6E2E67656E6572617465466F72436F6E646974696F6E616C222C206C5F67656E657261746564293B200A2020202072657475726E286C5F67656E657261746564293B0A20207D0A0A20202F2A0A2020202A2047656E657261746520612073657061726174';
wwv_flow_imp.g_varchar2_table(698) := '6F72206C696E6520286E657720726F772920696E2074686520415045582D55490A2020202A205768656E2061206C6162656C20697320676976656E2061646420697420746F20746865206C696E650A2020202A2054686520696420697320726571756972';
wwv_flow_imp.g_varchar2_table(699) := '656420746F2073686F772F686964652074686520636F6E74656E74206F662074686520726F7720666F7220636F6E646974696F6E616C20736368656D610A2020202A2072657475726E73207468652068746D6C200A20202A2F0A202066756E6374696F6E';
wwv_flow_imp.g_varchar2_table(700) := '2067656E6572617465536570617261746F7228736368656D612C206C6162656C2C2069642C20696E41727261792C20627574746F6E297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E657261746553';
wwv_flow_imp.g_varchar2_table(701) := '6570617261746F72222C206C6162656C2C2069642C20696E41727261792C20627574746F6E293B200A202020206C6574206C5F68746D6C203D27273B0A2020202069662821696E4172726179202626206C6162656C29207B202020202F2F205468657265';
wwv_flow_imp.g_varchar2_table(702) := '2069732061206C6162656C2C207075742061206C696E6520776974682074686520746578740A2020202020206C5F68746D6C202B3D20600A3C2F6469763E0A3C64697620636C6173733D22726F77206A736F6E726567696F6E223E0A20203C6469762063';
wwv_flow_imp.g_varchar2_table(703) := '6C6173733D22742D526567696F6E2D686561646572223E0A202020203C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F6E2D6865616465724974656D732D2D7469746C65223E0A2020202020203C6832';
wwv_flow_imp.g_varchar2_table(704) := '20636C6173733D22742D526567696F6E2D7469746C65222069643D22234944235F68656164696E672220646174612D617065782D68656164696E673D22223E234C4142454C233C2F68323E0A202020203C2F6469763E0A20603B0A202020207D0A200A20';
wwv_flow_imp.g_varchar2_table(705) := '202020696628627574746F6E2026262021736368656D612E726561644F6E6C79297B20202F2F200A2020202020206C5F68746D6C202B3D20600A202020203C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567';
wwv_flow_imp.g_varchar2_table(706) := '696F6E2D6865616465724974656D732D2D627574746F6E73223E0A2020202020203C627574746F6E2069643D22234944235F4352454154452220747970653D22627574746F6E2220636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F';
wwv_flow_imp.g_varchar2_table(707) := '4C6162656C20742D427574746F6E2D2D69636F6E206A732D69676E6F72654368616E6765206C746F33333135333836393834383630343539325F3022207469746C653D224372656174652220617269612D6C6162656C3D22437265617465223E0A202020';
wwv_flow_imp.g_varchar2_table(708) := '20202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D69672D6164642D726F772220617269612D68696464656E3D2274727565223E3C2F7370616E3E0A2020202020203C2F627574746F6E3E0A202020203C2F6469763E0A20203C2F';
wwv_flow_imp.g_varchar2_table(709) := '6469763E0A603B0A202020207D20656C7365207B0A2020202020206C5F68746D6C202B3D20600A20203C2F6469763E0A603B0A202020207D0A0A202020206C5F68746D6C202B3D20600A3C2F6469763E0A3C6469762069643D22234944235F434F4E5441';
wwv_flow_imp.g_varchar2_table(710) := '494E45522220636C6173733D22726F77206A736F6E726567696F6E202343535323223E0A20603B0A0A202020206C5F68746D6C203D20617065782E7574696C2E6170706C7954656D706C617465286C5F68746D6C2C200A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(711) := '202020202020202020202020202020202020202020202020207B200A20202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(712) := '2020202020202020202020202020202020202020202020202020224C4142454C223A206C6162656C2C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020224944223A2020202069642C0A202020';
wwv_flow_imp.g_varchar2_table(713) := '20202020202020202020202020202020202020202020202020202020202020202020202020202022435353223A20202028736368656D612E747970653D3D435F4A534F4E5F4F424A454354293F28736368656D612E617065782E6373737C7C2727293A27';
wwv_flow_imp.g_varchar2_table(714) := '270A202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A0A20202020617065782E64656275';
wwv_flow_imp.g_varchar2_table(715) := '672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465536570617261746F7222293B200A2020202072657475726E286C5F68746D6C293B0A20207D0A0A2020200A202066756E6374696F6E2067656E6572617465417272617944656C';
wwv_flow_imp.g_varchar2_table(716) := '657465427574746F6E28646174616974656D297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465417272617944656C657465427574746F6E222C20646174616974656D293B200A20202020';
wwv_flow_imp.g_varchar2_table(717) := '6C6574206C5F68746D6C203D20600A3C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F6E2D6865616465724974656D732D2D627574746F6E73223E0A20203C627574746F6E2069643D22234944235F44';
wwv_flow_imp.g_varchar2_table(718) := '454C4554452220747970653D22627574746F6E2220636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E206A732D69676E6F72654368616E6765206C746F3333313533383639383438';
wwv_flow_imp.g_varchar2_table(719) := '3630343539325F3022207469746C653D2244656C6574652220617269612D6C6162656C3D22437265617465223E0A202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D69672D64656C6574652220617269612D68696464656E3D2274';
wwv_flow_imp.g_varchar2_table(720) := '727565223E3C2F7370616E3E0A20203C2F627574746F6E3E0A3C2F6469763E0A603B0A202020206C5F68746D6C203D20617065782E7574696C2E6170706C7954656D706C617465286C5F68746D6C2C207B20706C616365686F6C646572733A207B224944';
wwv_flow_imp.g_varchar2_table(721) := '223A20646174616974656D7D207D20293B0A0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465417272617944656C657465427574746F6E22293B200A2020202072657475726E206C5F68746D';
wwv_flow_imp.g_varchar2_table(722) := '6C3B0A20207D0A0A20202F2A0A2020202A2067656E657261746520666F722061207461656D706C6174652074686520636C617373657320666F7220737461636B6C65642C20666C6F6174696E672C2072656C2D636F6C2C2068696464656E0A2020202A20';
wwv_flow_imp.g_varchar2_table(723) := '52657475726E73203A7B636F6E7461696E65723A2027616161272C206C6162656C3A2027626262272C20696E7075743A2027636363277D0A2020202A2054686520636C617373657320666F7220746865206974656D20636F6E7461696E65722C20666F72';
wwv_flow_imp.g_varchar2_table(724) := '206C6162656C20616E6420696E7075740A20202A2F0A202066756E6374696F6E2067656E54656D706C6174652874656D706C6174652C20636F6C77696474682C20736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A73';
wwv_flow_imp.g_varchar2_table(725) := '6F6E526567696F6E2E67656E54656D706C617465222C2074656D706C6174652C20636F6C77696474682C20736368656D61293B200A202020206C6574206C5F726574203D207B7D3B0A2020202073776974636828736368656D612E617065782E74656D70';
wwv_flow_imp.g_varchar2_table(726) := '6C6174657C7C74656D706C617465297B0A202020206361736520435F415045585F54454D504C4154455F4C4142454C5F48494444454E3A0A2020202020206C5F726574203D207B0A20202020202020202020202020202020636F6E7461696E65723A2027';
wwv_flow_imp.g_varchar2_table(727) := '742D466F726D2D6669656C64436F6E7461696E65722D2D68696464656E4C6162656C2072656C2D636F6C272C0A202020202020202020202020202020206C6162656C3A2027742D466F726D2D6669656C64436F6E7461696E65722D2D68696464656E4C61';
wwv_flow_imp.g_varchar2_table(728) := '62656C20636F6C20636F6C2D32272C0A20202020202020202020202020202020696E7075743A2027636F6C20636F6C2D27202B204D6174682E6D617828312C20636F6C77696474682D32292C0A2020202020202020202020202020202068696464656E3A';
wwv_flow_imp.g_varchar2_table(729) := '2027752D56697375616C6C7948696464656E270A20202020202020202020202020207D3B20200A20202020627265616B3B200A202020206361736520435F415045585F54454D504C4154455F4C4142454C5F4C4546543A200A2020202020206C5F726574';
wwv_flow_imp.g_varchar2_table(730) := '203D207B0A20202020202020202020202020202020636F6E7461696E65723A202772656C2D636F6C272C0A202020202020202020202020202020206C6162656C3A2027636F6C20636F6C2D32272C0A20202020202020202020202020202020696E707574';
wwv_flow_imp.g_varchar2_table(731) := '3A2027636F6C20636F6C2D27202B204D6174682E6D617828312C20636F6C77696474682D32292C0A2020202020202020202020202020202068696464656E3A2027270A20202020202020202020202020207D3B0A20202020627265616B3B0A2020202063';
wwv_flow_imp.g_varchar2_table(732) := '61736520435F415045585F54454D504C4154455F4C4142454C5F41424F56453A200A2020202020206C5F726574203D207B0A20202020202020202020202020202020636F6E7461696E65723A2027742D466F726D2D6669656C64436F6E7461696E65722D';
wwv_flow_imp.g_varchar2_table(733) := '2D737461636B6564272C0A202020202020202020202020202020206C6162656C3A2027272C0A20202020202020202020202020202020696E7075743A2027272C0A2020202020202020202020202020202068696464656E3A2027270A2020202020202020';
wwv_flow_imp.g_varchar2_table(734) := '2020202020207D3B0A20202020627265616B3B0A202020206361736520435F415045585F54454D504C4154455F4C4142454C5F464C4F4154494E473A200A2020202064656661756C743A200A2020202020206C5F726574203D207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(735) := '2020202020202020636F6E7461696E65723A2027742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C272C0A202020202020202020202020202020206C6162656C3A2027272C0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(736) := '2020696E7075743A2027272C0A2020202020202020202020202020202068696464656E3A2027270A20202020202020202020202020207D3B3B0A20202020627265616B3B0A202020207D0A0A20202020617065782E64656275672E747261636528223C3C';
wwv_flow_imp.g_varchar2_table(737) := '6A736F6E526567696F6E2E67656E54656D706C617465222C206C5F726574293B200A2020202072657475726E206C5F7265743B0A20207D0A0A20202F2A0A2020202A2067656E657261746520554920666F7220616E206F626A65637420736368656D612C';
wwv_flow_imp.g_varchar2_table(738) := '20666F6C6C6F77206E657374656420736368656D6173200A2020202A2072657475726E73207B6974656D733A302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E65';
wwv_flow_imp.g_varchar2_table(739) := '72617465466F724F626A65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D297B0A20202020736368656D612E61706578203D20736368656D612E61706578';
wwv_flow_imp.g_varchar2_table(740) := '207C7C7B7D3B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A0A20202020617065782E64656275672E747261636528223E3E6A736F6E52';
wwv_flow_imp.g_varchar2_table(741) := '6567696F6E2E67656E6572617465466F724F626A656374222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A0A202020206966282827272B6E616D6529';
wwv_flow_imp.g_varchar2_table(742) := '2E7374617274735769746828275F2729297B2020202F2F2069676E6F72652070726F7065727469657320686176696E67206E616D6573207374617274696E67207769746820225F220A2020202020202020617065782E64656275672E747261636528223C';
wwv_flow_imp.g_varchar2_table(743) := '3C6A736F6E526567696F6E2E67656E6572617465466F724F626A656374222C206C5F67656E657261746564293B0A202020202020202072657475726E206C5F67656E6572617465643B0A202020207D0A0A2020202073776974636828736368656D612E74';
wwv_flow_imp.g_varchar2_table(744) := '797065297B0A20202020202020206361736520226172726179223A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F72417272617928736368656D612C20646174612C20287072656669783F7072656669782B435F';
wwv_flow_imp.g_varchar2_table(745) := '44454C494D495445523A2727292B6E616D652C206E616D652C207374617274656E642C20747275652C206E65774974656D293B0A2020202020202020627265616B3B0A20202020202020206361736520226F626A656374223A202F2F20616E206F626A65';
wwv_flow_imp.g_varchar2_table(746) := '63742C20736F2067656E657261746520616C6C206F66206974732070726F706572746965730A2020202020202020202064617461203D2064617461207C7C277B7D273B0A20202020202020202020696628704F7074696F6E732E68656164657273297B0A';
wwv_flow_imp.g_varchar2_table(747) := '2020202020202020202020206C5F67656E6572617465642E68746D6C203D2067656E6572617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C2067656E4974656D6E616D65287072';
wwv_flow_imp.g_varchar2_table(748) := '656669782C206E616D65292C20696E41727261792C206E756C6C293B0A202020202020202020207D0A20202020202020202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E74726965732873636865';
wwv_flow_imp.g_varchar2_table(749) := '6D612E70726F706572746965737C7C7B7D29297B0A2020202020202020202020207374617274656E64203D20303B202F2F6C5F726F773D3D313F2D313A286C5F726F773E3D4F626A6563742E6B65797328736368656D612E70726F70657274696573292E';
wwv_flow_imp.g_varchar2_table(750) := '6C656E6774683F313A30293B0A2020202020202020202020206C6574206C5F67656E203D2067656E6572617465466F724F626A656374286C5F736368656D612C20646174615B6C5F6E616D655D2C20287072656669783F7072656669782B435F44454C49';
wwv_flow_imp.g_varchar2_table(751) := '4D495445523A2727292B6E616D652C206C5F6E616D652C207374617274656E642C2066616C73652C206E65774974656D293B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A2020202020';
wwv_flow_imp.g_varchar2_table(752) := '202020202020206C5F67656E6572617465642E6974656D73202B3D206C5F67656E2E6974656D733B0A202020202020202020207D0A0A202020202020202020207B0A2020202020202020202020206C6574206C5F67656E203D2067656E6572617465466F';
wwv_flow_imp.g_varchar2_table(753) := '72436F6E646974696F6E616C28736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B';
wwv_flow_imp.g_varchar2_table(754) := '3D206C5F67656E2E68746D6C3B0A2020202020202020202020206C5F67656E6572617465642E6974656D73202B3D206C5F67656E2E6974656D733B0A202020202020202020207D0A0A20202020202020202020696628696E417272617920262620217363';
wwv_flow_imp.g_varchar2_table(755) := '68656D612E726561644F6E6C79297B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D2067656E6572617465417272617944656C657465427574746F6E2867656E4974656D6E616D65287072656669782C206E616D652929';
wwv_flow_imp.g_varchar2_table(756) := '3B0A202020202020202020207D0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F535452494E473A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F72537472696E672873';
wwv_flow_imp.g_varchar2_table(757) := '6368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A2020202020202020627265616B3B0A0A20202020202020206361736520435F4A534F4E5F494E54454745523A0A2020202020202020';
wwv_flow_imp.g_varchar2_table(758) := '6361736520435F4A534F4E5F4E554D4245523A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F724E756D6572696328736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C';
wwv_flow_imp.g_varchar2_table(759) := '206E65774974656D293B0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F424F4F4C45414E3A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F72426F6F6C65616E287363';
wwv_flow_imp.g_varchar2_table(760) := '68656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A2020202020202020627265616B3B0A20202020202020206361736520756E646566696E65643A20202F2F206E6F20747970652C20736F';
wwv_flow_imp.g_varchar2_table(761) := '20646F206E6F7468696E670A2020202020202020202069662821435F4A534F4E5F434F4E535420696E20736368656D61297B202F2F206120636F6E737420646F65736E2774206E656564206120747970650A2020202020202020202020206C6F67536368';
wwv_flow_imp.g_varchar2_table(762) := '656D614572726F72282722747970652220697320756E646566696E656427293B0A202020202020202020207D0A2020202020202020627265616B0A20202020202020206361736520276E756C6C273A0A2020202020202020627265616B3B202020200A20';
wwv_flow_imp.g_varchar2_table(763) := '2020202020202064656661756C743A0A202020202020202020206C6F67536368656D614572726F7228272274797065223A2022257322206E6F7420696D706C656D656E746564272C20736368656D612E74797065293B0A2020202020202020627265616B';
wwv_flow_imp.g_varchar2_table(764) := '3B0A2020202020207D0A0A2020202020206966286C5F67656E6572617465642E7772617070657274797065297B202F2F20696E707574206974656D732069732067656E6572617465640A20202020202020206C6574206C6162656C203D2067656E657261';
wwv_flow_imp.g_varchar2_table(765) := '74654C6162656C286E616D652C20736368656D61293B0A2020202020202020636F6E7374206C5F74656D706C617465203D2067656E54656D706C61746528704F7074696F6E732E74656D706C6174652C20704F7074696F6E732E636F6C77696474682C20';
wwv_flow_imp.g_varchar2_table(766) := '736368656D61293B0A20202020202020202F2F20636F6E736F6C652E6C6F6728646174612C20736368656D61290A20202020202020206C5F67656E657261746564203D207B0A202020202020202020206974656D733A202020202020206C5F67656E6572';
wwv_flow_imp.g_varchar2_table(767) := '617465642E6974656D732C0A2020202020202020202077726170706572747970653A206C5F67656E6572617465642E77726170706572747970652C0A2020202020202020202068746D6C3A2020202020202020617065782E7574696C2E6170706C795465';
wwv_flow_imp.g_varchar2_table(768) := '6D706C617465280A600A20203C64697620636C6173733D22636F6C20636F6C2D23434F4C57494454482320617065782D636F6C2D6175746F2023434F4C5354415254454E4423223E0A202020203C646976202069643D22234944235F434F4E5441494E45';
wwv_flow_imp.g_varchar2_table(769) := '522220636C6173733D22742D466F726D2D6669656C64436F6E7461696E657220234649454C4454454D504C415445232023495352455155495245442320234353532320695F3131323931383130395F3020617065782D6974656D2D777261707065722023';
wwv_flow_imp.g_varchar2_table(770) := '57524150504552545950452322203E0A2020202020203C64697620636C6173733D22742D466F726D2D6C6162656C436F6E7461696E657220234C4142454C54454D504C41544523223E0A20202020202020203C6C6162656C20666F723D22234944232220';
wwv_flow_imp.g_varchar2_table(771) := '69643D22234944235F4C4142454C2220636C6173733D22742D466F726D2D6C6162656C20234C4142454C48494444454E23223E23544F504C4142454C233C2F6C6162656C3E0A2020202020203C2F6469763E0A2020202020203C64697620636C6173733D';
wwv_flow_imp.g_varchar2_table(772) := '22742D466F726D2D696E707574436F6E7461696E65722023494E50555454454D504C41544523223E0A20202020202020203C64697620636C6173733D22742D466F726D2D6974656D52657175697265642D6D61726B65722220617269612D68696464656E';
wwv_flow_imp.g_varchar2_table(773) := '3D2274727565223E3C2F6469763E0A20202020202020203C64697620636C6173733D22742D466F726D2D6974656D57726170706572223E0A60202B20206C5F67656E6572617465642E68746D6C202B0A60200A20202020202020203C2F6469763E0A2020';
wwv_flow_imp.g_varchar2_table(774) := '2020202020203C64697620636C6173733D22742D466F726D2D6974656D417373697374616E6365223E0A202020202020202020203C7370616E2069643D22234944235F6572726F725F706C616365686F6C6465722220636C6173733D22612D466F726D2D';
wwv_flow_imp.g_varchar2_table(775) := '6572726F7220752D76697369626C652220646174612D74656D706C6174652D69643D22234441544154454D504C41544523223E3C2F7370616E3E0A202020202020202020203C64697620636C6173733D22742D466F726D2D6974656D5265717569726564';
wwv_flow_imp.g_varchar2_table(776) := '2220617269612D68696464656E3D2274727565223E52657175697265643C2F6469763E0A20202020202020203C2F6469763E0A2020202020203C2F6469763E0A202020203C2F6469763E0A20203C2F6469763E0A602C0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(777) := '20202020202020202020202020202020202020202020207B20706C616365686F6C646572733A207B225752415050455254595045223A20206C5F67656E6572617465642E77726170706572747970652C0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(778) := '2020202020202020202020202020202020202020202020202020202020202020202022434F4C5749445448223A202020202028736368656D612E617065782E636F6C5370616E3F736368656D612E617065782E636F6C5370616E3A704F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(779) := '636F6C7769647468292C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022524F5753223A20202020202020202028736368656D612E617065782E6C696E65733F73';
wwv_flow_imp.g_varchar2_table(780) := '6368656D612E617065782E6C696E65733A35292C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022434F4C5354415254454E44223A20207374617274656E643C30';
wwv_flow_imp.g_varchar2_table(781) := '3F27636F6C2D7374617274273A287374617274656E643E303F27636F6C2D656E64273A2727292C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224944223A2020';
wwv_flow_imp.g_varchar2_table(782) := '20202020202020202067656E4974656D6E616D65287072656669782C206E616D65292C200A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224E414D45223A202020';
wwv_flow_imp.g_varchar2_table(783) := '20202020202067656E4974656D6E616D65287072656669782C206E616D65292C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224C4142454C223A202020202020';
wwv_flow_imp.g_varchar2_table(784) := '20206C6162656C2C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224649454C4454454D504C415445223A206C5F74656D706C6174652E636F6E7461696E65722C';
wwv_flow_imp.g_varchar2_table(785) := '0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224C4142454C54454D504C415445223A206C5F74656D706C6174652E6C6162656C2C0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(786) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020224C4142454C48494444454E223A2020206C5F74656D706C6174652E68696464656E2C0A20202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(787) := '2020202020202020202020202020202020202020202020202020202020202022494E50555454454D504C415445223A206C5F74656D706C6174652E696E7075742C0A20202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(788) := '2020202020202020202020202020202020202022435353223A2020202020202020202020736368656D612E617065782E6373737C7C27272C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(789) := '2020202020202020202022414C49474E223A202020202020202063416C69676E5B736368656D612E617065782E616C69676E5D7C7C27272C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(790) := '2020202020202020202022524541444F4E4C59223A2020202020736368656D612E726561646F6E6C793F2274727565223A2266616C7365222C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(791) := '2020202020202020202020225452494D535041434553223A20202027424F5448272C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022414A41584944454E544946';
wwv_flow_imp.g_varchar2_table(792) := '494552223A2070416A61784964656E7469666965722C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224441544154454D504C415445223A20704F7074696F6E73';
wwv_flow_imp.g_varchar2_table(793) := '2E6461746174656D706C61746545542C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022504C414345484F4C444552223A2020736368656D612E617065782E706C';
wwv_flow_imp.g_varchar2_table(794) := '616365686F6C6465723F27706C616365686F6C6465723D22272B736368656D612E617065782E706C616365686F6C6465722B2722273A27272C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(795) := '202020202020202020202022464F524D4154223A20202020202020736368656D612E617065782E666F726D61747C7C27272C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(796) := '20202020224558414D504C45223A202020202020285B435F4A534F4E5F464F524D41545F444154452C20435F4A534F4E5F464F524D41545F4441544554494D452C20435F4A534F4E5F464F524D41545F54494D455D2E696E636C7564657328736368656D';
wwv_flow_imp.g_varchar2_table(797) := '612E666F726D6174293F6A736F6E56616C7565324974656D28736368656D612C20617065782E646174652E746F49534F537472696E67286E657720446174652829292C206E65774974656D293A2727292C200A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(798) := '202020202020202020202020202020202020202020202020202020202020202020202020224D494E4C454E475448223A20202020736368656D612E6D696E4C656E6774683F276D696E6C656E6774683D27202B20736368656D612E6D696E4C656E677468';
wwv_flow_imp.g_varchar2_table(799) := '3A27272C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224D41584C454E475448223A20202020736368656D612E6D61784C656E6774683F276D61786C656E6774';
wwv_flow_imp.g_varchar2_table(800) := '683D27202B20736368656D612E6D61784C656E6774683A27272C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022544F504C4142454C223A202020202028736368';
wwv_flow_imp.g_varchar2_table(801) := '656D612E747970653D3D20435F4A534F4E5F424F4F4C45414E2026262021285B435F415045585F53454C4543542C20435F415045585F524144494F2C20435F415045585F5357495443485D2E696E636C7564657328736368656D612E617065782E697465';
wwv_flow_imp.g_varchar2_table(802) := '6D747970652929293F22223A6C6162656C2C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022434845434B4544223A202020202020736368656D612E747970653D';
wwv_flow_imp.g_varchar2_table(803) := '3D20435F4A534F4E5F424F4F4C45414E20262620646174613F22636865636B6564223A22222C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020225041545445524E';
wwv_flow_imp.g_varchar2_table(804) := '223A202020202020736368656D612E7061747465726E3F277061747465726E3D22272B736368656D612E7061747465726E2B2722273A22222C20200A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(805) := '20202020202020202020202020225245515549524544223A2020202020736368656D612E697352657175697265643F2772657175697265643D2222273A22222C0A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(806) := '2020202020202020202020202020202020202249535245515549524544223A202020736368656D612E697352657175697265643F2769732D7265717569726564273A22222C0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(807) := '2020202020202020202020202020202020202020202020224D494E223A2020202020202020202028226D696E696D756D2220696E20736368656D61293F285B435F4A534F4E5F464F524D41545F444154452C20435F4A534F4E5F464F524D41545F444154';
wwv_flow_imp.g_varchar2_table(808) := '4554494D452C20435F4A534F4E5F464F524D41545F54494D455D2E696E636C7564657328736368656D612E666F726D6174293F276D696E273A27646174612D6D696E27292B273D22272B736368656D612E6D696E696D756D2B2722273A22222C0A202020';
wwv_flow_imp.g_varchar2_table(809) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224D4158223A2020202020202020202028226D6178696D756D2220696E20736368656D61293F285B435F4A534F4E5F464F52';
wwv_flow_imp.g_varchar2_table(810) := '4D41545F444154452C20435F4A534F4E5F464F524D41545F4441544554494D452C20435F4A534F4E5F464F524D41545F54494D455D2E696E636C7564657328736368656D612E666F726D6174293F276D6178273A27646174612D6D617827292B20273D22';
wwv_flow_imp.g_varchar2_table(811) := '272B736368656D612E6D6178696D756D2B2722273A22222C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202256414C5545223A20202020202020206A736F6E5661';
wwv_flow_imp.g_varchar2_table(812) := '6C7565324974656D28736368656D612C20646174612C206E65774974656D297C7C27272C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202251554F544556414C55';
wwv_flow_imp.g_varchar2_table(813) := '45223A20202028736368656D612E747970653D3D20435F4A534F4E5F535452494E472026262064617461293F617065782E7574696C2E65736361706548544D4C2827272B64617461293A28646174613F646174613A2727292C0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(814) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202022494D414745223A2020202020202020736368656D612E617065782E696D6167657C7C22220A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(815) := '2020202020202020202020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020202020202020202020202020207D290A20202020202020207D3B0A202020207D0A0A2020202069662828';
wwv_flow_imp.g_varchar2_table(816) := '736368656D612E617065782E746578744265666F7265207C7C20736368656D612E617065782E6E6577526F772929207B202F2F2063757272656E74206669656C642073686F756C642073746172742061742061206E657720726F770A2020202020206C5F';
wwv_flow_imp.g_varchar2_table(817) := '67656E6572617465642E68746D6C203D2067656E6572617465536570617261746F7228736368656D612C20736368656D612E617065782E746578744265666F72652C20707265666978202B20275F4F424A272C20696E41727261792C206E756C6C29202B';
wwv_flow_imp.g_varchar2_table(818) := '206C5F67656E6572617465642E68746D6C3B0A202020207D0A0A20202020696628696E4172726179202626206C5F67656E6572617465642E6974656D733D3D31297B202F2F2074686973206F626A6563742069732067656E65726174656420696E736964';
wwv_flow_imp.g_varchar2_table(819) := '6520616E2061727261792C20736F20616464206F6E626A6563742072656C617465642068746D6C206172726F756E647D0A202020202020696628704F7074696F6E732E68656164657273297B0A20202020202020206C5F67656E6572617465642E68746D';
wwv_flow_imp.g_varchar2_table(820) := '6C203D2067656E6572617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C2067656E4974656D6E616D65287072656669782C206E616D65292C20696E41727261792C206E756C6C29';
wwv_flow_imp.g_varchar2_table(821) := '202B206C5F67656E6572617465642E68746D6C3B0A2020202020207D0A20202020202069662821736368656D612E726561644F6E6C79297B0A20202020202020206C5F67656E6572617465642E68746D6C202B3D2067656E657261746541727261794465';
wwv_flow_imp.g_varchar2_table(822) := '6C657465427574746F6E2867656E4974656D6E616D65287072656669782C206E616D6529293B0A2020202020207D0A202020207D0A2F2A0A202020202020202020206966286C5F67656E2E6974656D73203D3D203129207B202F2F20612073696D706C65';
wwv_flow_imp.g_varchar2_table(823) := '2061727261792C20736F206164642064656C657465627574746F6E2C20666F72206F626A656374732069747320616C72656164792067656E6572617465640A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D2067656E6572';
wwv_flow_imp.g_varchar2_table(824) := '617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C20707265666978202B20435F44454C494D49544552202B20692C20747275652C206E756C6C29202B206C5F67656E2E68746D6C';
wwv_flow_imp.g_varchar2_table(825) := '3B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D2067656E6572617465417272617944656C657465427574746F6E28707265666978202B20435F44454C494D49544552202B2069293B0A202020202020202020207D2065';
wwv_flow_imp.g_varchar2_table(826) := '6C7365207B0A2A2F0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F724F626A656374222C206C5F67656E657261746564293B0A2020202072657475726E286C5F67656E657261746564';
wwv_flow_imp.g_varchar2_table(827) := '293B0A20207D0A0A20202F2A0A2020202A0A20202A2F0A202066756E6374696F6E2067656E6572617465526567696F6E28736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E657749';
wwv_flow_imp.g_varchar2_table(828) := '74656D297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465526567696F6E222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E4172';
wwv_flow_imp.g_varchar2_table(829) := '7261792C206E65774974656D293B0A202020206C6574206C5F67656E657261746564203D2067656E6572617465466F724F626A65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E4172726179';
wwv_flow_imp.g_varchar2_table(830) := '2C206E65774974656D293B0A202020206C5F67656E6572617465642E68746D6C203D20600A3C64697620636C6173733D22726F77206A736F6E726567696F6E223E0A60202B206C5F67656E6572617465642E68746D6C202B20600A3C2F6469763E603B0A';
wwv_flow_imp.g_varchar2_table(831) := '20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465526567696F6E222C206C5F67656E657261746564293B0A2020202072657475726E286C5F67656E657261746564293B0A20207D0A20202F2A0A';
wwv_flow_imp.g_varchar2_table(832) := '2020202A2067657420612066696C65207769746820616E20414A41582D726571756573742072657475726E20612070726F6D6973650A20202A2F0A202066756E6374696F6E2067657446696C6528747970652C2073726329207B0A202020207265747572';
wwv_flow_imp.g_varchar2_table(833) := '6E206E65772050726F6D6973652866756E6374696F6E287265736F6C76652C2072656A65637429207B0A202020202020617065782E64656275672E747261636528276C6F61642066696C6520282573293A2022257322272C20747970652C20737263293B';
wwv_flow_imp.g_varchar2_table(834) := '0A202020202020636F6E73742073203D20646F63756D656E742E637265617465456C656D656E7428634D6170547970655B747970655D2E746167293B0A2020202020206C65742072203D2066616C73653B0A202020202020732E74797065203D20634D61';
wwv_flow_imp.g_varchar2_table(835) := '70547970655B747970655D2E747970653B0A202020202020735B634D6170547970655B747970655D2E617474725D203D207372633B0A202020202020732E72656C203D20634D6170547970655B747970655D2E72656C3B0A202020202020732E6173796E';
wwv_flow_imp.g_varchar2_table(836) := '63203D2066616C73653B0A202020202020732E6F6E6572726F72203D2066756E6374696F6E2865727229207B0A202020202020202072656A656374286572722C2073293B0A2020202020207D3B0A0A202020202020732E6F6E6C6F6164203D20732E6F6E';
wwv_flow_imp.g_varchar2_table(837) := '726561647973746174656368616E6765203D2066756E6374696F6E2829207B0A2020202020202020696620282172202626202821746869732E72656164795374617465207C7C20746869732E72656164795374617465203D3D2027636F6D706C65746527';
wwv_flow_imp.g_varchar2_table(838) := '2929207B0A2020202020202020202072203D20747275653B0A202020202020202020207265736F6C766528293B0A20202020202020207D20656C7365207B0A2020202020202020202072656A656374286E756C6C2C2073293B0A20202020202020207D0A';
wwv_flow_imp.g_varchar2_table(839) := '2020202020207D3B0A2020202020202F2F20617070656E64207363726970742074616720746F20626F64792C20736F2066696C652077696C6C206265206C6F6164656420696E206261636B67726F756E640A202020202020646F63756D656E742E626F64';
wwv_flow_imp.g_varchar2_table(840) := '792E617070656E644368696C642873293B0A202020207D293B0A20207D0A0A0A20202F2A0A2020202A206C6F616420616C6C2066696C65732066726F6D206C6973742066696C656E616D65732072656C617469766520746F2062617365506174680A2020';
wwv_flow_imp.g_varchar2_table(841) := '2A2F0A202066756E6374696F6E2067657446696C6573202866696C656E616D65732C20626173655061746829207B0A20202020766172206C5F617272203D20242E6D61702866696C656E616D65732C2066756E6374696F6E2866696C6529207B0A202020';
wwv_flow_imp.g_varchar2_table(842) := '202020202072657475726E2067657446696C6528202866696C652E656E64735769746828222E6A7322293F27736372697074273A2763737327292C202862617365506174687C7C222229202B2066696C6520293B0A202020207D293B0A20202020202020';
wwv_flow_imp.g_varchar2_table(843) := '200A202020206C5F6172722E7075736828242E44656665727265642866756E6374696F6E2820646566657272656420297B0A202020202020202024282064656665727265642E7265736F6C766520293B0A202020207D29293B0A20202020202020200A20';
wwv_flow_imp.g_varchar2_table(844) := '20202072657475726E20242E7768656E2E6170706C7928242C206C5F617272293B0A20207D0A0A20202F2F206C6F616420746865206F7261636C656A657420666F7220646174652D7069636B657220666F722041504558203C3D32322E310A202066756E';
wwv_flow_imp.g_varchar2_table(845) := '6374696F6E206C6F6164526571756972656446696C6573323231286974656D7479706573297B0A202020206C6574206C5F68746D6C203D27273B0A20202020617065782E64656275672E747261636528273E3E6A736F6E526567696F6E2E6C6F61645265';
wwv_flow_imp.g_varchar2_table(846) := '71756972656446696C6573323231272C206974656D7479706573293B0A202020206966286974656D74797065732E666F726D61742E64617465207C7C206974656D74797065732E666F726D61745B22646174652D74696D65225D297B20202F2F4841434B';
wwv_flow_imp.g_varchar2_table(847) := '20666F722041504558203C32322E322C206865726520616E64206F6C6420646174657069636B657220697320757365640A2020202020206C5F68746D6C202B3D20273C6C696E6B2072656C3D227374796C6573686565742220687265663D2227202B2061';
wwv_flow_imp.g_varchar2_table(848) := '7065782E656E762E415045585F46494C4553202B20276C69627261726965732F6F7261636C656A65742F27202B20617065782E6C696256657273696F6E732E6F7261636C656A6574202B2020272F6373732F6C6962732F6F6A2F7627202B20617065782E';
wwv_flow_imp.g_varchar2_table(849) := '6C696256657273696F6E732E6F7261636C656A6574202B2020272F726564776F6F642F6F6A2D726564776F6F642D6E6F7461672D6D696E2E6373732220747970653D22746578742F637373222F3E273B0A2020202020206C5F68746D6C202B3D20273C73';
wwv_flow_imp.g_varchar2_table(850) := '6372697074207372633D2227202B20617065782E656E762E415045585F46494C4553202B20276C69627261726965732F6F7261636C656A65742F27202B20617065782E6C696256657273696F6E732E6F7261636C656A6574202B2020272F6A732F6C6962';
wwv_flow_imp.g_varchar2_table(851) := '732F726571756972652F726571756972652E6A73223E3C2F7363726970743E273B0A2020202020206C5F68746D6C202B3D20273C736372697074207372633D2227202B20617065782E656E762E415045585F46494C4553202B20276C6962726172696573';
wwv_flow_imp.g_varchar2_table(852) := '2F617065782F6D696E69666965642F726571756972656A732E6A6574436F6E6669672E6D696E2E6A73223E3C2F7363726970743E273B0A2020202020206C5F68746D6C202B3D20273C736372697074207372633D2227202B20617065782E656E762E4150';
wwv_flow_imp.g_varchar2_table(853) := '45585F46494C4553202B20276C69627261726965732F617065782F6D696E69666965642F6A6574436F6D6D6F6E42756E646C652E6D696E2E6A73223E3C2F7363726970743E273B0A2020202020206C5F68746D6C202B3D20273C73637269707420737263';
wwv_flow_imp.g_varchar2_table(854) := '3D2227202B20617065782E656E762E415045585F46494C4553202B20276C69627261726965732F617065782F6D696E69666965642F6A6574446174655069636B657242756E646C652E6D696E2E6A73223E3C2F7363726970743E273B0A202020207D0A20';
wwv_flow_imp.g_varchar2_table(855) := '202020617065782E64656275672E747261636528273C3C6A736F6E526567696F6E2E6C6F6164526571756972656446696C6573323231272C206C5F68746D6C293B0A2020202072657475726E206C5F68746D6C3B0A20207D0A0A20202F2A0A2020202A20';
wwv_flow_imp.g_varchar2_table(856) := '6275696C642061206C697374206F6620616C6C206D697373696E672066696C65732072657175697265642062792075736564207769676574732F6974656D73206C696B6520726963687478742D656469746F722C202E2E2E200A2020202A204C6F642074';
wwv_flow_imp.g_varchar2_table(857) := '68652066696C65732076696120616A61780A20202A2F0A20206173796E632066756E6374696F6E206C6F6164526571756972656446696C6573286974656D747970657329207B0A2020202020202F2F206765742075736564206974656D74797065730A20';
wwv_flow_imp.g_varchar2_table(858) := '202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6C6F6164526571756972656446696C6573222C206974656D7479706573293B0A202020206C6574206C5F73637269707473203D205B5D3B0A0A202020206966286170';
wwv_flow_imp.g_varchar2_table(859) := '65782E656E762E415045585F56455253494F4E203E3D2732332E3227297B20202F2F206E6577204665617475727320666F722032332E320A20202020202069662821637573746F6D456C656D656E74732E6765742827612D636F6D626F626F7827292020';
wwv_flow_imp.g_varchar2_table(860) := '2626206974656D74797065732E6974656D747970652E636F6D626F626F78297B202F2F20636F6D626F626F7820697320757365642C20736F206C6F61642066696C657320666F72206E657720636F6D626F626F780A20202020202020206C5F7363726970';
wwv_flow_imp.g_varchar2_table(861) := '74732E7075736828276C69627261726965732F617065782F6D696E69666965642F6974656D2E436F6D626F626F782E6D696E2E6A7327293B0A2020202020207D0A20202020202069662821637573746F6D456C656D656E74732E6765742827612D717263';
wwv_flow_imp.g_varchar2_table(862) := '6F6465272920202626206974656D74797065732E6974656D747970652E7172636F6465297B202F2F20636F6D626F626F7820697320757365642C20736F206C6F61642066696C657320666F72206E657720636F6D626F626F780A20202020202020206C5F';
wwv_flow_imp.g_varchar2_table(863) := '736372697074732E7075736828276C69627261726965732F617065782F6D696E69666965642F6974656D2E5152636F64652E6D696E2E6A7327293B0A2020202020207D0A0A2020202020206966286974656D74797065732E6974656D747970652E726963';
wwv_flow_imp.g_varchar2_table(864) := '6874657874297B20202F2F20726963687465787420697320757365642C20736F206C6F61642066696C657320666F7220726963682D746578742D656469746F720A202020202020202069662821637573746F6D456C656D656E74732E6765742827612D72';
wwv_flow_imp.g_varchar2_table(865) := '6963682D746578742D656469746F722729297B20202F2F20437573746F6D20456C656D656E74206973206E6F7420696E207573652C206C6F61642069740A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F7469';
wwv_flow_imp.g_varchar2_table(866) := '6E796D63652F27202B20617065782E6C696256657273696F6E732E74696E796D6365202B20272F736B696E732F75692F6F786964652F736B696E2E63737327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965';
wwv_flow_imp.g_varchar2_table(867) := '732F74696E796D63652F27202B20617065782E6C696256657273696F6E732E74696E796D6365202B20272F74696E796D63652E6D696E2E6A7327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F707572';
wwv_flow_imp.g_varchar2_table(868) := '6966792F2720202B20617065782E6C696256657273696F6E732E646F6D507572696679202B20272F7075726966792E6D696E2E6A7327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F707269736D6A73';
wwv_flow_imp.g_varchar2_table(869) := '2F27202B20617065782E6C696256657273696F6E732E707269736D4A73202B20272F707269736D2E6A7327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F6D61726B65646A732F27202B20617065782E';
wwv_flow_imp.g_varchar2_table(870) := '6C696256657273696F6E732E6D61726B65644A73202B20272F6D61726B65642E6D696E2E6A7327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F7475726E646F776E2F27202B20617065782E6C696256';
wwv_flow_imp.g_varchar2_table(871) := '657273696F6E732E7475726E646F776E202B20272F7475726E646F776E2E6A7327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F617065782F6D696E69666965642F6974656D2E526963685465787445';
wwv_flow_imp.g_varchar2_table(872) := '6469746F722E6D696E2E6A7327293B0A20202020202020207D0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6C6F6164526571756972656446696C657322293B0A20202020';
wwv_flow_imp.g_varchar2_table(873) := '72657475726E2067657446696C657328206C5F736372697074732C20617065782E656E762E415045585F46494C4553293B0A20207D0A0A20202F2A0A2020202A2073686F7720616C6C20696E2D2F6F75747075742D6974656D7320666F7220746865204A';
wwv_flow_imp.g_varchar2_table(874) := '534F4E2D726567696F6E0A20202A2F0A202066756E6374696F6E2073686F774669656C6473286974656D7479706573297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E73686F774669656C647322293B0A20';
wwv_flow_imp.g_varchar2_table(875) := '2020206C6574206C5F67656E657261746564203D2067656E6572617465526567696F6E28704F7074696F6E732E736368656D612C2067446174612C206E756C6C2C20704F7074696F6E732E646174616974656D2C20302C2066616C73652C207472756529';
wwv_flow_imp.g_varchar2_table(876) := '3B0A202020206C6574206C5F68746D6C203D206C5F67656E6572617465642E68746D6C3B0A20202020696628617065782E656E762E415045585F56455253494F4E203C2732322E3227297B0A2020202020206C5F68746D6C202B3D206C6F616452657175';
wwv_flow_imp.g_varchar2_table(877) := '6972656446696C6573323231286974656D7479706573293B0A202020207D0A20202020202020202F2F206174746163682048544D4C20746F20726567696F6E0A2020202024282223222B70526567696F6E4964292E68746D6C286C5F68746D6C293B0A20';
wwv_flow_imp.g_varchar2_table(878) := '202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E73686F774669656C647322293B0A20207D0A0A0A20202F2A0A2020202A207265667265736820746865204A534F4E2D726567696F6E0A20202A2F0A20206173796E63';
wwv_flow_imp.g_varchar2_table(879) := '2066756E6374696F6E2072656672657368286E65774974656D29207B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E7265667265736822293B0A20202020617065782E64656275672E747261636528276A736F';
wwv_flow_imp.g_varchar2_table(880) := '6E526567696F6E2E72656672657368272C202764617461272C206E65774974656D2C206744617461293B0A0A2020202061776169742072696368746578744861636B28293B0A0A2F2F20202020202020202F2F2061747461636820746865206669656C64';
wwv_flow_imp.g_varchar2_table(881) := '7320746F207468652067656E6572617465642055490A202020206174746163684F626A65637428704F7074696F6E732E646174616974656D2C2027272C20704F7074696F6E732E736368656D612C20704F7074696F6E732E726561646F6E6C792C206744';
wwv_flow_imp.g_varchar2_table(882) := '6174612C206E65774974656D293B0A20202020617065784861636B7328293B0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7265667265736822293B0A20207D0A0A20202F2A0A2020202A2052656D6F766520';
wwv_flow_imp.g_varchar2_table(883) := '616C6C2070726F7065727469657320776974682076616C7565204E554C4C20746F20636F6D70616374207468652067656E657261746564204A534F4E0A20202A2F0A202066756E6374696F6E2072656D6F76654E756C6C7328646174612C207365617263';
wwv_flow_imp.g_varchar2_table(884) := '68297B0A202020206966286461746129207B0A20202020202069662841727261792E69734172726179286461746129297B0A2020202020202020646174612E666F72456163682866756E6374696F6E2876616C75652C20696478297B0A20202020202020';
wwv_flow_imp.g_varchar2_table(885) := '20202072656D6F76654E756C6C7328646174615B6964785D2C20736561726368293B202F2F206B65657020617272617920656C656D656E74732C206265636175736520706F736974696F6E20636F756C64206265206D65616E696E6766756C6C0A202020';
wwv_flow_imp.g_varchar2_table(886) := '20202020207D293B0A202020207D202020656C736520696628747970656F662864617461293D3D435F4A534F4E5F4F424A454354297B0A20202020202020204F626A6563742E6B6579732864617461292E666F72456163682866756E6374696F6E287661';
wwv_flow_imp.g_varchar2_table(887) := '6C75652C20696478297B0A2020202020202020202069662872656D6F76654E756C6C7328646174615B76616C75655D2C20736561726368293D3D3D6E756C6C297B20202F2F2076616C7565206973206E756C6C2C20736F2072656D6F7665207468652077';
wwv_flow_imp.g_varchar2_table(888) := '686F6C65206B65790A20202020202020202020202064656C65746528646174615B76616C75655D293B0A202020202020202020207D0A20202020202020207D293B0A2020202020202020696628214F626A6563742E6B6579732864617461292E6C656E67';
wwv_flow_imp.g_varchar2_table(889) := '7468297B202020202F2F204F626A65637420697320656D707479206E6F772C2072656D6F7665206974206C617465720A20202020202020202020646174613D6E756C6C3B0A20202020202020207D0A2020202020207D0A202020207D0A20202020726574';
wwv_flow_imp.g_varchar2_table(890) := '75726E2864617461293B0A20207D0A0A20202F2A0A2020202A20636F6E7665727420646966666572656E74206461746120666F726D61747320696E20746865204A534F4E2D6461746120696E746F2073696E676C6520666F726D6174730A20202A2F0A20';
wwv_flow_imp.g_varchar2_table(891) := '2066756E6374696F6E207265666F726D617456616C75657328736368656D612C20646174612C2072656164297B0A20202020617065782E64656275672E747261636528223E3E7265666F726D617456616C756573222C20736368656D61293B200A202020';
wwv_flow_imp.g_varchar2_table(892) := '20696628736368656D612026262064617461297B0A20202020202073776974636828736368656D612E74797065297B0A2020202020206361736520226F626A656374223A0A20202020202020206966286461746120696E7374616E63656F66204F626A65';
wwv_flow_imp.g_varchar2_table(893) := '637429207B0A20202020202020202020666F7228636F6E7374206C5F6B657920696E20736368656D612E70726F70657274696573297B0A20202020202020202020202020646174615B6C5F6B65795D203D207265666F726D617456616C75657328736368';
wwv_flow_imp.g_varchar2_table(894) := '656D612E70726F706572746965735B6C5F6B65795D2C20646174615B6C5F6B65795D2C2072656164293B0A202020202020202020207D0A20202020202020207D20656C7365207B0A20202020202020202020617065782E64656275672E6572726F722827';
wwv_flow_imp.g_varchar2_table(895) := '63616E206E6F7420646973706C617920646174613A272C20646174612C20276D75737420626520616E206F626A65637427293B0A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520226172726179223A0A2020202020';
wwv_flow_imp.g_varchar2_table(896) := '20202069662841727261792E69734172726179286461746129297B0A20202020202020202020666F72287661722069203D20303B2069203C20736368656D612E6974656D732E6C656E6774683B20692B2B297B0A20202020202020202020202020646174';
wwv_flow_imp.g_varchar2_table(897) := '615B695D203D207265666F726D617456616C75657328736368656D612E6974656D735B695D2C20646174615B695D2C2072656164293B0A202020202020202020207D0A20202020202020207D20656C7365207B0A20202020202020202020617065782E64';
wwv_flow_imp.g_varchar2_table(898) := '656275672E6572726F72282763616E206E6F7420646973706C617920646174613A272C20646174612C20276D75737420626520616E20617272617927293B0A20202020202020207D20202020200A202020202020627265616B3B0A202020202020646566';
wwv_flow_imp.g_varchar2_table(899) := '61756C743A0A202020202020627265616B3B0A2020202020207D200A0A202020202020696628736368656D612E6966297B20202F2F20636F6E646974696F6E616C20736368656D612C20616464206576656E74206F6E206974656D730A20202020202020';
wwv_flow_imp.g_varchar2_table(900) := '20696628736368656D612E7468656E297B200A20202020202020202020666F7228636F6E7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E747269657328736368656D612E7468656E2E70726F7065727469657329297B0A';
wwv_flow_imp.g_varchar2_table(901) := '2020202020202020202020207265666F726D617456616C756573286C5F6974656D2C20646174615B6C5F6E616D655D2C2072656164293B0A202020202020202020207D0A20202020202020207D0A0A2020202020202020696628736368656D612E656C73';
wwv_flow_imp.g_varchar2_table(902) := '65297B200A20202020202020202020666F7228636F6E7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E747269657328736368656D612E656C73652E70726F7065727469657329297B0A2020202020202020202020207265';
wwv_flow_imp.g_varchar2_table(903) := '666F726D617456616C756573286C5F6974656D2C20646174615B6C5F6E616D655D2C2072656164293B0A202020202020202020207D0A20202020202020207D0A2020202020207D2020202020200A202020207D200A20202020617065782E64656275672E';
wwv_flow_imp.g_varchar2_table(904) := '747261636528223C3C7265666F726D617456616C756573222C2064617461293B2020200A2020202072657475726E2864617461293B0A20207D0A0A20202F2A0A2020202A2061646A7573742074686520736368656D610A20202A2F0A202066756E637469';
wwv_flow_imp.g_varchar2_table(905) := '6F6E2061646A7573744F7074696F6E73286F7074696F6E73297B0A202020206F7074696F6E732E736368656D61203D2020202020202020202020206F7074696F6E732E736368656D61207C7C207B7D3B0A202020206F7074696F6E732E736368656D612E';
wwv_flow_imp.g_varchar2_table(906) := '70726F70657274696573203D206F7074696F6E732E736368656D612E70726F70657274696573207C7C207B7D3B0A202020206F7074696F6E732E736368656D612E61706578203D202020202020206F7074696F6E732E736368656D612E61706578207C7C';
wwv_flow_imp.g_varchar2_table(907) := '207B7D3B0A202020206F7074696F6E732E736368656D612E617065782E6C6162656C203D206F7074696F6E732E736368656D612E617065782E6C6162656C207C7C206E756C6C3B0A2020202072657475726E206F7074696F6E733B0A20207D0A20202F2A';
wwv_flow_imp.g_varchar2_table(908) := '202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A2020202A2068657265207468652066756E6374696F6E20636F6465207374617274';
wwv_flow_imp.g_varchar2_table(909) := '730A20202A2F0A2020617065782E64656275672E747261636528223E3E696E69744A736F6E526567696F6E222C2070526567696F6E49642C20704E616D652C2070416A61784964656E7469666965722C20704F7074696F6E73293B200A0A202069662870';
wwv_flow_imp.g_varchar2_table(910) := '4F7074696F6E732E6869646529207B202F2F2068696465207468652072656C61746564204A534F4E2D6974656D0A20202020617065782E6974656D28704F7074696F6E732E646174616974656D292E6869646528293B0A20207D0A0A20207472797B0A20';
wwv_flow_imp.g_varchar2_table(911) := '202020704F7074696F6E732E736368656D61203D204A534F4E2E706172736528704F7074696F6E732E736368656D612E7265706C616365282F5C5C222F672C20272227292E7265706C616365282F5C5C6E2F672C20275C6E27292E7265706C616365282F';
wwv_flow_imp.g_varchar2_table(912) := '5C5C722F672C20275C7227292E7265706C616365282F5C5C742F672C20275C742729293B0A20207D206361746368286529207B0A20202020617065782E64656275672E6572726F7228276A736F6E2D726567696F6E3A20736368656D61272C20652C2070';
wwv_flow_imp.g_varchar2_table(913) := '4F7074696F6E732E736368656D61293B0A20202020704F7074696F6E732E736368656D61203D207B7D3B0A20207D0A0A202020202F2F2067656E657261746520746865204A534F4E2066726F6D20646174616974656D2D6669656C640A2020747279207B';
wwv_flow_imp.g_varchar2_table(914) := '0A202020206744617461203D204A534F4E2E706172736528617065782E6974656D28704F7074696F6E732E646174616974656D292E67657456616C756528297C7C277B7D27293B0A20207D206361746368286529207B0A20202020617065782E64656275';
wwv_flow_imp.g_varchar2_table(915) := '672E6572726F7228276A736F6E2D726567696F6E3A20646174616974656D272C20704F7074696F6E732E646174616974656D2C20652C20704F7074696F6E732E736368656D61293B0A202020206744617461203D207B7D3B0A20207D0A0A202061706578';
wwv_flow_imp.g_varchar2_table(916) := '2E64656275672E74726163652827696E69744A736F6E526567696F6E3A2064617461272C206744617461293B0A20206C6574206E65774974656D203D2021286744617461202626204F626A6563742E6B657973286744617461292E6C656E677468293B0A';
wwv_flow_imp.g_varchar2_table(917) := '0A2020696628704F7074696F6E732E67656E6572617465536368656D61297B20202F2F2067656E6572617465204A534F4E2D736368656D61206261736564206F6E204A534F4E2D646174610A202020206C6574206C5F736368656D61203D7B7D3B0A2020';
wwv_flow_imp.g_varchar2_table(918) := '20206C5F736368656D61203D2067656E6572617465536368656D61286C5F736368656D612C2067446174617C7C7B7D293B0A20202020636F6E736F6C652E696E666F28272B2B2B4A534F4E2D736368656D612B2B2B272C204A534F4E2E737472696E6769';
wwv_flow_imp.g_varchar2_table(919) := '6679286C5F736368656D6129293B0A20202020704F7074696F6E732E736368656D61203D206C5F736368656D613B0A20207D0A0A2020704F7074696F6E73203D2061646A7573744F7074696F6E7328704F7074696F6E73293B0A0A202020202F2F207265';
wwv_flow_imp.g_varchar2_table(920) := '736F6C766520616C6C2024726566730A2020704F7074696F6E732E736368656D61203D2070726F7061676174655265667328704F7074696F6E732E736368656D61293B0A202070726F70616761746550726F7065727469657328704F7074696F6E732E73';
wwv_flow_imp.g_varchar2_table(921) := '6368656D612C20302C20704F7074696F6E732E726561646F6E6C792C2066616C73652C20704F7074696F6E732E6B656570417474726962757465732C2066616C7365293B0A0A202020202F2F2061646A75737420646966666572656E63657320696E200A';
wwv_flow_imp.g_varchar2_table(922) := '20206744617461203D207265666F726D617456616C75657328704F7074696F6E732E736368656D612C2067446174612C2074727565293B0A0A202020202F2F2073686F77207468652055492D6669656C64730A0A20206C6574206C5F6974656D74797065';
wwv_flow_imp.g_varchar2_table(923) := '73203D206E756C6C3B0A20206C5F6974656D7479706573203D206765744974656D747970657328704F7074696F6E732E736368656D612C206C5F6974656D7479706573293B0A0A202073686F774669656C6473286C5F6974656D7479706573293B200A20';
wwv_flow_imp.g_varchar2_table(924) := '200A202020202F2F207374617274206865726520616C6C207374756666207769686963682072756E73206173796E630A2020286173796E632066756E6374696F6E28297B0A20202F2A0A2020202A206372656174652074686520726567696F6E20616E64';
wwv_flow_imp.g_varchar2_table(925) := '206174746163682064656661756C742068616E646C6572730A20202A2F0A2020202066756E6374696F6E20637265617465526567696F6E28297B0A202020202020617065782E64656275672E747261636528223E3E637265617465526567696F6E22293B';
wwv_flow_imp.g_varchar2_table(926) := '0A2020202020202F2F2069662072656167696F6E20616C7265616479206578697374732064657374726F792069742066697273740A202020202020696628617065782E726567696F6E2E6973526567696F6E2870526567696F6E49642929207B0A202020';
wwv_flow_imp.g_varchar2_table(927) := '2020202020617065782E64656275672E7472616365282744455354524F5920524547494F4E272C2070526567696F6E4964293B0A2020202020202020617065782E726567696F6E2E64657374726F792870526567696F6E4964293B0A2020202020207D0A';
wwv_flow_imp.g_varchar2_table(928) := '202020202020617065782E726567696F6E2E637265617465282070526567696F6E49642C2063616C6C6261636B73293B0A202020202020617065782E6974656D2E617474616368282428272327202B2070526567696F6E496429293B0A20202020202061';
wwv_flow_imp.g_varchar2_table(929) := '7065782E64656275672E747261636528223C3C637265617465526567696F6E22293B2020200A202020207D0A0A20202020617065782E64656275672E7472616365282772657175697265642066696C6573206C6F64696E672E2E2E27293B0A2020202061';
wwv_flow_imp.g_varchar2_table(930) := '77616974206C6F6164526571756972656446696C6573286C5F6974656D7479706573293B0A20202020617065782E64656275672E7472616365282772657175697265642066696C6573206C6F6164656427293B0A20202020617761697420726566726573';
wwv_flow_imp.g_varchar2_table(931) := '68286E65774974656D293B0A0A20202020636F6E73742063616C6C6261636B73203D207B0A20202020202020202F2F2043616C6C6261636B20666F722072656672657368696E67206F6620746865204A534F4E2D726567696F6E2C2069732063616C6C65';
wwv_flow_imp.g_varchar2_table(932) := '6420627920415045582D726566726573680A202020202020726566726573683A2066756E6374696F6E2829207B0A2020202020202020617065782E64656275672E747261636528273E3E63616C6C6261636B2E726566726573683A20272C207052656769';
wwv_flow_imp.g_varchar2_table(933) := '6F6E49642C2070416A61784964656E7469666965722C20704F7074696F6E732C206744617461293B0A2020202020202020696628704F7074696F6E732E697344796E616D6963297B0A2020202020202020202020617065782E7365727665722E706C7567';
wwv_flow_imp.g_varchar2_table(934) := '696E2028200A20202020202020202020202070416A61784964656E7469666965722C200A2020202020202020202020207B20706167654974656D733A20704F7074696F6E732E71756572796974656D737D2C200A2020202020202020202020207B207375';
wwv_flow_imp.g_varchar2_table(935) := '63636573733A206173796E632066756E6374696F6E2820646174612029207B0A202020202020202020202020202020202F2F20666F7220736F6D6520726561736F6E207468652024646566732070726F70657274792069732072657475726E6564206173';
wwv_flow_imp.g_varchar2_table(936) := '20222464656673220A202020202020202020202020202020206C6574206C5F6E65776974656D203D2128674461746120262620284F626A6563742E6B657973286744617461292E6C656E6774683E3029293B0A2020202020202020202020202020202064';
wwv_flow_imp.g_varchar2_table(937) := '6174615B222464656673225D3D646174615B2722246465667322275D3B0A20202020202020202020202020202020617065782E64656275672E74726163652827574F524152524F554E4420246465667327293B0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(938) := '704F7074696F6E732E736368656D61203D20646174613B0A20202020202020202020202020202020704F7074696F6E73203D2061646A7573744F7074696F6E7328704F7074696F6E73293B0A20202020202020202020202020202020704F7074696F6E73';
wwv_flow_imp.g_varchar2_table(939) := '2E736368656D61203D2070726F7061676174655265667328704F7074696F6E732E736368656D61293B0A2020202020202020202020202020202070726F70616761746550726F7065727469657328704F7074696F6E732E736368656D612C20302C20704F';
wwv_flow_imp.g_varchar2_table(940) := '7074696F6E732E726561646F6E6C792C2066616C73652C20704F7074696F6E732E6B656570417474726962757465732C2066616C7365293B0A202020202020202020202020202020206C6574206C5F6974656D7479706573203D206E756C6C3B0A202020';
wwv_flow_imp.g_varchar2_table(941) := '202020202020202020202020206C5F6974656D7479706573203D206765744974656D747970657328704F7074696F6E732E736368656D612C206C5F6974656D7479706573293B0A20202020202020202020202020202020617065782E64656275672E7472';
wwv_flow_imp.g_varchar2_table(942) := '6163652827704F7074696F6E733A272C20704F7074696F6E73293B0A2020202020202020202020202020202073686F774669656C6473286C5F6974656D7479706573293B0A202020202020202020202020202020206177616974206C6F61645265717569';
wwv_flow_imp.g_varchar2_table(943) := '72656446696C6573286C5F6974656D7479706573293B0A2020202020202020202020202020202061776169742072696368746578744861636B28293B0A202020202020202020202020202020206174746163684F626A65637428704F7074696F6E732E64';
wwv_flow_imp.g_varchar2_table(944) := '6174616974656D2C2027272C20704F7074696F6E732E736368656D612C20704F7074696F6E732E726561646F6E6C792C2067446174612C206C5F6E65776974656D293B0A20202020202020202020202020202020617065784861636B7328293B0A202020';
wwv_flow_imp.g_varchar2_table(945) := '202020202020202020202020207365744F626A65637456616C75657328704F7074696F6E732E646174616974656D2C2027272C20704F7074696F6E732E736368656D612C20704F7074696F6E732E726561646F6E6C792C206744617461290A2020202020';
wwv_flow_imp.g_varchar2_table(946) := '2020202020202020202020637265617465526567696F6E28293B0A20202020202020202020202020207D0A2020202020202020202020207D20200A20202020202020202020293B0A20202020202020207D0A2020202020202020617065782E6465627567';
wwv_flow_imp.g_varchar2_table(947) := '2E747261636528273C3C63616C6C6261636B2E7265667265736827290A2020202020207D2C0A0A20202020202020202F2F2043616C6C6261636B2063616C6C6564206279206576656E742022617065786265666F7265706167657375626D6974220A2020';
wwv_flow_imp.g_varchar2_table(948) := '202020206265666F72655375626D69743A2066756E6374696F6E2028297B0A2020202020202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6265666F72655375626D6974222C2070526567696F6E49642C20704F7074';
wwv_flow_imp.g_varchar2_table(949) := '696F6E732E646174616974656D2C20704F7074696F6E732E736368656D61293B0A202020202020202069662821704F7074696F6E732E726561646F6E6C79297B20202F2F20646F206E6F7468696E6720666F7220726561646F6E6C79206A736F6E2D7265';
wwv_flow_imp.g_varchar2_table(950) := '67696F6E0A20202020202020202020617065782E64656275672E747261636528276A736F6E526567696F6E272C20704F7074696F6E73293B0A202020202020202020206C6574206C5F6A736F6E3D6765744461746128704F7074696F6E732E6461746169';
wwv_flow_imp.g_varchar2_table(951) := '74656D2C2027272C20704F7074696F6E732E736368656D612C206744617461293B0A20202020202020202020696628704F7074696F6E732E72656D6F76654E756C6C73297B0A2020202020202020202020206C5F6A736F6E203D2072656D6F76654E756C';
wwv_flow_imp.g_varchar2_table(952) := '6C73286C5F6A736F6E293B0A202020202020202020202020617065782E64656275672E7472616365282772656D6F766564204E554C4C73272C206C5F6A736F6E293B0A202020202020202020207D0A20202020202020202020617065782E64656275672E';
wwv_flow_imp.g_varchar2_table(953) := '7472616365282767656E657261746564204A534F4E272C206C5F6A736F6E293B0A20202020202020202020617065782E6974656D28704F7074696F6E732E646174616974656D292E73657456616C7565284A534F4E2E737472696E67696679286C5F6A73';
wwv_flow_imp.g_varchar2_table(954) := '6F6E29293B0A20202020202020207D0A2020202020202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6265666F72655375626D697422293B0A2020202020207D2C0A0A20202020202020202F2F2043616C6C6261636B';
wwv_flow_imp.g_varchar2_table(955) := '2063616C6C6564206279206576656E74202261706578706167657375626D6974220A2020202020207375626D69743A2066756E6374696F6E28297B0A2020202020202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E73';
wwv_flow_imp.g_varchar2_table(956) := '75626D697422293B0A202020202020202020202F2F204861636B20746F2072656D6F7665207468652064796E616D6963616C6C792067656E657261746564206974656D2066726F6D20636C69656E742D726573706F6E73650A2020202020202020242827';
wwv_flow_imp.g_varchar2_table(957) := '2327202B2070526567696F6E4964202B202720696E70757427292E72656D6F76654174747228276E616D6527293B0A20202020202020202428272327202B2070526567696F6E4964202B202720746578746172656127292E72656D6F7665417474722827';
wwv_flow_imp.g_varchar2_table(958) := '6E616D6527293B0A20202020202020202428272327202B2070526567696F6E4964202B20272073656C65637427292E72656D6F76654174747228276E616D6527293B20200A20202020202020202428272327202B2070526567696F6E4964202B20272061';
wwv_flow_imp.g_varchar2_table(959) := '2D636F6D626F626F7827292E72656D6F76654174747228276E616D6527293B0A20202020202020202428272327202B2070526567696F6E4964202B202720612D726963682D746578742D656469746F7227292E72656D6F76654174747228276E616D6527';
wwv_flow_imp.g_varchar2_table(960) := '293B2020202020200A2020202020202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7375626D697422293B0A2020202020207D0A202020207D3B0A0A20202020617065782E6A517565727928617065782E6750616765';
wwv_flow_imp.g_varchar2_table(961) := '436F6E7465787424292E62696E64282022617065786265666F7265706167657375626D6974222C2066756E6374696F6E2829207B0A20202020202063616C6C6261636B732E6265666F72655375626D697428293B0A202020207D293B0A20202020617065';
wwv_flow_imp.g_varchar2_table(962) := '782E6A51756572792820617065782E6750616765436F6E746578742420292E6F6E28202261706578706167657375626D6974222C2066756E6374696F6E2829207B0A20202020202063616C6C6261636B732E7375626D697428293B0A202020207D293B0A';
wwv_flow_imp.g_varchar2_table(963) := '20202020617065782E6A5175657279282077696E646F7720292E6F6E282022617065786265666F726572656672657368222C2066756E6374696F6E2829207B0A202020202020617065782E64656275672E747261636528274556454E543A272C20276170';
wwv_flow_imp.g_varchar2_table(964) := '65786265666F72657265667265736827293B0A202020207D293B0A20202020617065782E6A5175657279282077696E646F7720292E6F6E28202261706578616674657272656672657368222C2066756E6374696F6E2829207B0A20202020202061706578';
wwv_flow_imp.g_varchar2_table(965) := '2E64656275672E747261636528274556454E543A272C20276170657861667465727265667265736827293B0A202020207D293B0A0A20202020617065782E6A5175657279282077696E646F7720292E6F6E282022617065787265616479656E64222C2066';
wwv_flow_imp.g_varchar2_table(966) := '756E6374696F6E2820652029207B0A202020202020617065782E64656275672E747261636528274556454E543A272C2027617065787265616479656E6427293B0A202020207D293B0A0A20202020617065782E6A5175657279282077696E646F7720292E';
wwv_flow_imp.g_varchar2_table(967) := '6F6E2820226170657877696E646F77726573697A6564222C2066756E6374696F6E28206576656E742029207B0A202020202020617065782E64656275672E747261636528274556454E543A272C20276170657877696E646F77726573697A656427293B0A';
wwv_flow_imp.g_varchar2_table(968) := '202020207D293B0A0A202020202428272327202B2070526567696F6E4964292E72656164792866756E6374696F6E2829207B0A202020202020617065782E64656275672E747261636528274556454E543A272C20274A517565727920726561647927293B';
wwv_flow_imp.g_varchar2_table(969) := '0A2020202020207365744F626A65637456616C75657328704F7074696F6E732E646174616974656D2C2027272C20704F7074696F6E732E736368656D612C20704F7074696F6E732E726561646F6E6C792C206744617461293B0A202020207D293B0A2020';
wwv_flow_imp.g_varchar2_table(970) := '2020637265617465526567696F6E28293B0A20207D2928293B0A0A2020617065782E64656275672E747261636528223C3C696E69744A736F6E526567696F6E22293B20200A7D0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(36251893068016211)
,p_plugin_id=>wwv_flow_imp.id(36151739649985791)
,p_file_name=>'json-region.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
