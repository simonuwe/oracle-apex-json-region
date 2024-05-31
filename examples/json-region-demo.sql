prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>3517665679636402
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'UWE'
);
end;
/
 
prompt APPLICATION 101 - json-region-demo
--
-- Application Export:
--   Application:     101
--   Name:            json-region-demo
--   Date and Time:   15:27 Friday May 31, 2024
--   Exported By:     UWE
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     12
--       Items:                   28
--       Processes:               12
--       Regions:                 25
--       Buttons:                 29
--       Dynamic Actions:          2
--     Shared Components:
--       Logic:
--         Build Options:          1
--       Navigation:
--         Lists:                  3
--         Breadcrumbs:            1
--           Entries:             10
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--           Page:                 9
--           Region:              17
--           Label:                7
--           List:                13
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               3
--           Report:              11
--         LOVs:                   2
--         Shortcuts:              1
--         Plug-ins:               1
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         20.2.0.00.20
--   Instance ID:     1200184392583063
--

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'UWE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'json-region-demo')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'JSON-REGION-DEMO')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'CD9D516CFBD4F5288536C0A8481F7C6DF2068011D1BA3CBABA7DC3CEF80DBA85'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'19.2'
,p_flow_language=>'de'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'dd.mm.yyyy'
,p_date_time_format=>'dd.mm.yyyy HH24:MI'
,p_timestamp_format=>'dd.mm.yyyy HH24:MI'
,p_timestamp_tz_format=>'dd.mm.yyyy HH24:MI'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2024.05.23.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(3645262518688040)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'json-region-demo'
,p_app_builder_icon_name=>'app-icon.svg'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'JSON-Region-Demo Rel 0.9.0 APEX: #APEX_VERSION#'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'json-region-demo'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531152539'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
,p_print_server_type=>'NATIVE'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3646011438688042)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3795834191688224)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4428543430378908)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Objects'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_parent_list_item_id=>wwv_flow_api.id(3795834191688224)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7,8'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6195552855989108)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Objects23ai'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'SELECT 1 from all_tables WHERE table_name=''OBJECT23AI'''
,p_parent_list_item_id=>wwv_flow_api.id(3795834191688224)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2,3'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6370980921945965)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Jsons23ai'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'SELECT 1 from all_views WHERE view_name=''JSON23AI'''
,p_parent_list_item_id=>wwv_flow_api.id(3795834191688224)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5,6'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4626068756240636)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Object_types'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(3795834191688224)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'9,10'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3785476894688154)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3804377933688260)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3804862700688261)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(3804377933688260)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3805281975688261)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(3804377933688260)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/application_configuration
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3806967881688266)
,p_name=>'Application Configuration'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(3787636662688191)
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3807319304688266)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Configuration Options'
,p_list_item_link_target=>'f?p=&APP_ID.:10010:&SESSION.::&DEBUG.:10010:::'
,p_list_item_icon=>'fa-sliders'
,p_list_text_01=>'Enable or disable application features'
,p_required_patch=>wwv_flow_api.id(3787636662688191)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/app_icon_svg
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3C73766720786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F737667222076696577426F783D22302030203634203634222077696474683D22363422206865696768743D223634223E3C726563742077696474683D2231303025';
wwv_flow_api.g_varchar2_table(2) := '22206865696768743D2231303025222066696C6C3D222338314242354622202F3E3C67206F7061636974793D222E32223E3C7061746820643D224D333220323661322E3520322E3520302031203020322E3520322E3541322E35303320322E3530332030';
wwv_flow_api.g_varchar2_table(3) := '203020302033322032367A6D30203461312E3520312E3520302031203120312E352D312E3541312E35303220312E3530322030203020312033322033307A222F3E3C7061746820643D224D34322E3533362033362E3832386C2D322E3637332D322E3637';
wwv_flow_api.g_varchar2_table(4) := '324131382E3937332031382E39373320302030203020343020333263302D352E3835352D322E3732332D31312E3439332D372E3636382D31352E383734612E352E352030203020302D2E36363420304332362E3732332032302E3530372032342032362E';
wwv_flow_api.g_varchar2_table(5) := '3134352032342033326131382E3937332031382E393733203020302030202E31333720322E3135366C2D322E36373320322E36373341342E39363720342E3936372030203020302032302034302E3336345634372E35612E352E35203020302030202E35';
wwv_flow_api.g_varchar2_table(6) := '2E3568312E30373561332E30303220332E30303220302030203020312E3935322D2E3732326C342E332D332E363835632E3431312E3538322E38343720312E31353520312E33323220312E37313261322E30303120322E30303120302030203020312E35';
wwv_flow_api.g_varchar2_table(7) := '32372E363935682E38323476312E35612E352E3520302030203020312030563436682E38323461322E30303120322E30303120302030203020312E3532372D2E3639352032332E37382032332E373820302030203020312E3332332D312E3731326C342E';
wwv_flow_api.g_varchar2_table(8) := '32393820332E36383461332E30303220332E30303220302030203020312E3935332E3732334834332E35612E352E35203020302030202E352D2E35762D372E31333661342E393720342E39372030203020302D312E3436342D332E3533367A4D33322031';
wwv_flow_api.g_varchar2_table(9) := '372E3137334132322E3839372032322E3839372030203020312033362E363237203233682D392E3235344132322E3839372032322E3839372030203020312033322031372E3137337A4D32322E3837362034362E3532613220322030203020312D312E33';
wwv_flow_api.g_varchar2_table(10) := '2E343831483231762D362E36333661332E39373320332E39373320302030203120312E3137312D322E3832386C322E31342D322E31346132302E3330312032302E33303120302030203020322E39353920372E3335377A6D31312E3231342D312E383633';
wwv_flow_api.g_varchar2_table(11) := '61312E30313420312E3031342030203020312D2E3736362E3334344833322E35762D392E35612E352E352030203020302D312030563435682D2E38323461312E30313420312E3031342030203020312D2E3736362D2E3334344131392E342031392E3420';
wwv_flow_api.g_varchar2_table(12) := '30203020312032352033326131382E3434362031382E34343620302030203120312E3835382D386831302E3238344131382E3434362031382E3434362030203020312033392033326131392E342031392E342030203020312D342E39312031322E363536';
wwv_flow_api.g_varchar2_table(13) := '7A4D3433203437682D2E353735613220322030203020312D312E3330322D2E3438326C2D342E3339332D332E3736356132302E332032302E3320302030203020322E3935382D372E3335386C322E313420322E313441332E39373520332E393735203020';
wwv_flow_api.g_varchar2_table(14) := '3020312034332034302E3336347A222F3E3C2F673E3C7061746820643D224D33322031372E3137334132322E3839372032322E3839372030203020312033362E363237203233682D392E3235344132322E3839372032322E383937203020302031203332';
wwv_flow_api.g_varchar2_table(15) := '2031372E3137337A4D32322E3837362034362E3532613220322030203020312D312E332E343831483231762D362E36333661332E39373320332E39373320302030203120312E3137312D322E3832386C322E31342D322E31346132302E3330312032302E';
wwv_flow_api.g_varchar2_table(16) := '33303120302030203020322E39353920372E3335377A4D3433203437682D2E353735613220322030203020312D312E3330322D2E3438326C2D342E3339332D332E3736356132302E332032302E3320302030203020322E3935382D372E3335386C322E31';
wwv_flow_api.g_varchar2_table(17) := '3420322E313441332E39373520332E3937352030203020312034332034302E3336347A222066696C6C3D222366636662666122206F7061636974793D222E34222F3E3C7061746820643D224D33372E3134322032344832362E3835384131382E34343620';
wwv_flow_api.g_varchar2_table(18) := '31382E3434362030203020302032352033326131392E342031392E3420302030203020342E39312031322E36353620312E30313420312E303134203020302030202E3736362E333434682E383234762D392E35612E352E35203020302031203120305634';
wwv_flow_api.g_varchar2_table(19) := '35682E38323461312E30313420312E303134203020302030202E3736362D2E3334344131392E342031392E342030203020302033392033326131382E3434362031382E3434362030203020302D312E3835382D387A4D333220333161322E3520322E3520';
wwv_flow_api.g_varchar2_table(20) := '302031203120322E352D322E3541322E35303320322E3530332030203020312033322033317A222066696C6C3D222366666622206F7061636974793D222E3935222F3E3C7061746820643D224D333220333061312E3520312E3520302031203120312E35';
wwv_flow_api.g_varchar2_table(21) := '2D312E3541312E35303220312E3530322030203020312033322033307A222066696C6C3D222366636662666122206F7061636974793D222E36222F3E3C2F7376673E';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(3786749237688190)
,p_file_name=>'app-icon.svg'
,p_mime_type=>'image/svg+xml'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_icon_css
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6170702D69636F6E207B0A202020206261636B67726F756E642D696D6167653A2075726C286170702D69636F6E2E737667293B0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(2) := '642D73697A653A20636F7665723B0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0A202020206261636B67726F756E642D636F6C6F723A20233831424235463B0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(3787007910688191)
,p_file_name=>'app-icon.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3642860126688036)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3643171986688038)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3643406618688038)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3643729871688038)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3644052946688038)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'modern'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3644363162688038)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3644624477688038)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attribute_01=>'fa-star'
,p_attribute_04=>'#VALUE#'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3644982969688038)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(3788587042688193)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(3791064779688209)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(3791064779688209)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3791468148688211)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/lovs/object_type_object_type_name
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4432723080402672)
,p_lov_name=>'OBJECT_TYPE.OBJECT_TYPE_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'OBJECT_TYPE'
,p_return_column_name=>'OBJECT_TYPE_ID'
,p_display_column_name=>'OBJECT_TYPE_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(3789105044688195)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(3645560497688040)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(3645709338688041)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(3806796695688265)
,p_short_name=>'Administration'
,p_link=>'f?p=&APP_ID.:10000:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10000
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4626727876240639)
,p_parent_id=>wwv_flow_api.id(3645709338688041)
,p_short_name=>'Object_types'
,p_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4627947134240642)
,p_parent_id=>wwv_flow_api.id(4626727876240639)
,p_short_name=>'Object_type'
,p_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6371683141945967)
,p_parent_id=>wwv_flow_api.id(3645709338688041)
,p_short_name=>'Jsons23ai'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6372865781945969)
,p_parent_id=>wwv_flow_api.id(6371683141945967)
,p_short_name=>'Json23ai'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6404758875467087)
,p_parent_id=>wwv_flow_api.id(3645709338688041)
,p_short_name=>'Objects23ai'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6405248568479746)
,p_parent_id=>wwv_flow_api.id(6404758875467087)
,p_short_name=>'Object23ai'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6538102833653024)
,p_parent_id=>wwv_flow_api.id(3645709338688041)
,p_short_name=>'Objects'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6620229701564470)
,p_parent_id=>wwv_flow_api.id(6538102833653024)
,p_short_name=>'Object'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3646343656688046)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3646685720688051)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3646951572688051)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3647264179688052)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3647560769688052)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3647898378688052)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3648126958688052)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3648441006688052)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3648767502688052)
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3649102955688054)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3649425832688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3649738469688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3650032673688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3650316690688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3650689626688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3650998683688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3651219293688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3651556823688055)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3651851144688056)
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3652253505688056)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"'
||'></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3652532892688056)
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3652816969688056)
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3653181417688056)
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3653406787688056)
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3653786650688056)
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3654063137688057)
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3654304098688057)
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3654739902688057)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" aria-label="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button'
||'>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3655095081688057)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3655375369688057)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3655618952688057)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3655936841688058)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3656233143688058)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3656509261688058)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3656894106688058)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3657117415688058)
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3657534317688058)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3657817128688058)
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3658124517688058)
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3658416845688059)
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3658718791688059)
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3659034293688059)
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3659387000688059)
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3659696651688059)
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3660041516688059)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3660305835688059)
,p_page_template_id=>wwv_flow_api.id(3660041516688059)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3660614822688059)
,p_page_template_id=>wwv_flow_api.id(3660041516688059)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3660915370688059)
,p_page_template_id=>wwv_flow_api.id(3660041516688059)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3661561697688060)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-container">',
'  <header class="t-Login-containerHeader">#REGION_POSITION_01#</header>',
'  <main class="t-Login-containerBody" id="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</main>',
'  <footer class="t-Login-containerFooter">#REGION_POSITION_02#</footer>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3661864355688060)
,p_page_template_id=>wwv_flow_api.id(3661561697688060)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3662161177688060)
,p_page_template_id=>wwv_flow_api.id(3661561697688060)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3662494557688060)
,p_page_template_id=>wwv_flow_api.id(3661561697688060)
,p_name=>'Body Footer'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3663892564688061)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-info" id="t_Body_info">#REGION_POSITION_02#</div>',
'        <div class="t-Body-contentInner" role="main">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3664117529688062)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3664427799688062)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3664722456688062)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3665097690688062)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3665378925688062)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3665660370688063)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3665918584688063)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3666293172688063)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3666591682688063)
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3666940816688063)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3667210135688063)
,p_page_template_id=>wwv_flow_api.id(3666940816688063)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3667558850688064)
,p_page_template_id=>wwv_flow_api.id(3666940816688063)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(3667819215688064)
,p_page_template_id=>wwv_flow_api.id(3666940816688063)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(3762395612688117)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(3763036896688118)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(3763178473688118)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_popup
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3668406248688065)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionPopup" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Popup'
,p_internal_name=>'INLINE_POPUP'
,p_theme_id=>42
,p_theme_class_id=>24
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1483922538999385230
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3668776159688067)
,p_plug_template_id=>wwv_flow_api.id(3668406248688065)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3671975717688069)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3672292583688069)
,p_plug_template_id=>wwv_flow_api.id(3671975717688069)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/cards_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3675669502688071)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-CardsRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  #BODY##SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Cards Container'
,p_internal_name=>'CARDS_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>21
,p_default_template_options=>'u-colors'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2071277712695139743
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3676898744688071)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3677472438688071)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3677796207688072)
,p_plug_template_id=>wwv_flow_api.id(3677472438688071)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3678702996688072)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3679013268688072)
,p_plug_template_id=>wwv_flow_api.id(3678702996688072)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3679341214688072)
,p_plug_template_id=>wwv_flow_api.id(3678702996688072)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3680734519688073)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header">',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--title">',
'      <span class="t-ContentBlock-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h1 class="t-ContentBlock-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'      #EDIT#',
'    </div>',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--buttons">#CHANGE#</div>',
'  </div>',
'  <div class="t-ContentBlock-body">#BODY#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3682711375688074)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3683728501688074)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls"><button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3684062317688075)
,p_plug_template_id=>wwv_flow_api.id(3683728501688074)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3684383149688075)
,p_plug_template_id=>wwv_flow_api.id(3683728501688074)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3689773571688077)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3690070734688077)
,p_plug_template_id=>wwv_flow_api.id(3689773571688077)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3691838030688078)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h1 class="t-HeroRegion-title">#TITLE#</h1>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3692190999688078)
,p_plug_template_id=>wwv_flow_api.id(3691838030688078)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3693934569688079)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">#BODY#</div>',
'  <div class="t-Login-buttons">#NEXT#</div>',
'  <div class="t-Login-links">#EDIT##CREATE#</div>',
'  <div class="t-Login-subRegions">#SUB_REGIONS#</div>',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3694245902688079)
,p_plug_template_id=>wwv_flow_api.id(3693934569688079)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3695205490688079)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3695534385688080)
,p_plug_template_id=>wwv_flow_api.id(3695205490688079)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3695810997688080)
,p_plug_template_id=>wwv_flow_api.id(3695205490688079)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3701825983688082)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3702116713688083)
,p_plug_template_id=>wwv_flow_api.id(3701825983688082)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3702478060688083)
,p_plug_template_id=>wwv_flow_api.id(3701825983688082)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3704446588688083)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3704731146688084)
,p_plug_template_id=>wwv_flow_api.id(3704446588688083)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3705080714688084)
,p_plug_template_id=>wwv_flow_api.id(3704446588688083)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3705216470688084)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3705512955688084)
,p_plug_template_id=>wwv_flow_api.id(3705216470688084)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(3705802072688084)
,p_plug_template_id=>wwv_flow_api.id(3705216470688084)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(3712040877688087)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3736295351688100)
,p_list_template_current=>'<li class="t-NavTabs-item #A03# is-active" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class'
||'="t-NavTabs-badge #A05#">#A02#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-NavTabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class="t-NavTab'
||'s-badge #A05#">#A02#</span></a></li>'
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_mega_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3737844099688103)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--noSub is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--noSub #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_list_template_name=>'Top Navigation Mega Menu'
,p_internal_name=>'TOP_NAVIGATION_MEGA_MENU'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-MegaMenu #COMPONENT_CSS_CLASSES#" id="t_MenuNav" style="display:none;">',
'  <div class="a-Menu-content t-MegaMenu-container">',
'    <div class="t-MegaMenu-body">',
'    <ul class="t-MegaMenu-list t-MegaMenu-list--top">'))
,p_list_template_after_rows=>' </ul></div></div></div>'
,p_before_sub_list=>'<ul class="t-MegaMenu-list t-MegaMenu-list--sub">'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--hasSub is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--hasSub #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Description'
,p_a04_label=>'List Item Class'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_a07_label=>'Badge Class'
,p_a08_label=>'Menu Item Class'
,p_reference_id=>1665447133514362075
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3740024911688104)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></'
||'div></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>',
''))
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3741420547688105)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut'
,p_a06_label=>'Link Target'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3742407331688106)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3746270396688108)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3749224600688109)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_default_template_options=>'js-defaultCollapsed'
,p_preset_template_options=>'js-navCollapsed--hidden:t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3751055338688110)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("#t_MenuNav", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="t_MenuNav"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3752094912688111)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#" title="#A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#" title="#A04#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_a04_label=>'Title Attribute'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3752464894688111)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3757815300688113)
,p_list_template_current=>'<li class="t-Tabs-item is-active #A03#" id="#A01#"><a href="#LINK#" class="t-Tabs-link #A04#"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-Tabs-link #A04#"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3759421263688114)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ iconType: ''fa'', callout: e.hasClass("js-menu-callout")});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut'
,p_a06_label=>'Link Target'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3760066112688114)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3712265689688087)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/content_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3712852917688089)
,p_row_template_name=>'Content Row'
,p_internal_name=>'CONTENT_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-ContentRow-item #ITEM_CLASSES#">',
'  <div class="t-ContentRow-wrap">',
'    <div class="t-ContentRow-selection">#SELECTION#</div>',
'    <div class="t-ContentRow-iconWrap">',
'      <span class="t-ContentRow-icon #ICON_CLASS#">#ICON_HTML#</span>',
'    </div>',
'    <div class="t-ContentRow-body">',
'      <div class="t-ContentRow-content">',
'        <h3 class="t-ContentRow-title">#TITLE#</h3>',
'        <div class="t-ContentRow-description">#DESCRIPTION#</div>',
'      </div>',
'      <div class="t-ContentRow-misc">#MISC#</div>',
'      <div class="t-ContentRow-actions">#ACTIONS#</div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-ContentRow #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1797843454948280151
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3716012649688090)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_row_template_condition1=>':LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <div class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3719434614688092)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3721428826688093)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3723227153688094)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
' <span class="t-BadgeList-wrap u-color">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
' </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3726880624688095)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" id="report_table_#REGION_STATIC_ID#" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(3726880624688095)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3729437664688097)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body">',
'        <div class="t-Comments-info">',
'            #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3730678752688097)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3730845997688097)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(3736083096688100)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(3761648956688115)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(3761726186688116)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(3761838233688116)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(3761901888688116)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(3762035626688116)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(3762112807688117)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(3762275193688117)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(3764491432688119)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(3764637920688123)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(3764543509688121)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(3766009079688135)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(3657534317688058)
,p_default_dialog_template=>wwv_flow_api.id(3660041516688059)
,p_error_template=>wwv_flow_api.id(3661561697688060)
,p_printer_friendly_template=>wwv_flow_api.id(3657534317688058)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(3661561697688060)
,p_default_button_template=>wwv_flow_api.id(3763036896688118)
,p_default_region_template=>wwv_flow_api.id(3705216470688084)
,p_default_chart_template=>wwv_flow_api.id(3705216470688084)
,p_default_form_template=>wwv_flow_api.id(3705216470688084)
,p_default_reportr_template=>wwv_flow_api.id(3705216470688084)
,p_default_tabform_template=>wwv_flow_api.id(3705216470688084)
,p_default_wizard_template=>wwv_flow_api.id(3705216470688084)
,p_default_menur_template=>wwv_flow_api.id(3682711375688074)
,p_default_listr_template=>wwv_flow_api.id(3705216470688084)
,p_default_irr_template=>wwv_flow_api.id(3676898744688071)
,p_default_report_template=>wwv_flow_api.id(3726880624688095)
,p_default_label_template=>wwv_flow_api.id(3761901888688116)
,p_default_menu_template=>wwv_flow_api.id(3764491432688119)
,p_default_calendar_template=>wwv_flow_api.id(3764543509688121)
,p_default_list_template=>wwv_flow_api.id(3760066112688114)
,p_default_nav_list_template=>wwv_flow_api.id(3751055338688110)
,p_default_top_nav_list_temp=>wwv_flow_api.id(3751055338688110)
,p_default_side_nav_list_temp=>wwv_flow_api.id(3749224600688109)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(3678702996688072)
,p_default_dialogr_template=>wwv_flow_api.id(3712040877688087)
,p_default_option_label=>wwv_flow_api.id(3761901888688116)
,p_default_required_label=>wwv_flow_api.id(3762275193688117)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(3752094912688111)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.6/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(3764826664688126)
,p_theme_id=>42
,p_name=>'Redwood Light'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_IMAGES#css/Redwood-Light#MIN#.css?v=#APEX_VERSION#'))
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>2596426436825065489
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(3765038561688126)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(3765282728688126)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(3765443900688126)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(3765658179688126)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(3765891772688126)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3662751234688061)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT'
,p_display_name=>'Page Layout'
,p_display_sequence=>10
,p_template_types=>'PAGE'
,p_null_text=>'Floating (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3663145185688061)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND'
,p_display_name=>'Page Background'
,p_display_sequence=>20
,p_template_types=>'PAGE'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3669252873688068)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3670824804688069)
,p_theme_id=>42
,p_name=>'CALLOUT_POSITION'
,p_display_name=>'Callout Position'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Determines where the callout for the popup will be positioned relative to its parent.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3672524006688069)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3673119205688070)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3674396905688070)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3674742560688070)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3675989050688071)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3678042161688072)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3680044015688073)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3681218181688073)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3682209233688074)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3684648538688075)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3685082987688075)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3685443600688075)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3686033506688076)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3687255847688076)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3688417279688076)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3692809136688078)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3693297553688078)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3694531530688079)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER'
,p_display_name=>'Login Header'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the Login region header.'
,p_null_text=>'Icon and Title (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3696928797688081)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3698539202688081)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3700176231688082)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3702930349688083)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3703317268688083)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3703941488688083)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3712556172688089)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3713165249688089)
,p_theme_id=>42
,p_name=>'COL_CONTENT_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>120
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3713511866688089)
,p_theme_id=>42
,p_name=>'COL_SELECTION'
,p_display_name=>'Selection'
,p_display_sequence=>100
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3713995814688090)
,p_theme_id=>42
,p_name=>'COL_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>110
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3714328108688090)
,p_theme_id=>42
,p_name=>'COL_CONTENT_DESCRIPTION'
,p_display_name=>'Description'
,p_display_sequence=>130
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3714738429688090)
,p_theme_id=>42
,p_name=>'COL_MISC'
,p_display_name=>'Misc'
,p_display_sequence=>140
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3715157267688090)
,p_theme_id=>42
,p_name=>'COL_ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>150
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3715590957688090)
,p_theme_id=>42
,p_name=>'CONTENT_ALIGNMENT'
,p_display_name=>'Content Alignment'
,p_display_sequence=>90
,p_template_types=>'REPORT'
,p_null_text=>'Center (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3716375739688091)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3716986643688091)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3717301529688091)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3719725935688092)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3723552085688094)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3727163470688096)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3727965467688096)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3728978112688096)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3730197836688097)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3731977401688098)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3733735309688099)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3734708918688099)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3736554832688102)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3737360295688102)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3738559602688103)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3740533768688105)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3742912959688106)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3745142318688107)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3746583042688108)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3748376936688109)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3750113179688110)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE'
,p_display_name=>'Collapse Mode'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3753785474688111)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3756148980688112)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3756724691688113)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3760328468688114)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3762596467688118)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3763352479688118)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3766273515688142)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3766650416688142)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3767439206688143)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3767879301688143)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3768243228688143)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3769475112688144)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3770028068688144)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3770844970688144)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3771220800688144)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3771807241688145)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3772415156688145)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3772886265688145)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3773439036688145)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3774054635688146)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3774823705688146)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3775246144688146)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3775647884688146)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3776057281688146)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3777089222688147)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3778042466688147)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3779063030688148)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3780076014688148)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3781079276688148)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3782048462688149)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3783092496688149)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3784042660688150)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(3784487573688150)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3649030360688054)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(3646343656688046)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3652152978688056)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(3649102955688054)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3654693890688057)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(3652253505688056)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3657411708688058)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(3654739902688057)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3659918585688059)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(3657534317688058)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3661238946688060)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(3660041516688059)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3661442234688060)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(3660041516688059)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3662939595688061)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT_SPLIT'
,p_display_name=>'Split'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(3661561697688060)
,p_css_classes=>'t-LoginPage--split'
,p_group_id=>wwv_flow_api.id(3662751234688061)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3663348653688061)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_1'
,p_display_name=>'Background 1'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(3661561697688060)
,p_css_classes=>'t-LoginPage--bg1'
,p_group_id=>wwv_flow_api.id(3663145185688061)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3663592913688061)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_2'
,p_display_name=>'Background 2'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(3661561697688060)
,p_css_classes=>'t-LoginPage--bg2'
,p_group_id=>wwv_flow_api.id(3663145185688061)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3663745236688061)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_3'
,p_display_name=>'Background 3'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_api.id(3661561697688060)
,p_css_classes=>'t-LoginPage--bg3'
,p_group_id=>wwv_flow_api.id(3663145185688061)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3666867737688063)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(3663892564688061)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3668129738688064)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(3666940816688063)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3668304303688064)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(3666940816688063)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3669055463688068)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3669487967688068)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(3669252873688068)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3669691629688068)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(3669252873688068)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3669806543688068)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(3669252873688068)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3670081317688068)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(3669252873688068)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3670246880688068)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3670484603688068)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3670612122688068)
,p_theme_id=>42
,p_name=>'DISPLAY_POPUP_CALLOUT'
,p_display_name=>'Display Popup Callout'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-popup-callout'
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add display a callout for the popup. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3671090876688069)
,p_theme_id=>42
,p_name=>'BEFORE'
,p_display_name=>'Before'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-popup-pos-before'
,p_group_id=>wwv_flow_api.id(3670824804688069)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout before or typically to the left of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3671292045688069)
,p_theme_id=>42
,p_name=>'AFTER'
,p_display_name=>'After'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-popup-pos-after'
,p_group_id=>wwv_flow_api.id(3670824804688069)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout after or typically to the right of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3671499905688069)
,p_theme_id=>42
,p_name=>'ABOVE'
,p_display_name=>'Above'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-popup-pos-above'
,p_group_id=>wwv_flow_api.id(3670824804688069)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout above or typically on top of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3671683341688069)
,p_theme_id=>42
,p_name=>'BELOW'
,p_display_name=>'Below'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-popup-pos-below'
,p_group_id=>wwv_flow_api.id(3670824804688069)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout below or typically to the bottom of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3671815473688069)
,p_theme_id=>42
,p_name=>'INSIDE'
,p_display_name=>'Inside'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(3668406248688065)
,p_css_classes=>'js-popup-pos-inside'
,p_group_id=>wwv_flow_api.id(3670824804688069)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout inside of the parent. This is useful when the parent is sufficiently large, such as a report or large region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3672757634688069)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(3672524006688069)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3672927902688070)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(3672524006688069)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3673342822688070)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(3673119205688070)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3673596394688070)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(3673119205688070)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3673708502688070)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(3673119205688070)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3673967877688070)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3674145494688070)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(3673119205688070)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3674599890688070)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(3674396905688070)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3674926143688070)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_api.id(3674742560688070)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3675129227688071)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(3674742560688070)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3675359129688071)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(3674396905688070)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3675580207688071)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3671975717688069)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(3674396905688070)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3676165541688071)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3675669502688071)
,p_css_classes=>'t-CardsRegion--styleA'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3676302977688071)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3675669502688071)
,p_css_classes=>'t-CardsRegion--styleB'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3676520385688071)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Style C'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3675669502688071)
,p_css_classes=>'t-CardsRegion--styleC'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3676726057688071)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3675669502688071)
,p_css_classes=>'u-colors'
,p_template_types=>'REGION'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3677143960688071)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3676898744688071)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3677306764688071)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3676898744688071)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3678214988688072)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3677472438688071)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(3678042161688072)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3678468398688072)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3677472438688071)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(3678042161688072)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3678662467688072)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3677472438688071)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3679645209688073)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(3678702996688072)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3679837553688073)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3678702996688072)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3680214966688073)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(3678702996688072)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(3680044015688073)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3680484622688073)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(3678702996688072)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(3680044015688073)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3680646264688073)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3678702996688072)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3681075741688073)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3680734519688073)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3681417745688073)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3680734519688073)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(3681218181688073)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3681643130688073)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3680734519688073)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(3681218181688073)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3681895632688074)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3680734519688073)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(3681218181688073)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3682002358688074)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3680734519688073)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3682493827688074)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3680734519688073)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(3682209233688074)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3682671478688074)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3680734519688073)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(3682209233688074)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3683077148688074)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3682711375688074)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3683271951688074)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3682711375688074)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3683436006688074)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3682711375688074)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(3681218181688073)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3683689565688074)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3682711375688074)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(3681218181688073)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3684869717688075)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_api.id(3684648538688075)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3685263845688075)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_api.id(3685082987688075)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3685624620688075)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3685894326688076)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3686234377688076)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3686419251688076)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3686673610688076)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3686863609688076)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3687016322688076)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3687430982688076)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(3687255847688076)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3687645916688076)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3687819931688076)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3688041470688076)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(3687255847688076)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3688254491688076)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3688695115688076)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(3688417279688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3688883757688077)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(3688417279688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3689002662688077)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3689298837688077)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3689430228688077)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3689611583688077)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3683728501688074)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3690392062688077)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3690524757688077)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3690741492688078)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3690937109688078)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3691147738688078)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3691316347688078)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(3669252873688068)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3691512413688078)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(3669252873688068)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3691713734688078)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3689773571688077)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(3669252873688068)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3692498548688078)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3691838030688078)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3692674155688078)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3691838030688078)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3693074504688078)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3691838030688078)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(3692809136688078)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3693490886688078)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3691838030688078)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_api.id(3693297553688078)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3693664890688079)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3691838030688078)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_api.id(3693297553688078)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3693890664688079)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3691838030688078)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3694734093688079)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3693934569688079)
,p_css_classes=>'t-Login-region--headerIcon'
,p_group_id=>wwv_flow_api.id(3694531530688079)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Icon in the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3694926030688079)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3693934569688079)
,p_css_classes=>'t-Login-region--headerTitle'
,p_group_id=>wwv_flow_api.id(3694531530688079)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Title in the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3695130382688079)
,p_theme_id=>42
,p_name=>'LOGO_HEADER_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3693934569688079)
,p_css_classes=>'t-Login-region--headerHidden'
,p_group_id=>wwv_flow_api.id(3694531530688079)
,p_template_types=>'REGION'
,p_help_text=>'Hides both the Region Icon and Title from the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3696175286688080)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3696366504688080)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3696513045688080)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3696756233688080)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3697143588688081)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(3696928797688081)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3697393949688081)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3697570998688081)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3697784559688081)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3697949942688081)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3698126904688081)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3698386225688081)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3698762199688081)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(3698539202688081)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3698973706688081)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(3687255847688076)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3699187882688081)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(3698539202688081)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3699384885688081)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3699516457688081)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3699717163688082)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3699936911688082)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(3687255847688076)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3700390311688082)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(3700176231688082)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3700557467688082)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(3700176231688082)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3700743466688082)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3700960385688082)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3701159612688082)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3701331961688082)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(3696928797688081)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3701586693688082)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(3696928797688081)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3701773127688082)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3695205490688079)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(3696928797688081)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3702747612688083)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3701825983688082)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3703194096688083)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3701825983688082)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(3702930349688083)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3703565780688083)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3701825983688082)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(3703317268688083)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3703723487688083)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3701825983688082)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(3703317268688083)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3704183674688083)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3701825983688082)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(3703941488688083)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3704348928688083)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3701825983688082)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(3703941488688083)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3706150922688084)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(3698539202688081)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3706302998688084)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3706573069688084)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3706735389688084)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3706904317688085)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3707103367688085)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3707380635688085)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3707549654688085)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3707704985688085)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(3687255847688076)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3707905128688085)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(3698539202688081)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3708169975688085)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(3687255847688076)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3708376252688085)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3708579802688085)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3708749839688085)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3708923943688085)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3709144209688086)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3709327574688086)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3709553647688086)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(3685443600688075)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3709787012688086)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3709907053688086)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3710176723688086)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3710372276688086)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3710529848688086)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3710751349688086)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3710927110688086)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3711124883688086)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3711391341688086)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3711519700688087)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(3686033506688076)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3711720877688087)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3711966915688087)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(3705216470688084)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(3675989050688071)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3712728088688089)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(3712265689688087)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3713384575688089)
,p_theme_id=>42
,p_name=>'TITLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--hideTitle'
,p_group_id=>wwv_flow_api.id(3713165249688089)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Title from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3713714879688089)
,p_theme_id=>42
,p_name=>'SELECTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--hideSelection'
,p_group_id=>wwv_flow_api.id(3713511866688089)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Selection column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3714115764688090)
,p_theme_id=>42
,p_name=>'ICON_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--hideIcon'
,p_group_id=>wwv_flow_api.id(3713995814688090)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Icon from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3714598718688090)
,p_theme_id=>42
,p_name=>'DESCRIPTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--hideDescription'
,p_group_id=>wwv_flow_api.id(3714328108688090)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Description from being rendered on the screen.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3714904773688090)
,p_theme_id=>42
,p_name=>'MISC_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--hideMisc'
,p_group_id=>wwv_flow_api.id(3714738429688090)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Misc column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3715318644688090)
,p_theme_id=>42
,p_name=>'ACTIONS_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--hideActions'
,p_group_id=>wwv_flow_api.id(3715157267688090)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Actions column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3715719623688090)
,p_theme_id=>42
,p_name=>'ALIGNMENT_TOP'
,p_display_name=>'Top'
,p_display_sequence=>100
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--alignTop'
,p_group_id=>wwv_flow_api.id(3715590957688090)
,p_template_types=>'REPORT'
,p_help_text=>'Aligns the content to the top of the row. This is useful when you expect that yours rows will vary in height (e.g. some rows will have longer descriptions than others).'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3715989689688090)
,p_theme_id=>42
,p_name=>'STYLE_COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(3712852917688089)
,p_css_classes=>'t-ContentRow--styleCompact'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
,p_help_text=>'This option reduces the padding and font sizes to present a compact display of the same information.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3716549176688091)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(3716375739688091)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3716784226688091)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(3716375739688091)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3717172998688091)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(3716986643688091)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3717583501688091)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3717700458688091)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3717913609688092)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3718120239688092)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3718354946688092)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3718587599688092)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3718785194688092)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3718949179688092)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3719168436688092)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3719302364688092)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3716012649688090)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3719990955688093)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3720191194688093)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3720377930688093)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3720520485688093)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3720709639688093)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3720952241688093)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3721199096688093)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3721330461688093)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3719434614688092)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3721752925688093)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3721943509688093)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3722116149688093)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3722324708688093)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3722562372688094)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3722724205688094)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3722931159688094)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3723187604688094)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(3721428826688093)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(3719725935688092)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3723734171688094)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(3723552085688094)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3723985862688094)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(3723552085688094)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3724102994688094)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(3723552085688094)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3724339510688094)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(3723552085688094)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3724574519688094)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(3723552085688094)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3724755764688095)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3724944792688095)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3725170057688095)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3725344616688095)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3725532104688095)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3725739207688095)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3725980811688095)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3726196876688095)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3726319001688095)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3726575491688095)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3726771707688095)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3723227153688094)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3727343438688096)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(3727163470688096)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3727594842688096)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3727737740688096)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(3727163470688096)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3728113996688096)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(3727965467688096)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3728365394688096)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(3727965467688096)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3728577059688096)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(3727163470688096)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3728764521688096)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(3727163470688096)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3729123312688097)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(3728978112688096)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3729375145688097)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3726880624688095)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(3728978112688096)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3729769421688097)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3729437664688097)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_api.id(3716375739688091)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3729906399688097)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3729437664688097)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_api.id(3716375739688091)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3730366138688097)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3729437664688097)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(3730197836688097)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3730547997688097)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3729437664688097)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(3730197836688097)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3731106886688098)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(3716375739688091)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3731351830688098)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(3716375739688091)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3731524991688098)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3731750936688098)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3732155878688098)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(3731977401688098)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3732393533688098)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(3731977401688098)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3732542372688098)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3732763711688098)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3732996942688098)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3733118488688098)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3733324171688098)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3733585602688098)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(3717301529688091)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3733961647688099)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(3733735309688099)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3734154315688099)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(3733735309688099)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3734387530688099)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(3733735309688099)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3734551989688099)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3734925904688099)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(3734708918688099)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3735129219688099)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(3734708918688099)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3735326865688099)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3735500121688099)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3735742413688099)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(3712556172688089)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3735957545688100)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(3730845997688097)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(3733735309688099)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3736771073688102)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3736295351688100)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(3736554832688102)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3736934217688102)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3736295351688100)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(3736554832688102)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3737133337688102)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3736295351688100)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(3736554832688102)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3737531287688102)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3736295351688100)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(3737360295688102)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3737720308688103)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3736295351688100)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(3737360295688102)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3738108141688103)
,p_theme_id=>42
,p_name=>'FULL_WIDTH'
,p_display_name=>'Full Width'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'t-MegaMenu--fullWidth'
,p_template_types=>'LIST'
,p_help_text=>'Stretches the menu to fill the width of the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3738390222688103)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Displays a callout arrow that points to where the menu was activated from.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3738720940688103)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'t-MegaMenu--layout2Cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3738961951688103)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'t-MegaMenu--layout3Cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3739136533688103)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'t-MegaMenu--layout4Cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3739314070688104)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'t-MegaMenu--layout5Cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3739594798688104)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'t-MegaMenu--layoutStacked'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3739790795688104)
,p_theme_id=>42
,p_name=>'CUSTOM'
,p_display_name=>'Custom'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'t-MegaMenu--layoutCustom'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3739960546688104)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3737844099688103)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3740360178688104)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3740024911688104)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3740755894688105)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3740024911688104)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(3740533768688105)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3740911661688105)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3740024911688104)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(3740533768688105)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3741181579688105)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3740024911688104)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(3740533768688105)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3741367437688105)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3740024911688104)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3741788379688106)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3741420547688105)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3741902108688106)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3741420547688105)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3742195554688106)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3741420547688105)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3742395853688106)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3741420547688105)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3742758765688106)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3743174956688106)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3743378938688107)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3743566393688107)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3743775951688107)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3743908068688107)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3744111330688107)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3744379183688107)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3744515815688107)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3744707278688107)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3744956775688107)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3745312254688107)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(3745142318688107)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3745538030688108)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(3745142318688107)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3745722427688108)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(3745142318688107)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3745945344688108)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(3745142318688107)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3746120805688108)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3742407331688106)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(3745142318688107)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3746740265688108)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(3746583042688108)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3746987842688108)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(3746583042688108)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3747168007688108)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3747396722688108)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3747584641688108)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3747730316688108)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3747947039688109)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3748110533688109)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3748515221688109)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(3748376936688109)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3748738994688109)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3748981163688109)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3749128368688109)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3749589419688110)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3749725226688110)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3749931395688110)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3750320768688110)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_css_classes=>'js-navCollapsed--hidden'
,p_group_id=>wwv_flow_api.id(3750113179688110)
,p_template_types=>'LIST'
,p_help_text=>'Completely hide the navigation menu when it is collapsed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3750515736688110)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3750767706688110)
,p_theme_id=>42
,p_name=>'ICON_DEFAULT'
,p_display_name=>'Icon (Default)'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_css_classes=>'js-navCollapsed--default'
,p_group_id=>wwv_flow_api.id(3750113179688110)
,p_template_types=>'LIST'
,p_help_text=>'Display icons when the navigation menu is collapsed for large screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3750903070688110)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3751380758688110)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3751055338688110)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3751561752688110)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3751055338688110)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3751735566688110)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3751055338688110)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3751903756688110)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3751055338688110)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3752321929688111)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752094912688111)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3752763719688111)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(3746583042688108)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3752971731688111)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(3746583042688108)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3753195827688111)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3753335761688111)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3753564243688111)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3753999122688111)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(3753785474688111)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3754154867688111)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(3753785474688111)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3754367220688112)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3754529337688112)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3754709577688112)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3754934486688112)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3755121256688112)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3755374866688112)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3755591617688112)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3755782997688112)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3755999405688112)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3756381489688113)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(3756148980688112)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3756536062688113)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(3756148980688112)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3756903594688113)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(3756724691688113)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3757183314688113)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(3756724691688113)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3757363035688113)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(3756724691688113)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3757577024688113)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3757776074688113)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(3752464894688111)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(3756724691688113)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3758169997688113)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3757815300688113)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(3748376936688109)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3758349917688113)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3757815300688113)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3758555000688113)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3757815300688113)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3758775006688113)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3757815300688113)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(3756148980688112)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3758998217688114)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3757815300688113)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(3756148980688112)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3759144478688114)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3757815300688113)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(3738559602688103)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3759375533688114)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(3757815300688113)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(3748376936688109)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3759798313688114)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3759421263688114)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3759952809688114)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3759421263688114)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3760598667688114)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3760066112688114)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(3760328468688114)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3760732092688114)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(3760066112688114)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3760924956688115)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(3760066112688114)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3761104912688115)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3760066112688114)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3761330775688115)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3760066112688114)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(3760328468688114)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3761572112688115)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(3760066112688114)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(3742912959688106)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3762755047688118)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(3762596467688118)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3762907301688118)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(3762596467688118)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3763554814688119)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(3763178473688118)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(3763352479688118)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3763729263688119)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(3763178473688118)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(3763352479688118)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3763915123688119)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(3763178473688118)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3764134476688119)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(3763178473688118)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(3762596467688118)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3764388365688119)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(3763178473688118)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(3762596467688118)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3766428588688142)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(3766273515688142)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3766844458688143)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(3766650416688142)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3767065580688143)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(3766273515688142)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3767231395688143)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(3766273515688142)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3767622981688143)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(3767439206688143)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3768044730688143)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(3767879301688143)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3768481105688143)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(3768243228688143)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3768686346688143)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(3767879301688143)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3768854675688143)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(3766273515688142)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3769085252688144)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(3767439206688143)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3769252692688144)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(3768243228688143)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3769654751688144)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(3769475112688144)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3769868296688144)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(3769475112688144)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3770237912688144)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(3770028068688144)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3770414323688144)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(3770028068688144)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3770610147688144)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(3770028068688144)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3771055097688144)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(3770844970688144)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3771437997688145)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(3771220800688144)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3771603872688145)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(3771220800688144)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3772023514688145)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(3771807241688145)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3772214020688145)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(3771807241688145)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3772658762688145)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(3772415156688145)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3773074878688145)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(3772886265688145)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3773209225688145)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(3767439206688143)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3773631469688145)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(3773439036688145)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3773891757688146)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(3773439036688145)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3774246540688146)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(3774054635688146)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3774462508688146)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(3774054635688146)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3774601510688146)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(3767879301688143)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3775079787688146)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(3774823705688146)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3775428593688146)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(3775246144688146)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3775884898688146)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(3775647884688146)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3776200373688146)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(3776057281688146)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3776486982688147)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(3776057281688146)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3776616218688147)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(3776057281688146)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3776861734688147)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(3776057281688146)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3777238893688147)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(3777089222688147)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3777490080688147)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(3777089222688147)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3777626725688147)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(3777089222688147)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3777834967688147)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(3777089222688147)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3778276107688147)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(3778042466688147)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3778483392688147)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(3778042466688147)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3778654597688147)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(3778042466688147)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3778882957688148)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(3778042466688147)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3779269673688148)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(3779063030688148)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3779421657688148)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(3779063030688148)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3779673553688148)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(3779063030688148)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3779883950688148)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(3779063030688148)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3780248319688148)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(3780076014688148)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3780444450688148)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(3780076014688148)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3780682134688148)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(3780076014688148)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3780800822688148)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(3780076014688148)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3781243384688148)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(3781079276688148)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3781470681688149)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(3781079276688148)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3781653177688149)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(3781079276688148)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3781801138688149)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(3781079276688148)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3782224990688149)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(3782048462688149)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3782456183688149)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(3782048462688149)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3782657037688149)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(3782048462688149)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3782861609688149)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(3782048462688149)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3783293990688149)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(3783092496688149)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3783419492688149)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(3783092496688149)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3783616009688149)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(3783092496688149)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3783835694688150)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(3783092496688149)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3784205601688150)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(3784042660688150)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3784630880688150)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(3784487573688150)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3784806463688150)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(3784487573688150)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(3785070825688150)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(3787636662688191)
,p_build_option_name=>'Feature: Configuration Options'
,p_build_option_status=>'INCLUDE'
,p_feature_identifier=>'APPLICATION_CONFIGURATION'
,p_build_option_comment=>'Allow application administrators to enable or disable specific functionality, associated with an Application Express build option, from within the application.'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(3788988150688195)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_accounts
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(3645262518688040)
,p_name=>'Application Express Accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/shared_components/plugins/region_type/json_region_uwesimon_selfhost_e
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(44707756106280238)
,p_plugin_type=>'REGION TYPE'
,p_name=>'JSON_REGION.UWESIMON.SELFHOST.E'
,p_display_name=>'Json-Region'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','JSON_REGION.UWESIMON.SELFHOST.E'),'')
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.starRating#MIN#.js',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.pctGraph#MIN#.js',
'#PLUGIN_FILES#json-region.js'))
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
'  l_apex_version        apex_release.version_no%TYPE;',
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
'  SELECT VERSION_NO INTO l_apex_version FROM APEX_RELEASE;',
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
'  APEX_JAVASCRIPT.ADD_REQUIREJS();',
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
'         apex_javascript.add_attribute(''schema'',         l_schema) ||',
'         apex_javascript.add_attribute(''apex_files'',     APEX_APPLICATION.G_IMAGE_PREFIX) ||',
'         apex_javascript.add_attribute(''nls_date_format'',V(''APP_NLS_DATE_FORMAT'')) ||',
'         apex_javascript.add_attribute(''apex_version'',   l_apex_version, false,false) ||',
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
,p_help_text=>'This plug-in was downloaded from https://github.com/simonuwe/oracle-apex-json-region and backported to APEX 20.2.'
,p_version_identifier=>'0.9.0c'
,p_about_url=>'https://github.com/simonuwe/oracle-apex-json-region'
,p_files_version=>131
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44710613998319898)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44708531858294181)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>10
,p_prompt=>'Source'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'1'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The source for the JSON-schema.',
'This could be a static schema or a schema retrieved by a SQL-query.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(44708849700295298)
,p_plugin_attribute_id=>wwv_flow_api.id(44708531858294181)
,p_display_sequence=>10
,p_display_value=>'Static'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(44709310463296544)
,p_plugin_attribute_id=>wwv_flow_api.id(44708531858294181)
,p_display_sequence=>20
,p_display_value=>'SQL-Query'
,p_return_value=>'SQL-Query'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44709687016305798)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>20
,p_prompt=>'Static Schema'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(44708531858294181)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44709929801311513)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>30
,p_prompt=>'SQL-Query'
,p_attribute_type=>'SQL'
,p_is_required=>false
,p_display_length=>80
,p_max_length=>4000
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(44708531858294181)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'1'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Query to retrieve the JSON-schema. It must return exactly one row with the JSON-schema-column.',
'',
'The schema must contain the attributes',
'type, properties and optionally required.',
'For a detailed JSON-schema description see https://json-schema.org/'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44710246902315594)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>40
,p_prompt=>'Column Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'3'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The width of a column.',
'The default universal-theme supports here 1 (12 columns), 2, 3, 4, 6, 12(1 column)'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44710917928324077)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44711219855328570)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44711489302331671)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44711788890334507)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(44708245045289537)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10238069741832118)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>55
,p_prompt=>'Template'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'floating'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10238375682836484)
,p_plugin_attribute_id=>wwv_flow_api.id(10238069741832118)
,p_display_sequence=>10
,p_display_value=>'Header Floating'
,p_return_value=>'floating'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10238757714838324)
,p_plugin_attribute_id=>wwv_flow_api.id(10238069741832118)
,p_display_sequence=>20
,p_display_value=>'Label Above'
,p_return_value=>'above'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10239180463839389)
,p_plugin_attribute_id=>wwv_flow_api.id(10238069741832118)
,p_display_sequence=>30
,p_display_value=>'Label Left'
,p_return_value=>'left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10239603541841172)
,p_plugin_attribute_id=>wwv_flow_api.id(10238069741832118)
,p_display_sequence=>40
,p_display_value=>'Label Hidden'
,p_return_value=>'hidden'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A2041504558204A534F4E2D726567696F6E20706C7567696E0A202A20286329205577652053696D6F6E20323032332C323032340A202A20417061636865204C6963656E73652056657273696F6E20322E300A2A2F0A0A2F2F20666F72204F72';
wwv_flow_api.g_varchar2_table(2) := '61636C65203C2032312E310A2F2F20617065782E656E7620646F6573206E6F74206E6F74206578697374732C20617065782E6C6F63616C65206F6E6C79207061727469616C6C790A617065782E6C6F63616C652E746F4E756D626572203D20617065782E';
wwv_flow_api.g_varchar2_table(3) := '6C6F63616C652E746F4E756D626572207C7C2066756E6374696F6E287056616C75652C2070466F726D617429207B200A20207056616C7565203D20282727202B207056616C7565292E7265706C61636528617065782E6C6F63616C652E67657443757272';
wwv_flow_api.g_varchar2_table(4) := '656E637928292C202727293B20202F2F2072656D6F76652063757272656E63792024E282AC2E2E2E0A20207056616C7565203D20282727202B207056616C7565292E7265706C61636528617065782E6C6F63616C652E67657449534F43757272656E6379';
wwv_flow_api.g_varchar2_table(5) := '28292C202727293B202F2F2072656D6F7665204555522F5553442F2E2E2E0A20207056616C7565203D20282727202B207056616C7565292E7265706C61636528617065782E6C6F63616C652E67657447726F7570536570617261746F7228292C20272729';
wwv_flow_api.g_varchar2_table(6) := '3B20202F2F2072656D6F76652047726F7570736570657261746F720A20207056616C7565203D20282727202B207056616C7565292E7265706C61636528617065782E6C6F63616C652E676574446563696D616C536570617261746F7228292C20272E2729';
wwv_flow_api.g_varchar2_table(7) := '3B20202F2F2072656D6F766520636F6E76657220446563696D616C536570657261746F7220746F202E0A202072657475726E204E756D626572287056616C7565290A7D3B200A617065782E64617465203D20617065782E646174657C7C7B0A2020706172';
wwv_flow_api.g_varchar2_table(8) := '73653A2066756E6374696F6E2870446174652C2070466F726D617429207B0A202020206C6574206C5F726574203D6E756C6C3B0A2020202069662870446174652E696E636C756465732827202729297B20202F2F20636F6E7461696E732074696D650A20';
wwv_flow_api.g_varchar2_table(9) := '20202020207044617465203D2070446174652E7265706C616365282754272C20272027293B202F2F20657863657074206461746574696D65207769746820222022206F7220225422206265747765656E206461746520616E642074696D652C2041504558';
wwv_flow_api.g_varchar2_table(10) := '3C32322E31202220222064656C696D697465720A2020202020206C5F726574203D20242E646174657069636B65722E706172736544617465282764642E6D6D2E7979272C207044617465293B0A2020202020206C5F726574203D206E6577204461746528';
wwv_flow_api.g_varchar2_table(11) := '6C5F7265742E67657454696D652829202D206C5F7265742E67657454696D657A6F6E654F666673657428292A3630303030293B0A2020202020206C5F726574203D206E65772044617465286C5F7265742E746F49534F537472696E6728292E7375627374';
wwv_flow_api.g_varchar2_table(12) := '72696E6728302C313029202B20272027202B2070446174652E6D61746368282F5B5C645D7B327D3A5B5C645D7B327D283A5B5C645D7B327D293F2F67295B305D202B20275A27293B0A202020207D20656C7365207B202F2F2064617465206F6E6C790A20';
wwv_flow_api.g_varchar2_table(13) := '20202020206C5F726574203D20242E646174657069636B65722E7061727365446174652870466F726D61742C207044617465293B0A2020202020206C5F726574203D206E65772044617465286C5F7265742E67657454696D652829202D206C5F7265742E';
wwv_flow_api.g_varchar2_table(14) := '67657454696D657A6F6E654F666673657428292A3630303030293B0A202020207D0A2020202072657475726E286C5F726574293B0A202020202F2F202870446174652E7265706C616365282754272C2027202729293B0A20207D2C0A2020746F49534F53';
wwv_flow_api.g_varchar2_table(15) := '7472696E673A2066756E6374696F6E28704461746529207B200A2020202072657475726E20286E65772044617465287044617465292E746F49534F537472696E6728292E737562737472696E6728302C313929293B0A20207D0A7D3B0A0A227573652073';
wwv_flow_api.g_varchar2_table(16) := '7472696374223B0A0A0A2F2A0A20202020696628216E616D652E6D61746368282F5E5B412D5A612D7A5F302D395D2B242F6729297B202F2F20636F6E7461696E7320736F6D65207370656369616C206368617261637465727320616E6420656E636C6F73';
wwv_flow_api.g_varchar2_table(17) := '656420627920222C207265706C616365206279205F0A202020202020636F6E7374206C5F6E616D65203D206E616D653B0A2020202020206E616D65203D206E616D652E7265706C616365282F222F672C2727292E7265706C616365282F5B5E412D5A612D';
wwv_flow_api.g_varchar2_table(18) := '7A5F302D395D2F672C20275F27293B20200A202020202020617065782E64656275672E6572726F722827696E76616C69642070726F7065727479206B6579272C206C5F6E616D652C20277265706C61636564206279272C206E616D65293B0A202020207D';
wwv_flow_api.g_varchar2_table(19) := '0A2A2F0A0A2F2A0A202A20696E697469616C697A6520746865204A534F4E2D726567696F6E20706C7567696E2C2063616C6C20666F726D20696E7369646520504C2F53514C207768656E20706C7567696E2069737420696E697469616C697A65640A2A2F';
wwv_flow_api.g_varchar2_table(20) := '0A2F2F206173796E632066756E6374696F6E20696E69744A736F6E526567696F6E282070526567696F6E49642C20704E616D652C2070416A61784964656E7469666965722C20704F7074696F6E7329207B0A66756E6374696F6E20696E69744A736F6E52';
wwv_flow_api.g_varchar2_table(21) := '6567696F6E282070526567696F6E49642C20704E616D652C2070416A61784964656E7469666965722C20704F7074696F6E7329207B0A2020636F6E737420435F415045585F56455253494F4E5F32303032203D202232302E32220A2020636F6E73742043';
wwv_flow_api.g_varchar2_table(22) := '5F415045585F56455253494F4E5F32313032203D202232312E32220A2020636F6E737420435F415045585F56455253494F4E5F32323031203D202232322E31220A2020636F6E737420435F415045585F56455253494F4E5F32323032203D202232322E32';
wwv_flow_api.g_varchar2_table(23) := '220A2020636F6E737420435F415045585F56455253494F4E5F32333032203D202232332E32220A0A0A20202020202020202F2F20676574207468652064617461742D74656D706C6174652D696420666F7220696E6C696E65206572726F72732066726F6D';
wwv_flow_api.g_varchar2_table(24) := '20616E6F7468657220696E707574206669656C640A2F2F20636F6E736F6C652E6572726F72284A534F4E2E737472696E6769667928704F7074696F6E7329293B0A20206C6574206744617461203D207B7D3B20202F2F20686F6C647320746865204A534F';
wwv_flow_api.g_varchar2_table(25) := '4E2D6461746120617320616E206F626A65637420686965726172636869650A20206C6574206744617465466F726D6174203D20617065782E6C6F63616C652E67657444617465466F726D61743F617065782E6C6F63616C652E67657444617465466F726D';
wwv_flow_api.g_varchar2_table(26) := '617428293A6E756C6C3B0A2020696628216744617465466F726D617429207B0A202020206744617465466F726D6174203D20704F7074696F6E732E6E6C735F646174655F666F726D61742E746F4C6F7765724361736528292E7265706C616365282F7979';
wwv_flow_api.g_varchar2_table(27) := '2F672C277927293B0A20207D20656C7365207B0A20202020696628704F7074696F6E732E617065785F76657273696F6E203C20435F415045585F56455253494F4E5F32323031297B0A2020202020206744617465466F726D6174203D20704F7074696F6E';
wwv_flow_api.g_varchar2_table(28) := '732E6E6C735F646174655F666F726D61742E746F4C6F7765724361736528292E7265706C61636528276D6D272C20274D4D27293B0A202020207D0A20207D0A20206C6574206754696D65466F726D6174203D206E756C6C3B0A2020696628704F7074696F';
wwv_flow_api.g_varchar2_table(29) := '6E732E617065785F76657273696F6E203E3D20435F415045585F56455253494F4E5F3232303129207B0A202020206754696D65466F726D6174203D2027484832343A4D49273B0A20207D20656C736520696628704F7074696F6E732E617065785F766572';
wwv_flow_api.g_varchar2_table(30) := '73696F6E203E3D20435F415045585F56455253494F4E5F3231303229207B0A202020206754696D65466F726D6174203D202248483A6D6D223B0A20207D20656C7365207B0A202020206754696D65466F726D6174203D202248483A6969223B0A20207D0A';
wwv_flow_api.g_varchar2_table(31) := '0A20202F2F206744617465466F726D6174203D202764642E4D4D2E79797979273B0A20202F2F206754696D65466F726D6174203D202748483A6D6D273B0A0A2020704F7074696F6E732E617065785F76657273696F6E203D20704F7074696F6E732E6170';
wwv_flow_api.g_varchar2_table(32) := '65785F76657273696F6E2E6D61746368282F5C642B5C2E5C642B2F295B305D3B20202F2F206F6E6C792066697273742032206E756D62657273206F662076657273696F6E0A2020704F7074696F6E732E6461746174656D706C6174654554203D20242824';
wwv_flow_api.g_varchar2_table(33) := '28272E612D466F726D2D6572726F725B646174612D74656D706C6174652D69645D27295B305D292E617474722827646174612D74656D706C6174652D69642729207C7C202778785F4554273B0A636F6E736F6C652E6C6F6728704F7074696F6E73293B0A';
wwv_flow_api.g_varchar2_table(34) := '20202F2A0A2020202A202073657420626F6F6C65616E2076616C3120776F2076616C32207768656E2076616C31206973206E6F74207365740A20202A2F0A202066756E6374696F6E20626F6F6C65616E49664E6F745365742876616C312C2076616C3229';
wwv_flow_api.g_varchar2_table(35) := '7B0A202020202072657475726E202828747970656F662076616C31203D3D2027626F6F6C65616E27293F76616C313A76616C32290A20207D0A0A20202F2A0A2020202A204C6F67204A534F4E2D736368656D612072656C61746564206572726F726D6573';
wwv_flow_api.g_varchar2_table(36) := '73616765730A20202A2F0A202066756E6374696F6E206C6F67536368656D614572726F72286D73672C202E2E2E61726773297B0A2020202069662841727261792E6973417272617928617267732920262620617267732E6C656E6774683E30297B0A2020';
wwv_flow_api.g_varchar2_table(37) := '20202020617065782E64656275672E6572726F7228274A534F4E2D736368656D6120696E76616C69643A20272B206D73672C202E2E2E61726773290A202020207D20656C7365207B0A202020202020617065782E64656275672E6572726F7228274A534F';
wwv_flow_api.g_varchar2_table(38) := '4E2D736368656D6120696E76616C69643A20272B206D7367290A202020207D0A20207D0A0A20202F2A0A2020202A20536F6D65206861636B730A2020202A205761697420666F72205269636874746578742D456469746F7220746F20626520696E697469';
wwv_flow_api.g_varchar2_table(39) := '616C697A65640A2020202A206F746865727769736520617065782E6974656D282772696368746578742D4954454D27292E73657456616C7565282E2E2E292077696C6C20636175736520756E646566696E6564206572726F72200A20202A2F0A20206675';
wwv_flow_api.g_varchar2_table(40) := '6E6374696F6E2077616974466F72456469746F722829207B0A2020202072657475726E206E65772050726F6D6973652866756E6374696F6E20287265736F6C76652C2072656A65637429207B0A2020202020202020636865636B456469746F7228726573';
wwv_flow_api.g_varchar2_table(41) := '6F6C7665293B0A202020207D293B0A20207D0A0A20202F2A0A2020202A20436865636B2077686574686572207468652072696368746578742D656469746F7220697320696E697469616C697A65640A20202A2F0A202066756E6374696F6E20636865636B';
wwv_flow_api.g_varchar2_table(42) := '456469746F72287265736F6C766529207B0A202020206C657420656469746F72456C656D656E74203D20242827612D726963682D746578742D656469746F7227293B0A20202020696620282128656469746F72456C656D656E7420262620656469746F72';
wwv_flow_api.g_varchar2_table(43) := '456C656D656E745B305D20262620656469746F72456C656D656E745B305D2E676574456469746F7228292929207B0A20202020202073657454696D656F757428636865636B456469746F722E62696E6428746869732C207265736F6C7665292C20333029';
wwv_flow_api.g_varchar2_table(44) := '3B0A202020207D2020656C7365207B0A2020202020207265736F6C766528293B0A202020207D0A20207D0A0A20202F2A0A2020202A205761697420756E74696C207468652072696368746578742D656469746F7220697320696E697469616C697A65640A';
wwv_flow_api.g_varchar2_table(45) := '20202A2F0A20206173796E632066756E6374696F6E2072696368746578744861636B28297B0A202020206C657420656469746F72456C656D656E74203D20242827612D726963682D746578742D656469746F7227293B0A20202020696628656469746F72';
wwv_flow_api.g_varchar2_table(46) := '456C656D656E7420262620656469746F72456C656D656E745B305D297B0A202020202020617065782E64656275672E74726163652028277761697420666F722072696368746578742D656469746F72206265656F6E20696E697469616C697A656427293B';
wwv_flow_api.g_varchar2_table(47) := '0A20202020202061776169742077616974466F72456469746F7228293B0A202020207D0A20207D0A0A0A20202F2A0A2020202A20436865636B207768657468657220616E206F626A65637420697320656D7074792C20636F6E7461696E73206E6F207072';
wwv_flow_api.g_varchar2_table(48) := '6F70657274696573206F7220616C6C2070726F7065727469657320617265206E756C6C0A20202A2F0A202066756E6374696F6E2069734F626A656374456D7074792864617461297B0A202020206C6574206C5F656D707479203D20747275653B0A202020';
wwv_flow_api.g_varchar2_table(49) := '20617065782E64656275672E747261636528273E3E6A736F6E526567696F6E2E69734F626A656374456D707479272C2064617461293B0A202020206966286461746120262620747970656F662064617461203D3D20276F626A65637427297B0A20202020';
wwv_flow_api.g_varchar2_table(50) := '2020666F7228636F6E7374205B6C5F6B65792C206C5F646174615D206F66204F626A6563742E656E7472696573286461746129297B0A20202020202020206966286C5F64617461297B0A202020202020202020206C5F656D707479203D2066616C73653B';
wwv_flow_api.g_varchar2_table(51) := '0A20202020202020207D0A2020202020207D0A202020207D20656C73652069662864617461297B0A2020202020206C5F656D707479203D2066616C73653B0A202020207D0A20202020617065782E64656275672E747261636528273C3C6A736F6E526567';
wwv_flow_api.g_varchar2_table(52) := '696F6E2E69734F626A656374456D707479272C206C5F656D707479293B0A2020202072657475726E286C5F656D707479293B0A20207D200A20202F2A0A2020202A20736F6D65204861636B7320746F206D616B652074686520706C7567696E20776F726B';
wwv_flow_api.g_varchar2_table(53) := '0A20202A2F0A202066756E6374696F6E20617065784861636B7328297B0A0A202020202F2F204861636B20746F2061747461636820616C6C2048616E646C657220746F20746865206669656C647320696E20746865206A736F6E2D726567696F6E20200A';
wwv_flow_api.g_varchar2_table(54) := '20202020617065782E64656275672E747261636528273E3E6A736F6E526567696F6E2E617065784861636B7327293B0A202020202020202F2F20617065782E6974656D2E617474616368282428272327202B2070526567696F6E496429293B0A20202020';
wwv_flow_api.g_varchar2_table(55) := '2020202020202F2F206861636B20746F20737570706F727420666C6F6174696E67206C61626C657320666F7220756E6976657273616C2D7468656D612034320A20202020696628617065782E7468656D653432297B0A202020202020617065782E646562';
wwv_flow_api.g_varchar2_table(56) := '75672E696E666F28275468656D65343220706174636827293B0A202020202020617065782E6576656E742E7472696767657228617065782E6750616765436F6E74657874242C2027617065787265616479656E6427293B0A202020207D0A0A2020202061';
wwv_flow_api.g_varchar2_table(57) := '7065782E64656275672E747261636528273C3C6A736F6E526567696F6E2E617065784861636B7327293B0A20207D0A0A202020202F2F204861636B20746F2072656D6F766520626F726465722066726F6D20726567696F6E0A20202428272327202B2070';
wwv_flow_api.g_varchar2_table(58) := '526567696F6E4964292E6373732822626F72646572222C20226E6F6E6522293B0A0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F204A534F4E202274797065223A';
wwv_flow_api.g_varchar2_table(59) := '20222E2E2E220A2020636F6E737420435F4A534F4E5F4F424A45435420202020202020202020203D20276F626A656374273B0A2020636F6E737420435F4A534F4E5F41525241592020202020202020202020203D20276172726179273B0A2020636F6E73';
wwv_flow_api.g_varchar2_table(60) := '7420435F4A534F4E5F50524F50455254494553202020202020203D202770726F70657274696573273B0A2020636F6E737420435F4A534F4E5F52455155495245442020202020202020203D20277265717569726564273B0A2020636F6E737420435F4A53';
wwv_flow_api.g_varchar2_table(61) := '4F4E5F52454620202020202020202020202020203D202724726566273B0A2020636F6E737420435F4A534F4E5F535452494E4720202020202020202020203D2027737472696E67273B0A2020636F6E737420435F4A534F4E5F494E544547455220202020';
wwv_flow_api.g_varchar2_table(62) := '2020202020203D2027696E7465676572273B0A2020636F6E737420435F4A534F4E5F4E554D42455220202020202020202020203D20276E756D626572273B0A2020636F6E737420435F4A534F4E5F424F4F4C45414E202020202020202020203D2027626F';
wwv_flow_api.g_varchar2_table(63) := '6F6C65616E273B0A2020636F6E737420435F4A534F4E5F434F4E53542020202020202020202020203D2027636F6E7374273B0A2020636F6E737420435F4A534F4E5F464F524D41545F444154452020202020203D202764617465273B0A2020636F6E7374';
wwv_flow_api.g_varchar2_table(64) := '20435F4A534F4E5F464F524D41545F4441544554494D4520203D2027646174652D74696D65273B0A2020636F6E737420435F4A534F4E5F464F524D41545F54494D452020202020203D202774696D65273B0A2020636F6E737420435F4A534F4E5F464F52';
wwv_flow_api.g_varchar2_table(65) := '4D41545F454D41494C20202020203D2027656D61696C273B0A2020636F6E737420435F4A534F4E5F464F524D41545F555249202020202020203D2027757269273B0A0A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(66) := '20202020202020202020202F2F20636F6E646974696F6E616C206B6579776F7264730A2020636F6E737420435F4A534F4E5F434F4E445F414C4C5F4F462020202020203D2027616C6C4F66273B0A2020636F6E737420435F4A534F4E5F434F4E445F414E';
wwv_flow_api.g_varchar2_table(67) := '595F4F462020202020203D2027616E794F66273B0A2020636F6E737420435F4A534F4E5F434F4E445F4E4F542020202020202020203D20276E6F74273B0A20200A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(68) := '202020202020202020202020202020202F2F204A534F4E20656E636F64656420737472696E67730A2020636F6E737420435F4A534F4E5F494D4147455F504E4720202020202020203D2027696D6167652F706E67273B0A2020636F6E737420435F4A534F';
wwv_flow_api.g_varchar2_table(69) := '4E5F494D4147455F4A504720202020202020203D2027696D6167652F6A7067273B0A2020636F6E737420435F4A534F4E5F494D4147455F47494620202020202020203D2027696D6167652F676966273B0A2020636F6E737420435F4A534F4E5F42415345';
wwv_flow_api.g_varchar2_table(70) := '363420202020202020202020203D2027626173653634273B0A0A2020636F6E737420435F44454C494D495445522020202020202020203D20275F272020202020202020202020202020202020202F2F2064656C696D6974657220666F722070617468206F';
wwv_flow_api.g_varchar2_table(71) := '66206E6573746564206F626A656374730A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F202261706578223A207B226974656D74797065223A20222E2E2E222C202E';
wwv_flow_api.g_varchar2_table(72) := '2E2E7D200A2020636F6E737420435F415045585F535749544348202020202020203D2027737769746368273B2020202020202020202020202F2F206974656D74797065207377697463680A2020636F6E737420435F415045585F52494348544558542020';
wwv_flow_api.g_varchar2_table(73) := '2020203D20277269636874657874273B202020202020202020202F2F206974656D7479706520726963687465787420656469746F720A2020636F6E737420435F415045585F544558544152454120202020203D20277465787461726561273B0A2020636F';
wwv_flow_api.g_varchar2_table(74) := '6E737420435F415045585F434F4D424F20202020202020203D2027636F6D626F626F78273B202020202020202020202F2F206974656D7479706520636F6D626F626F780A2020636F6E737420435F415045585F524144494F20202020202020203D202772';
wwv_flow_api.g_varchar2_table(75) := '6164696F273B0A2020636F6E737420435F415045585F434845434B424F5820202020203D2027636865636B626F78273B0A2020636F6E737420435F415045585F53454C454354202020202020203D202773656C656374273B202020202020202020202020';
wwv_flow_api.g_varchar2_table(76) := '2F2F206974656D747970652073656C6563740A2020636F6E737420435F415045585F50415353574F524420202020203D202770617373776F7264273B0A2020636F6E737420435F415045585F53544152524154494E472020203D20277374617272617469';
wwv_flow_api.g_varchar2_table(77) := '6E67273B0A2020636F6E737420435F415045585F5152434F4445202020202020203D20277172636F6465273B0A2020636F6E737420435F415045585F494D41474520202020202020203D2027696D616765273B0A2020636F6E737420435F415045585F43';
wwv_flow_api.g_varchar2_table(78) := '555252454E435920202020203D202763757272656E6379273B0A2020636F6E737420435F415045585F484F52495A4F4E54414C2020203D2027686F72697A6F6E74616C273B0A2020636F6E737420435F415045585F564552544943414C20202020203D20';
wwv_flow_api.g_varchar2_table(79) := '27766572746963616C273B0A2020636F6E737420435F415045585F504354475241504820202020203D20277063746772617068273B0A2020636F6E737420435F415045585F4C4142454C20202020202020203D20276C6162656C273B0A2020636F6E7374';
wwv_flow_api.g_varchar2_table(80) := '20435F415045585F414C49474E20202020202020203D2027616C69676E273B0A2020636F6E737420435F415045585F4C4546542020202020202020203D20276C656674273B0A2020636F6E737420435F415045585F43454E544552202020202020203D20';
wwv_flow_api.g_varchar2_table(81) := '2763656E746572273B0A2020636F6E737420435F415045585F524947485420202020202020203D20277269676874273B0A0A2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F48494444454E2020203D202768696464656E273B';
wwv_flow_api.g_varchar2_table(82) := '0A2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F4C45465420202020203D20276C656674273B0A2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F41424F5645202020203D202761626F7665273B0A';
wwv_flow_api.g_varchar2_table(83) := '2020636F6E737420435F415045585F54454D504C4154455F4C4142454C5F464C4F4154494E47203D2027666C6F6174696E67273B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(84) := '202020202F2F20457874656E646564204F7261636C65207479706573200A2020636F6E737420435F4F5241434C455F54494D455354414D5020203D202774696D657374616D70273B2020202020200A0A202020202F2F206D617070696E672066726F6D20';
wwv_flow_api.g_varchar2_table(85) := '66696C652D657874696F6E73696F6E73206C696B65202E6A7320746F2068746D6C2D7461677320726571756972656420746F206F706164207468652066696C650A2020636F6E737420634D617054797065203D207B0A2020202022736372697074223A20';
wwv_flow_api.g_varchar2_table(86) := '7B7461673A2022736372697074222C2072656C3A206E756C6C2C202020202020202020617474723A2022737263222C20207072656669783A20223F763D22202B20704F7074696F6E732E617065785F76657273696F6E2C20747970653A2022746578742F';
wwv_flow_api.g_varchar2_table(87) := '6A617661736372697074227D2C0A2020202022637373223A202020207B7461673A20226C696E6B222C20202072656C3A20227374796C657368656574222C20617474723A202268726566222C207072656669783A2022222C202020202020202020202020';
wwv_flow_api.g_varchar2_table(88) := '20202020202020202020202020202020747970653A2022746578742F637373227D0A20207D3B0A0A2020636F6E73742063416C69676E203D207B0A2020202020206C6566743A2022752D746578745374617274222C0A20202020202063656E7465723A20';
wwv_flow_api.g_varchar2_table(89) := '22752D7465787443656E746572222C0A20202020202072696768743A2022752D74657874456E64220A20207D0A0A20202F2A0A2020202A202067656E65726174652061204A534F4E2D736368656D612066726F6D204A534F4E2D646174610A20202A2F0A';
wwv_flow_api.g_varchar2_table(90) := '202066756E6374696F6E2067656E6572617465536368656D6128736368656D612C2064617461297B0A202020202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465536368656D61222C20736368656D';
wwv_flow_api.g_varchar2_table(91) := '612C2064617461293B0A2020202020206966286461746120262620747970656F662064617461203D3D20276F626A65637427297B20202F2F206D75737420676F20646F776E2072656375727369766C790A202020202020202069662841727261792E6973';
wwv_flow_api.g_varchar2_table(92) := '4172726179286461746129297B0A20202020202020202020736368656D61203D207B747970653A20226172726179222C206974656D733A207B7D7D3B0A20202020202020202020666F7228636F6E7374206C5F64617461206F66206461746129207B0A20';
wwv_flow_api.g_varchar2_table(93) := '2020202020202020202020736368656D612E6974656D73203D2067656E6572617465536368656D6128736368656D612E6974656D732C206C5F64617461293B0A202020202020202020207D0A20202020202020207D20656C7365207B20202F2F20612073';
wwv_flow_api.g_varchar2_table(94) := '696D706C65206F626A6563740A20202020202020202020736368656D612E74797065203D20226F626A656374223B0A20202020202020202020736368656D612E70726F70657274696573203D20736368656D612E70726F70657274696573207C7C7B7D3B';
wwv_flow_api.g_varchar2_table(95) := '0A20202020202020202020666F722028636F6E7374205B6C5F6B65792C206C5F646174615D206F66204F626A6563742E656E7472696573286461746129297B0A202020202020202020202020736368656D612E70726F706572746965735B6C5F6B65795D';
wwv_flow_api.g_varchar2_table(96) := '203D20736368656D612E70726F706572746965735B6C5F6B65795D207C7C7B7D3B0A202020202020202020202020736368656D612E70726F706572746965735B6C5F6B65795D203D2067656E6572617465536368656D6128736368656D612E70726F7065';
wwv_flow_api.g_varchar2_table(97) := '72746965735B6C5F6B65795D2C206C5F64617461293B0A202020202020202020207D0A20202020202020207D0A2020202020207D20656C7365207B0A20202020202020206C6574206C5F74797065203D206E756C6C3B0A20202020202020206C6574206C';
wwv_flow_api.g_varchar2_table(98) := '5F666F726D6174203D206E756C6C3B0A202020202020202073776974636828747970656F662064617461297B0A20202020202020202020636173652027626F6F6C65616E273A0A2020202020202020202020206C5F74797065203D20435F4A534F4E5F42';
wwv_flow_api.g_varchar2_table(99) := '4F4F4C45414E3B0A20202020202020202020627265616B3B0A202020202020202020206361736520276E756D626572273A0A2020202020202020202020206966284E756D6265722E6973496E7465676572286461746129297B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(100) := '202020206C5F74797065203D20435F4A534F4E5F494E54454745523B0A2020202020202020202020207D20656C7365207B0A20202020202020202020202020206C5F74797065203D20435F4A534F4E5F4E554D4245520A2020202020202020202020207D';
wwv_flow_api.g_varchar2_table(101) := '0A20202020202020202020627265616B3B0A20202020202020202020636173652027737472696E67273A0A2020202020202020202020206C5F74797065203D20435F4A534F4E5F535452494E473B0A202020202020202020202020202020202F2F206361';
wwv_flow_api.g_varchar2_table(102) := '6C6320666F726D617420746F6F0A202020202020202020202020696628646174612E6D61746368282F5E5C647B347D5C2D5C647B327D5C2D5C647B327D242F29297B0A20202020202020202020202020206C5F666F726D6174203D202764617465273B0A';
wwv_flow_api.g_varchar2_table(103) := '2020202020202020202020207D20656C736520696628646174612E6D61746368282F5E5C647B347D5C2D5C647B327D5C2D5C647B327D28547C20295C647B327D285C3A5C647B327D297B312C327D285C2E5C642B293F242F29297B0A2020202020202020';
wwv_flow_api.g_varchar2_table(104) := '2020202020206C5F666F726D6174203D2027646174652D74696D65273B0A2020202020202020202020207D20656C736520696628646174612E6D61746368282F5E5C647B327D285C3A5C647B327D297B312C327D285C2E5C642B293F242F29297B0A2020';
wwv_flow_api.g_varchar2_table(105) := '2020202020202020202020206C5F666F726D6174203D202774696D65273B0A2020202020202020202020207D0A2020202020202020202020627265616B3B0A202020202020202020202064656661756C743A0A2020202020202020202020202069662864';
wwv_flow_api.g_varchar2_table(106) := '617461297B20202F2F206E756C6C206973204F4B0A2020202020202020202020202020206C6F67536368656D614572726F722827756E6B6E6F776E206461746174797065272C20747970656F6620646174612C2064617461293B0A202020202020202020';
wwv_flow_api.g_varchar2_table(107) := '202020207D0A202020202020202020202020206C5F74797065203D20435F4A534F4E5F535452494E473B20202F2F20636F6E74696E7565206173206120737472696E670A20202020202020207D0A2020202020202020736368656D61203D207B74797065';
wwv_flow_api.g_varchar2_table(108) := '3A206C5F747970657D3B0A20202020202020206966286C5F666F726D6174297B0A20202020202020202020736368656D612E666F726D6174203D206C5F666F726D61743B0A20202020202020207D0A2020202020207D0A202020202020617065782E6465';
wwv_flow_api.g_varchar2_table(109) := '6275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465536368656D61222C20736368656D61293B0A20202020202072657475726E20736368656D613B0A20207D0A20202F2A0A2020202A206275696C6420746865206E616D6520';
wwv_flow_api.g_varchar2_table(110) := '6F6620616E206974656D20696E20746865204A534F4E2D726567696F6E2066726F6D20746861200A20202A2F0A202066756E6374696F6E2067656E4974656D6E616D6528646174616974656D2C206669656C64297B0A2020202020206C6574206C5F6E61';
wwv_flow_api.g_varchar2_table(111) := '6D65203D2027273B0A202020202020696628646174616974656D29207B0A20202020202020206C5F6E616D65203D20646174616974656D3B0A20202020202020206966286669656C64297B0A202020202020202020206C5F6E616D65202B3D20435F4445';
wwv_flow_api.g_varchar2_table(112) := '4C494D49544552202B206669656C643B0A20202020202020207D0A2020202020207D20656C7365207B0A20202020202020206C5F6E616D653D6669656C643B0A2020202020207D0A20202020202072657475726E206C5F6E616D653B0A20207D0A0A2020';
wwv_flow_api.g_varchar2_table(113) := '2F2A200A2020202A206576616C7561746573207468652069662D65787072657373696F6E206F66206120636F6E646974696F6E616C20736368656D61207573696E67207468652076616C756573206F6620746865204A534F4E2D646174610A20202A2F0A';
wwv_flow_api.g_varchar2_table(114) := '202066756E6374696F6E206576616C45787072657373696F6E28736368656D612C2064617461297B0A202020206C6574206C5F726574203D20747275653B0A20202020736368656D61203D20736368656D617C7C7B7D3B0A20202020617065782E646562';
wwv_flow_api.g_varchar2_table(115) := '75672E747261636528223E3E6A736F6E526567696F6E2E6576616C45787072657373696F6E222C20736368656D612C2064617461293B0A2020202020202020202020202F2F20636865636B20776865746865722076616C75657320617265206E6F742065';
wwv_flow_api.g_varchar2_table(116) := '6D7074790A20202020666F7228636F6E7374205B6C5F6669656C642C206C5F636F6D705D206F66204F626A6563742E656E747269657328736368656D6129297B0A20202020636F6E736F6C652E6C6F6728274556414C272C206C5F6669656C642C206C5F';
wwv_flow_api.g_varchar2_table(117) := '636F6D70293B0A20202020737769746368286C5F6669656C64297B0A202020206361736520435F4A534F4E5F52455155495245443A0A202020202020617065782E64656275672E747261636528276576616C45787072657373696F6E3A20272C20736368';
wwv_flow_api.g_varchar2_table(118) := '656D612E72657175697265642C20276E6F7420656D707479272C2064617461293B0A20202020202069662841727261792E69734172726179286C5F636F6D7029297B0A2020202020202020666F7228636F6E7374206C5F6669656C64206F66206C5F636F';
wwv_flow_api.g_varchar2_table(119) := '6D70297B0A2020202020202020202069662828646174615B6C5F6669656C645D3D3D6E756C6C29207C7C2028646174615B6C5F6669656C645D2E6C656E6774683D3D3029297B20202F2F206669656C6420697320656D7074790A20202020202020202020';
wwv_flow_api.g_varchar2_table(120) := '20206C5F726574203D2066616C73653B0A202020202020202020207D0A20202020202020207D0A2020202020207D20656C7365207B0A20202020202020206C6F67536368656D614572726F722827636F6E646974696F6E616C20736368656D61272C206C';
wwv_flow_api.g_varchar2_table(121) := '5F6669656C642C20276D75737420626520616E20617272617927293B200A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F434F4E445F414C4C5F4F463A0A202020202020666F7228636F6E7374206C5F656E7472';
wwv_flow_api.g_varchar2_table(122) := '79206F66206C5F636F6D70297B0A20202020202020206C5F726574203D206C5F726574202626206576616C45787072657373696F6E286C5F656E7472792C2064617461293B0A2020202020207D0A20202020627265616B3B0A202020206361736520435F';
wwv_flow_api.g_varchar2_table(123) := '4A534F4E5F434F4E445F414E595F4F463A0A202020202020617065782E64656275672E747261636528276576616C45787072657373696F6E3A20272C206C5F6669656C642C206C5F636F6D702C20274F5227293B0A2020202020206C6574206C5F726574';
wwv_flow_api.g_varchar2_table(124) := '32203D2066616C73653B0A202020202020666F7228636F6E7374206C5F656E747279206F66206C5F636F6D70297B0A20202020202020206C5F72657432203D206C5F72657432207C7C206576616C45787072657373696F6E286C5F656E7472792C206461';
wwv_flow_api.g_varchar2_table(125) := '7461293B0A2020202020207D0A2020202020206C5F726574203D206C5F726574202626206C5F726574323B0A20202020627265616B3B0A202020206361736520435F4A534F4E5F434F4E445F4E4F543A0A202020202020617065782E64656275672E7472';
wwv_flow_api.g_varchar2_table(126) := '61636528276576616C45787072657373696F6E3A20272C206C5F636F6D702C20274E4F5427293B0A2020202020206C5F726574203D20216576616C45787072657373696F6E286C5F636F6D702C2064617461293B0A20202020627265616B3B0A20202020';
wwv_flow_api.g_varchar2_table(127) := '6361736520435F4A534F4E5F50524F504552544945533A0A2020202020206C5F726574203D206576616C45787072657373696F6E28736368656D612E70726F706572746965732C2064617461293B0A20202020627265616B3B0A2020202064656661756C';
wwv_flow_api.g_varchar2_table(128) := '743A20202F2F20612073696D7072652070726F7065727479207769746368203D3D206F7220494E0A20202020202069662841727261792E69734172726179286C5F636F6D702E656E756D29297B0A2020202020202020617065782E64656275672E747261';
wwv_flow_api.g_varchar2_table(129) := '636528276576616C45787072657373696F6E3A272C206C5F6669656C642C2022696E20222C206C5F636F6D702C20646174615B6C5F6669656C645D290A2020202020202020696628216C5F636F6D702E656E756D2E696E636C7564657328646174615B6C';
wwv_flow_api.g_varchar2_table(130) := '5F6669656C645D29297B0A2020202020202020202020206C5F7265743D66616C73653B0A202020202020202020207D0A20202020202020207D20656C736520696628747970656F66206C5F636F6D7020213D2027756E646566696E656427297B0A202020';
wwv_flow_api.g_varchar2_table(131) := '20202020202020617065782E64656275672E747261636528276576616C45787072657373696F6E3A272C206C5F6669656C642C20223D3D222C206C5F636F6D702C20646174615B6C5F6669656C645D290A202020202020202020206966286C5F636F6D70';
wwv_flow_api.g_varchar2_table(132) := '2E636F6E7374213D646174615B6C5F6669656C645D297B0A2020202020202020202020206C5F7265743D66616C73653B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020207D0A20202020';
wwv_flow_api.g_varchar2_table(133) := '617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6576616C45787072657373696F6E222C20736368656D612C206C5F726574293B0A2020202072657475726E286C5F726574293B0A20207D0A0A20202F2A0A2020202A206669';
wwv_flow_api.g_varchar2_table(134) := '6C6C2061206D6170207769746820616C6C206974656D7479706573207573656420696E20746865204A534F4E2D536368656D610A20202A2F0A202066756E6374696F6E206765744974656D747970657328736368656D612C206974656D7479706573297B';
wwv_flow_api.g_varchar2_table(135) := '0A202020206974656D7479706573203D206974656D7479706573207C7C207B747970653A207B7D2C206974656D747970653A207B7D2C20666F726D61743A207B7D7D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E52656769';
wwv_flow_api.g_varchar2_table(136) := '6F6E2E6765744974656D7479706573222C20736368656D612C206974656D7479706573293B0A0A202020206974656D74797065732E747970655B736368656D612E747970655D3D747275653B0A2020202073776974636828736368656D612E7479706529';
wwv_flow_api.g_varchar2_table(137) := '7B0A202020206361736520435F4A534F4E5F4F424A4543543A0A202020202020666F72286C6574205B6C5F6E616D652C206C5F70726F70657274795D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A';
wwv_flow_api.g_varchar2_table(138) := '20202020202020206974656D7479706573203D206765744974656D7479706573286C5F70726F70657274792C206974656D7479706573293B0A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F41525241593A0A20';
wwv_flow_api.g_varchar2_table(139) := '20202020206974656D7479706573203D206765744974656D747970657328736368656D612E6974656D732C206974656D7479706573293B0A202020202020696628736368656D612E61706578297B0A20202020202020206974656D74797065732E697465';
wwv_flow_api.g_varchar2_table(140) := '6D747970655B736368656D612E617065782E6974656D747970655D203D20747275653B0A2020202020207D0A20202020627265616B3B0A2020202064656661756C743A0A202020202020696628736368656D612E666F726D6174297B0A20202020202020';
wwv_flow_api.g_varchar2_table(141) := '206974656D74797065732E666F726D61745B736368656D612E666F726D61745D203D20747275653B0A2020202020207D0A202020202020696628736368656D612E61706578297B0A20202020202020206974656D74797065732E6974656D747970655B73';
wwv_flow_api.g_varchar2_table(142) := '6368656D612E617065782E6974656D747970655D203D20747275653B0A2020202020207D0A20202020627265616B3B0A202020207D0A200A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6765744974656D7479';
wwv_flow_api.g_varchar2_table(143) := '706573222C206974656D7479706573293B0A2020202072657475726E286974656D7479706573293B0A20207D0A0A20202F2A0A2020202A207365742073686F772F6869646520617474726962757465206279206D6F646520666F7220616C6C206669656C';
wwv_flow_api.g_varchar2_table(144) := '7320696E20736368656D612C20746F2073686F772F6869646520636F6E646974696F6E616C207061727473206F66207468652055490A20202A2F0A202066756E6374696F6E2070726F70616761746553686F7728646174616974656D2C20736368656D61';
wwv_flow_api.g_varchar2_table(145) := '2C206D6F6465297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F70616761746553686F77222C20646174616974656D2C20736368656D612C206D6F6465293B0A20202020696628736368656D612E74';
wwv_flow_api.g_varchar2_table(146) := '7970653D3D435F4A534F4E5F4F424A454354297B0A202020202020666F72286C6574205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A202020202020202069';
wwv_flow_api.g_varchar2_table(147) := '6628704F7074696F6E732E68656164657273297B0A2020202020202020202020202F2F20636F6E736F6C652E6C6F6728277377697463682068656164657273272C20646174616974656D293B0A2020202020202020202020206966286D6F64653D3D7472';
wwv_flow_api.g_varchar2_table(148) := '75652920207B200A20202020202020202020202020202428272327202B20646174616974656D202B20275F68656164696E6727292E73686F7728293B200A2020202020202020202020207D0A2020202020202020202020206966286D6F64653D3D66616C';
wwv_flow_api.g_varchar2_table(149) := '736529207B200A20202020202020202020202020202428272327202B20646174616974656D202B20275F68656164696E6727292E6869646528293B200A2020202020202020202020207D0A20202020202020207D0A202020202020202070726F70616761';
wwv_flow_api.g_varchar2_table(150) := '746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6974656D2C206D6F6465293B0A2020202020207D0A202020207D20656C7365207B0A2020202020206966286D6F64653D3D747275652920207B200A20';
wwv_flow_api.g_varchar2_table(151) := '202020202020202428272327202B20646174616974656D202B20275F434F4E5441494E455227292E73686F7728293B200A20202020202020202428272327202B20646174616974656D292E70726F7028277265717569726564272C736368656D612E6973';
wwv_flow_api.g_varchar2_table(152) := '5265717569726564293B202020202020202020200A2020202020207D0A2020202020206966286D6F64653D3D66616C736529207B200A20202020202020202428272327202B20646174616974656D202B20275F434F4E5441494E455227292E6869646528';
wwv_flow_api.g_varchar2_table(153) := '293B200A20202020202020202428272327202B20646174616974656D292E70726F7028277265717569726564272C66616C7365293B0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E52656769';
wwv_flow_api.g_varchar2_table(154) := '6F6E2E70726F70616761746553686F7722293B0A20207D0A0A20202F2A0A20202A20736574207468652072657175697265642061747472696275746520616E64205549206D61726B657220666F7220612055492D6974656D0A20202A2F0A202066756E63';
wwv_flow_api.g_varchar2_table(155) := '74696F6E2070726F706167617465526571756972656428646174616974656D2C20736368656D612C206D6F6465297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F7061676174655265717569726564';
wwv_flow_api.g_varchar2_table(156) := '222C20646174616974656D2C20736368656D612C206D6F6465293B0A202020206C6574206974656D203D202428272327202B20646174616974656D293B0A202020206974656D2E70726F7028227265717569726564222C6D6F6465293B0A202020206966';
wwv_flow_api.g_varchar2_table(157) := '286D6F64653D3D74727565297B0A2020202020206974656D2E636C6F7365737428222E742D466F726D2D6669656C64436F6E7461696E657222292E616464436C617373282269732D726571756972656422293B0A202020207D20656C7365207B0A202020';
wwv_flow_api.g_varchar2_table(158) := '2020206974656D2E636C6F7365737428222E742D466F726D2D6669656C64436F6E7461696E657222292E72656D6F7665436C617373282269732D726571756972656422293B0A202020207D0A20202020617065782E64656275672E747261636528223C3C';
wwv_flow_api.g_varchar2_table(159) := '6A736F6E526567696F6E2E70726F706167617465526571756972656422293B0A20207D0A0A20202F2A0A2020202A20636F6E7665727420616E206974656D2D76616C7565206F662074686520415045582D554920696E746F206A736F6E2D76616C756520';
wwv_flow_api.g_varchar2_table(160) := '6E656564656420666F722073746F72696E672069740A20202A2F0A202066756E6374696F6E206974656D56616C7565324A736F6E28736368656D612C2076616C7565297B0A2020202069662876616C7565203D3D3D20222229207B2076616C75653D6E75';
wwv_flow_api.g_varchar2_table(161) := '6C6C3B207D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6974656D56616C7565324A736F6E222C20736368656D612C2076616C7565293B202020200A202020206C6574206C5F76616C7565203D2076616C';
wwv_flow_api.g_varchar2_table(162) := '75653B0A2020202069662876616C7565213D6E756C6C297B0A2020202020207472797B0A202020202020202073776974636828736368656D612E74797065297B0A202020202020202020206361736520435F4A534F4E5F535452494E473A0A2020202020';
wwv_flow_api.g_varchar2_table(163) := '2020202020202073776974636828736368656D612E666F726D6174297B0A20202020202020202020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A202020202020202020202020202020206C5F76616C7565203D20617065782E';
wwv_flow_api.g_varchar2_table(164) := '646174652E746F49534F537472696E6728617065782E646174652E70617273652876616C75652C206744617465466F726D617429292E737562737472696E6728302C3130293B0A2020202020202020202020202020627265616B3B0A2020202020202020';
wwv_flow_api.g_varchar2_table(165) := '2020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A20202020202020202020202020202020696628704F7074696F6E732E617065785F76657273696F6E3E3D435F415045585F56455253494F4E5F3231303229207B0A';
wwv_flow_api.g_varchar2_table(166) := '2020202020202020202020202020202020206C5F76616C7565203D20617065782E646174652E746F49534F537472696E6728617065782E646174652E70617273652876616C75652C206744617465466F726D6174202B20272027202B206754696D65466F';
wwv_flow_api.g_varchar2_table(167) := '726D61742E7265706C61636528276D6D272C274D4927292E7265706C616365282748483234272C27484827292E7265706C61636528274848272C2748483234272929293B0A202020202020202020202020202020207D20656C7365207B0A202020202020';
wwv_flow_api.g_varchar2_table(168) := '2020202020202020202020206C5F76616C7565203D20617065782E646174652E746F49534F537472696E6728617065782E646174652E70617273652876616C75652C206744617465466F726D6174202B20272027202B206754696D65466F726D61742929';
wwv_flow_api.g_varchar2_table(169) := '3B0A202020202020202020202020202020207D0A2020202020202020202020202020627265616B3B20200A20202020202020202020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A202020202020202020202020202020206C5F';
wwv_flow_api.g_varchar2_table(170) := '76616C7565203D2076616C75653B0A2020202020202020202020202020627265616B3B0A2020202020202020202020207D0A2020202020202020202020206C5F76616C7565203D206C5F76616C75652E6C656E6774683E303F6C5F76616C75653A6E756C';
wwv_flow_api.g_varchar2_table(171) := '6C3B0A20202020202020202020627265616B3B20200A202020202020202020206361736520435F4A534F4E5F424F4F4C45414E3A0A2020202020202020202020206C5F76616C7565203D202876616C75653D3D225922293B0A2020202020202020202062';
wwv_flow_api.g_varchar2_table(172) := '7265616B3B0A202020202020202020206361736520435F4A534F4E5F494E54454745523A0A202020202020202020206361736520435F4A534F4E5F4E554D4245523A0A20202020202020202020202069662876616C7565213D6E756C6C29207B0A202020';
wwv_flow_api.g_varchar2_table(173) := '2020202020202020202020696628736368656D612E617065782E666F726D6174297B0A202020202020202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E746F4E756D6265722876616C75652C20736368656D612E61706578';
wwv_flow_api.g_varchar2_table(174) := '2E666F726D6174293B0A20202020202020202020202020207D20656C7365207B0A202020202020202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E746F4E756D6265722876616C7565293B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(175) := '20207D0A2020202020202020202020207D0A20202020202020202020627265616B3B20200A20202020202020207D0A2020202020207D2063617463682865297B0A2020202020202020617065782E64656275672E6572726F722827496E76616C69642069';
wwv_flow_api.g_varchar2_table(176) := '6E7075742064617461272C20736368656D612E617065782E666F726D61742C2076616C75652C2065293B0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6974656D56616C75';
wwv_flow_api.g_varchar2_table(177) := '65324A736F6E222C206C5F76616C7565293B0A2020202072657475726E206C5F76616C75653B0A20207D0A0A20202F2A0A2020202A20676574207468652056616C7565206F66206120636F6E7374616E742022636F6E7374223A202E2E2E0A2020202A20';
wwv_flow_api.g_varchar2_table(178) := '7573656420746F20636F6E766572742074686520636F6E7374616E74204E4F572F6E657720696E7420746F2063757272656E7420646174652F6461746574696D650A20202A2F0A202066756E6374696F6E20676574436F6E7374616E7428666F726D6174';
wwv_flow_api.g_varchar2_table(179) := '2C207374722C20697344656661756C74297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E676574436F6E7374616E74222C20666F726D61742C207374722C20697344656661756C74293B0A202020206C6574';
wwv_flow_api.g_varchar2_table(180) := '206C5F76616C7565203D207374723B0A2020202069662828747970656F6628737472293D3D27737472696E67272920262620287374722E746F5570706572436173652829203D3D20274E4F572729297B0A2020202020206C5F6E6F77203D206E65772044';
wwv_flow_api.g_varchar2_table(181) := '61746528292E746F49534F537472696E6728293B0A20202020202073776974636828666F726D6174297B0A2020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A202020202020202020206C5F76616C7565203D206C5F6E6F772E';
wwv_flow_api.g_varchar2_table(182) := '737562737472696E6728302C3130293B202F2F20617065782E646174652E666F726D6174286E6577204461746528292C2027595959592D4D4D2D444427293B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F464F524D41';
wwv_flow_api.g_varchar2_table(183) := '545F4441544554494D453A0A202020202020202020206C5F76616C7565203D206C5F6E6F772E737562737472696E6728302C3139293B202F2F20617065782E646174652E666F726D6174286E6577204461746528292C2027595959592D4D4D2D44445448';
wwv_flow_api.g_varchar2_table(184) := '4832343A4D493A535327293B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A202020202020202020206C5F76616C7565203D206C5F6E6F772E737562737472696E672831312C3136293B';
wwv_flow_api.g_varchar2_table(185) := '202F2F20617065782E646174652E666F726D6174286E6577204461746528292C2027484832343A4D4927293B0A202020202020627265616B3B0A20202020202064656661756C743A0A202020202020202020206C5F76616C7565203D207374723B0A2020';
wwv_flow_api.g_varchar2_table(186) := '20202020627265616B3B0A2020202020207D0A20202020202069662821697344656661756C7420262620666F726D61743D3D435F4A534F4E5F464F524D41545F4441544529207B20200A202020202020202020202F2F20616C7761797320616464202068';
wwv_flow_api.g_varchar2_table(187) := '683A6D6D3A737320746F2064617465207768656E206E6F742064656661756C740A20202020202020206C5F76616C7565202B3D20275430303A30303A3030273B0A2020202020207D0A200A202020207D0A20202020617065782E64656275672E74726163';
wwv_flow_api.g_varchar2_table(188) := '6528223C3C6A736F6E526567696F6E2E676574436F6E7374616E74222C206C5F76616C7565293B0A2020202072657475726E20286C5F76616C7565293B0A20207D0A0A20202F2A0A2020202A20636F6E76657274206A736F6E2D76616C756520696E746F';
wwv_flow_api.g_varchar2_table(189) := '206974656D2D76616C756520726571756972656420696E2074686520415045582D55490A20202A2F0A202066756E6374696F6E206A736F6E56616C7565324974656D28736368656D612C2076616C75652C206E65774974656D297B0A202020206C657420';
wwv_flow_api.g_varchar2_table(190) := '6C5F76616C7565203D2076616C75653B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6A736F6E56616C7565324974656D222C20736368656D61293B0A202020206966286E65774974656D202626202176616C';
wwv_flow_api.g_varchar2_table(191) := '756520262620736368656D612E64656661756C7429207B0A2020202020202F2F205768656E20612064656661756C7420697320636F6E666967757265642C2075736520697420666F72207768656E2061206E6577206974656D20697320696E207573650A';
wwv_flow_api.g_varchar2_table(192) := '20202020202076616C7565203D20676574436F6E7374616E7428736368656D612E666F726D61742C20736368656D612E64656661756C742C2074727565293B0A202020207D0A0A20202020696628736368656D612E77726974654F6E6C79297B2020202F';
wwv_flow_api.g_varchar2_table(193) := '2F20646F206E6F742073686F77207468652063757272656E742076616C7565207768656E20697420697320612077726974654F6E6C792055492D6974656D0A20202020202076616C7565203D206E756C6C3B0A2020202020206C5F76616C7565203D2020';
wwv_flow_api.g_varchar2_table(194) := '6E756C6C3B0A202020207D0A0A2020202069662876616C7565207C7C2076616C75653D3D66616C7365207C7C2076616C75653D3D30207C7C2076616C75653D3D302E30297B0A2020202020206C5F76616C7565203D2076616C75653B0A20202020202074';
wwv_flow_api.g_varchar2_table(195) := '7279207B202020200A202020202020202073776974636828736368656D612E74797065297B0A202020202020202020206361736520435F4A534F4E5F494E54454745523A0A202020202020202020206361736520435F4A534F4E5F4E554D4245523A0A20';
wwv_flow_api.g_varchar2_table(196) := '2020202020202020202020696628215B435F415045585F53544152524154494E472C20435F415045585F50435447524150485D2E696E636C7564657328736368656D612E617065782E6974656D7479706529297B0A202020202020202020202020202069';
wwv_flow_api.g_varchar2_table(197) := '6628736368656D612E617065782E666F726D6174297B0A202020202020202020202020202020206C5F76616C7565203D20617065782E6C6F63616C652E666F726D61744E756D626572286C5F76616C75652C20736368656D612E617065782E666F726D61';
wwv_flow_api.g_varchar2_table(198) := '74293B0A20202020202020202020202020207D20656C7365207B0A20202020202020202020202020202020696628704F7074696F6E732E617065785F76657273696F6E3C435F415045585F56455253494F4E5F32313032297B20202F2F206F6C64657220';
wwv_flow_api.g_varchar2_table(199) := '7468616E2032312E322C207468616E20666F726D61744E756D62657220646F6573206E6F7420657863616E676520736570657261746F72730A2020202020202020202020202020202020206C5F76616C7565203D202827272B6C5F76616C7565292E7265';
wwv_flow_api.g_varchar2_table(200) := '706C61636528272E272C20617065782E6C6F63616C652E676574446563696D616C536570617261746F722829293B0A202020202020202020202020202020207D20656C7365207B0A2020202020202020202020202020202020206C5F76616C7565203D20';
wwv_flow_api.g_varchar2_table(201) := '617065782E6C6F63616C652E666F726D61744E756D626572286C5F76616C7565293B0A202020202020202020202020202020207D0A20202020202020202020202020207D0A2020202020202020202020207D0A20202020202020202020627265616B3B0A';
wwv_flow_api.g_varchar2_table(202) := '202020202020202020206361736520435F4A534F4E5F535452494E473A0A20202020202020202020202073776974636828736368656D612E666F726D6174297B0A20202020202020202020202020206361736520435F4A534F4E5F464F524D41545F4441';
wwv_flow_api.g_varchar2_table(203) := '54453A0A20202020202020202020202020202020696628704F7074696F6E732E617065785F76657273696F6E3C435F415045585F56455253494F4E5F32323031297B0A202020202020202020202020202020202020696628704F7074696F6E732E617065';
wwv_flow_api.g_varchar2_table(204) := '785F76657273696F6E3E3D435F415045585F56455253494F4E5F32313032297B0A20202020202020202020202020202020202020206C5F76616C7565203D20617065782E646174652E666F726D617428617065782E646174652E70617273652876616C75';
wwv_flow_api.g_varchar2_table(205) := '652C27595959592D4D4D2D444427292C206744617465466F726D6174293B0A2020202020202020202020202020202020207D20656C736520696628704F7074696F6E732E617065785F76657273696F6E3C435F415045585F56455253494F4E5F32323031';
wwv_flow_api.g_varchar2_table(206) := '297B0A20202020202020202020202020202020202020206C5F76616C7565203D20242E646174657069636B65722E666F726D617444617465286744617465466F726D61742C206E657720446174652876616C756529293B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(207) := '2020202020207D0A202020202020202020202020202020207D20656C7365207B0A2020202020202020202020202020202020206C5F76616C7565203D2076616C75653B0A202020202020202020202020202020207D0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(208) := '627265616B3B0A20202020202020202020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A20202020202020202020202020202020696628704F7074696F6E732E617065785F76657273696F6E3C435F415045585F5645';
wwv_flow_api.g_varchar2_table(209) := '5253494F4E5F32323031297B202020202020202020202020202020200A202020202020202020202020202020202020696628704F7074696F6E732E617065785F76657273696F6E3C435F415045585F56455253494F4E5F32313032297B0A202020202020';
wwv_flow_api.g_varchar2_table(210) := '202020202020202020202020202076616C7565203D2076616C75652E7265706C616365282754272C20272027293B202F2F20657863657074206461746574696D65207769746820222022206F7220225422206265747765656E206461746520616E642074';
wwv_flow_api.g_varchar2_table(211) := '696D652C20415045583C32322E31202220222064656C696D697465720A202020202020202020202020202020202020202076616C7565203D20242E646174657069636B65722E666F726D617444617465286744617465466F726D61742C206E6577204461';
wwv_flow_api.g_varchar2_table(212) := '74652876616C75652929202B20272027202B2076616C75652E6D61746368282F5B5C645D7B327D3A5B5C645D7B327D283A5B5C645D7B327D293F2F67293B0A2020202020202020202020202020202020207D20656C7365207B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(213) := '2020202020202020202076616C7565203D2076616C75652E7265706C616365282720272C20275427293B202F2F20657863657074206461746574696D65207769746820222022206F7220225422206265747765656E206461746520616E642074696D6520';
wwv_flow_api.g_varchar2_table(214) := '20415045583E203D32322E312E30202254222064656C696D697465720A2020202020202020202020202020202020207D0A2020202020202020202020202020202020206C5F76616C7565203D2076616C75653B0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(215) := '2020696628704F7074696F6E732E617065785F76657273696F6E3E435F415045585F56455253494F4E5F32323031297B0A20202020202020202020202020202020202020206C5F76616C7565203D20617065782E646174652E666F726D6174286E657720';
wwv_flow_api.g_varchar2_table(216) := '446174652876616C7565292C206744617465466F726D6174202B20272027202B206754696D65466F726D6174293B0A2020202020202020202020202020202020207D20656C736520696628704F7074696F6E732E617065785F76657273696F6E3E3D435F';
wwv_flow_api.g_varchar2_table(217) := '415045585F56455253494F4E5F32313032297B0A20202020202020202020202020202020202020206C5F76616C7565203D20617065782E646174652E666F726D6174286E657720446174652876616C7565292C206744617465466F726D6174202B202720';
wwv_flow_api.g_varchar2_table(218) := '27202B206754696D65466F726D61742E7265706C61636528276D6D272C274D4927292E7265706C616365282748483234272C27484827292E7265706C61636528274848272C27484832342729293B0A2020202020202020202020202020202020207D0A20';
wwv_flow_api.g_varchar2_table(219) := '2020202020202020202020202020207D20656C7365207B0A202020202020202020202020202020206C5F76616C7565203D2076616C75653B0A202020202020202020202020202020207D0A2020202020202020202020202020627265616B3B0A20202020';
wwv_flow_api.g_varchar2_table(220) := '202020202020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A202020202020202020202020202020206C5F76616C7565203D2076616C75652E737562737472696E6728302C35293B0A2020202020202020202020202020627265';
wwv_flow_api.g_varchar2_table(221) := '616B3B0A202020202020202020202020202064656661756C743A0A20202020202020202020202020202020696628736368656D612E726561644F6E6C79297B0A20202020202020202020202020202020202073776974636828736368656D612E61706578';
wwv_flow_api.g_varchar2_table(222) := '2E6974656D74797065297B0A2020202020202020202020202020202020206361736520435F415045585F54455854415245413A0A20202020202020202020202020202020202020206C5F76616C75653D206C5F76616C75653F6C5F76616C75652E726570';
wwv_flow_api.g_varchar2_table(223) := '6C616365416C6C28273C272C2027266C743B27292E7265706C616365416C6C28275C6E272C20273C62722F3E27293A27273B0A202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020202020636173652043';
wwv_flow_api.g_varchar2_table(224) := '5F415045585F52494348544558543A0A202020202020202020202020202020202020627265616B3B202020200A2020202020202020202020202020202020207D20200A202020202020202020202020202020207D20200A2020202020202020202020207D';
wwv_flow_api.g_varchar2_table(225) := '0A20202020202020202020627265616B3B20200A202020202020202020206361736520435F4A534F4E5F424F4F4C45414E3A0A2020202020202020202020206C5F76616C7565203D202876616C75653F2259223A224E22293B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(226) := '627265616B3B0A202020202020202020206361736520435F4A534F4E5F494E54454745523A0A202020202020202020206361736520435F4A534F4E5F4E554D4245523A0A20202020202020202020206C5F76616C7565203D20617065782E6C6F63616C65';
wwv_flow_api.g_varchar2_table(227) := '2E666F726D61744E756D6265722876616C75652C20736368656D612E6170657820262620736368656D612E617065782E666F726D6174207C7C6E756C6C293B0A20202020202020202020627265616B3B0A20202020202020207D0A2020202020207D2063';
wwv_flow_api.g_varchar2_table(228) := '617463682865297B0A2020202020202020617065782E64656275672E6572726F722827496E76616C6964204A534F4E2D64617461272C2076616C75652C2065293B0A2020202020207D0A202020207D20200A20202020617065782E64656275672E747261';
wwv_flow_api.g_varchar2_table(229) := '636528223C3C6A736F6E526567696F6E2E6A736F6E56616C7565324974656D222C206C5F76616C7565293B0A2020202072657475726E286C5F76616C7565293B0A20207D0A0A20202F2A0A2020202A2020616464206120726F7720746F20616E20617272';
wwv_flow_api.g_varchar2_table(230) := '61790A20202A2F0A202066756E6374696F6E2064656C4172726179526F7728646174616974656D297B0A202020206C6574206C5F726F776964203D202827272B646174616974656D292E7265706C616365282F44454C455445242F2C2027434F4E544149';
wwv_flow_api.g_varchar2_table(231) := '4E455227290A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E64656C4172726179526F77222C20646174616974656D2C206C5F726F776964293B0A202020202428272327202B206C5F726F776964292E72656D6F';
wwv_flow_api.g_varchar2_table(232) := '766528290A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E64656C4172726179526F7722293B0A20207D0A0A20202F2A0A2020202A2020616464206120726F7720746F20616E2061727261790A20202A2F0A2020';
wwv_flow_api.g_varchar2_table(233) := '66756E6374696F6E206164644172726179526F7728646174616974656D2C20736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6164644172726179526F77222C20646174616974656D2C2073';
wwv_flow_api.g_varchar2_table(234) := '6368656D61293B0A202020206C6574206C5F6974656D73203D202428222322202B2070526567696F6E4964202B2027205B69645E3D2227202B20646174616974656D202B20275F225D2E726F7727293B0A20202020636F6E7374206C5F6964203D206C5F';
wwv_flow_api.g_varchar2_table(235) := '6974656D732E6C656E6774682D310A20202020636F6E7374206C5F6974656D203D206C5F6974656D735B6C5F69645D2E69643B0A202020206C6574206C5F67656E657261746564203D2067656E6572617465466F724F626A65637428736368656D612E69';
wwv_flow_api.g_varchar2_table(236) := '74656D732C207B7D2C20646174616974656D2C2027272B6C5F69642C2066616C73652C20747275652C2074727565293B0A202020206C5F67656E6572617465642E68746D6C203D20273C64697620636C6173733D22726F77206A736F6E726567696F6E22';
wwv_flow_api.g_varchar2_table(237) := '3E27202B206C5F67656E6572617465642E68746D6C202B20273C2F6469763E273B0A202020202428272327202B206C5F6974656D20292E6166746572286C5F67656E6572617465642E68746D6C293B0A202020206174746163684F626A65637428646174';
wwv_flow_api.g_varchar2_table(238) := '616974656D202B20275F27202B206C5F69642C2027272C20736368656D612E6974656D732C2066616C73652C207B7D2C2074727565293B0A20202020617065782E6974656D2E617474616368282428272327202B2070526567696F6E496429293B0A2020';
wwv_flow_api.g_varchar2_table(239) := '2020617065784861636B7328293B0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6164644172726179526F7722293B0A20207D0A20202F2A0A2020202A20617474616368207468652067656E65726174656420';
wwv_flow_api.g_varchar2_table(240) := '6669656C6473206F6620616E20617272617920696E20746865204A534F4E2D736368656D6120746F20415045580A20202A2F0A202066756E6374696F6E20617474616368417272617928646174616974656D2C20707265766974656D2C20736368656D61';
wwv_flow_api.g_varchar2_table(241) := '2C20726561646F6E6C792C20646174612C206E65774974656D297B200A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6174746163684172726179222C20646174616974656D2C20736368656D612C2072656164';
wwv_flow_api.g_varchar2_table(242) := '6F6E6C792C2064617461293B0A202020206C6574206C5F76616C7565203D206A736F6E56616C7565324974656D28736368656D612C20646174612C206E65774974656D293B0A20202020736368656D61203D20736368656D617C7C7B7D3B0A2020202073';
wwv_flow_api.g_varchar2_table(243) := '6368656D612E61706578203D20736368656D612E61706578207C7C207B7D3B0A202020206C6574206974656D203D20736368656D612E6974656D737C7C7B7D3B0A2020202069662841727261792E69734172726179286974656D2E656E756D29297B2020';
wwv_flow_api.g_varchar2_table(244) := '2F2F5B435F4A534F4E5F535452494E472C20435F4A534F4E5F494E54454745522C20435F4A534F4E5F4E554D4245525D2E696E636C75646573286974656D2E7479706529297B0A202020202020696628704F7074696F6E732E617065785F76657273696F';
wwv_flow_api.g_varchar2_table(245) := '6E203E3D435F415045585F56455253494F4E5F323330322026262028736368656D612E617065782E6974656D74797065203D3D20435F415045585F434F4D424F207C7C20286974656D2E61706578202626206974656D2E617065782E6974656D74797065';
wwv_flow_api.g_varchar2_table(246) := '203D3D20435F415045585F434F4D424F2929297B0A2020202020202020617065782E6974656D2E63726561746528646174616974656D2C207B6974656D5F747970653A2027636F6D626F626F78277D293B0A2020202020207D20656C7365207B0A202020';
wwv_flow_api.g_varchar2_table(247) := '2020202020617065782E7769646765742E636865636B626F78416E64526164696F282723272B20646174616974656D2C27636865636B626F7827293B0A2020202020207D3B0A202020207D20656C7365207B0A20202020202064617461203D2064617461';
wwv_flow_api.g_varchar2_table(248) := '207C7C205B5D3B0A20202020202069662841727261792E69734172726179286461746129297B0A20202020202020202428272327202B20646174616974656D202B20275F43524541544527292E6F6E2827636C69636B272C2066756E6374696F6E286576';
wwv_flow_api.g_varchar2_table(249) := '297B206164644172726179526F7728646174616974656D2C20736368656D61293B7D293B0A2020202020202020666F7228636F6E7374206920696E2064617461297B0A202020202020202020206174746163684F626A65637428646174616974656D202B';
wwv_flow_api.g_varchar2_table(250) := '20435F44454C494D49544552202B2069202C20707265766974656D2C206974656D2C20726561646F6E6C792C20646174615B695D2C206E65774974656D29200A20202020202020207D0A2020202020202020202020202F2F2044656C6574652062757474';
wwv_flow_api.g_varchar2_table(251) := '6F6E7320666F7220657665727920726F770A20202020202020202428275B69645E3D2227202B20646174616974656D202B20275F225D20627574746F6E27292E6F6E2827636C69636B272C2066756E6374696F6E286576297B2064656C4172726179526F';
wwv_flow_api.g_varchar2_table(252) := '7728242874686973295B305D2E6964293B207D293B0A2020202020207D0A202020207D0A20202020696628726561646F6E6C7929207B0A202020202020617065782E6974656D28646174616974656D292E64697361626C6528293B200A202020207D0A20';
wwv_flow_api.g_varchar2_table(253) := '202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E617474616368417272617922293B0A20207D0A0A20202F2A0A2020202A20736574207468652056616C756573206F6620616E20617272617920696E20746865204A53';
wwv_flow_api.g_varchar2_table(254) := '4F4E2D736368656D610A20202A2F0A202066756E6374696F6E20736574417272617956616C75657328646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C2064617461297B200A20202020617065782E64656275';
wwv_flow_api.g_varchar2_table(255) := '672E747261636528223E3E6A736F6E526567696F6E2E736574417272617956616C756573222C20646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C2064617461293B0A202020206C6574206C5F76616C756520';
wwv_flow_api.g_varchar2_table(256) := '3D206A736F6E56616C7565324974656D28736368656D612C20646174612C206E65774974656D293B0A20202020736368656D612E61706578203D20736368656D612E61706578207C7C207B7D3B0A202020206C6574206974656D203D20736368656D612E';
wwv_flow_api.g_varchar2_table(257) := '6974656D737C7C7B7D3B0A2020202064617461203D20646174617C7C5B5D3B0A2020202069662841727261792E69734172726179286461746129297B0A2020202020206966282041727261792E69734172726179286974656D2E656E756D29297B20202F';
wwv_flow_api.g_varchar2_table(258) := '2F207768656E20746865726520697320616E20656E756D2C207468697320617272617920666F722061206D756C746973656C656374696F6E0A20202020202020206966285B435F4A534F4E5F535452494E472C20435F4A534F4E5F494E54454745522C20';
wwv_flow_api.g_varchar2_table(259) := '435F4A534F4E5F4E554D4245525D2E696E636C75646573286974656D2E7479706529297B0A20202020202020202020617065782E64656275672E74726163652827736574417272617956616C7565733A272C206C5F76616C7565293B0A20202020202020';
wwv_flow_api.g_varchar2_table(260) := '202020617065782E6974656D28646174616974656D292E73657456616C7565286C5F76616C75657C7C5B5D293B0A20202020202020202020696628726561646F6E6C7929207B0A202020202020202020202020617065782E6974656D2864617461697465';
wwv_flow_api.g_varchar2_table(261) := '6D292E64697361626C6528293B0A202020202020202020207D200A20202020202020207D0A2020202020207D20656C7365207B0A2020202020202020666F7228636F6E7374206920696E2064617461297B0A202020202020202020207365744F626A6563';
wwv_flow_api.g_varchar2_table(262) := '7456616C75657328646174616974656D202B20435F44454C494D49544552202B20692C20707265766974656D2C206974656D2C20726561646F6E6C792C20646174615B695D293B0A20202020202020207D0A2020202020207D0A202020207D20656C7365';
wwv_flow_api.g_varchar2_table(263) := '207B0A2020202020206C6F67536368656D614572726F72282764617461206D75737420626520616E206172726179272C2064617461293B0A202020207D0A0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7365';
wwv_flow_api.g_varchar2_table(264) := '74417272617956616C75657322293B0A20207D0A0A20202F2A0A2020202A20736574207468652056616C756573206F66206120616C6C206669656C647320696E20746865204A534F4E2D736368656D610A20202A2F0A202066756E6374696F6E20736574';
wwv_flow_api.g_varchar2_table(265) := '4F626A65637456616C75657328646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C2064617461297B200A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E7365744F626A';
wwv_flow_api.g_varchar2_table(266) := '65637456616C756573222C20646174616974656D2C20707265766974656D2C20736368656D612C20726561646F6E6C792C2064617461293B0A20202020736368656D612E61706578203D20736368656D612E61706578207C7C207B7D3B0A202020206C65';
wwv_flow_api.g_varchar2_table(267) := '74206C5F76616C7565203D206A736F6E56616C7565324974656D28736368656D612C20646174612C206E65774974656D293B0A2020202073776974636828736368656D612E74797065297B0A2020202063617365206E756C6C3A0A202020206361736520';
wwv_flow_api.g_varchar2_table(268) := '756E646566696E65643A0A2020202020206C6F67536368656D614572726F7228276D697373696E6720227479706522206174272C20646174616974656D293B0A20202020627265616B3B0A202020206361736520435F4A534F4E5F4F424A4543543A0A20';
wwv_flow_api.g_varchar2_table(269) := '2020202020696628747970656F6620736368656D612E70726F70657274696573203D3D20276F626A65637427297B0A202020202020202064617461203D2064617461207C7C7B7D3B0A2020202020202020666F72286C6574205B6C5F6E616D652C206C5F';
wwv_flow_api.g_varchar2_table(270) := '736368656D615D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A20202020202020202020696628212827272B6C5F6E616D65292E7374617274735769746828275F2729297B2020202F2F2069676E6F';
wwv_flow_api.g_varchar2_table(271) := '72652070726F7065727469657320686176696E67206E616D6573207374617274696E67207769746820225F220A2020202020202020202020207365744F626A65637456616C7565732867656E4974656D6E616D6528646174616974656D2C206C5F6E616D';
wwv_flow_api.g_varchar2_table(272) := '65292C20646174616974656D2C206C5F736368656D612C20736368656D612E726561644F6E6C792C20646174615B6C5F6E616D655D293B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020';
wwv_flow_api.g_varchar2_table(273) := '206361736520435F4A534F4E5F41525241593A2020200A202020202020736574417272617956616C75657328646174616974656D2C20646174616974656D2C20736368656D612C20736368656D612E726561644F6E6C792C2064617461293B0A20202020';
wwv_flow_api.g_varchar2_table(274) := '627265616B3B0A20202020636173652027636F6E7374273A20202F2F206120636F6E73742076616C75650A202020206361736520276E756C6C273A20202F2F20656D707479206F626A65637420646F206E6F7468696E670A20202020627265616B3B0A20';
wwv_flow_api.g_varchar2_table(275) := '2020206361736520435F4A534F4E5F424F4F4C45414E3A0A202020202020617065782E6974656D28646174616974656D292E73657456616C7565286C5F76616C7565293B0A202020202020696628736368656D612E726561644F6E6C7929207B0A202020';
wwv_flow_api.g_varchar2_table(276) := '2020202020617065782E6974656D28646174616974656D292E64697361626C6528293B200A2020202020207D0A20202020627265616B3B0A2020202064656661756C743A0A202020202020696628736368656D612E726561644F6E6C79297B0A20202020';
wwv_flow_api.g_varchar2_table(277) := '202020206966285B435F415045585F53544152524154494E475D2E696E636C7564657328736368656D612E617065782E6974656D747970652929207B0A20202020202020202020617065782E6974656D28646174616974656D292E64697361626C652829';
wwv_flow_api.g_varchar2_table(278) := '3B0A20202020202020207D0A0A202020202020202069662821617065782E7769646765742E7063744772617068202626205B435F415045585F50435447524150485D2E696E636C7564657328736368656D612E617065782E6974656D7479706529297B0A';
wwv_flow_api.g_varchar2_table(279) := '202020202020202020202428272327202B20646174616974656D292E68746D6C28617065782E6974656D28646174616974656D292E646973706C617956616C7565466F72286C5F76616C756529293B0A20202020202020207D0A20202020202020200A20';
wwv_flow_api.g_varchar2_table(280) := '202020202020206966285B435F415045585F52494348544558545D2E696E636C7564657328736368656D612E617065782E6974656D7479706529297B0A202020202020202020206C5F76616C7565203D2077696E646F772E6D61726B65642E7061727365';
wwv_flow_api.g_varchar2_table(281) := '28206C5F76616C75652C207B0A20202020202020202020202020202020202020202020202020202020202067666D3A20747275652C0A202020202020202020202020202020202020202020202020202020202020627265616B733A20747275652C0A2020';
wwv_flow_api.g_varchar2_table(282) := '202020202020202020202020202020202020202020202020202020207461626C65733A20747275652C0A2020202020202020202020202020202020202020202020202020202020206D616E676C653A2066616C73652C0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(283) := '20202020202020202020202020202020207868746D6C3A2066616C73652C0A2020202020202020202020202020202020202020202020202020202020206865616465724964733A2066616C73650A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(284) := '2020202020207D293B0A202020202020202020202428272327202B20646174616974656D202B20275F444953504C415927292E68746D6C286C5F76616C7565293B0A20202020202020207D0A2020202020207D0A20202020202069662821736368656D61';
wwv_flow_api.g_varchar2_table(285) := '2E726561644F6E6C79207C7C205B435F415045585F5152434F44455D2E696E636C7564657328736368656D612E617065782E6974656D7479706529297B0A2020202020202020696628704F7074696F6E732E617065785F76657273696F6E3E3D435F4150';
wwv_flow_api.g_varchar2_table(286) := '45585F56455253494F4E5F32323032207C7C2028200A20202020202020202020202020215B435F4A534F4E5F464F524D41545F4441544554494D452C20435F4A534F4E5F464F524D41545F444154455D2E696E636C7564657328736368656D612E666F72';
wwv_flow_api.g_varchar2_table(287) := '6D6174292026260A20202020202020202020202020215B435F415045585F53544152524154494E475D2E696E636C7564657328736368656D612E617065782E6974656D74797065290A2020202020202020202020290A2020202020202020297B20202F2F';
wwv_flow_api.g_varchar2_table(288) := '206861636B20666F72206F6C64206A65742D646174612D7069636B65722C2073746172726174696E670A20202020202020202020617065782E6974656D28646174616974656D292E73657456616C7565286C5F76616C7565293B0A20202020202020207D';
wwv_flow_api.g_varchar2_table(289) := '0A2020202020207D0A20202020627265616B3B0A202020207D0A0A20202020696628736368656D612E6966297B0A202020202020696628736368656D612E7468656E29207B20202F2F20636F6E646974696F6E616C20736368656D61207468656E0A2020';
wwv_flow_api.g_varchar2_table(290) := '2020202020206C65742070726F70657274696573203D20736368656D612E7468656E2E70726F706572746965737C7C7B7D3B0A20202020202020207365744F626A65637456616C75657328646174616974656D2C20646174616974656D2C207B74797065';
wwv_flow_api.g_varchar2_table(291) := '3A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C20736368656D612E726561644F6E6C792C2064617461293B0A2020202020207D0A0A202020202020696628736368656D612E656C736529207B202F';
wwv_flow_api.g_varchar2_table(292) := '2F20636F6E646974696F6E616C20736368656D6120656C73650A20202020202020206C65742070726F70657274696573203D20736368656D612E656C73652E70726F706572746965737C7C7B7D3B0A20202020202020207365744F626A65637456616C75';
wwv_flow_api.g_varchar2_table(293) := '657328646174616974656D2C20646174616974656D2C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C20736368656D612E726561644F6E6C792C2064617461293B0A202020202020';
wwv_flow_api.g_varchar2_table(294) := '7D0A202020207D0A0A0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7365744F626A65637456616C75657322293B0A20207D0A0A20202F2A0A2020202A20204275696C642072656375736976656C792061206C';
wwv_flow_api.g_varchar2_table(295) := '697374206F6620616C6C206974656D73207573656420696E2074686520736368656D612E69662070726F70657274790A20202A2F0A202066756E6374696F6E20676574436F6E646974696F6E616C4974656D7328636F6E646974696F6E297B0A20202020';
wwv_flow_api.g_varchar2_table(296) := '617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E676574436F6E646974696F6E616C4974656D73222C20636F6E646974696F6E293B0A202020206C6574206C5F6974656D73203D205B5D3B0A20202020666F7228636F6E7374';
wwv_flow_api.g_varchar2_table(297) := '205B6C5F6669656C642C206C5F636F6D705D206F66204F626A6563742E656E747269657328636F6E646974696F6E29297B0A202020202020737769746368286C5F6669656C64297B0A2020202020206361736520435F4A534F4E5F52455155495245443A';
wwv_flow_api.g_varchar2_table(298) := '0A202020202020202069662841727261792E69734172726179286C5F636F6D7029297B0A202020202020202020206C5F6974656D73203D206C5F636F6D703B0A20202020202020207D20656C7365207B0A20202020202020202020206C6F67536368656D';
wwv_flow_api.g_varchar2_table(299) := '614572726F722827636F6E646974696F6E616C20736368656D61272C206C5F6669656C642C20276D75737420626520616E20617272617927293B200A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E';
wwv_flow_api.g_varchar2_table(300) := '5F434F4E445F414C4C5F4F463A0A2020202020206361736520435F4A534F4E5F434F4E445F414E595F4F463A0A2020202020202020666F7228636F6E7374206C5F736368656D61206F66206C5F636F6D70297B0A202020202020202020206C5F6974656D';
wwv_flow_api.g_varchar2_table(301) := '73203D206C5F6974656D732E636F6E63617428676574436F6E646974696F6E616C4974656D73286C5F736368656D6129293B0A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F434F4E445F4E4F54';
wwv_flow_api.g_varchar2_table(302) := '3A0A2020202020206361736520435F4A534F4E5F50524F504552544945533A0A20202020202020206C5F6974656D73203D206C5F6974656D732E636F6E63617428676574436F6E646974696F6E616C4974656D7328636F6E646974696F6E5B6C5F666965';
wwv_flow_api.g_varchar2_table(303) := '6C645D29293B0A202020202020627265616B3B0A20202020202064656661756C743A20202F2F20612073696D7072652070726F7065727479207769746368203D3D206F7220494E0A20202020202020206C5F6974656D732E70757368286C5F6669656C64';
wwv_flow_api.g_varchar2_table(304) := '293B0A202020202020627265616B3B0A2020202020207D0A202020207D0A0A202020206C5F6974656D73203D2041727261792E66726F6D286E657720536574286C5F6974656D7329293B202F2F2072656D6F7665206475706C6963617465730A20202020';
wwv_flow_api.g_varchar2_table(305) := '617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E676574436F6E646974696F6E616C4974656D73222C206C5F6974656D73293B0A2020202072657475726E286C5F6974656D73293B0A20207D0A20202F2A0A2020202A206174';
wwv_flow_api.g_varchar2_table(306) := '74616368207468652067656E657261746564206669656C6473206F6620746865204A534F4E2D7363686D6120746F20415045580A20202A2F0A202066756E6374696F6E206174746163684F626A65637428646174616974656D2C20707265766974656D2C';
wwv_flow_api.g_varchar2_table(307) := '20736368656D612C20726561646F6E6C792C20646174612C206E65774974656D297B200A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6174746163684F626A656374222C20646174616974656D2C2070726576';
wwv_flow_api.g_varchar2_table(308) := '6974656D2C20736368656D612C20726561646F6E6C792C20646174612C206E65774974656D293B0A20202020736368656D61203D20736368656D617C7C7B7D3B0A20202020736368656D612E61706578203D20736368656D612E61706578207C7C207B7D';
wwv_flow_api.g_varchar2_table(309) := '3B0A0A2020202073776974636828736368656D612E74797065297B0A2020202063617365206E756C6C3A0A202020206361736520756E646566696E65643A0A2020202020206C6F67536368656D614572726F7228276D697373696E672022747970652220';
wwv_flow_api.g_varchar2_table(310) := '617420272C20646174616974656D293B0A20202020627265616B3B0A202020206361736520435F4A534F4E5F4F424A4543543A0A202020202020696628747970656F6620736368656D612E70726F70657274696573203D3D20276F626A65637427297B0A';
wwv_flow_api.g_varchar2_table(311) := '202020202020202064617461203D2064617461207C7C7B7D3B0A2020202020202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A';
wwv_flow_api.g_varchar2_table(312) := '20202020202020202020696628212827272B6C5F6E616D65292E7374617274735769746828275F2729297B2020202F2F2069676E6F72652070726F7065727469657320686176696E67206E616D6573207374617274696E67207769746820225F220A2020';
wwv_flow_api.g_varchar2_table(313) := '202020202020202020206174746163684F626A6563742867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C20646174616974656D2C206C5F736368656D612C20736368656D612E726561644F6E6C792C20646174615B6C5F6E61';
wwv_flow_api.g_varchar2_table(314) := '6D655D2C206E65774974656D293B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F41525241593A2020200A202020202020617474616368417272617928';
wwv_flow_api.g_varchar2_table(315) := '646174616974656D2C20646174616974656D2C20736368656D612C20736368656D612E726561644F6E6C792C20646174612C206E65774974656D293B0A20202020627265616B3B0A202020206361736520276E756C6C273A20202F2F20656D707479206F';
wwv_flow_api.g_varchar2_table(316) := '626A65637420646F206E6F7468696E670A20202020627265616B3B0A202020206361736520435F4A534F4E5F535452494E473A0A20202020202069662821736368656D612E726561644F6E6C79297B0A2020202020202020737769746368202873636865';
wwv_flow_api.g_varchar2_table(317) := '6D612E666F726D6174297B0A20202020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A20202020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A20202020202020202020696628704F707469';
wwv_flow_api.g_varchar2_table(318) := '6F6E732E617065785F76657273696F6E203C435F415045585F56455253494F4E5F32323031297B0A202020202020202020202020617065782E7769646765742E646174657069636B6572282723272B20646174616974656D2C207B200A20202020202020';
wwv_flow_api.g_varchar2_table(319) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202022627574746F6E496D6167654F6E6C79223A66616C73652C0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(320) := '20202020202020202020202020202020202022627574746F6E54657874223A225C75303033437370616E20636C6173733D5C7530303232612D49636F6E2069636F6E2D63616C656E6461725C75303032325C75303033455C75303033435C753030324673';
wwv_flow_api.g_varchar2_table(321) := '70616E5C75303033455C75303033437370616E20636C6173733D5C7530303232752D56697375616C6C7948696464656E5C75303032325C7530303345506F7075702043616C656E6461723A20437265617465642041745C75303033437370616E5C753030';
wwv_flow_api.g_varchar2_table(322) := '3345222C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202273686F7754696D65223A2020202020202020736368656D612E666F726D61743D3D20435F4A534F4E5F464F52';
wwv_flow_api.g_varchar2_table(323) := '4D41545F4441544554494D452C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202274696D65323468223A202020202020202020747275652C0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(324) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202264656661756C7444617465223A20202020206E657720446174652864617461292C0A2020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(325) := '2020202020202020202020202020202020202020202020202273686F774F6E223A22627574746F6E222C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202273686F774F74';
wwv_flow_api.g_varchar2_table(326) := '6865724D6F6E746873223A20747275652C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020226368616E67654D6F6E7468223A2020202020747275652C0A20202020202020';
wwv_flow_api.g_varchar2_table(327) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020226368616E676559656172223A202020202020747275652C0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(328) := '202020202020202020202020202020202020226D696E44617465223A20736368656D612E6D696E696D756D3F6E6577204461746528736368656D612E6D696E696D756D293A6E756C6C2C0A20202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(329) := '20202020202020202020202020202020202020202020202020226D617844617465223A20736368656D612E6D6178696D756D3F6E6577204461746528736368656D612E6D6178696D756D293A6E756C6C0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(330) := '20202020202020202020202020202020202020202020202020202020207D2C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020736368656D612E617065782E666F726D61742C0A';
wwv_flow_api.g_varchar2_table(331) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020617065782E6C6F63616C652E6765744C616E67756167652829293B0A202020202020202020202020617065782E6A517565727928';
wwv_flow_api.g_varchar2_table(332) := '2723272B20646174616974656D2C292E6E6578742827627574746F6E27292E616464436C6173732827612D427574746F6E20612D427574746F6E2D2D63616C656E64617227293B0A202020202020202020207D0A2020202020202020627265616B3B2020';
wwv_flow_api.g_varchar2_table(333) := '0A20202020202020207D0A0A20202020202020207377697463682028736368656D612E617065782E6974656D74797065297B0A20202020202020206361736520435F415045585F524144494F3A0A20202020202020202020617065782E7769646765742E';
wwv_flow_api.g_varchar2_table(334) := '636865636B626F78416E64526164696F282723272B20646174616974656D2C27726164696F27293B0A2020202020202020627265616B3B0A20202020202020206361736520435F415045585F494D4147453A20202F2F20646973706C6179206F6E6C790A';
wwv_flow_api.g_varchar2_table(335) := '20202020202020206361736520435F415045585F5152434F44453A202F2F20646973706C6179206F6E6C790A2020202020202020627265616B3B0A202020202020202064656661756C743A0A20202020202020202020617065782E6974656D2E63726561';
wwv_flow_api.g_varchar2_table(336) := '746528646174616974656D2C207B7D293B0A2020202020202020627265616B3B0A20202020202020207D0A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F424F4F4C45414E3A0A20202020202073776974636828';
wwv_flow_api.g_varchar2_table(337) := '736368656D612E617065782E6974656D74797065297B0A2020202020206361736520435F415045585F5357495443483A0A2020202020202020617065782E7769646765742E7965734E6F28646174616974656D2C20275357495443485F434227293B200A';
wwv_flow_api.g_varchar2_table(338) := '202020202020627265616B3B0A2020202020206361736520435F415045585F524144494F3A0A2020202020202020617065782E7769646765742E636865636B626F78416E64526164696F282723272B20646174616974656D2C27726164696F27293B0A20';
wwv_flow_api.g_varchar2_table(339) := '2020202020627265616B3B0A2020202020206361736520435F415045585F53454C4543543A0A2020202020202020617065782E6974656D2E63726561746528646174616974656D2C207B7D293B200A202020202020627265616B3B0A2020202020206465';
wwv_flow_api.g_varchar2_table(340) := '6661756C743A0A2020202020202020617065782E6974656D2E63726561746528646174616974656D2C207B7D293B200A202020202020627265616B3B0A2020202020207D0A0A202020202020696628736368656D612E726561644F6E6C7929207B0A2020';
wwv_flow_api.g_varchar2_table(341) := '202020202020617065782E6974656D28646174616974656D292E64697361626C6528293B200A2020202020207D0A20202020627265616B3B0A202020206361736520435F4A534F4E5F4E554D4245523A0A202020206361736520435F4A534F4E5F494E54';
wwv_flow_api.g_varchar2_table(342) := '454745523A0A20202020202073776974636828736368656D612E617065782E6974656D74797065297B0A2020202020206361736520435F415045585F50435447524150483A0A2020202020202020696628617065782E7769646765742E70637447726170';
wwv_flow_api.g_varchar2_table(343) := '6829207B0A20202020202020202020617065782E7769646765742E706374477261706828646174616974656D293B0A20202020202020207D20656C7365207B0A2F2F20202020202020202020617065782E6974656D2E6372656174652864617461697465';
wwv_flow_api.g_varchar2_table(344) := '6D2C207B7D293B0A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F415045585F53544152524154494E473A0A2020202020202020617065782E7769646765742E73746172526174696E6728646174616974656D';
wwv_flow_api.g_varchar2_table(345) := '2C207B73686F77436C656172427574746F6E3A2066616C73652C206E756D53746172733A20736368656D612E6D6178696D756D7D293B200A202020202020627265616B3B0A20202020202064656661756C743A202020202020200A202020202020202069';
wwv_flow_api.g_varchar2_table(346) := '662821736368656D612E726561644F6E6C79297B0A20202020202020202020617065782E6974656D2E63726561746528646174616974656D2C207B7D293B0A20202020202020207D0A202020202020627265616B3B0A2020202020207D0A202020206272';
wwv_flow_api.g_varchar2_table(347) := '65616B3B0A2020202064656661756C743A0A20202020202069662821435F4A534F4E5F434F4E535420696E20736368656D6129207B20202F2F206120636F6E73742076616C756520646F6573206E2774206E656564206120747970652C200A2020202020';
wwv_flow_api.g_varchar2_table(348) := '202020617065782E64656275672E6572726F7228276974656D207769746820756E646566696E65642074797065272C20646174616974656D2C20736368656D612E74797065293B0A2020202020207D0A20202020627265616B3B0A202020207D0A0A2020';
wwv_flow_api.g_varchar2_table(349) := '2020696628736368656D612E6966297B0A2020202020206C6574206C5F6576616C203D206576616C45787072657373696F6E28736368656D612E69662C2064617461293B0A202020202020696628736368656D612E7468656E29207B20202F2F20636F6E';
wwv_flow_api.g_varchar2_table(350) := '646974696F6E616C20736368656D61207468656E0A20202020202020206C65742070726F70657274696573203D20736368656D612E7468656E2E70726F706572746965737C7C7B7D3B0A20202020202020206174746163684F626A656374286461746169';
wwv_flow_api.g_varchar2_table(351) := '74656D2C20646174616974656D2C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C20736368656D612E726561644F6E6C792C20646174612C206E65774974656D293B0A2020202020';
wwv_flow_api.g_varchar2_table(352) := '202020666F7228636F6E7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E74726965732870726F7065727469657329297B0A2020202020202020202070726F70616761746553686F772867656E4974656D6E616D65286461';
wwv_flow_api.g_varchar2_table(353) := '74616974656D2C206C5F6E616D65292C206C5F6974656D2C206C5F6576616C3D3D3D74727565293B0A20202020202020207D0A2020202020207D0A0A202020202020696628736368656D612E656C736529207B202F2F20636F6E646974696F6E616C2073';
wwv_flow_api.g_varchar2_table(354) := '6368656D6120656C73650A20202020202020206C65742070726F70657274696573203D20736368656D612E656C73652E70726F706572746965737C7C7B7D3B0A20202020202020206174746163684F626A65637428646174616974656D2C206461746169';
wwv_flow_api.g_varchar2_table(355) := '74656D2C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C20736368656D612E726561644F6E6C792C20646174612C206E65774974656D293B0A2020202020202020666F7228636F6E';
wwv_flow_api.g_varchar2_table(356) := '7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E74726965732870726F7065727469657329297B0A2020202020202020202070726F70616761746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F';
wwv_flow_api.g_varchar2_table(357) := '6E616D65292C206C5F6974656D2C206C5F6576616C3D3D3D66616C7365293B0A20202020202020207D0A2020202020207D0A202020207D0A0A20202020696628736368656D612E6966297B20202F2F20636F6E646974696F6E616C20736368656D612C20';
wwv_flow_api.g_varchar2_table(358) := '616464206576656E74206F6E206974656D730A2020202020206C6574206C5F646570656E644F6E203D20676574436F6E646974696F6E616C4974656D7328736368656D612E6966293B0A2020202020202F2F204F626A6563742E6B65797328736368656D';
wwv_flow_api.g_varchar2_table(359) := '612E69662E70726F70657274696573293B0A202020202020666F72286C6574206C5F6E616D65206F66206C5F646570656E644F6E297B0A2020202020202020636F6E736F6C652E6C6F6728276F6E4368616E6765272C20646174616974656D2C206C5F6E';
wwv_flow_api.g_varchar2_table(360) := '616D65293B0A20202020202020202428222322202B2067656E4974656D6E616D6528646174616974656D2C206C5F6E616D6529292E6F6E28276368616E6765272C2066756E6374696F6E28297B0A20202020202020202020636F6E736F6C652E6C6F6728';
wwv_flow_api.g_varchar2_table(361) := '27636C69636B6564206F6E272C20646174616974656D2C206C5F6E616D65293B0A20202020202020202020696628736368656D612E6966297B20202F2F20636C69636B206F6E206120636F6E646974696F6E616C206974656D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(362) := '20206C6574206C5F6A736F6E203D206765744F626A65637456616C75657328646174616974656D2C2027272C20736368656D612C207B7D293B0A202020202020202020202020636F6E736F6C652E6C6F6728274556414C272C206C5F6A736F6E293B0A20';
wwv_flow_api.g_varchar2_table(363) := '20202020202020202020206C6574206C5F6576616C203D206576616C45787072657373696F6E28736368656D612E69662C206C5F6A736F6E293B0A202020202020202020202020696628736368656D612E7468656E297B200A2020202020202020202020';
wwv_flow_api.g_varchar2_table(364) := '2020206C65742070726F70657274696573203D20736368656D612E7468656E2E70726F706572746965737C7C7B7D3B0A2020202020202020202020202020666F7228636F6E7374205B6C5F6E616D652C6C5F6974656D5D206F66204F626A6563742E656E';
wwv_flow_api.g_varchar2_table(365) := '74726965732870726F7065727469657329297B0A2020202020202020202020202020202070726F70616761746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6974656D2C206C5F6576616C3D3D747275';
wwv_flow_api.g_varchar2_table(366) := '65293B0A20202020202020202020202020207D0A2020202020202020202020207D0A0A202020202020202020202020696628736368656D612E656C7365297B200A20202020202020202020202020206C65742070726F70657274696573203D2073636865';
wwv_flow_api.g_varchar2_table(367) := '6D612E656C73652E70726F706572746965737C7C7B7D3B0A2020202020202020202020202020666F7228636F6E7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E74726965732870726F7065727469657329297B0A202020';
wwv_flow_api.g_varchar2_table(368) := '2020202020202020202020202070726F70616761746553686F772867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6974656D2C206C5F6576616C3D3D66616C7365293B0A20202020202020202020202020207D0A2020';
wwv_flow_api.g_varchar2_table(369) := '202020202020202020207D2020202020202020202020202020202020202020202020202020202020200A202020202020202020207D0A20202020202020207D293B0A2020202020207D0A202020207D0A2020202069662841727261792E69734172726179';
wwv_flow_api.g_varchar2_table(370) := '28736368656D612E646570656E64656E7452657175697265642929207B200A2020202020202020202020202F2F20746865206974656D2068617320646570656E64656E74206974656D732C20736F206164642063616C6C6261636B206F6E206461746120';
wwv_flow_api.g_varchar2_table(371) := '6368616E67650A2020202020202020666F7228636F6E7374206974656D206F6620736368656D612E646570656E64656E74526571756972656429207B0A202020202020202020206C6574206C5F6974656D203D2067656E4974656D6E616D652870726576';
wwv_flow_api.g_varchar2_table(372) := '6974656D2C206974656D293B0A202020202020202020206C6574206C5F76616C7565203D20646174613B0A2020202020202020202070726F7061676174655265717569726564286C5F6974656D2C20736368656D615B6974656D5D2C206C5F76616C7565';
wwv_flow_api.g_varchar2_table(373) := '202626206C5F76616C75652E6C656E6774683E30293B0A20202020202020207D0A20202020202020202428222322202B20646174616974656D292E6F6E28276368616E6765272C2066756E6374696F6E28297B0A20202020202020202020666F7228636F';
wwv_flow_api.g_varchar2_table(374) := '6E7374206974656D206F6620736368656D612E646570656E64656E74526571756972656429207B0A2020202020202020202020206C6574206C5F6974656D203D2067656E4974656D6E616D6528707265766974656D2C206974656D290A20202020202020';
wwv_flow_api.g_varchar2_table(375) := '20202020206C6574206C5F76616C7565203D20242874686973292E76616C28293B0A202020202020202020202020636F6E736F6C652E7761726E2827646570656E6473272C20736368656D615B6974656D5D2C206C5F76616C7565293B0A202020202020';
wwv_flow_api.g_varchar2_table(376) := '20202020202070726F7061676174655265717569726564286C5F6974656D2C20736368656D615B6974656D5D2C206C5F76616C7565202626206C5F76616C75652E6C656E6774683E30293B0A202020202020202020207D3B0A20202020202020207D293B';
wwv_flow_api.g_varchar2_table(377) := '0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6174746163684F626A65637422293B0A20207D0A0A20202F2A0A2020202A207265747269657665206461746120666F722055492D6669656C6473';
wwv_flow_api.g_varchar2_table(378) := '206F66204A534F4E2D736368656D6120616E64206275696C64204A534F4E2C206F6C644A736F6E20697320726571756972656420746F20737570706F7274206669656C647769736520726561646F6E6C790A20202A2F0A202066756E6374696F6E206765';
wwv_flow_api.g_varchar2_table(379) := '744F626A65637456616C75657328646174616974656D2C206E616D652C20736368656D612C206F6C644A736F6E297B200A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6765744F626A65637456616C75657322';
wwv_flow_api.g_varchar2_table(380) := '2C20646174616974656D2C206E616D652C20736368656D612C206F6C644A736F6E293B0A202020206C6574206C5F6A736F6E203D207B7D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A2020202069662821';
wwv_flow_api.g_varchar2_table(381) := '5B435F4A534F4E5F41525241592C20435F4A534F4E5F4F424A4543545D2E696E636C7564657328736368656D612E747970652920262620736368656D612E726561644F6E6C79297B202F2F207768656E2073696D706C652061747472696275746520616D';
wwv_flow_api.g_varchar2_table(382) := '6E6420726561646F6E6C79206E6F206461746120636F756C6420626520726561642C206B65657020746865206F6C6420646174610A2020202020206C5F6A736F6E203D206F6C644A736F6E3B0A202020207D20656C7365207B0A2020202020206C5F6A73';
wwv_flow_api.g_varchar2_table(383) := '6F6E203D20736368656D612E6164646974696F6E616C50726F706572746965733F6F6C644A736F6E3A7B7D3B20202F2F207768656E20746865726520617265206164646974696F6E616C50726F706572746965732C206B6565702074686572652076616C';
wwv_flow_api.g_varchar2_table(384) := '7565730A20202020202073776974636828736368656D612E74797065297B0A2020202020206361736520435F4A534F4E5F4F424A4543543A0A202020202020202069662821286F6C644A736F6E20696E7374616E63656F66204F626A6563742929207B0A';
wwv_flow_api.g_varchar2_table(385) := '20202020202020202020617065782E64656275672E74726163652827536368656D61206D69736D617463683A272C20736368656D612E747970652C20274A534F4E3A272C206F6C644A736F6E2C20276D75737420626520616E206F626A65637427293B0A';
wwv_flow_api.g_varchar2_table(386) := '202020202020202020206C5F6A736F6E203D207B7D3B0A202020202020202020206F6C644A736F6E203D7B7D3B0A20202020202020207D0A2020202020202020696628736368656D612E70726F70657274696573297B0A20202020202020202020666F72';
wwv_flow_api.g_varchar2_table(387) := '286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E70726F7065727469657329297B0A2020202020202020202020206C5F6A736F6E5B6C5F6E616D655D3D6765744F626A65637456';
wwv_flow_api.g_varchar2_table(388) := '616C7565732867656E4974656D6E616D6528646174616974656D2C206C5F6E616D65292C206C5F6E616D652C206C5F736368656D612C206F6C644A736F6E5B6C5F6E616D655D293B0A202020202020202020207D0A20202020202020207D0A2020202020';
wwv_flow_api.g_varchar2_table(389) := '20627265616B3B0A2020202020206361736520276E756C6C273A0A20202020202020206C5F6A736F6E203D206E756C6C3B0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F41525241593A207B200A202020202020202020';
wwv_flow_api.g_varchar2_table(390) := '20736368656D612E6974656D73203D20736368656D612E6974656D73207C7C207B7D3B0A202020202020202069662841727261792E6973417272617928736368656D612E6974656D732E656E756D29297B20202F2F20617272617920666F72206D756C74';
wwv_flow_api.g_varchar2_table(391) := '69706C652073656C656374696F6E0A202020202020202020206C6574206C5F64617461203D20617065782E6974656D28646174616974656D292E67657456616C756528293B0A202020202020202020206C5F6A736F6E203D206974656D56616C7565324A';
wwv_flow_api.g_varchar2_table(392) := '736F6E28736368656D612C206C5F64617461293B0A20202020202020207D20656C7365207B0A202020202020202020206C657420693D303B0A202020202020202020206C6574206C5F666F756E64203D2066616C73653B0A202020202020202020206C5F';
wwv_flow_api.g_varchar2_table(393) := '6A736F6E203D205B5D3B0A202020202020202020206F6C644A736F6E203D206F6C644A736F6E7C7C5B5D3B0A202020202020202020206C6574206C5F726F7773203D202428222322202B2070526567696F6E4964202B2027205B69645E3D2227202B2064';
wwv_flow_api.g_varchar2_table(394) := '6174616974656D202B20275F225D2E726F7727293B0A20202020202020202020666F7228636F6E7374206C5F726F77206F66206C5F726F7773297B0A202020202020202020202020636F6E7374206C5F6964203D2024286C5F726F77295B305D2E69642E';
wwv_flow_api.g_varchar2_table(395) := '7265706C616365282F5F434F4E5441494E4552242F2C2727293B0A202020202020202020202020636F6E7374206C5F64617461203D206765744F626A65637456616C756573286C5F69642C2027272C20736368656D612E6974656D732C207B7D293B0A20';
wwv_flow_api.g_varchar2_table(396) := '20202020202020202020206966282169734F626A656374456D707479286C5F6461746129297B20202F2F20646F6E27742061646420656D70747920726F77730A20202020202020202020202020206C5F6A736F6E2E70757368286C5F64617461293B0A20';
wwv_flow_api.g_varchar2_table(397) := '20202020202020202020207D0A202020202020202020207D0A20202020202020207D0A2020202020207D0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F535452494E473A0A2020202020206361736520435F4A534F4E5F';
wwv_flow_api.g_varchar2_table(398) := '494E54454745523A0A2020202020206361736520435F4A534F4E5F4E554D4245523A0A2020202020206361736520435F4A534F4E5F424F4F4C45414E3A7B0A20202020202020206C6574206C5F64617461203D20617065782E6974656D28646174616974';
wwv_flow_api.g_varchar2_table(399) := '656D292E67657456616C756528293B0A20202020202020206C6574206C5F76616C7565203D206974656D56616C7565324A736F6E28736368656D612C206C5F64617461293B0A20202020202020206966286C5F76616C7565213D6E756C6C297B0A202020';
wwv_flow_api.g_varchar2_table(400) := '202020202020206C5F6A736F6E203D206C5F76616C75653B0A20202020202020207D20656C7365207B0A202020202020202020206C5F6A736F6E203D206E756C6C3B0A20202020202020207D0A2F2F202D2D2D2D204841434B20202D2D2D2D2D2D2D0A20';
wwv_flow_api.g_varchar2_table(401) := '202020202020206966282827272B6E616D65292E7374617274735769746828275F2729297B0A202020202020202020206C5F6A736F6E203D206F6C644A736F6E3B200A20202020202020207D0A2020202020207D0A202020202020627265616B3B0A2020';
wwv_flow_api.g_varchar2_table(402) := '2020202064656661756C743A0A2020202020202020696628435F4A534F4E5F434F4E535420696E20736368656D6129207B20202F2F206120636F6E737420646F65736E277420686176652061206974656D20696E207468652055490A2020202020202020';
wwv_flow_api.g_varchar2_table(403) := '20206C5F6A736F6E203D20736368656D612E636F6E73743B0A20202020202020207D0A202020202020627265616B3B0A2020202020207D0A202020207D0A0A20202020696628736368656D612E6966297B20202F2F207468657265206973206120636F6E';
wwv_flow_api.g_varchar2_table(404) := '646974696F6E616C20736368656D610A20202020202020202F2F2067657474696E6720746865206461746120646570656E6473206F6E20746865206576616C756174696F6E206F662074686520696620636C617573652E0A2020202020206C6574206C5F';
wwv_flow_api.g_varchar2_table(405) := '6576616C203D206576616C45787072657373696F6E28736368656D612E69662C206C5F6A736F6E293B0A202020202020696628736368656D612E7468656E202626206C5F6576616C3D3D74727565297B0A20202020202020206C65742070726F70657274';
wwv_flow_api.g_varchar2_table(406) := '696573203D20736368656D612E7468656E2E70726F706572746965737C7C7B7D3B0A20202020202020206C6574206C5F6E65774A736F6E203D206765744F626A65637456616C75657328646174616974656D2C2027272C207B747970653A20435F4A534F';
wwv_flow_api.g_varchar2_table(407) := '4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C206F6C644A736F6E293B0A20202020202020202F2F20636F6E736F6C652E646972286C5F6E65774A736F6E293B0A20202020202020202F2F206D6572676520636F6E';
wwv_flow_api.g_varchar2_table(408) := '646974696F6E616C20696E70757420696E746F2063757272656E7420726573756C740A20202020202020206C5F6A736F6E203D207B2E2E2E6C5F6A736F6E2C202E2E2E6C5F6E65774A736F6E7D3B0A2020202020207D0A0A202020202020696628736368';
wwv_flow_api.g_varchar2_table(409) := '656D612E656C7365202626206C5F6576616C3D3D66616C7365297B0A20202020202020206C65742070726F70657274696573203D20736368656D612E656C73652E70726F706572746965737C7C7B7D3B0A20202020202020206C6574206C5F6E65774A73';
wwv_flow_api.g_varchar2_table(410) := '6F6E203D206765744F626A65637456616C75657328646174616974656D2C2027272C207B747970653A20435F4A534F4E5F4F424A4543542C2070726F706572746965733A2070726F706572746965737D2C206F6C644A736F6E293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(411) := '2F2F20636F6E736F6C652E646972286C5F6E65774A736F6E293B0A20202020202020202F2F206D6572676520636F6E646974696F6E616C20696E70757420696E746F2063757272656E7420726573756C740A20202020202020206C5F6A736F6E203D207B';
wwv_flow_api.g_varchar2_table(412) := '2E2E2E6C5F6A736F6E2C202E2E2E6C5F6E65774A736F6E7D3B0A2020202020207D0A0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6765744F626A65637456616C756573222C206C5F6A736F6E';
wwv_flow_api.g_varchar2_table(413) := '293B0A2020202072657475726E286C5F6A736F6E293B0A20207D0A0A20202F2A0A2020202A2067656E65726174657320746865206C6162656C2066726F6D20746865206F626A6563746E616D65206F722075736520616E206578697374696E67206C6162';
wwv_flow_api.g_varchar2_table(414) := '656C0A20202A2F0A202066756E6374696F6E2067656E65726174654C6162656C286E616D652C20736368656D61297B0A202020206C6574206C5F6C6162656C3D27273B0A20202020696628736368656D612E6170657820262620435F415045585F4C4142';
wwv_flow_api.g_varchar2_table(415) := '454C20696E20736368656D612E61706578297B0A2020202020206C5F6C6162656C203D20736368656D612E617065782E6C6162656C7C7C27273B0A202020207D20656C7365207B20200A2020202020202F2F20666F722064656661756C74206C6162656C';
wwv_flow_api.g_varchar2_table(416) := '207265706C616365202D5F206279206120626C616E6B20616E64207365742066697273742063686172206F66206561636820776F726420696E207570706572636173650A2020202020206C5F6C6162656C203D20206E616D652E746F4C6F776572436173';
wwv_flow_api.g_varchar2_table(417) := '6528290A2020202020202020202020202020202020202020202E73706C6974282F207C5C2D7C5F2F290A2020202020202020202020202020202020202020202E6D617028287329203D3E20732E6368617241742830292E746F5570706572436173652829';
wwv_flow_api.g_varchar2_table(418) := '202B20732E737562737472696E67283129290A2020202020202020202020202020202020202020202E6A6F696E28272027293B0A202020207D0A2020202072657475726E286C5F6C6162656C293B0A20207D0A0A20202F2A0A2020202A2070726F706167';
wwv_flow_api.g_varchar2_table(419) := '6174652074686520737562736368656D617320666F72202224726566220A20202A2F0A202066756E6374696F6E2070726F7061676174655265667328736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567';
wwv_flow_api.g_varchar2_table(420) := '696F6E2E70726F70616761746552656673222C20736368656D61293B0A20202020696628736368656D6120262620747970656F6620736368656D61203D3D20276F626A65637427297B0A202020202020696628736368656D615B435F4A534F4E5F524546';
wwv_flow_api.g_varchar2_table(421) := '5D20262620747970656F6620736368656D615B435F4A534F4E5F5245465D203D3D2027737472696E6727297B0A20202020202020206C6574206A736F6E706174683D736368656D615B435F4A534F4E5F5245465D3B0A20202020202020206966286A736F';
wwv_flow_api.g_varchar2_table(422) := '6E706174682E737562737472696E6728302C3229203D3D27232F27297B0A202020202020202020206C65742067657456616C7565203D20286F2C207029203D3E20702E7265706C6163652827232F272C2727292E73706C697428272F27292E7265647563';
wwv_flow_api.g_varchar2_table(423) := '652828722C206B29203D3E20725B6B5D2C206F293B0A202020202020202020207472797B0A2020202020202020202020206C6574206E6577536368656D61203D2067657456616C756528704F7074696F6E732E736368656D612C206A736F6E7061746829';
wwv_flow_api.g_varchar2_table(424) := '3B0A2020202020202020202020206966286E6577536368656D61297B0A20202020202020202020202020204F626A6563742E61737369676E28736368656D612C206E6577536368656D61293B0A2020202020202020202020207D20656C7365207B0A2020';
wwv_flow_api.g_varchar2_table(425) := '2020202020202020202020206C6F67536368656D614572726F722827756E6B6E6F776E272C20435F4A534F4E5F5245462C20736368656D615B435F4A534F4E5F5245465D290A2020202020202020202020207D0A20202020202020202020202064656C65';
wwv_flow_api.g_varchar2_table(426) := '746528736368656D615B435F4A534F4E5F5245465D293B0A202020202020202020207D2063617463682865297B0A2020202020202020202020206C6F67536368656D614572726F722827746172676574206F662024726566206E6F7420666F756E643A20';
wwv_flow_api.g_varchar2_table(427) := '272C206A736F6E70617468293B0A202020202020202020207D0A20202020202020207D0A2020202020207D20656C7365207B0A20202020202020202F2F2070726F63657373207265637572736976656C79200A202020202020202069662841727261792E';
wwv_flow_api.g_varchar2_table(428) := '6973417272617928736368656D6129297B200A20202020202020202020666F7228636F6E7374206920696E20736368656D61297B0A202020202020202020202020736368656D615B695D203D2070726F7061676174655265667328736368656D615B695D';
wwv_flow_api.g_varchar2_table(429) := '293B0A202020202020202020207D2020200A20202020202020207D20656C7365207B0A20202020202020202020666F7228636F6E7374205B6C5F6B65792C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D6129297B';
wwv_flow_api.g_varchar2_table(430) := '0A202020202020202020202020736368656D615B6C5F6B65795D203D2070726F70616761746552656673286C5F736368656D61293B0A202020202020202020207D0A20202020202020207D0A2020202020207D0A202020207D0A20202020617065782E64';
wwv_flow_api.g_varchar2_table(431) := '656275672E747261636528223C3C6A736F6E526567696F6E2E70726F70616761746552656673222C204A534F4E2E737472696E6769667928736368656D6129293B0A2020202072657475726E20736368656D613B0A20207D0A20202F2A0A2020202A2070';
wwv_flow_api.g_varchar2_table(432) := '726F7061676174652076616C756573206F66204A534F4E2D736368656D612070726F7065727469657320726563757369766520696E746F2070726F706572746965732F6974656D730A2020202A2053657420736F6D652070726F70657274696573206465';
wwv_flow_api.g_varchar2_table(433) := '70656E64696E67206F6E206F74686572730A2020202A20536574206D697373696E672070726F7065727469657320746F20726561736F6E61626C652076616C75657320746F2061766F6964206572726F727320696E206C61746572207374616765730A20';
wwv_flow_api.g_varchar2_table(434) := '202A2F0A202066756E6374696F6E2070726F70616761746550726F7065727469657328736368656D612C206C6576656C2C20726561646F6E6C792C2077726974656F6E6C792C206164646974696F6E616C50726F706572746965732C20636F6E64697469';
wwv_flow_api.g_varchar2_table(435) := '6F6E616C297B200A20202020736368656D61203D20736368656D61207C7C207B7D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020736368656D612E617065782E636F6E646974696F6E616C203D20';
wwv_flow_api.g_varchar2_table(436) := '636F6E646974696F6E616C3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E70726F70616761746550726F70657274696573222C206C6576656C2C20736368656D612C20726561646F6E6C792C207772697465';
wwv_flow_api.g_varchar2_table(437) := '6F6E6C792C206164646974696F6E616C50726F706572746965732C20636F6E646974696F6E616C293B0A202020206C6576656C2B2B3B0A202020206966286C6576656C3E3230297B0A202020202020617065782E64656275672E6572726F72282770726F';
wwv_flow_api.g_varchar2_table(438) := '70616761746550726F7065727469657320726563757273696F6E272C206C6576656C2C2027746F206465657027290A20202020202072657475726E3B0A202020207D0A0A20202020696628736368656D612E646570656E64656E74536368656D6173297B';
wwv_flow_api.g_varchar2_table(439) := '202F2F20636F6E7665727420646570656E64656E7420736368656D617320746F2049462F454C53452C2072657175697265642070726F706572747920746F20646570656E64656E7452657175697265640A2020202020206C6574206C5F6B657973203D20';
wwv_flow_api.g_varchar2_table(440) := '4F626A6563742E6B65797328736368656D612E646570656E64656E74536368656D6173293B0A2020202020206966286C5F6B6579732E6C656E6774683D3D31297B0A2020202020202020736368656D612E6966203D207B202270726F7065727469657322';
wwv_flow_api.g_varchar2_table(441) := '3A207B7D7D3B0A2020202020202020736368656D612E69662E70726F706572746965735B6C5F6B6579735B305D5D203D207B22636F6E7374223A206E756C6C7D3B0A2020202020202020736368656D612E656C7365203D207B202270726F706572746965';
wwv_flow_api.g_varchar2_table(442) := '73223A207B7D7D3B0A2020202020202020736368656D612E656C73652E70726F70657274696573203D20736368656D612E646570656E64656E74536368656D61735B6C5F6B6579735B305D5D2E70726F706572746965733B0A2020202020202020636F6E';
wwv_flow_api.g_varchar2_table(443) := '7374206C5F7265717569726564203D20736368656D612E646570656E64656E74536368656D61735B6C5F6B6579735B305D5D2E72657175697265643B0A202020202020202069662841727261792E69734172726179286C5F726571756972656429297B0A';
wwv_flow_api.g_varchar2_table(444) := '20202020202020202020736368656D612E646570656E64656E7452657175697265643D5B5D3B0A20202020202020202020736368656D612E646570656E64656E7452657175697265645B6C5F6B6579735B305D5D203D206C5F72657175697265643B0A20';
wwv_flow_api.g_varchar2_table(445) := '202020202020207D0A202020202020202064656C65746520736368656D612E646570656E64656E74536368656D61733B0A2020202020207D20656C7365207B0A2020202020202020617065782E64656275672E6572726F722827646570656E64656E7453';
wwv_flow_api.g_varchar2_table(446) := '6368656D61733A206E756D626572206F66206F626A6563747320213D203127293B0A2020202020207D0A202020207D0A0A20202020202020202F2F2070726F7061676174652074686520646570656E64656E745265717569726564206469726563746C79';
wwv_flow_api.g_varchar2_table(447) := '20746F207468652070726F70657274696573200A20202020696628736368656D612E747970653D3D435F4A534F4E5F4152524159297B200A202020202020696628736368656D612E6974656D73297B0A2020202020202020206966284F626A6563742E6B';
wwv_flow_api.g_varchar2_table(448) := '65797328736368656D612E6974656D73292E6C656E6774683D3D30297B20202F2F206974656D732073686F756C642068617665206174206C65617374206F6E6520656E7472790A2020202020202020202020617065782E64656275672E7761726E282761';
wwv_flow_api.g_varchar2_table(449) := '727261792073686F756C642068617665206174206C656173742031206974656D7327290A2020202020202020207D0A202020202020207D20656C7365207B0A20202020202020206C6F67536368656D614572726F7228276D697373696E6720226974656D';
wwv_flow_api.g_varchar2_table(450) := '732220666F72202274797065223A2022617272617922272920200A2020202020202020736368656D612E6974656D733D7B7D3B0A2020202020207D0A202020207D0A0A20202020202020202F2F2070726F7061676174652074686520646570656E64656E';
wwv_flow_api.g_varchar2_table(451) := '745265717569726564206469726563746C7920746F207468652070726F70657274696573200A20202020696628736368656D612E747970653D3D435F4A534F4E5F4F424A454354297B200A202020202020696628736368656D612E70726F706572746965';
wwv_flow_api.g_varchar2_table(452) := '73297B0A20202020202020206966284F626A6563742E6B65797328736368656D612E70726F70657274696573292E6C656E6774683D3D30297B20202F2F206974656D732073686F756C642068617665206174206C65617374206F6E6520656E7472790A20';
wwv_flow_api.g_varchar2_table(453) := '202020202020202020617065782E64656275672E7761726E28276F626A6563742073686F756C642068617665206174206C6561737420312070726F706572747927290A20202020202020207D0A2020202020207D20656C7365207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(454) := '6C6F67536368656D614572726F7228276D697373696E67202270726F706572746965732220666F72202274797065223A20226F626A6563742227293B0A2020202020202020736368656D612E70726F706572746965733D7B7D3B200A2020202020207D0A';
wwv_flow_api.g_varchar2_table(455) := '202020202020736368656D612E6164646974696F6E616C50726F70657274696573203D20626F6F6C65616E49664E6F7453657428736368656D612E6164646974696F6E616C50726F706572746965732C206164646974696F6E616C50726F706572746965';
wwv_flow_api.g_varchar2_table(456) := '73293B0A202020202020696628736368656D612E646570656E64656E745265717569726564297B0A2020202020202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E';
wwv_flow_api.g_varchar2_table(457) := '646570656E64656E74526571756972656429297B0A202020202020202020207472797B0A202020202020202020202020736368656D612E70726F706572746965735B6C5F6E616D655D2E646570656E64656E745265717569726564203D206C5F73636865';
wwv_flow_api.g_varchar2_table(458) := '6D613B0A202020202020202020207D63617463682865297B0A202020202020202020202020617065782E64656275672E6572726F722827646570656E64656E745265717569726564206E6F7420666F756E643A20272C206C5F6E616D652C2065293B2020';
wwv_flow_api.g_varchar2_table(459) := '202020202020202020200A202020202020202020207D0A20202020202020207D0A2020202020207D20200A202020207D0A0A0A202020202F2F2063616C63206D696E696D756D2F6D6178696D756D0A20202020696628736368656D612E6D696E696D756D';
wwv_flow_api.g_varchar2_table(460) := '297B0A202020202020736368656D612E6D696E696D756D203D20676574436F6E7374616E7428736368656D612E666F726D61742C20736368656D612E6D696E696D756D2C2066616C7365293B0A202020207D0A20202020696628736368656D612E6D6178';
wwv_flow_api.g_varchar2_table(461) := '696D756D297B0A202020202020736368656D612E6D6178696D756D203D20676574436F6E7374616E7428736368656D612E666F726D61742C20736368656D612E6D6178696D756D2C2066616C7365293B0A202020207D0A202020200A2020202069662873';
wwv_flow_api.g_varchar2_table(462) := '6368656D612E7061747465726E20262621736368656D612E7479706529207B20202F2F207768656E207061747465726E206973207365742074797065207468652064656661756C74206973202274797065223A2022737472696E67220A20202020202073';
wwv_flow_api.g_varchar2_table(463) := '6368656D612E74797065203D20435F4A534F4E5F535452494E473B0A202020207D0A0A202020202F2F204F7261636C6520737065636966696320534348454D4120657874656E73696F6E730A20202020696628736368656D612E70726F70657274696573';
wwv_flow_api.g_varchar2_table(464) := '20262620736368656D612E70726F706572746965732E64625072696D6172794B6579297B20202F2F2072656D6F76652064625072696D6172794B65792C206974277320612070726F706572747920616E6420776F756C6420736F2062652068616E646C65';
wwv_flow_api.g_varchar2_table(465) := '6420617320656E20696E707574206974656D0A20202020202064656C65746520736368656D612E70726F706572746965732E64625072696D6172794B65793B0A202020207D0A0A20202020696628736368656D612E657874656E6465645479706529207B';
wwv_flow_api.g_varchar2_table(466) := '2020202F2F204F7261636C652073706563696669632064617461747970650A20202020202069662841727261792E6973417272617928736368656D612E657874656E6465645479706529297B202020202F2F20666F72206E756C6C61626C65202070726F';
wwv_flow_api.g_varchar2_table(467) := '70657274696573206974206973205B2274797065222C206E756C6C5D0A2020202020202020696628736368656D612E657874656E646564547970652E696E636C75646573286E756C6C29297B20202F2F200A202020202020202020202F2F20636F6E736F';
wwv_flow_api.g_varchar2_table(468) := '6C652E6C6F67282752656D6F7665206E756C6C2066726F6D272C20736368656D612E657874656E64656454797065293B0A20202020202020207D0A2020202020202020696628736368656D612E657874656E646564547970652E6C656E677468203D3D20';
wwv_flow_api.g_varchar2_table(469) := '31297B0A20202020202020202020736368656D612E657874656E64656454797065203D20736368656D612E657874656E646564547970655B305D3B0A20202020202020207D0A2020202020207D0A2020202020207377697463682028736368656D612E65';
wwv_flow_api.g_varchar2_table(470) := '7874656E6465645479706529207B2020202F2F204F7261636C652D7370636966696320657874656E73696F6E2C20636F6E7665727420696E746F206A736F6E2D736368656D61207265706573656E746174696F6E0A2020202020206361736520435F4A53';
wwv_flow_api.g_varchar2_table(471) := '4F4E5F464F524D41545F444154453A0A2020202020202020736368656D612E74797065203D20435F4A534F4E5F535452494E473B0A2020202020202020736368656D612E666F726D61743D20736368656D612E666F726D61747C7C20435F4A534F4E5F46';
wwv_flow_api.g_varchar2_table(472) := '4F524D41545F444154453B202F2F20646F206E6F74206F7665727772697465206578697374696E6720666F726D6174730A202020202020627265616B3B0A2020202020206361736520435F4F5241434C455F54494D455354414D503A0A20202020202020';
wwv_flow_api.g_varchar2_table(473) := '20736368656D612E74797065203D20435F4A534F4E5F535452494E473B0A2020202020202020736368656D612E666F726D61743D736368656D612E666F726D61747C7C20435F4A534F4E5F464F524D41545F4441544554494D453B0A2020202020206272';
wwv_flow_api.g_varchar2_table(474) := '65616B3B0A2020202020206361736520435F4A534F4E5F535452494E473A0A2020202020206361736520435F4A534F4E5F424F4F4C45414E3A0A2020202020202020736368656D612E74797065203D20736368656D612E657874656E646564547970653B';
wwv_flow_api.g_varchar2_table(475) := '0A202020202020627265616B3B0A2020202020206361736520435F4A534F4E5F494E54454745523A0A2020202020206361736520435F4A534F4E5F4E554D4245523A0A2020202020202020696628736368656D612E73716C5363616C653D3D30297B2020';
wwv_flow_api.g_varchar2_table(476) := '2F2F206E6F20646967697420626568696E6420222E222C20736F20696E74656765720A20202020202020202020736368656D612E74797065203D20435F4A534F4E5F494E54454745523B0A20202020202020207D20656C7365207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(477) := '2020736368656D612E74797065203D20736368656D612E657874656E646564547970653B0A20202020202020207D0A202020202020627265616B3B0A20202020202064656661756C743A0A2020202020202020617065782E64656275672E6572726F7228';
wwv_flow_api.g_varchar2_table(478) := '27536368656D6120636F6E7461696E7320756E737570706F727420657874656E64656454797065202573272C20736368656D612E657874656E64656454797065293B0A2020202020207D0A202020207D0A0A2020202020202F2F2064656661756C742066';
wwv_flow_api.g_varchar2_table(479) := 'C3BC722022656E756D220A20202020696628736368656D612E656E756D297B0A202020202020736368656D612E617065782E6974656D74797065203D20736368656D612E617065782E6974656D747970657C7C20435F415045585F53454C4543543B0A20';
wwv_flow_api.g_varchar2_table(480) := '2020207D0A0A20202020736368656D612E617065782E726561646F6E6C79203D20626F6F6C65616E49664E6F7453657428736368656D612E617065782E726561646F6E6C792C20726561646F6E6C79293B0A20202020736368656D612E726561644F6E6C';
wwv_flow_api.g_varchar2_table(481) := '79203D20626F6F6C65616E49664E6F7453657428736368656D612E726561644F6E6C792C20736368656D612E617065782E726561646F6E6C79293B0A20202020736368656D612E77726974654F6E6C79203D20626F6F6C65616E49664E6F745365742873';
wwv_flow_api.g_varchar2_table(482) := '6368656D612E77726974654F6E6C792C2077726974656F6E6C79293B0A0A2020202073776974636828736368656D612E74797065297B0A2020202020206361736520435F4A534F4E5F4E554D4245523A0A2020202020202020736368656D612E61706578';
wwv_flow_api.g_varchar2_table(483) := '2E666F726D6174203D2028736368656D612E617065782E666F726D61743D3D435F415045585F43555252454E4359293F27464D4C39393947393939473939394739393947393939443939273A28736368656D612E617065782E666F726D6174293B0A2020';
wwv_flow_api.g_varchar2_table(484) := '20202020627265616B3B0A2020202020206361736520435F4A534F4E5F494E54454745523A0A2020202020202020736368656D612E617065782E666F726D6174203D2028736368656D612E617065782E666F726D61743D3D435F415045585F4355525245';
wwv_flow_api.g_varchar2_table(485) := '4E4359293F27464D4C39393947393939473939394739393947393939273A28736368656D612E617065782E666F726D61747C7C27393939393939393939393939393939393939393939393927293B0A2020202020202020696628736368656D612E617065';
wwv_flow_api.g_varchar2_table(486) := '782E6974656D747970653D3D435F415045585F5043544752415048297B0A20202020202020202020736368656D612E726561644F6E6C79203D20747275653B0A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F';
wwv_flow_api.g_varchar2_table(487) := '4A534F4E5F535452494E473A0A20202020202020206966285B435F415045585F5152434F44452C20435F415045585F494D4147455D2E696E636C7564657328736368656D612E617065782E6974656D7479706529207C7C20736368656D612E636F6E7465';
wwv_flow_api.g_varchar2_table(488) := '6E74456E636F64696E67203D3D20435F4A534F4E5F424153453634297B0A20202020202020202020736368656D612E726561644F6E6C792020203D20747275653B20202F2F2063616E206E6F74206265206368616E6765640A2020202020202020202073';
wwv_flow_api.g_varchar2_table(489) := '6368656D612E69735265717569726564203D2066616C73653B202F2F206E6F742072657175697265640A20202020202020207D3B0A0A2020202020202020696628736368656D612E636F6E74656E74456E636F64696E67297B2020202F2F20656E636F64';
wwv_flow_api.g_varchar2_table(490) := '656420737472696E670A20202020202020202020696628736368656D612E636F6E74656E74456E636F64696E673D3D20435F4A534F4E5F424153453634297B0A202020202020202020202020736368656D612E617065782E696D6167653D736368656D61';
wwv_flow_api.g_varchar2_table(491) := '2E636F6E74656E744D65646961547970653B0A202020202020202020202020736368656D612E617065782E6974656D74797065203D20435F415045585F494D4147453B0A202020202020202020202020696628215B435F4A534F4E5F494D4147455F4749';
wwv_flow_api.g_varchar2_table(492) := '462C20435F4A534F4E5F494D4147455F4A50472C20435F4A534F4E5F494D4147455F504E475D2E696E636C7564657328736368656D612E636F6E74656E744D656469615479706529297B20202F2F0A2020202020202020202020202020617065782E6465';
wwv_flow_api.g_varchar2_table(493) := '6275672E6572726F722827756E6B6E6F776E20737472696E6720636F6E74656E744D65646961547970652022257322272C20736368656D612E636F6E74656E744D6564696154797065293B0A20202020202020202020202020202F2F2064656661756C74';
wwv_flow_api.g_varchar2_table(494) := '206973204A50470A2020202020202020202020202020736368656D612E636F6E74656E744D6564696154797065203D20435F4A534F4E5F494D4147455F4A50473B0A2020202020202020202020207D0A202020202020202020207D20656C7365207B0A20';
wwv_flow_api.g_varchar2_table(495) := '2020202020202020202020617065782E64656275672E6572726F722827756E6B6E6F776E20737472696E6720656E636F64696E672022257322272C20736368656D612E636F6E74656E74456E636F64696E67293B20200A20202020202020202020202073';
wwv_flow_api.g_varchar2_table(496) := '6368656D612E636F6E74656E74456E636F64696E67203D20435F4A534F4E5F4241534536343B0A202020202020202020207D0A20202020202020207D20656C7365207B20202F2F20706C61696E20737472696E672C20636865636B20666F726D6174730A';
wwv_flow_api.g_varchar2_table(497) := '2020202020202020202073776974636828736368656D612E666F726D6174297B0A20202020202020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A20202020202020202020202020736368656D612E617065782E666F726D6174';
wwv_flow_api.g_varchar2_table(498) := '203D20736368656D612E617065782E666F726D6174207C7C206744617465466F726D61743B0A2020202020202020202020627265616B3B0A20202020202020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A20202020';
wwv_flow_api.g_varchar2_table(499) := '202020202020202020736368656D612E617065782E666F726D6174203D20736368656D612E617065782E666F726D6174207C7C20286744617465466F726D6174202B20272027202B206754696D65466F726D6174293B0A20202020202020202020206272';
wwv_flow_api.g_varchar2_table(500) := '65616B3B0A20202020202020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A20202020202020202020202020736368656D612E617065782E666F726D6174203D206754696D65466F726D61743B0A202020202020202020202062';
wwv_flow_api.g_varchar2_table(501) := '7265616B3B0A202020202020202020202064656661756C743A0A20202020202020202020202020696628736368656D612E6D61784C656E67746820262620736368656D612E6D61784C656E6774683E704F7074696F6E732E746578746172656177696474';
wwv_flow_api.g_varchar2_table(502) := '6820262620736368656D612E617065782E6974656D7479706520213D435F415045585F5249434854455854297B0A202020202020202020202020202020736368656D612E617065782E6974656D747970653D435F415045585F54455854415245413B2020';
wwv_flow_api.g_varchar2_table(503) := '0A202020202020202020202020207D0A2020202020202020202020627265616B3B2020200A202020202020202020207D0A20202020202020207D0A202020202020627265616B3B202020200A202020207D0A0A20202020202020202F2F20736574206170';
wwv_flow_api.g_varchar2_table(504) := '65782E666F726D6174730A20202020696628704F7074696F6E732E617065785F76657273696F6E203C435F415045585F56455253494F4E5F32333032297B202F2F20636865636B20666F72206E6577206974656D7479706520696E206F6C642072656C65';
wwv_flow_api.g_varchar2_table(505) := '617365732C2072656D6F7665207468656D20616E64206C6F67206572726F720A2020202020206966285B435F415045585F5152434F44452C20435F415045585F52494348544558542C20435F415045585F434F4D424F2C205D2E696E636C756465732873';
wwv_flow_api.g_varchar2_table(506) := '6368656D612E617065782E6974656D7479706529297B0A20202020202020206C6F67536368656D614572726F7228276974656D74797065206E6F7420737570706F7274656420696E20415045582D76657273696F6E272C20736368656D612E617065782E';
wwv_flow_api.g_varchar2_table(507) := '6974656D747970652C20704F7074696F6E732E617065785F76657273696F6E293B0A2020202020202020696628736368656D612E617065782E6974656D74797065203D3D20435F415045585F5249434854455854297B20202F2F20757365207465787461';
wwv_flow_api.g_varchar2_table(508) := '7265610A20202020202020202020736368656D612E617065782E6974656D74797065203D20435F415045585F54455854415245413B0A20202020202020207D20656C7365207B0A2020202020202020202064656C65746520736368656D612E617065782E';
wwv_flow_api.g_varchar2_table(509) := '6974656D747970653B0A20202020202020207D0A2020202020207D0A202020207D0A0A20202020202020202F2F2070726F70616761746520726571756972656420746F20656163682070726F706572746965730A2020202069662841727261792E697341';
wwv_flow_api.g_varchar2_table(510) := '7272617928736368656D612E726571756972656429297B0A202020202020666F72286C6574206C5F736368656D61206F6620736368656D612E7265717569726564297B0A2020202020202020696628736368656D612E70726F7065727469657320262620';
wwv_flow_api.g_varchar2_table(511) := '736368656D612E70726F706572746965735B6C5F736368656D615D297B0A20202020202020202020736368656D612E70726F706572746965735B6C5F736368656D615D2E697352657175697265643D747275653B0A20202020202020207D0A2020202020';
wwv_flow_api.g_varchar2_table(512) := '202020696628736368656D612E6974656D7320262620736368656D612E6974656D735B6C5F736368656D615D297B0A20202020202020202020736368656D612E6974656D735B6C5F736368656D615D2E697352657175697265643D747275653B0A202020';
wwv_flow_api.g_varchar2_table(513) := '20202020207D0A2020202020207D0A202020207D0A0A20202020696628736368656D612E7468656E297B0A20202020202070726F70616761746550726F70657274696573287B747970653A20435F4A534F4E5F4F424A4543542C2072657175697265643A';
wwv_flow_api.g_varchar2_table(514) := '20736368656D612E7468656E2E72657175697265647C7C5B5D2C2070726F706572746965733A20736368656D612E7468656E2E70726F706572746965737D2C206C6576656C2C20736368656D612E726561644F6E6C792C20736368656D612E7772697465';
wwv_flow_api.g_varchar2_table(515) := '4F6E6C792C20736368656D612E6164646974696F6E616C50726F706572746965732C2074727565293B0A202020207D0A0A20202020696628736368656D612E656C7365297B0A20202020202070726F70616761746550726F70657274696573287B747970';
wwv_flow_api.g_varchar2_table(516) := '653A20435F4A534F4E5F4F424A4543542C2072657175697265643A20736368656D612E656C73652E72657175697265647C7C5B5D2C2070726F706572746965733A20736368656D612E656C73652E70726F706572746965737D2C206C6576656C2C207363';
wwv_flow_api.g_varchar2_table(517) := '68656D612E726561644F6E6C792C20736368656D612E77726974654F6E6C792C20736368656D612E6164646974696F6E616C50726F706572746965732C2074727565293B0A202020207D0A0A20202020666F72286C6574205B6C5F6E616D652C206C5F73';
wwv_flow_api.g_varchar2_table(518) := '6368656D615D206F66204F626A6563742E656E747269657328736368656D612E70726F706572746965737C7C7B7D29297B0A20202020202070726F70616761746550726F70657274696573286C5F736368656D612C206C6576656C2C20736368656D612E';
wwv_flow_api.g_varchar2_table(519) := '726561644F6E6C792C20736368656D612E77726974654F6E6C792C20736368656D612E6164646974696F6E616C50726F706572746965732C2066616C7365293B0A202020207D0A0A20202020696628736368656D612E6974656D73297B20202F2F207468';
wwv_flow_api.g_varchar2_table(520) := '65726520697320616E206974656D20646566696E6974696F6E2C2070726F6365737320746869730A202020202020736368656D612E6974656D732E6164646974696F6E616C50726F70657274696573203D20626F6F6C65616E49664E6F74536574287363';
wwv_flow_api.g_varchar2_table(521) := '68656D612E6974656D732E6164646974696F6E616C50726F706572746965732C206164646974696F6E616C50726F70657274696573293B0A20202020202070726F70616761746550726F7065727469657328736368656D612E6974656D732C206C657665';
wwv_flow_api.g_varchar2_table(522) := '6C2C20736368656D612E726561644F6E6C792C20736368656D612E77726974654F6E6C792C20736368656D612E6164646974696F6E616C50726F706572746965732C2066616C7365293B0A202020207D0A0A20202020617065782E64656275672E747261';
wwv_flow_api.g_varchar2_table(523) := '636528223C3C6A736F6E526567696F6E2E70726F70616761746550726F70657274696573222C206C6576656C293B0A20207D0A0A20202F2A0A2020202A2067656E6572617465207468652055492048544D4C20666F722032332E3220436F6D626F626F78';
wwv_flow_api.g_varchar2_table(524) := '200A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E6572617465466F72436F6D626F28736368656D612C20';
wwv_flow_api.g_varchar2_table(525) := '646174612C207072656669782C206E616D652C207374617274656E642C20636865636B626F78297B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027';
wwv_flow_api.g_varchar2_table(526) := '277D3B0A202020206C6574206C5F76616C756573203D2028646174617C7C5B5D292E6A6F696E28277C27293B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72436F6D626F222C2073';
wwv_flow_api.g_varchar2_table(527) := '6368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20636865636B626F78293B0A202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20202020202020312C0A2020202020202020';
wwv_flow_api.g_varchar2_table(528) := '77726170706572747970653A2027617065782D6974656D2D777261707065722D2D636F6D626F626F7820617065782D6974656D2D777261707065722D2D636F6D626F626F782D6D616E79272C0A202020202020202068746D6C3A20202020202020206170';
wwv_flow_api.g_varchar2_table(529) := '65782E7574696C2E6170706C7954656D706C61746528600A3C612D636F6D626F626F782069643D222349442322206E616D653D22234944232220235245515549524544232076616C75653D222356414C5545532322206D756C74692D76616C75653D2274';
wwv_flow_api.g_varchar2_table(530) := '727565222072657475726E2D646973706C61793D2266616C7365222076616C75652D736570617261746F72733D227C22206D61782D726573756C74733D223722206D696E2D636861726163746572732D7365617263683D223022206D617463682D747970';
wwv_flow_api.g_varchar2_table(531) := '653D22636F6E7461696E7322206D61786C656E6774683D2231303022206D756C74692D73656C6563743D22747275652220706172656E74732D72657175697265643D2274727565223E0A20203C64697620636C6173733D22617065782D6974656D2D636F';
wwv_flow_api.g_varchar2_table(532) := '6D626F73656C656374223E0A202020203C756C20636C6173733D22612D436869707320612D43686970732D2D6170706C69656420612D43686970732D2D777261702220726F6C653D2270726573656E746174696F6E223E0A602C0A202020202020202020';
wwv_flow_api.g_varchar2_table(533) := '2020202020202020202020202020202020202020202020202020202020202020202020202020207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F';
wwv_flow_api.g_varchar2_table(534) := '6C646572733A207B0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202256414C554553223A206C5F76616C7565730A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(535) := '2020202020202020202020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D290A202020207D3B0A0A202020206C5F';
wwv_flow_api.g_varchar2_table(536) := '67656E6572617465642E68746D6C202B3D20617065782E7574696C2E6170706C7954656D706C61746528600A2020202020203C6C6920636C6173733D22612D4368697020612D436869702D2D696E7075742069732D656D707479223E0A20202020202020';
wwv_flow_api.g_varchar2_table(537) := '203C696E70757420747970653D22746578742220636C6173733D22617065782D6974656D2D746578742220617269612D6C6162656C6C656462793D22234944235F4C4142454C222076616C75653D222356414C55455323222023504C414345484F4C4445';
wwv_flow_api.g_varchar2_table(538) := '5223206D61786C656E6774683D223130302220726F6C653D22636F6D626F626F782220617269612D657870616E6465643D2266616C736522206175746F636F6D706C6574653D226F666622206175746F636F72726563743D226F666622206175746F6361';
wwv_flow_api.g_varchar2_table(539) := '706974616C697A653D226E6F6E6522207370656C6C636865636B3D2266616C73652220617269612D6175746F636F6D706C6574653D226C6973742220617269612D64657363726962656462793D22234944235F646573632220617269612D627573793D22';
wwv_flow_api.g_varchar2_table(540) := '66616C7365223E0A20202020202020203C7370616E20636C6173733D22612D436869702D636C656172206A732D636C656172496E707574223E3C7370616E20636C6173733D22612D49636F6E2069636F6E2D6D756C74692D72656D6F7665222061726961';
wwv_flow_api.g_varchar2_table(541) := '2D68696464656E3D2274727565223E3C2F7370616E3E3C2F7370616E3E0A2020202020203C2F6C693E0A202020203C2F756C3E0A20203C2F6469763E0A20203C612D636F6C756D6E2D6D65746164617461206E616D653D22234944232220736561726368';
wwv_flow_api.g_varchar2_table(542) := '61626C653D22747275652220696E6465783D2230223E3C2F612D636F6C756D6E2D6D657461646174613E0A602C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207B0A20202020';
wwv_flow_api.g_varchar2_table(543) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(544) := '2020202020202020202020202020202020202256414C554553223A20617065782E7574696C2E65736361706548544D4C286C5F76616C756573290A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(545) := '202020202020202020207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A20202020666F7228636F6E7374206C5F6F7074696F6E206F6620736368656D612E656E75';
wwv_flow_api.g_varchar2_table(546) := '6D207C7C5B5D297B0A2020202020206C5F67656E6572617465642E68746D6C202B3D20617065782E7574696C2E6170706C7954656D706C61746528600A20203C612D6F7074696F6E2076616C75653D2231223E234F5054494F4E233C612D6F7074696F6E';
wwv_flow_api.g_varchar2_table(547) := '2D636F6C756D6E2D76616C75653E234F5054494F4E233C2F612D6F7074696F6E2D636F6C756D6E2D76616C75653E3C2F612D6F7074696F6E3E0A602C20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(548) := '2020202020202020207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(549) := '202020202020202020202020202020202020202020202020202020202020202020224F5054494F4E223A20617065782E7574696C2E65736361706548544D4C286C5F6F7074696F6E290A2020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(550) := '202020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A202020207D0A202020206C5F67656E657261746564';
wwv_flow_api.g_varchar2_table(551) := '2E68746D6C202B3D20600A3C2F612D636F6D626F626F783E0A603B0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72436F6D626F222C206C5F67656E657261746564293B0A20202020';
wwv_flow_api.g_varchar2_table(552) := '72657475726E286C5F67656E657261746564293B0A20207D0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F7220612070756C6C646F776E2F726164696F2F636865636B626F782070726F70657274792064657065';
wwv_flow_api.g_varchar2_table(553) := '6E64696E67206F6E206974656D747970650A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E657261746546';
wwv_flow_api.g_varchar2_table(554) := '6F7253656C65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206974656D747970652C20736368656D6141706578297B0A202020206C6574206C5F67656E657261746564203D207B206974656D733A';
wwv_flow_api.g_varchar2_table(555) := '302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020736368656D612E617065782E656E756D203D20736368656D612E6170';
wwv_flow_api.g_varchar2_table(556) := '65782E656E756D7C7C7B7D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F7253656C656374222C20736368656D612C20646174612C207072656669782C206E616D652C2073746172';
wwv_flow_api.g_varchar2_table(557) := '74656E642C206974656D74797065293B0A202020206966286974656D74797065203D3D20435F415045585F53454C454354297B0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A2020202020202020';
wwv_flow_api.g_varchar2_table(558) := '68746D6C3A20600A3C73656C6563742069643D222349442322206E616D653D222349442322202352455155495245442320636C6173733D2273656C6563746C69737420617065782D6974656D2D73656C6563742220646174612D6E61746976652D6D656E';
wwv_flow_api.g_varchar2_table(559) := '753D2266616C7365222073697A653D2231223E0A607D3B20202020202020202020200A20202020202069662821736368656D612E6973526571756972656429207B0A20202020202020206C5F67656E6572617465642E68746D6C2B3D273C6F7074696F6E';
wwv_flow_api.g_varchar2_table(560) := '2076616C75653D22223E3C2F6F7074696F6E3E273B0A2020202020207D0A202020202020666F7228636F6E7374206C5F76616C7565206F6620736368656D612E656E756D297B0A20202020202020206C5F67656E6572617465642E68746D6C202B3D2061';
wwv_flow_api.g_varchar2_table(561) := '7065782E7574696C2E6170706C7954656D706C61746528600A20203C6F7074696F6E2076616C75653D222356414C554523223E23444953504C415956414C5545233C2F6F7074696F6E3E0A602C0A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(562) := '20202020202020202020202020202020202020202020202020207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A20202020';
wwv_flow_api.g_varchar2_table(563) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202256414C5545223A20202020202020206A736F6E56616C7565324974656D28736368656D612C206C5F76616C7565292C0A20';
wwv_flow_api.g_varchar2_table(564) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022444953504C415956414C5545223A206A736F6E56616C7565324974656D28736368656D612C20736368656D612E61';
wwv_flow_api.g_varchar2_table(565) := '7065782E656E756D5B6C5F76616C75655D7C7C6C5F76616C7565290A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(566) := '20202020202020202020202020202020202020202020202020202020207D293B0A2020202020207D0A2020202020206C5F67656E6572617465642E68746D6C202B3D0A600A3C2F73656C6563743E0A603B0A202020207D20656C7365207B0A2020202020';
wwv_flow_api.g_varchar2_table(567) := '206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202068746D6C3A20617065782E7574696C2E6170706C7954656D706C61746528600A3C64697620746162696E6465783D222D31222069643D222349';
wwv_flow_api.g_varchar2_table(568) := '44232220617269612D6C6162656C6C656462793D22234944235F4C4142454C22202352455155495245442320636C6173733D22202354595045235F67726F757020617065782D6974656D2D67726F757020617065782D6974656D2D67726F75702D2D7263';
wwv_flow_api.g_varchar2_table(569) := '20617065782D6974656D2D2354595045232220726F6C653D2223545950452367726F7570223E0A602C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(570) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(571) := '20202020202020202020202020202254595045223A20206974656D747970650A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(572) := '2020202020202020202020202020202020202020202020202020202020202020207D290A2020202020207D3B0A2020202020206C6574206C5F6E723D303B0A2020202020200A202020202020666F7228636F6E7374206C5F76616C7565206F6620736368';
wwv_flow_api.g_varchar2_table(573) := '656D612E656E756D297B0A20202020202020206C5F67656E6572617465642E68746D6C202B3D20617065782E7574696C2E6170706C7954656D706C61746528600A20203C64697620636C6173733D22617065782D6974656D2D6F7074696F6E2220234449';
wwv_flow_api.g_varchar2_table(574) := '52233E0A202020203C696E70757420747970653D22235459504523222069643D22234944235F234E522322206E616D653D22234944232220646174612D646973706C61793D222356414C554523222076616C75653D222356414C554523222023504C4143';
wwv_flow_api.g_varchar2_table(575) := '45484F4C44455223202352455155495245442320617269612D6C6162656C3D222356414C5545232220636C6173733D22223E0A202020203C6C6162656C20636C6173733D22752D2354595045232220666F723D22234944235F234E52232220617269612D';
wwv_flow_api.g_varchar2_table(576) := '68696464656E3D2274727565223E23444953504C415956414C5545233C2F6C6162656C3E0A20203C2F6469763E0A602C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207B0A20';
wwv_flow_api.g_varchar2_table(577) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(578) := '20202020202020202020202020202020202020202022444952223A2020202020202020202028736368656D61417065782E646972656374696F6E3D3D435F415045585F484F52495A4F4E54414C293F277374796C653D22666C6F61743A206C6566742227';
wwv_flow_api.g_varchar2_table(579) := '3A22222C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202254595045223A2020202020202020206974656D747970652C0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(580) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202256414C5545223A20202020202020206A736F6E56616C7565324974656D28736368656D612C206C5F76616C7565292C0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(581) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202022444953504C415956414C5545223A206A736F6E56616C7565324974656D28736368656D612C20736368656D612E617065782E656E756D5B6C5F';
wwv_flow_api.g_varchar2_table(582) := '76616C75655D7C7C6C5F76616C7565292C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224E52223A20202020202020202020206C5F6E722B2B0A2020202020';
wwv_flow_api.g_varchar2_table(583) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A';
wwv_flow_api.g_varchar2_table(584) := '2020202020207D0A0A2020202020206C5F67656E6572617465642E68746D6C202B3D20600A3C2F6469763E0A603B0A202020207D0A2020202073776974636820286974656D74797065297B0A202020206361736520435F415045585F53454C4543543A20';
wwv_flow_api.g_varchar2_table(585) := '0A2020202020206C5F67656E6572617465642E7772617070657274797065203D2027617065782D6974656D2D777261707065722D2D73656C6563742D6C697374273B0A20202020627265616B3B0A202020206361736520435F415045585F524144494F3A';
wwv_flow_api.g_varchar2_table(586) := '0A2020202020206C5F67656E6572617465642E7772617070657274797065203D2027617065782D6974656D2D777261707065722D2D726164696F67726F7570273B0A20202020627265616B3B0A202020206361736520435F415045585F434845434B424F';
wwv_flow_api.g_varchar2_table(587) := '583A0A2020202020206C5F67656E6572617465642E7772617070657274797065203D2027617065782D6974656D2D777261707065722D2D636865636B626F78273B0A20202020627265616B3B0A202020207D0A20202020617065782E64656275672E7472';
wwv_flow_api.g_varchar2_table(588) := '61636528223C3C6A736F6E526567696F6E2E67656E6572617465466F7253656C656374222C206C5F67656E657261746564293B0A2020202072657475726E286C5F67656E657261746564293B0A20207D0A0A20202F2A0A2020202A2067656E6572617465';
wwv_flow_api.g_varchar2_table(589) := '207468652055492D6974656D20666F72206120737472696E672070726F706572747920646570656E64696E67206F6E20666F726D61742C202E2E2E0A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A20227878';
wwv_flow_api.g_varchar2_table(590) := '78222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E6572617465466F72537472696E6728736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D297B0A20';
wwv_flow_api.g_varchar2_table(591) := '2020206C6574206C5F67656E657261746564203D207B6974656D733A302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020';
wwv_flow_api.g_varchar2_table(592) := '736368656D612E617065782E656E756D203D20736368656D612E617065782E656E756D7C7C7B7D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72537472696E67222C2073636865';
wwv_flow_api.g_varchar2_table(593) := '6D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A20202020696628736368656D612E726561644F6E6C79297B0A20202020202073776974636828736368656D612E617065782E6974656D7479';
wwv_flow_api.g_varchar2_table(594) := '7065297B0A2020202020206361736520435F415045585F494D4147453A0A2020202020202020696628736368656D612E666F726D61743D3D435F4A534F4E5F464F524D41545F555249297B20202F2F7573652075726C20666F722074686520696D616765';
wwv_flow_api.g_varchar2_table(595) := '0A202020202020202020206C5F67656E657261746564203D207B0A2020202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D66';
wwv_flow_api.g_varchar2_table(596) := '69656C64272C0A20202020202020202020202068746D6C3A20600A3C7370616E20636C6173733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C79223E0A20203C696D67207372633D222356414C554523222061';
wwv_flow_api.g_varchar2_table(597) := '6C743D222356414C554523223E0A3C2F7370616E3E0A3C696E70757420747970653D2268696464656E222069643D2223494423222076616C75653D222356414C554523222F3E0A607D3B0A20202020202020207D20656C7365207B20202F2F20696D6167';
wwv_flow_api.g_varchar2_table(598) := '656461746120697320696E636C7564656420696E204A534F4E0A202020202020202020206C5F67656E657261746564203D207B0A2020202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027';
wwv_flow_api.g_varchar2_table(599) := '617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A20202020202020202020202068746D6C3A20600A3C7370616E20636C6173733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C79';
wwv_flow_api.g_varchar2_table(600) := '223E0A20203C696D67207372633D22646174613A23494D414745233B6261736536342C2356414C554523223E0A3C2F7370616E3E0A3C696E70757420747970653D2268696464656E222069643D2223494423222076616C75653D222356414C554523222F';
wwv_flow_api.g_varchar2_table(601) := '3E0A607D3B0A0A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520435F415045585F5152434F44453A0A20202020202020206C5F67656E657261746564203D207B0A202020202020202020206974656D733A20312C0A';
wwv_flow_api.g_varchar2_table(602) := '2020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D7172636F6465272C0A2020202020202020202068746D6C3A20600A3C612D7172636F64652069643D22234944232220636C6173733D22612D51';
wwv_flow_api.g_varchar2_table(603) := '52436F64652220616A61782D6964656E7469666965723D2223414A41584944454E54494649455223222076616C75653D222356414C554523223E203C2F612D7172636F64653E0A607D3B0A202020202020627265616B3B0A20202020202064656661756C';
wwv_flow_api.g_varchar2_table(604) := '743A0A20202020202020206C5F67656E657261746564203D207B0A202020202020202020206974656D733A20312C0A2020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64';
wwv_flow_api.g_varchar2_table(605) := '272C0A2020202020202020202068746D6C3A20273C7370616E2069643D22234944235F444953504C415922202352455155495245442320636C6173733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C79222064';
wwv_flow_api.g_varchar2_table(606) := '6174612D6573636170653D2274727565223E2356414C5545233C2F7370616E3E270A20202020202020207D3B0A202020202020627265616B3B0A2020202020207D0A202020207D20656C7365207B0A20202020202069662841727261792E697341727261';
wwv_flow_api.g_varchar2_table(607) := '7928736368656D612E656E756D29297B0A20202020202020206966285B435F415045585F53454C4543542C20435F415045585F524144494F5D2E696E636C7564657328736368656D612E617065782E6974656D7479706529297B0A202020202020202020';
wwv_flow_api.g_varchar2_table(608) := '206C5F67656E657261746564203D2067656E6572617465466F7253656C65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20736368656D612E617065782E6974656D747970652C20736368656D612E';
wwv_flow_api.g_varchar2_table(609) := '61706578293B0A20202020202020207D20656C7365207B0A202020202020202020206C6F67536368656D614572726F722827656E756D206E6F7420737570706F7274656420666F72272C20736368656D612E617065782E6974656D74797065293B20200A';
wwv_flow_api.g_varchar2_table(610) := '20202020202020207D0A2020202020207D20656C7365207B0A202020202020202073776974636828736368656D612E666F726D6174297B0A20202020202020206361736520435F4A534F4E5F464F524D41545F454D41494C3A0A20202020202020202020';
wwv_flow_api.g_varchar2_table(611) := '6C5F67656E657261746564203D207B0A2020202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A20202020';
wwv_flow_api.g_varchar2_table(612) := '202020202020202068746D6C3A20600A3C696E70757420747970653D22656D61696C222069643D222349442322206E616D653D22234944232220235245515549524544232023504C414345484F4C4445522320235041545445524E2320636C6173733D22';
wwv_flow_api.g_varchar2_table(613) := '23414C49474E2320746578745F6669656C6420617065782D6974656D2D74657874222073697A653D2233322220234D494E4C454E4754482320234D41584C454E4754482320646174612D7472696D2D7370616365733D22235452494D5350414345532322';
wwv_flow_api.g_varchar2_table(614) := '20617269612D64657363726962656462793D22234944235F6572726F72223E0A607D3B0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F464F524D41545F5552493A0A202020202020202020206C5F67656E6572';
wwv_flow_api.g_varchar2_table(615) := '61746564203D207B0A2020202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(616) := '2068746D6C3A20600A3C696E70757420747970653D2275726C222069643D222349442322206E616D653D22234944232220235245515549524544232023504C414345484F4C4445522320235041545445524E2320636C6173733D2223414C49474E232074';
wwv_flow_api.g_varchar2_table(617) := '6578745F6669656C6420617065782D6974656D2D74657874222073697A653D2233322220234D494E4C454E4754482320234D41584C454E4754482320646174612D7472696D2D7370616365733D22235452494D535041434553232220617269612D646573';
wwv_flow_api.g_varchar2_table(618) := '63726962656462793D22234944235F6572726F72223E0A607D3B0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F464F524D41545F444154453A0A20202020202020202020696628704F7074696F6E732E617065';
wwv_flow_api.g_varchar2_table(619) := '785F76657273696F6E203E3D435F415045585F56455253494F4E5F32323032297B0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(620) := '77726170706572747970653A2027617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6170657820617065782D6974656D2D777261707065722D2D646174652D7069636B65722D617065782D706F707570272C0A202020202020';
wwv_flow_api.g_varchar2_table(621) := '202020202020202068746D6C3A20600A3C612D646174652D7069636B65722069643D2223494423222023524551554952454423206368616E67652D6D6F6E74683D227472756522206368616E67652D796561723D22747275652220646973706C61792D61';
wwv_flow_api.g_varchar2_table(622) := '733D22706F7075702220646973706C61792D7765656B733D226E756D626572222020234D494E2320234D4158232070726576696F75732D6E6578742D64697374616E63653D226F6E652D6D6F6E7468222073686F772D646179732D6F7574736964652D6D';
wwv_flow_api.g_varchar2_table(623) := '6F6E74683D2276697369626C65222073686F772D6F6E3D22666F6375732220746F6461792D627574746F6E3D22747275652220666F726D61743D2223464F524D415423222076616C69642D6578616D706C653D22234558414D504C45232220796561722D';
wwv_flow_api.g_varchar2_table(624) := '73656C656374696F6E2D72616E67653D22352220636C6173733D22617065782D6974656D2D646174657069636B65722D2D706F707570223E0A20203C696E70757420617269612D686173706F7075703D226469616C6F672220636C6173733D2220617065';
wwv_flow_api.g_varchar2_table(625) := '782D6974656D2D7465787420617065782D6974656D2D646174657069636B657222206E616D653D2223494423222073697A653D22323022206D61786C656E6774683D223230222023504C414345484F4C4445522320747970653D2274657874222069643D';
wwv_flow_api.g_varchar2_table(626) := '22234944235F696E707574222072657175697265643D222220617269612D6C6162656C6C656462793D22234944235F4C4142454C22206D61786C656E6774683D22323535222076616C75653D222356414C554523223E0A20203C627574746F6E20617269';
wwv_flow_api.g_varchar2_table(627) := '612D686173706F7075703D226469616C6F672220617269612D6C6162656C3D2223494E464F232220636C6173733D22612D427574746F6E20612D427574746F6E2D2D63616C656E6461722220746162696E6465783D222D312220747970653D2262757474';
wwv_flow_api.g_varchar2_table(628) := '6F6E2220617269612D64657363726962656462793D22234944235F4C4142454C2220617269612D636F6E74726F6C733D22234944235F696E707574223E0A202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D63616C656E64617222';
wwv_flow_api.g_varchar2_table(629) := '3E0A202020203C2F7370616E3E0A20203C2F627574746F6E3E0A3C2F612D646174652D7069636B65723E0A607D3B0A202020202020202020207D20656C736520696628704F7074696F6E732E617065785F76657273696F6E203E3D435F415045585F5645';
wwv_flow_api.g_varchar2_table(630) := '5253494F4E5F32313032297B0A2020202020202020202020206C5F67656E657261746564203D207B0A202020202020202020202020202069746D65733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974';
wwv_flow_api.g_varchar2_table(631) := '656D2D7772617070657220617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6A6574272C0A202020202020202020202020202068746D6C3A20600A3C6F6A2D696E7075742D646174652069643D222349442322202352455155';
wwv_flow_api.g_varchar2_table(632) := '495245442320636C6173733D22617065782D6A65742D636F6D706F6E656E7420617065782D6974656D2D646174657069636B65722D6A6574206F6A2D696E7075746461746574696D652D646174652D6F6E6C79206F6A2D636F6D706F6E656E74206F6A2D';
wwv_flow_api.g_varchar2_table(633) := '696E7075746461746574696D65206F6A2D666F726D2D636F6E74726F6C206F6A2D746578742D6669656C64222020234D494E2320234D41582320646174612D666F726D61743D2223464F524D415423222020646174612D6A65742D7061747465726E3D22';
wwv_flow_api.g_varchar2_table(634) := '23464F524D4154232220646174612D6D61786C656E6774683D223235352220646174612D6E616D653D22234944232220646174612D6F7261636C652D646174652D76616C75653D222356414C5545232220646174612D73697A653D223332222064617461';
wwv_flow_api.g_varchar2_table(635) := '2D76616C69642D6578616D706C653D22234558414D504C45232220646174652D7069636B65722E6368616E67652D6D6F6E74683D2273656C6563742220646174652D7069636B65722E6368616E67652D796561723D2273656C6563742220646174652D70';
wwv_flow_api.g_varchar2_table(636) := '69636B65722E646179732D6F7574736964652D6D6F6E74683D2276697369626C652220646174652D7069636B65722E73686F772D6F6E3D22666F6375732220646174652D7069636B65722E7765656B2D646973706C61793D226E6F6E652220646973706C';
wwv_flow_api.g_varchar2_table(637) := '61792D6F7074696F6E732E636F6E7665727465722D68696E743D226E6F6E652220646973706C61792D6F7074696F6E732E6D657373616765733D226E6F6E652220646973706C61792D6F7074696F6E732E76616C696461746F722D68696E743D226E6F6E';
wwv_flow_api.g_varchar2_table(638) := '65222074696D652D7069636B65722E74696D652D696E6372656D656E743D2230303A31353A30303A303022207472616E736C6174696F6E732E6E6578742D746578743D224E65787422207472616E736C6174696F6E732E707265762D746578743D225072';
wwv_flow_api.g_varchar2_table(639) := '6576696F7573222076616C75653D222356414C554523223E0A3C2F6F6A2D696E7075742D646174653E0A607D3B0A202020202020202020207D20656C7365207B0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020';
wwv_flow_api.g_varchar2_table(640) := '2020202020202069746D65733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D77726170706572272C0A202020202020202020202020202068746D6C3A20600A20203C696E7075742074797065';
wwv_flow_api.g_varchar2_table(641) := '3D227465787422202352455155495245442320617269612D64657363726962656462793D22234944235F666F726D61745F68656C702220636C6173733D22646174657069636B657220617065782D6974656D2D7465787420617065782D6974656D2D6461';
wwv_flow_api.g_varchar2_table(642) := '74657069636B6572222069643D222349442322206E616D653D222349442322206D61786C656E6774683D22323535222073697A653D223332222076616C75653D222356414C55452322206175746F636F6D706C6574653D226F6666223E0A20203C737061';
wwv_flow_api.g_varchar2_table(643) := '6E20636C6173733D22752D56697375616C6C7948696464656E222069643D22234944235F666F726D61745F68656C70223E457870656374656420666F726D61743A2023464F524D4154233C2F7370616E3E0A607D3B0A202020202020202020207D0A2020';
wwv_flow_api.g_varchar2_table(644) := '202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F464F524D41545F4441544554494D453A0A20202020202020202020696628704F7074696F6E732E617065785F76657273696F6E203E3D435F415045585F56455253494F';
wwv_flow_api.g_varchar2_table(645) := '4E5F32323032297B0A2020202020202020202020206C5F67656E657261746564203D207B0A202020202020202020202020202069746D65733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D77';
wwv_flow_api.g_varchar2_table(646) := '7261707065722D2D646174652D7069636B65722D6170657820617065782D6974656D2D777261707065722D2D646174652D7069636B65722D617065782D706F707570272C0A202020202020202020202020202068746D6C3A20600A3C612D646174652D70';
wwv_flow_api.g_varchar2_table(647) := '69636B65722069643D2223494423222023524551554952454423206368616E67652D6D6F6E74683D227472756522206368616E67652D796561723D22747275652220646973706C61792D61733D22706F7075702220646973706C61792D7765656B733D22';
wwv_flow_api.g_varchar2_table(648) := '6E756D6265722220234D494E2320234D4158232070726576696F75732D6E6578742D64697374616E63653D226F6E652D6D6F6E7468222073686F772D646179732D6F7574736964652D6D6F6E74683D2276697369626C65222073686F772D6F6E3D22666F';
wwv_flow_api.g_varchar2_table(649) := '637573222073686F772D74696D653D2274727565222074696D652D696E6372656D656E742D6D696E7574653D2231352220746F6461792D627574746F6E3D22747275652220666F726D61743D2223464F524D415423222076616C69642D6578616D706C65';
wwv_flow_api.g_varchar2_table(650) := '3D22234558414D504C45232220796561722D73656C656374696F6E2D72616E67653D22352220636C6173733D22617065782D6974656D2D646174657069636B65722D2D706F707570223E0A20203C696E70757420617269612D686173706F7075703D2264';
wwv_flow_api.g_varchar2_table(651) := '69616C6F672220636C6173733D2220617065782D6974656D2D7465787420617065782D6974656D2D646174657069636B657222206E616D653D2223494423222073697A653D22333022206D61786C656E6774683D223330222023504C414345484F4C4445';
wwv_flow_api.g_varchar2_table(652) := '522320747970653D2274657874222069643D22234944235F696E707574222072657175697265643D222220617269612D6C6162656C6C656462793D22234944235F4C4142454C22206D61786C656E6774683D22323535222076616C75653D222356414C55';
wwv_flow_api.g_varchar2_table(653) := '4523223E0A20203C627574746F6E20617269612D686173706F7075703D226469616C6F672220617269612D6C6162656C3D2223494E464F232220636C6173733D22612D427574746F6E20612D427574746F6E2D2D63616C656E6461722220746162696E64';
wwv_flow_api.g_varchar2_table(654) := '65783D222D312220747970653D22627574746F6E2220617269612D64657363726962656462793D22234944235F4C4142454C2220617269612D636F6E74726F6C733D22234944235F696E707574223E0A202020203C7370616E20636C6173733D22612D49';
wwv_flow_api.g_varchar2_table(655) := '636F6E2069636F6E2D63616C656E6461722D74696D65223E0A202020203C2F7370616E3E0A20203C2F627574746F6E3E0A3C2F612D646174652D7069636B65723E0A607D3B0A202020202020202020207D20656C736520696628704F7074696F6E732E61';
wwv_flow_api.g_varchar2_table(656) := '7065785F76657273696F6E203E3D435F415045585F56455253494F4E5F32313032297B0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(657) := '202077726170706572747970653A2027617065782D6974656D2D7772617070657220617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6A6574272C0A202020202020202020202020202068746D6C3A20600A3C6F6A2D696E70';
wwv_flow_api.g_varchar2_table(658) := '75742D646174652D74696D652069643D222349442322202352455155495245442320636C6173733D22617065782D6A65742D636F6D706F6E656E7420617065782D6974656D2D646174657069636B65722D6A6574206F6A2D696E7075746461746574696D';
wwv_flow_api.g_varchar2_table(659) := '652D646174652D74696D65206F6A2D636F6D706F6E656E74206F6A2D696E7075746461746574696D65206F6A2D666F726D2D636F6E74726F6C206F6A2D746578742D6669656C642220234D494E2320234D41582320646174612D666F726D61743D222346';
wwv_flow_api.g_varchar2_table(660) := '4F524D415423222020646174612D6A65742D7061747465726E3D2223464F524D4154232220646174612D6D61786C656E6774683D223235352220646174612D6E616D653D22234944232220646174612D6F7261636C652D646174652D76616C75653D2223';
wwv_flow_api.g_varchar2_table(661) := '56414C5545232220646174612D73697A653D2233322220646174612D76616C69642D6578616D706C653D22234558414D504C45232220646174652D7069636B65722E6368616E67652D6D6F6E74683D2273656C6563742220646174652D7069636B65722E';
wwv_flow_api.g_varchar2_table(662) := '6368616E67652D796561723D2273656C6563742220646174652D7069636B65722E646179732D6F7574736964652D6D6F6E74683D2276697369626C652220646174652D7069636B65722E73686F772D6F6E3D22666F6375732220646174652D7069636B65';
wwv_flow_api.g_varchar2_table(663) := '722E7765656B2D646973706C61793D226E6F6E652220646973706C61792D6F7074696F6E732E636F6E7665727465722D68696E743D226E6F6E652220646973706C61792D6F7074696F6E732E6D657373616765733D226E6F6E652220646973706C61792D';
wwv_flow_api.g_varchar2_table(664) := '6F7074696F6E732E76616C696461746F722D68696E743D226E6F6E6522207472616E736C6174696F6E732E6E6578742D746578743D224E65787422207472616E736C6174696F6E732E707265762D746578743D2250726576696F7573222076616C75653D';
wwv_flow_api.g_varchar2_table(665) := '222356414C554523223E0A3C2F6F6A2D696E7075742D646174652D74696D653E0A607D3B0A202020202020202020207D20656C7365207B0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974';
wwv_flow_api.g_varchar2_table(666) := '656D733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D7772617070657220617065782D6974656D2D777261707065722D2D646174652D7069636B65722D6A6574272C0A202020202020202020';
wwv_flow_api.g_varchar2_table(667) := '202020202068746D6C3A20600A20203C696E70757420747970653D227465787422202352455155495245442320617269612D64657363726962656462793D22234944235F666F726D61745F68656C702220636C6173733D22646174657069636B65722061';
wwv_flow_api.g_varchar2_table(668) := '7065782D6974656D2D7465787420617065782D6974656D2D646174657069636B6572222069643D222349442322206E616D653D222349442322206D61786C656E6774683D22323535222073697A653D223332222076616C75653D222356414C5545232220';
wwv_flow_api.g_varchar2_table(669) := '6175746F636F6D706C6574653D226F6666223E0A20203C7370616E20636C6173733D22752D56697375616C6C7948696464656E222069643D22234944235F666F726D61745F68656C70223E457870656374656420666F726D61743A2023464F524D415423';
wwv_flow_api.g_varchar2_table(670) := '3C2F7370616E3E0A607D3B0A202020202020202020207D0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F464F524D41545F54494D453A0A202020202020202020206C5F67656E657261746564203D207B0A2020';
wwv_flow_api.g_varchar2_table(671) := '202020202020202020206974656D733A20312C0A20202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A20202020202020202020202068746D6C3A20600A3C69';
wwv_flow_api.g_varchar2_table(672) := '6E70757420747970653D2274696D65222069643D222349442322206E616D653D222349442322202352455155495245442320234D494E2320234D41582320636C6173733D22746578745F6669656C6420617065782D6974656D2D7465787422202023504C';
wwv_flow_api.g_varchar2_table(673) := '414345484F4C444552232073697A653D22352220646174612D7472696D2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72222F3E0A607D3B0A202020202020202062726561';
wwv_flow_api.g_varchar2_table(674) := '6B3B0A202020202020202064656661756C743A0A202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020206974656D733A20312C0A202020202020202020202077726170706572747970653A2027617065782D697465';
wwv_flow_api.g_varchar2_table(675) := '6D2D777261707065722D2D746578742D6669656C64272C0A202020202020202020202068746D6C3A20600A3C696E70757420747970653D2274657874222069643D222349442322206E616D653D222349442322202352455155495245442320234D494E4C';
wwv_flow_api.g_varchar2_table(676) := '454E4754482320234D41584C454E475448232023504C414345484F4C4445522320235041545445524E2320636C6173733D2223414C49474E2320746578745F6669656C6420617065782D6974656D2D74657874222073697A653D2233322220646174612D';
wwv_flow_api.g_varchar2_table(677) := '7472696D2D7370616365733D22235452494D535041434553232220617269612D64657363726962656462793D22234944235F6572726F72223E0A607D3B0A202020202020202020207377697463682028736368656D612E617065782E6974656D74797065';
wwv_flow_api.g_varchar2_table(678) := '297B0A202020202020202020206361736520435F415045585F50415353574F52443A0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(679) := '20200A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D70617373776F7264272C0A202020202020202020202020202068746D6C3A20600A3C696E70757420747970653D2270617373';
wwv_flow_api.g_varchar2_table(680) := '776F726422206E616D653D222349442322222073697A653D2233302220235041545445524E23202352455155495245442320234D494E4C454E4754482320234D41584C454E47544823206175746F636F6D706C6574653D2270617373776F726422207661';
wwv_flow_api.g_varchar2_table(681) := '6C75653D22222069643D22234944232220636C6173733D2270617373776F726420617065782D6974656D2D74657874223E0A607D3B0A20202020202020202020627265616B3B202020200A202020202020202020206361736520435F415045585F524943';
wwv_flow_api.g_varchar2_table(682) := '48544558543A0A2020202020202020202020206C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261';
wwv_flow_api.g_varchar2_table(683) := '707065722D2D726963682D746578742D656469746F72272C0A202020202020202020202020202068746D6C3A20600A3C612D726963682D746578742D656469746F722069643D222349442322206E616D653D222349442322206D6F64653D226D61726B64';
wwv_flow_api.g_varchar2_table(684) := '6F776E22202352455155495245442320726561642D6F6E6C793D2223524541444F4E4C59232220646973706C61792D76616C75652D6D6F64653D22706C61696E2D74657874222076697375616C2D6D6F64653D22696E6C696E65222076616C75653D2223';
wwv_flow_api.g_varchar2_table(685) := '51554F544556414C554523223E0A3C2F612D726963682D746578742D656469746F723E0A607D3B0A202020202020202020627265616B3B0A202020202020202020206361736520435F415045585F54455854415245413A0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(686) := '6C5F67656E657261746564203D207B0A20202020202020202020202020206974656D733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D7465787461726561272C0A2020';
wwv_flow_api.g_varchar2_table(687) := '20202020202020202020202068746D6C3A20600A3C64697620636C6173733D22617065782D6974656D2D67726F757020617065782D6974656D2D67726F75702D2D7465787461726561223E0A20203C7465787461726561206E616D653D22234E414D4523';
wwv_flow_api.g_varchar2_table(688) := '2220726F77733D2223524F5753232220636F6C733D22313030222069643D222349442322202352455155495245442320636C6173733D22746578746172656120617065782D6974656D2D74657874617265612220646174612D726573697A61626C653D22';
wwv_flow_api.g_varchar2_table(689) := '7472756522207374796C653D22726573697A653A20626F74683B223E2351554F544556414C5545233C2F74657874617265613E0A3C2F6469763E0A20607D3B0A20202020202020202020627265616B3B0A202020202020202020207D0A20202020202020';
wwv_flow_api.g_varchar2_table(690) := '20627265616B3B0A20202020202020207D0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72537472696E67222C206C5F67656E657261746564293B';
wwv_flow_api.g_varchar2_table(691) := '0A2020202072657475726E286C5F67656E657261746564293B0A20207D3B0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F72206120696E74656765722F6E756D6265722070726F706572747920646570656E6469';
wwv_flow_api.g_varchar2_table(692) := '6E67206F6E20666F726D61742C202E2E2E0A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E657261746546';
wwv_flow_api.g_varchar2_table(693) := '6F724E756D6572696328736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D297B0A20202020736368656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A202020206C6574';
wwv_flow_api.g_varchar2_table(694) := '206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E657261746546';
wwv_flow_api.g_varchar2_table(695) := '6F724E756D65726963222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E64293B0A2020202069662841727261792E6973417272617928736368656D612E656E756D29297B20202F2F206E756D657269632050';
wwv_flow_api.g_varchar2_table(696) := '756C6C646F776E0A2020202020206C5F67656E657261746564203D2067656E6572617465466F7253656C65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20435F415045585F53454C4543542C2073';
wwv_flow_api.g_varchar2_table(697) := '6368656D612E61706578293B0A202020207D20656C7365207B0A20202020202020202020696628736368656D612E617065782E6974656D747970653D3D435F415045585F5043544752415048297B0A2020202020202020202020206C5F67656E65726174';
wwv_flow_api.g_varchar2_table(698) := '6564203D207B0A20202020202020202020202020206974656D733A20312C0A202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D7063742D6772617068272C0A20202020202020202020';
wwv_flow_api.g_varchar2_table(699) := '2020202068746D6C3A600A3C64697620636C6173733D22617065782D6974656D2D7063742D6772617068222069643D22234944232220646174612D73686F772D76616C75653D227472756522223E2356414C5545233C2F6469763E0A607D3B0A20202020';
wwv_flow_api.g_varchar2_table(700) := '2020202020207D20656C736520696628736368656D612E617065782E6974656D747970653D3D435F415045585F53544152524154494E47297B0A20202020202020202020202020206C5F67656E657261746564203D207B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(701) := '202020206974656D733A20312C0A2020202020202020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D737461722D726174696E67272C0A2020202020202020202020202020202068746D6C3A2060';
wwv_flow_api.g_varchar2_table(702) := '0A3C6469762069643D22234944232220636C6173733D22612D53746172526174696E6720617065782D6974656D2D73746172726174696E67223E0A20203C64697620636C6173733D22612D53746172526174696E67222076616C75653D222356414C5545';
wwv_flow_api.g_varchar2_table(703) := '23223E0A202020203C696E70757420747970653D22746578742220617269612D6C6162656C6C656462793D22234944235F4C4142454C222069643D22234944235F494E505554222076616C75653D222356414C55452322206E616D653D22234944222063';
wwv_flow_api.g_varchar2_table(704) := '6C6173733D2220752D76682069732D666F63757361626C652220726F6C653D227370696E627574746F6E2220617269612D76616C75656E6F773D222356414C5545232220617269612D76616C75656D61783D22234D4158232220617269612D76616C7565';
wwv_flow_api.g_varchar2_table(705) := '746578743D222356414C554523223E200A202020203C64697620636C6173733D22612D53746172526174696E672D7374617273223E200A202020203C2F6469763E0A20203C2F6469763E0A3C2F6469763E0A607D3B0A202020202020202020207D20656C';
wwv_flow_api.g_varchar2_table(706) := '7365207B0A202020202020202020202020696628736368656D612E726561644F6E6C79297B0A20202020202020202020202020206C5F67656E657261746564203D207B0A202020202020202020202020202020206974656D733A20312C0A202020202020';
wwv_flow_api.g_varchar2_table(707) := '2020202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D746578742D6669656C64272C0A2020202020202020202020202020202068746D6C3A20273C7370616E2069643D22234944235F444953504C41';
wwv_flow_api.g_varchar2_table(708) := '5922202352455155495245442320636C6173733D22646973706C61795F6F6E6C7920617065782D6974656D2D646973706C61792D6F6E6C792220646174612D6573636170653D2274727565223E2356414C5545233C2F7370616E3E277D3B0A2020202020';
wwv_flow_api.g_varchar2_table(709) := '202020202020207D20656C7365207B0A20202020202020202020202020206C5F67656E657261746564203D207B0A202020202020202020202020202020206974656D733A20312C0A2020202020202020202020202020202077726170706572747970653A';
wwv_flow_api.g_varchar2_table(710) := '2027617065782D6974656D2D777261707065722D2D6E756D6265722D6669656C64272C0A2020202020202020202020202020202068746D6C3A20600A3C696E70757420747970653D2274657874222069643D222349442322206E616D653D222349442322';
wwv_flow_api.g_varchar2_table(711) := '20235245515549524544232023504C414345484F4C4445522320636C6173733D2223414C49474E23206E756D6265725F6669656C6420617065782D6974656D2D7465787420617065782D6974656D2D6E756D626572222073697A653D2233302220234D49';
wwv_flow_api.g_varchar2_table(712) := '4E2320234D41582320646174612D666F726D61743D2223464F524D4154232220696E7075746D6F64653D22646563696D616C22207374796C653D22746578742D616C69676E3A7374617274223E0A607D3B0A202020202020202020207D0A202020202020';
wwv_flow_api.g_varchar2_table(713) := '20207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F724E756D65726963222C206C5F67656E657261746564293B0A2020202072657475726E286C5F67656E65726174';
wwv_flow_api.g_varchar2_table(714) := '6564293B0A20207D3B0A0A20202F2A0A2020202A2067656E6572617465207468652055492D6974656D20666F72206120737472696E672070726F706572747920646570656E64696E67206F6E206974656D747970652E0A2020202A2072657475726E7320';
wwv_flow_api.g_varchar2_table(715) := '7B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F202020200A202066756E6374696F6E2067656E6572617465466F72426F6F6C65616E28736368656D612C20646174612C20707265';
wwv_flow_api.g_varchar2_table(716) := '6669782C206E616D652C207374617274656E642C206E65774974656D297B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A202020207363';
wwv_flow_api.g_varchar2_table(717) := '68656D612E61706578203D20736368656D612E617065787C7C7B7D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72426F6F6C65616E222C20736368656D612C20646174612C2070';
wwv_flow_api.g_varchar2_table(718) := '72656669782C206E616D652C207374617274656E642C206E65774974656D293B0A2020202073776974636828736368656D612E617065782E6974656D74797065297B0A202020206361736520435F415045585F5357495443483A0A2020202020206C5F67';
wwv_flow_api.g_varchar2_table(719) := '656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202077726170706572747970653A2027617065782D6974656D2D777261707065722D2D7965732D6E6F272C0A202020202020202068746D6C3A20600A3C7370';
wwv_flow_api.g_varchar2_table(720) := '616E20636C6173733D22612D537769746368223E0A20203C696E70757420747970653D22636865636B626F78222069643D222349442322206E616D653D22234944232220636C6173733D22222076616C75653D22592220646174612D6F6E2D6C6162656C';
wwv_flow_api.g_varchar2_table(721) := '3D224F6E2220646174612D6F66662D76616C75653D224E2220646174612D6F66662D6C6162656C3D224F6666223E0A20203C7370616E20636C6173733D22612D5377697463682D746F67676C65223E3C2F7370616E3E0A3C2F7370616E3E0A607D3B2020';
wwv_flow_api.g_varchar2_table(722) := '0A20202020627265616B3B0A202020206361736520435F415045585F53454C4543543A0A202020206361736520435F415045585F524144494F3A0A2020202020206C6574206C5F61706578203D207B2E2E2E736368656D612E617065787D3B0A20202020';
wwv_flow_api.g_varchar2_table(723) := '20206C5F617065782E656E756D203D207B4E3A20224E6F222C20593A2022596573227D3B0A2020202020206C6574206C5F67656E203D2067656E6572617465466F72537472696E67287B2274797065223A2022737472696E67222C202269735265717569';
wwv_flow_api.g_varchar2_table(724) := '726564223A20736368656D612E697352657175697265642C2022656E756D223A205B224E222C202259225D2C202261706578223A206C5F617065787D2C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D29';
wwv_flow_api.g_varchar2_table(725) := '3B0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202077726170706572747970653A2028736368656D612E617065782E6974656D747970653D3D435F415045585F53454C45435429';
wwv_flow_api.g_varchar2_table(726) := '3F27617065782D6974656D2D777261707065722D2D73696E676C652D636865636B626F78273A27617065782D6974656D2D777261707065722D2D726164696F67726F7570272C0A202020202020202068746D6C3A206C5F67656E2E68746D6C0A20202020';
wwv_flow_api.g_varchar2_table(727) := '20207D3B0A20202020627265616B3B0A2020202064656661756C743A0A2020202020206C5F67656E657261746564203D207B0A20202020202020206974656D733A20312C0A202020202020202077726170706572747970653A2027617065782D6974656D';
wwv_flow_api.g_varchar2_table(728) := '2D777261707065722D2D73696E676C652D636865636B626F78272C0A202020202020202068746D6C3A20600A3C64697620636C6173733D22617065782D6974656D2D73696E676C652D636865636B626F78223E0A20203C696E70757420747970653D2268';
wwv_flow_api.g_varchar2_table(729) := '696464656E22206E616D653D22234944232220636C6173733D22222069643D22234944235F48494444454E56414C5545222076616C75653D222356414C554523223E0A20203C696E70757420747970653D22636865636B626F78222023434845434B4544';
wwv_flow_api.g_varchar2_table(730) := '2320235245515549524544232069643D22234944232220617269612D6C6162656C3D22234C4142454C232220646174612D756E636865636B65642D76616C75653D224E222076616C75653D2259223E0A20203C6C6162656C20666F723D22234944232220';
wwv_flow_api.g_varchar2_table(731) := '69643D22234944235F4C4142454C2220636C6173733D2220752D636865636B626F782220617269612D68696464656E3D2274727565223E234C4142454C233C2F6C6162656C3E0A3C2F6469763E0A607D3B202020200A202020207D0A2020202061706578';
wwv_flow_api.g_varchar2_table(732) := '2E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F72426F6F6C65616E222C206C5F67656E657261746564293B0A2020202072657475726E20286C5F67656E657261746564293B0A20207D0A0A20202F2A0A2020';
wwv_flow_api.g_varchar2_table(733) := '202A2067656E6572617465207468652055492D6974656D20666F72206120737472696E672070726F706572747920646570656E64696E67206F6E206974656D747970652E0A2020202A2043757272656E746C79206F6E6C7920617272617973206F662073';
wwv_flow_api.g_varchar2_table(734) := '696D706C6520747970657320776974682022656E756D220A2020202A2072657475726E73207B6974656D733A20302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D200A20202A2F20200A202066756E6374696F6E20';
wwv_flow_api.g_varchar2_table(735) := '67656E6572617465466F72417272617928736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D297B0A202020206C6574206C5F67656E657261746564203D207B697465';
wwv_flow_api.g_varchar2_table(736) := '6D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F724172726179222C20736368656D612C2064';
wwv_flow_api.g_varchar2_table(737) := '6174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A202020206C6574206974656D203D20736368656D612E6974656D737C7C7B7D3B0A2020202064617461203D2064617461207C7C20';
wwv_flow_api.g_varchar2_table(738) := '5B5D3B0A2020202069662841727261792E69734172726179286461746129297B0A2020202020206966282041727261792E69734172726179286974656D2E656E756D29297B20202F2F207768656E20746865726520697320616E20656E756D2C20746869';
wwv_flow_api.g_varchar2_table(739) := '7320617272617920666F722061206D756C746973656C656374696F6E0A20202020202020206966285B435F4A534F4E5F535452494E472C20435F4A534F4E5F494E54454745522C20435F4A534F4E5F4E554D4245525D2E696E636C75646573286974656D';
wwv_flow_api.g_varchar2_table(740) := '2E7479706529297B0A202020202020202020206C5F67656E6572617465642E6974656D73203D313B0A20202020202020202020696628704F7074696F6E732E617065785F76657273696F6E203E3D435F415045585F56455253494F4E5F32333032202626';
wwv_flow_api.g_varchar2_table(741) := '2028736368656D612E617065782E6974656D747970653D3D435F415045585F434F4D424F207C7C20286974656D2E61706578202626206974656D2E617065782E6974656D747970653D3D435F415045585F434F4D424F2929297B0A202020202020202020';
wwv_flow_api.g_varchar2_table(742) := '2020206C5F67656E657261746564203D2067656E6572617465466F72436F6D626F286974656D2C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A202020202020202020207D20656C7365207B0A20';
wwv_flow_api.g_varchar2_table(743) := '20202020202020202020206C5F67656E657261746564203D202067656E6572617465466F7253656C656374286974656D2C20646174612C207072656669782C206E616D652C207374617274656E642C20435F415045585F434845434B424F582C20736368';
wwv_flow_api.g_varchar2_table(744) := '656D612E61706578293B0A202020202020202020207D0A20202020202020207D20656C7365207B0A202020202020202020206C6F67536368656D614572726F7228272274797065223A3A20226172726179222073696D706C65207479706520737472696E';
wwv_flow_api.g_varchar2_table(745) := '67207769746820656E756D206F6E6C79272C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E64293B0A20202020202020207D0A2020202020207D20656C7365207B20202F2F206C6F6F70207468726F75676820';
wwv_flow_api.g_varchar2_table(746) := '74686520617272617920616E642067656E657261746520616E206F626A65637420666F72206561636820726F770A2020202020202020696628704F7074696F6E732E68656164657273297B0A202020202020202020206C5F67656E6572617465642E6874';
wwv_flow_api.g_varchar2_table(747) := '6D6C203D2067656E6572617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C207072656669782C2066616C73652C202743524541544527293B0A20202020202020207D0A20202020';
wwv_flow_api.g_varchar2_table(748) := '20202020666F7228636F6E737420206920696E206461746129207B0A20202020202020202020636F6E7374206C5F67656E203D2067656E6572617465466F724F626A656374286974656D2C20646174615B695D2C207072656669782C202727202B692C20';
wwv_flow_api.g_varchar2_table(749) := '7374617274656E642C20747275652C206E65774974656D293B0A202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A20202020202020207D0A0A0A2020202020207D0A202020207D20656C7365207B';
wwv_flow_api.g_varchar2_table(750) := '0A2020202020206C6F67536368656D614572726F72282764617461206D75737420626520616E206172726179272C2064617461293B0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572';
wwv_flow_api.g_varchar2_table(751) := '617465466F724172726179222C206C5F67656E657261746564293B2020200A2020202072657475726E286C5F67656E657261746564293B0A20207D0A0A0A20202F2A0A2020202A0A20202A2F0A202066756E6374696F6E20636865636B436F6E64697469';
wwv_flow_api.g_varchar2_table(752) := '6F6E28736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E636865636B436F6E646974696F6E222C20736368656D61293B0A0A202020206C6574206C5F726574203D2028747970656F66207363';
wwv_flow_api.g_varchar2_table(753) := '68656D61203D3D276F626A65637427202626202141727261792E6973417272617928736368656D6129293B0A202020206966286C5F72657420262620736368656D612E616C6C4F66297B202020200A2020202020206C5F726574203D2041727261792E69';
wwv_flow_api.g_varchar2_table(754) := '73417272617928736368656D612E616C6C4F66293B0A2020202020206966286C5F726574297B202020202F2F20616C6C4F6620697320646566696E656420616E6420616E2061727261790A2020202020202020666F7228636F6E7374206C5F736368656D';
wwv_flow_api.g_varchar2_table(755) := '61206F6620736368656D612E616C6C4F66297B0A202020202020202020206C5F726574203D206C5F72657420262620636865636B436F6E646974696F6E286C5F736368656D61293B0A20202020202020207D20200A2020202020207D2020200A20202020';
wwv_flow_api.g_varchar2_table(756) := '7D0A202020206966286C5F72657420262620736368656D612E616E794F66297B202020200A2020202020206C5F726574203D2041727261792E6973417272617928736368656D612E616E794F66293B2020200A2020202020206966286C5F726574297B20';
wwv_flow_api.g_varchar2_table(757) := '202020202F2F20616E794F6620697320646566696E656420616E6420616E2061727261790A2020202020202020666F7228636F6E7374206C5F736368656D61206F6620736368656D612E616E794F66297B0A202020202020202020206C5F726574203D20';
wwv_flow_api.g_varchar2_table(758) := '6C5F72657420262620636865636B436F6E646974696F6E286C5F736368656D61293B0A20202020202020207D0A2020202020207D20200A202020207D0A0A202020206966286C5F72657420262620736368656D612E6E6F74297B20202F2F206E6F742069';
wwv_flow_api.g_varchar2_table(759) := '7320646566696E656420616E6420616E206F626A656374200A2020202020206C5F726574203D2028747970656F6620736368656D612E6E6F74203D3D20276F626A65637427293B2020200A2020202020206C5F726574203D206C5F726574202626206368';
wwv_flow_api.g_varchar2_table(760) := '65636B436F6E646974696F6E28736368656D612E6E6F74293B200A202020207D0A202020200A202020206966286C5F72657420262620736368656D612E7265717569726564297B20202F2F20726571756972656420697320646566696E656420616E6420';
wwv_flow_api.g_varchar2_table(761) := '616E206172726179200A2020202020206C5F726574203D202841727261792E6973417272617928736368656D612E726571756972656429293B2020200A202020207D0A0A202020206966286C5F72657420262620736368656D612E70726F706572746965';
wwv_flow_api.g_varchar2_table(762) := '73297B20202F2F206E6F7420697320646566696E656420616E6420616E206F626A656374200A2020202020206C5F726574203D2028747970656F6620736368656D612E70726F70657274696573203D3D20276F626A65637427293B200A2020202020206C';
wwv_flow_api.g_varchar2_table(763) := '5F726574203D206C5F72657420262620636865636B436F6E646974696F6E28736368656D612E70726F70657274696573293B20200A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E636865636B43';
wwv_flow_api.g_varchar2_table(764) := '6F6E646974696F6E222C206C5F726574293B0A2020202072657475726E206C5F7265743B0A20207D0A0A20202F2A0A2020202A2067656E657261746520554920666F7220636F6E646974696F6E616C20736368656D6120776974682069662F7468656E2F';
wwv_flow_api.g_varchar2_table(765) := '656C73650A2020202A2072657475726E73207B6974656D733A302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D200A20202A2F0A202066756E6374696F6E2067656E6572617465466F72436F6E646974696F6E616C';
wwv_flow_api.g_varchar2_table(766) := '28736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D297B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C20777261707065727479';
wwv_flow_api.g_varchar2_table(767) := '70653A206E756C6C2C2068746D6C3A2027277D3B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465466F72436F6E646974696F6E616C222C20736368656D612C20646174612C207072656669';
wwv_flow_api.g_varchar2_table(768) := '782C206E616D652C20696E41727261792C207374617274656E64293B0A0A20202020696628747970656F6620736368656D612E6966203D3D20276F626A65637427297B20202F2F207468657265206973206120636F6E646974696F6E616C20736368656D';
wwv_flow_api.g_varchar2_table(769) := '610A2020202020202F2F2055492069732067656E65726174656420666F72205448454E20616E6420454C53452C2073657420746F2068696464656E20646570656E64696E67206F6E2069662D636C617573650A202020202020696628636865636B436F6E';
wwv_flow_api.g_varchar2_table(770) := '646974696F6E28736368656D612E696629297B0A2020202020202020696628736368656D612E7468656E297B0A20202020202020202020696628736368656D612E7468656E2E70726F70657274696573297B0A202020202020202020202020666F72286C';
wwv_flow_api.g_varchar2_table(771) := '6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E7468656E2E70726F706572746965737C7C7B7D29297B0A20202020202020202020202020206C6574206C5F67656E203D2067656E65';
wwv_flow_api.g_varchar2_table(772) := '72617465466F724F626A656374286C5F736368656D612C20646174615B6C5F6E616D655D2C20287072656669783F7072656669782B435F44454C494D495445523A2727292B6E616D652C206C5F6E616D652C207374617274656E642C2066616C73652C20';
wwv_flow_api.g_varchar2_table(773) := '6E65774974656D293B0A20202020202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A2020202020202020202020207D0A202020202020202020207D0A20202020202020207D0A0A20202020202020';
wwv_flow_api.g_varchar2_table(774) := '20696628736368656D612E656C7365297B20202F2F207769746820656C73650A20202020202020202020696628736368656D612E656C73652E70726F70657274696573297B0A202020202020202020202020666F72286C6574205B6C5F6E616D652C206C';
wwv_flow_api.g_varchar2_table(775) := '5F736368656D615D206F66204F626A6563742E656E747269657328736368656D612E656C73652E70726F706572746965737C7C7B7D29297B0A20202020202020202020202020206C6574206C5F67656E203D2067656E6572617465466F724F626A656374';
wwv_flow_api.g_varchar2_table(776) := '286C5F736368656D612C20646174615B6C5F6E616D655D2C20287072656669783F7072656669782B435F44454C494D495445523A2727292B6E616D652C206C5F6E616D652C207374617274656E642C2066616C73652C206E65774974656D293B0A202020';
wwv_flow_api.g_varchar2_table(777) := '20202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A2020202020202020202020207D0A202020202020202020207D0A20202020202020207D0A2020202020207D20656C7365207B0A202020202020';
wwv_flow_api.g_varchar2_table(778) := '20206C6F67536368656D614572726F722827696E76616C696420636F6E646974696F6E272C20736368656D612E69662920200A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E';
wwv_flow_api.g_varchar2_table(779) := '67656E6572617465466F72436F6E646974696F6E616C222C206C5F67656E657261746564293B200A2020202072657475726E286C5F67656E657261746564293B0A20207D0A0A20202F2A0A2020202A2047656E6572617465206120736570617261746F72';
wwv_flow_api.g_varchar2_table(780) := '206C696E6520286E657720726F772920696E2074686520415045582D55490A2020202A205768656E2061206C6162656C20697320676976656E2061646420697420746F20746865206C696E650A2020202A20546865206964206973207265717569726564';
wwv_flow_api.g_varchar2_table(781) := '20746F2073686F772F686964652074686520636F6E74656E74206F662074686520726F7720666F7220636F6E646974696F6E616C20736368656D610A2020202A2072657475726E73207468652068746D6C200A20202A2F0A202066756E6374696F6E2067';
wwv_flow_api.g_varchar2_table(782) := '656E6572617465536570617261746F7228736368656D612C206C6162656C2C2069642C20696E41727261792C20627574746F6E297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465536570';
wwv_flow_api.g_varchar2_table(783) := '617261746F72222C206C6162656C2C2069642C20696E41727261792C20627574746F6E293B200A202020206C6574206C5F68746D6C203D27273B0A2020202069662821696E4172726179202626206C6162656C29207B202020202F2F2054686572652069';
wwv_flow_api.g_varchar2_table(784) := '732061206C6162656C2C207075742061206C696E6520776974682074686520746578740A2020202020206C5F68746D6C202B3D20600A3C2F6469763E0A3C64697620636C6173733D22726F77206A736F6E726567696F6E223E0A20203C64697620636C61';
wwv_flow_api.g_varchar2_table(785) := '73733D22742D526567696F6E2D686561646572223E0A202020203C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F6E2D6865616465724974656D732D2D7469746C65223E0A2020202020203C68322063';
wwv_flow_api.g_varchar2_table(786) := '6C6173733D22742D526567696F6E2D7469746C65222069643D22234944235F68656164696E672220646174612D617065782D68656164696E673D22223E234C4142454C233C2F68323E0A202020203C2F6469763E0A20603B0A202020207D0A200A202020';
wwv_flow_api.g_varchar2_table(787) := '20696628627574746F6E2026262021736368656D612E726561644F6E6C79297B20202F2F200A2020202020206C5F68746D6C202B3D20600A202020203C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F';
wwv_flow_api.g_varchar2_table(788) := '6E2D6865616465724974656D732D2D627574746F6E73223E0A2020202020203C627574746F6E2069643D22234944235F4352454154452220747970653D22627574746F6E2220636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C61';
wwv_flow_api.g_varchar2_table(789) := '62656C20742D427574746F6E2D2D69636F6E206A732D69676E6F72654368616E6765206C746F33333135333836393834383630343539325F3022207469746C653D224372656174652220617269612D6C6162656C3D22437265617465223E0A2020202020';
wwv_flow_api.g_varchar2_table(790) := '2020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D69672D6164642D726F772220617269612D68696464656E3D2274727565223E3C2F7370616E3E0A2020202020203C2F627574746F6E3E0A202020203C2F6469763E0A20203C2F6469';
wwv_flow_api.g_varchar2_table(791) := '763E0A603B0A202020207D20656C7365207B0A2020202020206C5F68746D6C202B3D20600A20203C2F6469763E0A603B0A202020207D0A0A202020206C5F68746D6C202B3D20600A3C2F6469763E0A3C6469762069643D22234944235F434F4E5441494E';
wwv_flow_api.g_varchar2_table(792) := '45522220636C6173733D22726F77206A736F6E726567696F6E202343535323223E0A20603B0A0A202020206C5F68746D6C203D20617065782E7574696C2E6170706C7954656D706C617465286C5F68746D6C2C200A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(793) := '20202020202020202020202020202020202020202020207B200A20202020202020202020202020202020202020202020202020202020202020202020202020202020706C616365686F6C646572733A207B0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(794) := '202020202020202020202020202020202020202020202020224C4142454C223A206C6162656C2C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020224944223A2020202069642C0A2020202020';
wwv_flow_api.g_varchar2_table(795) := '2020202020202020202020202020202020202020202020202020202020202020202020202022435353223A20202028736368656D612E747970653D3D435F4A534F4E5F4F424A454354293F28736368656D612E617065782E6373737C7C2727293A27270A';
wwv_flow_api.g_varchar2_table(796) := '202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020202020202020202020202020202020202020207D293B0A0A20202020617065782E64656275672E';
wwv_flow_api.g_varchar2_table(797) := '747261636528223C3C6A736F6E526567696F6E2E67656E6572617465536570617261746F7222293B200A2020202072657475726E286C5F68746D6C293B0A20207D0A0A2020200A202066756E6374696F6E2067656E6572617465417272617944656C6574';
wwv_flow_api.g_varchar2_table(798) := '65427574746F6E28646174616974656D297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465417272617944656C657465427574746F6E222C20646174616974656D293B200A202020206C65';
wwv_flow_api.g_varchar2_table(799) := '74206C5F68746D6C203D20600A3C64697620636C6173733D22742D526567696F6E2D6865616465724974656D7320742D526567696F6E2D6865616465724974656D732D2D627574746F6E73223E0A20203C627574746F6E2069643D22234944235F44454C';
wwv_flow_api.g_varchar2_table(800) := '4554452220747970653D22627574746F6E2220636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E206A732D69676E6F72654368616E6765206C746F33333135333836393834383630';
wwv_flow_api.g_varchar2_table(801) := '343539325F3022207469746C653D2244656C6574652220617269612D6C6162656C3D22437265617465223E0A202020203C7370616E20636C6173733D22612D49636F6E2069636F6E2D69672D64656C6574652220617269612D68696464656E3D22747275';
wwv_flow_api.g_varchar2_table(802) := '65223E3C2F7370616E3E0A20203C2F627574746F6E3E0A3C2F6469763E0A603B0A202020206C5F68746D6C203D20617065782E7574696C2E6170706C7954656D706C617465286C5F68746D6C2C207B20706C616365686F6C646572733A207B224944223A';
wwv_flow_api.g_varchar2_table(803) := '20646174616974656D7D207D20293B0A0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465417272617944656C657465427574746F6E22293B200A2020202072657475726E206C5F68746D6C3B';
wwv_flow_api.g_varchar2_table(804) := '0A20207D0A0A20202F2A0A2020202A2067656E657261746520666F722061207461656D706C6174652074686520636C617373657320666F7220737461636B6C65642C20666C6F6174696E672C2072656C2D636F6C2C2068696464656E0A2020202A205265';
wwv_flow_api.g_varchar2_table(805) := '7475726E73203A7B636F6E7461696E65723A2027616161272C206C6162656C3A2027626262272C20696E7075743A2027636363277D0A2020202A2054686520636C617373657320666F7220746865206974656D20636F6E7461696E65722C20666F72206C';
wwv_flow_api.g_varchar2_table(806) := '6162656C20616E6420696E7075740A20202A2F0A202066756E6374696F6E2067656E54656D706C6174652874656D706C6174652C20636F6C77696474682C20736368656D61297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E';
wwv_flow_api.g_varchar2_table(807) := '526567696F6E2E67656E54656D706C617465222C2074656D706C6174652C20636F6C77696474682C20736368656D61293B200A202020206C6574206C5F726574203D207B7D3B0A2020202073776974636828736368656D612E617065782E74656D706C61';
wwv_flow_api.g_varchar2_table(808) := '74657C7C74656D706C617465297B0A202020206361736520435F415045585F54454D504C4154455F4C4142454C5F48494444454E3A0A2020202020206C5F726574203D207B0A20202020202020202020202020202020636F6E7461696E65723A2027742D';
wwv_flow_api.g_varchar2_table(809) := '466F726D2D6669656C64436F6E7461696E65722D2D68696464656E4C6162656C2072656C2D636F6C272C0A202020202020202020202020202020206C6162656C3A2027742D466F726D2D6669656C64436F6E7461696E65722D2D68696464656E4C616265';
wwv_flow_api.g_varchar2_table(810) := '6C20636F6C20636F6C2D32272C0A20202020202020202020202020202020696E7075743A2027636F6C20636F6C2D27202B204D6174682E6D617828312C20636F6C77696474682D32292C0A2020202020202020202020202020202068696464656E3A2027';
wwv_flow_api.g_varchar2_table(811) := '752D56697375616C6C7948696464656E270A20202020202020202020202020207D3B20200A20202020627265616B3B200A202020206361736520435F415045585F54454D504C4154455F4C4142454C5F4C4546543A200A2020202020206C5F726574203D';
wwv_flow_api.g_varchar2_table(812) := '207B0A20202020202020202020202020202020636F6E7461696E65723A202772656C2D636F6C272C0A202020202020202020202020202020206C6162656C3A2027636F6C20636F6C2D32272C0A20202020202020202020202020202020696E7075743A20';
wwv_flow_api.g_varchar2_table(813) := '27636F6C20636F6C2D27202B204D6174682E6D617828312C20636F6C77696474682D32292C0A2020202020202020202020202020202068696464656E3A2027270A20202020202020202020202020207D3B0A20202020627265616B3B0A20202020636173';
wwv_flow_api.g_varchar2_table(814) := '6520435F415045585F54454D504C4154455F4C4142454C5F41424F56453A200A2020202020206C5F726574203D207B0A20202020202020202020202020202020636F6E7461696E65723A2027742D466F726D2D6669656C64436F6E7461696E65722D2D73';
wwv_flow_api.g_varchar2_table(815) := '7461636B6564272C0A202020202020202020202020202020206C6162656C3A2027272C0A20202020202020202020202020202020696E7075743A2027272C0A2020202020202020202020202020202068696464656E3A2027270A20202020202020202020';
wwv_flow_api.g_varchar2_table(816) := '202020207D3B0A20202020627265616B3B0A202020206361736520435F415045585F54454D504C4154455F4C4142454C5F464C4F4154494E473A200A2020202064656661756C743A200A2020202020206C5F726574203D207B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(817) := '202020202020636F6E7461696E65723A2027742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C272C0A202020202020202020202020202020206C6162656C3A2027272C0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(818) := '696E7075743A2027272C0A2020202020202020202020202020202068696464656E3A2027270A20202020202020202020202020207D3B3B0A20202020627265616B3B0A202020207D0A0A20202020617065782E64656275672E747261636528223C3C6A73';
wwv_flow_api.g_varchar2_table(819) := '6F6E526567696F6E2E67656E54656D706C617465222C206C5F726574293B200A2020202072657475726E206C5F7265743B0A20207D0A0A20202F2A0A2020202A2067656E657261746520554920666F7220616E206F626A65637420736368656D612C2066';
wwv_flow_api.g_varchar2_table(820) := '6F6C6C6F77206E657374656420736368656D6173200A2020202A2072657475726E73207B6974656D733A302C2077726170706572747970653A2022787878222C2068746D6C3A2022787878227D0A20202A2F0A202066756E6374696F6E2067656E657261';
wwv_flow_api.g_varchar2_table(821) := '7465466F724F626A65637428736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D297B0A20202020736368656D612E61706578203D20736368656D612E61706578207C';
wwv_flow_api.g_varchar2_table(822) := '7C7B7D3B0A202020206C6574206C5F67656E657261746564203D207B6974656D733A20302C2077726170706572747970653A206E756C6C2C2068746D6C3A2027277D3B0A0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567';
wwv_flow_api.g_varchar2_table(823) := '696F6E2E67656E6572617465466F724F626A656374222C20736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A0A202020206966282827272B6E616D65292E73';
wwv_flow_api.g_varchar2_table(824) := '74617274735769746828275F2729297B2020202F2F2069676E6F72652070726F7065727469657320686176696E67206E616D6573207374617274696E67207769746820225F220A2020202020202020617065782E64656275672E747261636528223C3C6A';
wwv_flow_api.g_varchar2_table(825) := '736F6E526567696F6E2E67656E6572617465466F724F626A656374222C206C5F67656E657261746564293B0A202020202020202072657475726E206C5F67656E6572617465643B0A202020207D0A0A2020202073776974636828736368656D612E747970';
wwv_flow_api.g_varchar2_table(826) := '65297B0A20202020202020206361736520226172726179223A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F72417272617928736368656D612C20646174612C20287072656669783F7072656669782B435F4445';
wwv_flow_api.g_varchar2_table(827) := '4C494D495445523A2727292B6E616D652C206E616D652C207374617274656E642C20747275652C206E65774974656D293B0A2020202020202020627265616B3B0A20202020202020206361736520226F626A656374223A202F2F20616E206F626A656374';
wwv_flow_api.g_varchar2_table(828) := '2C20736F2067656E657261746520616C6C206F66206974732070726F706572746965730A2020202020202020202064617461203D2064617461207C7C277B7D273B0A20202020202020202020696628704F7074696F6E732E68656164657273297B0A2020';
wwv_flow_api.g_varchar2_table(829) := '202020202020202020206C5F67656E6572617465642E68746D6C203D2067656E6572617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C2067656E4974656D6E616D652870726566';
wwv_flow_api.g_varchar2_table(830) := '69782C206E616D65292C20696E41727261792C206E756C6C293B0A202020202020202020207D0A20202020202020202020666F72286C6574205B6C5F6E616D652C206C5F736368656D615D206F66204F626A6563742E656E747269657328736368656D61';
wwv_flow_api.g_varchar2_table(831) := '2E70726F706572746965737C7C7B7D29297B0A2020202020202020202020207374617274656E64203D20303B202F2F6C5F726F773D3D313F2D313A286C5F726F773E3D4F626A6563742E6B65797328736368656D612E70726F70657274696573292E6C65';
wwv_flow_api.g_varchar2_table(832) := '6E6774683F313A30293B0A2020202020202020202020206C6574206C5F67656E203D2067656E6572617465466F724F626A656374286C5F736368656D612C20646174615B6C5F6E616D655D2C20287072656669783F7072656669782B435F44454C494D49';
wwv_flow_api.g_varchar2_table(833) := '5445523A2727292B6E616D652C206C5F6E616D652C207374617274656E642C2066616C73652C206E65774974656D293B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D206C5F67656E2E68746D6C3B0A20202020202020';
wwv_flow_api.g_varchar2_table(834) := '20202020206C5F67656E6572617465642E6974656D73202B3D206C5F67656E2E6974656D733B0A202020202020202020207D0A0A202020202020202020207B0A2020202020202020202020206C6574206C5F67656E203D2067656E6572617465466F7243';
wwv_flow_api.g_varchar2_table(835) := '6F6E646974696F6E616C28736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D20';
wwv_flow_api.g_varchar2_table(836) := '6C5F67656E2E68746D6C3B0A2020202020202020202020206C5F67656E6572617465642E6974656D73202B3D206C5F67656E2E6974656D733B0A202020202020202020207D0A0A20202020202020202020696628696E4172726179202626202173636865';
wwv_flow_api.g_varchar2_table(837) := '6D612E726561644F6E6C79297B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D2067656E6572617465417272617944656C657465427574746F6E2867656E4974656D6E616D65287072656669782C206E616D6529293B0A';
wwv_flow_api.g_varchar2_table(838) := '202020202020202020207D0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F535452494E473A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F72537472696E6728736368';
wwv_flow_api.g_varchar2_table(839) := '656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A2020202020202020627265616B3B0A0A20202020202020206361736520435F4A534F4E5F494E54454745523A0A20202020202020206361';
wwv_flow_api.g_varchar2_table(840) := '736520435F4A534F4E5F4E554D4245523A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F724E756D6572696328736368656D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E';
wwv_flow_api.g_varchar2_table(841) := '65774974656D293B0A2020202020202020627265616B3B0A20202020202020206361736520435F4A534F4E5F424F4F4C45414E3A0A202020202020202020206C5F67656E657261746564203D2067656E6572617465466F72426F6F6C65616E2873636865';
wwv_flow_api.g_varchar2_table(842) := '6D612C20646174612C207072656669782C206E616D652C207374617274656E642C206E65774974656D293B0A2020202020202020627265616B3B0A20202020202020206361736520756E646566696E65643A20202F2F206E6F20747970652C20736F2064';
wwv_flow_api.g_varchar2_table(843) := '6F206E6F7468696E670A2020202020202020202069662821435F4A534F4E5F434F4E535420696E20736368656D61297B202F2F206120636F6E737420646F65736E2774206E656564206120747970650A2020202020202020202020206C6F67536368656D';
wwv_flow_api.g_varchar2_table(844) := '614572726F72282722747970652220697320756E646566696E656427293B0A202020202020202020207D0A2020202020202020627265616B0A20202020202020206361736520276E756C6C273A0A2020202020202020627265616B3B202020200A202020';
wwv_flow_api.g_varchar2_table(845) := '202020202064656661756C743A0A202020202020202020206C6F67536368656D614572726F7228272274797065223A206E6F7420696D706C656D656E746564272C20736368656D612E74797065293B0A2020202020202020627265616B3B0A2020202020';
wwv_flow_api.g_varchar2_table(846) := '207D0A0A2020202020206966286C5F67656E6572617465642E7772617070657274797065297B202F2F20696E707574206974656D732069732067656E6572617465640A20202020202020206C6574206C6162656C203D2067656E65726174654C6162656C';
wwv_flow_api.g_varchar2_table(847) := '286E616D652C20736368656D61293B0A20202020202020206C6574206C5F6572726F72203D2027273B0A2020202020202020696628704F7074696F6E732E617065785F76657273696F6E3E3D435F415045585F56455253494F4E5F3232303129207B200A';
wwv_flow_api.g_varchar2_table(848) := '202020202020202020206C5F6572726F72203D20600A3C64697620636C6173733D22742D466F726D2D6974656D417373697374616E6365223E0A20203C7370616E2069643D22234944235F6572726F725F706C616365686F6C6465722220636C6173733D';
wwv_flow_api.g_varchar2_table(849) := '22612D466F726D2D6572726F7220752D76697369626C652220646174612D74656D706C6174652D69643D22234441544154454D504C41544523223E3C2F7370616E3E0A20203C64697620636C6173733D22742D466F726D2D6974656D5265717569726564';
wwv_flow_api.g_varchar2_table(850) := '2220617269612D68696464656E3D2274727565223E52657175697265643C2F6469763E0A3C2F6469763E0A60200A20202020202020207D20656C7365207B0A202020202020202020206C5F6572726F72203D20600A3C7370616E2069643D22234944235F';
wwv_flow_api.g_varchar2_table(851) := '6572726F725F706C616365686F6C6465722220636C6173733D22612D466F726D2D6572726F7220752D76697369626C652220646174612D74656D706C6174652D69643D22234441544154454D504C41544523223E3C2F7370616E3E0A603B0A2020202020';
wwv_flow_api.g_varchar2_table(852) := '2020207D0A0A2020202020202020636F6E7374206C5F74656D706C617465203D2067656E54656D706C61746528704F7074696F6E732E74656D706C6174652C20704F7074696F6E732E636F6C77696474682C20736368656D61293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(853) := '2F2F20636F6E736F6C652E6C6F6728646174612C20736368656D61290A20202020202020206C5F67656E657261746564203D207B0A202020202020202020206974656D733A202020202020206C5F67656E6572617465642E6974656D732C0A2020202020';
wwv_flow_api.g_varchar2_table(854) := '202020202077726170706572747970653A206C5F67656E6572617465642E77726170706572747970652C0A2020202020202020202068746D6C3A2020202020202020617065782E7574696C2E6170706C7954656D706C617465280A600A20203C64697620';
wwv_flow_api.g_varchar2_table(855) := '636C6173733D22636F6C20636F6C2D23434F4C57494454482320617065782D636F6C2D6175746F2023434F4C5354415254454E4423223E0A202020203C646976202069643D22234944235F434F4E5441494E45522220636C6173733D22742D466F726D2D';
wwv_flow_api.g_varchar2_table(856) := '6669656C64436F6E7461696E657220234649454C4454454D504C415445232023495352455155495245442320234353532320695F3131323931383130395F3020617065782D6974656D2D77726170706572202357524150504552545950452322203E0A20';
wwv_flow_api.g_varchar2_table(857) := '20202020203C64697620636C6173733D22742D466F726D2D6C6162656C436F6E7461696E657220234C4142454C54454D504C41544523223E0A20202020202020203C6C6162656C20666F723D2223494423222069643D22234944235F4C4142454C222063';
wwv_flow_api.g_varchar2_table(858) := '6C6173733D22742D466F726D2D6C6162656C20234C4142454C48494444454E23223E23544F504C4142454C233C2F6C6162656C3E0A2020202020203C2F6469763E0A2020202020203C64697620636C6173733D22742D466F726D2D696E707574436F6E74';
wwv_flow_api.g_varchar2_table(859) := '61696E65722023494E50555454454D504C41544523223E0A20202020202020203C64697620636C6173733D22742D466F726D2D6974656D52657175697265642D6D61726B65722220617269612D68696464656E3D2274727565223E3C2F6469763E0A2020';
wwv_flow_api.g_varchar2_table(860) := '2020202020203C64697620636C6173733D22742D466F726D2D6974656D57726170706572223E0A60202B206C5F67656E6572617465642E68746D6C202B200A60200A20202020202020203C2F6469763E0A60202B206C5F6572726F7220202B20600A2020';
wwv_flow_api.g_varchar2_table(861) := '202020203C2F6469763E0A202020203C2F6469763E0A20203C2F6469763E0A602C0A2020202020202020202020202020202020202020202020202020202020202020202020207B20706C616365686F6C646572733A207B22575241505045525459504522';
wwv_flow_api.g_varchar2_table(862) := '3A20206C5F67656E6572617465642E77726170706572747970652C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022434F4C5749445448223A2020202020287363';
wwv_flow_api.g_varchar2_table(863) := '68656D612E617065782E636F6C5370616E3F736368656D612E617065782E636F6C5370616E3A704F7074696F6E732E636F6C7769647468292C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(864) := '202020202020202020202022524F5753223A20202020202020202028736368656D612E617065782E6C696E65733F736368656D612E617065782E6C696E65733A35292C0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(865) := '20202020202020202020202020202020202020202022434F4C5354415254454E44223A20207374617274656E643C303F27636F6C2D7374617274273A287374617274656E643E303F27636F6C2D656E64273A2727292C0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(866) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020224944223A202020202020202020202067656E4974656D6E616D65287072656669782C206E616D65292C200A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(867) := '20202020202020202020202020202020202020202020202020202020202020202020202020224E414D45223A20202020202020202067656E4974656D6E616D65287072656669782C206E616D65292C0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(868) := '202020202020202020202020202020202020202020202020202020202020202020224C4142454C223A20202020202020206C6162656C2C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(869) := '202020202020202020224649454C4454454D504C415445223A206C5F74656D706C6174652E636F6E7461696E65722C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(870) := '20224C4142454C54454D504C415445223A206C5F74656D706C6174652E6C6162656C2C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224C4142454C4849444445';
wwv_flow_api.g_varchar2_table(871) := '4E223A2020206C5F74656D706C6174652E68696464656E2C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022494E50555454454D504C415445223A206C5F74656D';
wwv_flow_api.g_varchar2_table(872) := '706C6174652E696E7075742C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022435353223A2020202020202020202020736368656D612E617065782E6373737C7C';
wwv_flow_api.g_varchar2_table(873) := '27272C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022414C49474E223A202020202020202063416C69676E5B736368656D612E617065782E616C69676E5D7C7C';
wwv_flow_api.g_varchar2_table(874) := '27272C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022524541444F4E4C59223A2020202020736368656D612E726561646F6E6C793F2274727565223A2266616C';
wwv_flow_api.g_varchar2_table(875) := '7365222C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020225452494D535041434553223A20202027424F5448272C0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(876) := '202020202020202020202020202020202020202020202020202020202020202020202022414A41584944454E544946494552223A2070416A61784964656E7469666965722C0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(877) := '2020202020202020202020202020202020202020202020224441544154454D504C415445223A20704F7074696F6E732E6461746174656D706C61746545542C0A202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(878) := '202020202020202020202020202020202022504C414345484F4C444552223A2020736368656D612E617065782E706C616365686F6C6465723F27706C616365686F6C6465723D22272B736368656D612E617065782E706C616365686F6C6465722B272227';
wwv_flow_api.g_varchar2_table(879) := '3A27272C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022464F524D4154223A20202020202020736368656D612E617065782E666F726D61747C7C27272C0A2020';
wwv_flow_api.g_varchar2_table(880) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224558414D504C45223A202020202020285B435F4A534F4E5F464F524D41545F444154452C20435F4A534F4E5F464F524D';
wwv_flow_api.g_varchar2_table(881) := '41545F4441544554494D452C20435F4A534F4E5F464F524D41545F54494D455D2E696E636C7564657328736368656D612E666F726D6174293F6A736F6E56616C7565324974656D28736368656D612C206E6577204461746528292E746F49534F53747269';
wwv_flow_api.g_varchar2_table(882) := '6E6728292C206E65774974656D293A2727292C200A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224D494E4C454E475448223A20202020736368656D612E6D696E';
wwv_flow_api.g_varchar2_table(883) := '4C656E6774683F276D696E6C656E6774683D27202B20736368656D612E6D696E4C656E6774683A27272C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224D4158';
wwv_flow_api.g_varchar2_table(884) := '4C454E475448223A20202020736368656D612E6D61784C656E6774683F276D61786C656E6774683D27202B20736368656D612E6D61784C656E6774683A27272C0A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(885) := '20202020202020202020202020202020202022544F504C4142454C223A202020202028736368656D612E747970653D3D20435F4A534F4E5F424F4F4C45414E2026262021285B435F415045585F53454C4543542C20435F415045585F524144494F2C2043';
wwv_flow_api.g_varchar2_table(886) := '5F415045585F5357495443485D2E696E636C7564657328736368656D612E617065782E6974656D747970652929293F22223A6C6162656C2C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(887) := '2020202020202020202022434845434B4544223A202020202020736368656D612E747970653D3D20435F4A534F4E5F424F4F4C45414E20262620646174613F22636865636B6564223A22222C0A2020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(888) := '202020202020202020202020202020202020202020202020202020202020225041545445524E223A202020202020736368656D612E7061747465726E3F277061747465726E3D22272B736368656D612E7061747465726E2B2722273A22222C20200A2020';
wwv_flow_api.g_varchar2_table(889) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020225245515549524544223A2020202020736368656D612E697352657175697265643F2772657175697265643D2222273A22';
wwv_flow_api.g_varchar2_table(890) := '222C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202249535245515549524544223A202020736368656D612E697352657175697265643F2769732D726571756972';
wwv_flow_api.g_varchar2_table(891) := '6564273A22222C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224D494E223A2020202020202020202028226D696E696D756D2220696E20736368656D61293F28';
wwv_flow_api.g_varchar2_table(892) := '5B435F4A534F4E5F464F524D41545F444154452C20435F4A534F4E5F464F524D41545F4441544554494D452C20435F4A534F4E5F464F524D41545F54494D455D2E696E636C7564657328736368656D612E666F726D6174293F276D696E273A2764617461';
wwv_flow_api.g_varchar2_table(893) := '2D6D696E27292B273D22272B736368656D612E6D696E696D756D2B2722273A22222C0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020224D4158223A202020202020';
wwv_flow_api.g_varchar2_table(894) := '2020202028226D6178696D756D2220696E20736368656D61293F285B435F4A534F4E5F464F524D41545F444154452C20435F4A534F4E5F464F524D41545F4441544554494D452C20435F4A534F4E5F464F524D41545F54494D455D2E696E636C75646573';
wwv_flow_api.g_varchar2_table(895) := '28736368656D612E666F726D6174293F276D6178273A27646174612D6D617827292B20273D22272B736368656D612E6D6178696D756D2B2722273A22222C0A20202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(896) := '202020202020202020202020202020202256414C5545223A20202020202020206A736F6E56616C7565324974656D28736368656D612C20646174612C206E65774974656D297C7C27272C0A20202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(897) := '202020202020202020202020202020202020202020202020202020202251554F544556414C5545223A20202028736368656D612E747970653D3D20435F4A534F4E5F535452494E472026262064617461293F617065782E7574696C2E6573636170654854';
wwv_flow_api.g_varchar2_table(898) := '4D4C2827272B64617461293A28646174613F646174613A2727292C0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202022494D414745223A2020202020202020736368';
wwv_flow_api.g_varchar2_table(899) := '656D612E617065782E696D6167657C7C22220A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(900) := '2020202020202020207D290A20202020202020207D3B0A202020207D0A0A2020202069662828736368656D612E617065782E746578744265666F7265207C7C20736368656D612E617065782E6E6577526F772929207B202F2F2063757272656E74206669';
wwv_flow_api.g_varchar2_table(901) := '656C642073686F756C642073746172742061742061206E657720726F770A2020202020206C5F67656E6572617465642E68746D6C203D2067656E6572617465536570617261746F7228736368656D612C20736368656D612E617065782E74657874426566';
wwv_flow_api.g_varchar2_table(902) := '6F72652C20707265666978202B20275F4F424A272C20696E41727261792C206E756C6C29202B206C5F67656E6572617465642E68746D6C3B0A202020207D0A0A20202020696628696E4172726179202626206C5F67656E6572617465642E6974656D733D';
wwv_flow_api.g_varchar2_table(903) := '3D31297B202F2F2074686973206F626A6563742069732067656E65726174656420696E7369646520616E2061727261792C20736F20616464206F6E626A6563742072656C617465642068746D6C206172726F756E647D0A202020202020696628704F7074';
wwv_flow_api.g_varchar2_table(904) := '696F6E732E68656164657273297B0A20202020202020206C5F67656E6572617465642E68746D6C203D2067656E6572617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C2067656E';
wwv_flow_api.g_varchar2_table(905) := '4974656D6E616D65287072656669782C206E616D65292C20696E41727261792C206E756C6C29202B206C5F67656E6572617465642E68746D6C3B0A2020202020207D0A20202020202069662821736368656D612E726561644F6E6C79297B0A2020202020';
wwv_flow_api.g_varchar2_table(906) := '2020206C5F67656E6572617465642E68746D6C202B3D2067656E6572617465417272617944656C657465427574746F6E2867656E4974656D6E616D65287072656669782C206E616D6529293B0A2020202020207D0A202020207D0A2F2A0A202020202020';
wwv_flow_api.g_varchar2_table(907) := '202020206966286C5F67656E2E6974656D73203D3D203129207B202F2F20612073696D706C652061727261792C20736F206164642064656C657465627574746F6E2C20666F72206F626A656374732069747320616C72656164792067656E657261746564';
wwv_flow_api.g_varchar2_table(908) := '0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D2067656E6572617465536570617261746F7228736368656D612C2067656E65726174654C6162656C286E616D652C20736368656D61292C20707265666978202B20435F44';
wwv_flow_api.g_varchar2_table(909) := '454C494D49544552202B20692C20747275652C206E756C6C29202B206C5F67656E2E68746D6C3B0A2020202020202020202020206C5F67656E6572617465642E68746D6C202B3D2067656E6572617465417272617944656C657465427574746F6E287072';
wwv_flow_api.g_varchar2_table(910) := '65666978202B20435F44454C494D49544552202B2069293B0A202020202020202020207D20656C7365207B0A2A2F0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465466F724F626A65637422';
wwv_flow_api.g_varchar2_table(911) := '2C206C5F67656E657261746564293B0A2020202072657475726E286C5F67656E657261746564293B0A20207D0A0A20202F2A0A2020202A0A20202A2F0A202066756E6374696F6E2067656E6572617465526567696F6E28736368656D612C20646174612C';
wwv_flow_api.g_varchar2_table(912) := '207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D297B0A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E67656E6572617465526567696F6E222C2073636865';
wwv_flow_api.g_varchar2_table(913) := '6D612C20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A202020206C6574206C5F67656E657261746564203D2067656E6572617465466F724F626A65637428736368656D612C';
wwv_flow_api.g_varchar2_table(914) := '20646174612C207072656669782C206E616D652C207374617274656E642C20696E41727261792C206E65774974656D293B0A202020206C5F67656E6572617465642E68746D6C203D20600A3C64697620636C6173733D22726F77206A736F6E726567696F';
wwv_flow_api.g_varchar2_table(915) := '6E223E0A60202B206C5F67656E6572617465642E68746D6C202B20600A3C2F6469763E603B0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E67656E6572617465526567696F6E222C206C5F67656E6572617465';
wwv_flow_api.g_varchar2_table(916) := '64293B0A2020202072657475726E286C5F67656E657261746564293B0A20207D0A20202F2A0A2020202A2067657420612066696C65207769746820616E20414A41582D726571756573742072657475726E20612070726F6D6973650A20202A2F0A202066';
wwv_flow_api.g_varchar2_table(917) := '756E6374696F6E2067657446696C6528747970652C2073726329207B0A2020202072657475726E206E65772050726F6D6973652866756E6374696F6E287265736F6C76652C2072656A65637429207B0A202020202020617065782E64656275672E747261';
wwv_flow_api.g_varchar2_table(918) := '636528276C6F61642066696C6520282573293A2022257322272C20747970652C20737263293B0A202020202020636F6E73742073203D20646F63756D656E742E637265617465456C656D656E7428634D6170547970655B747970655D2E746167293B0A20';
wwv_flow_api.g_varchar2_table(919) := '20202020206C65742072203D2066616C73653B0A202020202020732E74797065203D20634D6170547970655B747970655D2E747970653B0A202020202020735B634D6170547970655B747970655D2E617474725D203D207372633B0A202020202020732E';
wwv_flow_api.g_varchar2_table(920) := '72656C203D20634D6170547970655B747970655D2E72656C3B0A202020202020732E6173796E63203D2066616C73653B0A202020202020732E6F6E6572726F72203D2066756E6374696F6E2865727229207B0A202020202020202072656A656374286572';
wwv_flow_api.g_varchar2_table(921) := '722C2073293B0A2020202020207D3B0A0A202020202020732E6F6E6C6F6164203D20732E6F6E726561647973746174656368616E6765203D2066756E6374696F6E2829207B0A2020202020202020696620282172202626202821746869732E7265616479';
wwv_flow_api.g_varchar2_table(922) := '5374617465207C7C20746869732E72656164795374617465203D3D2027636F6D706C657465272929207B0A2020202020202020202072203D20747275653B0A202020202020202020207265736F6C766528293B0A20202020202020207D20656C7365207B';
wwv_flow_api.g_varchar2_table(923) := '0A2020202020202020202072656A656374286E756C6C2C2073293B0A20202020202020207D0A2020202020207D3B0A2020202020202F2F20617070656E64207363726970742074616720746F20626F64792C20736F2066696C652077696C6C206265206C';
wwv_flow_api.g_varchar2_table(924) := '6F6164656420696E206261636B67726F756E640A202020202020646F63756D656E742E626F64792E617070656E644368696C642873293B0A202020207D293B0A20207D0A0A0A20202F2A0A2020202A206C6F616420616C6C2066696C65732066726F6D20';
wwv_flow_api.g_varchar2_table(925) := '6C6973742066696C656E616D65732072656C617469766520746F2062617365506174680A20202A2F0A202066756E6374696F6E2067657446696C6573202866696C656E616D65732C20626173655061746829207B0A20202020766172206C5F617272203D';
wwv_flow_api.g_varchar2_table(926) := '20242E6D61702866696C656E616D65732C2066756E6374696F6E2866696C6529207B0A202020202020202072657475726E2067657446696C6528202866696C652E656E64735769746828222E6A7322293F27736372697074273A2763737327292C202862';
wwv_flow_api.g_varchar2_table(927) := '617365506174687C7C222229202B2066696C6520293B0A202020207D293B0A20202020202020200A202020206C5F6172722E7075736828242E44656665727265642866756E6374696F6E2820646566657272656420297B0A202020202020202024282064';
wwv_flow_api.g_varchar2_table(928) := '656665727265642E7265736F6C766520293B0A202020207D29293B0A20202020202020200A2020202072657475726E20242E7768656E2E6170706C7928242C206C5F617272293B0A20207D0A0A20202F2F206C6F616420746865206F7261636C656A6574';
wwv_flow_api.g_varchar2_table(929) := '20666F7220646174652D7069636B657220666F722041504558203C3D32322E310A202066756E6374696F6E206C6F6164526571756972656446696C6573323231286974656D7479706573297B0A202020206C6574206C5F68746D6C203D27273B0A202020';
wwv_flow_api.g_varchar2_table(930) := '20617065782E64656275672E747261636528273E3E6A736F6E526567696F6E2E6C6F6164526571756972656446696C6573323231272C206974656D7479706573293B0A202020206966286974656D74797065732E666F726D61742E64617465207C7C2069';
wwv_flow_api.g_varchar2_table(931) := '74656D74797065732E666F726D61745B22646174652D74696D65225D297B20202F2F4841434B20666F722041504558203C32322E322C206865726520616E206F6C6420646174657069636B657220697320757365640A2020202020206C5F68746D6C202B';
wwv_flow_api.g_varchar2_table(932) := '3D20273C736372697074207372633D2227202B20704F7074696F6E732E617065785F66696C6573202B20276C69627261726965732F617065782F6D696E69666965642F6A6574436F6D6D6F6E42756E646C652E6D696E2E6A73223E3C2F7363726970743E';
wwv_flow_api.g_varchar2_table(933) := '273B0A202020202020696628704F7074696F6E732E617065785F76657273696F6E3E3D435F415045585F56455253494F4E5F32323031297B202F2F2061706578203C32322E3120686173206576656E206F6C64657220646174657069636B65720A202020';
wwv_flow_api.g_varchar2_table(934) := '20202020206C5F68746D6C202B3D20273C736372697074207372633D2227202B20704F7074696F6E732E617065785F66696C6573202B20276C69627261726965732F617065782F6D696E69666965642F6A6574446174655069636B657242756E646C652E';
wwv_flow_api.g_varchar2_table(935) := '6D696E2E6A73223E3C2F7363726970743E273B0A2020202020207D0A202020207D0A20202020617065782E64656275672E747261636528273C3C6A736F6E526567696F6E2E6C6F6164526571756972656446696C6573323231272C206C5F68746D6C293B';
wwv_flow_api.g_varchar2_table(936) := '0A2020202072657475726E206C5F68746D6C3B0A20207D0A0A20202F2A0A2020202A206275696C642061206C697374206F6620616C6C206D697373696E672066696C65732072657175697265642062792075736564207769676574732F6974656D73206C';
wwv_flow_api.g_varchar2_table(937) := '696B6520726963687478742D656469746F722C202E2E2E200A2020202A204C6F64207468652066696C65732076696120616A61780A20202A2F0A20206173796E632066756E6374696F6E206C6F6164526571756972656446696C6573286974656D747970';
wwv_flow_api.g_varchar2_table(938) := '657329207B0A2020202020202F2F206765742075736564206974656D74797065730A20202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6C6F6164526571756972656446696C6573222C206974656D7479706573293B';
wwv_flow_api.g_varchar2_table(939) := '0A202020206C6574206C5F73637269707473203D205B5D3B0A0A20202020696628704F7074696F6E732E617065785F76657273696F6E203E3D435F415045585F56455253494F4E5F32333032297B20202F2F206E6577204665617475727320666F722032';
wwv_flow_api.g_varchar2_table(940) := '332E320A20202020202069662821637573746F6D456C656D656E74732E6765742827612D636F6D626F626F78272920202626206974656D74797065732E6974656D747970652E636F6D626F626F78297B202F2F20636F6D626F626F782069732075736564';
wwv_flow_api.g_varchar2_table(941) := '2C20736F206C6F61642066696C657320666F72206E657720636F6D626F626F780A20202020202020206C5F736372697074732E7075736828276C69627261726965732F617065782F6D696E69666965642F6974656D2E436F6D626F626F782E6D696E2E6A';
wwv_flow_api.g_varchar2_table(942) := '7327293B0A2020202020207D0A20202020202069662821637573746F6D456C656D656E74732E6765742827612D7172636F6465272920202626206974656D74797065732E6974656D747970652E7172636F6465297B202F2F20636F6D626F626F78206973';
wwv_flow_api.g_varchar2_table(943) := '20757365642C20736F206C6F61642066696C657320666F72206E657720636F6D626F626F780A20202020202020206C5F736372697074732E7075736828276C69627261726965732F617065782F6D696E69666965642F6974656D2E5152636F64652E6D69';
wwv_flow_api.g_varchar2_table(944) := '6E2E6A7327293B0A2020202020207D0A0A2020202020206966286974656D74797065732E6974656D747970652E7269636874657874297B20202F2F20726963687465787420697320757365642C20736F206C6F61642066696C657320666F722072696368';
wwv_flow_api.g_varchar2_table(945) := '2D746578742D656469746F720A202020202020202069662821637573746F6D456C656D656E74732E6765742827612D726963682D746578742D656469746F722729297B20202F2F20437573746F6D20456C656D656E74206973206E6F7420696E20757365';
wwv_flow_api.g_varchar2_table(946) := '2C206C6F61642069740A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F74696E796D63652F27202B20617065782E6C696256657273696F6E732E74696E796D6365202B20272F736B696E732F75692F6F786964';
wwv_flow_api.g_varchar2_table(947) := '652F736B696E2E63737327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F74696E796D63652F27202B20617065782E6C696256657273696F6E732E74696E796D6365202B20272F74696E796D63652E6D';
wwv_flow_api.g_varchar2_table(948) := '696E2E6A7327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F7075726966792F2720202B20617065782E6C696256657273696F6E732E646F6D507572696679202B20272F7075726966792E6D696E2E6A';
wwv_flow_api.g_varchar2_table(949) := '7327293B0A202020202020202020206C5F736372697074732E7075736828276C69627261726965732F707269736D6A732F27202B20617065782E6C696256657273696F6E732E707269736D4A73202B20272F707269736D2E6A7327293B0A202020202020';
wwv_flow_api.g_varchar2_table(950) := '202020206C5F736372697074732E7075736828276C69627261726965732F6D61726B65646A732F27202B20617065782E6C696256657273696F6E732E6D61726B65644A73202B20272F6D61726B65642E6D696E2E6A7327293B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(951) := '6C5F736372697074732E7075736828276C69627261726965732F7475726E646F776E2F27202B20617065782E6C696256657273696F6E732E7475726E646F776E202B20272F7475726E646F776E2E6A7327293B0A202020202020202020206C5F73637269';
wwv_flow_api.g_varchar2_table(952) := '7074732E7075736828276C69627261726965732F617065782F6D696E69666965642F6974656D2E5269636854657874456469746F722E6D696E2E6A7327293B0A20202020202020207D0A2020202020207D0A202020207D0A0A20202020617065782E6465';
wwv_flow_api.g_varchar2_table(953) := '6275672E747261636528223C3C6A736F6E526567696F6E2E6C6F6164526571756972656446696C657322293B0A2020202072657475726E2067657446696C657328206C5F736372697074732C20704F7074696F6E732E617065785F66696C6573293B0A20';
wwv_flow_api.g_varchar2_table(954) := '207D0A0A20202F2A0A2020202A2073686F7720616C6C20696E2D2F6F75747075742D6974656D7320666F7220746865204A534F4E2D726567696F6E0A20202A2F0A202066756E6374696F6E2073686F774669656C6473286974656D7479706573297B0A20';
wwv_flow_api.g_varchar2_table(955) := '202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E73686F774669656C647322293B0A202020206C6574206C5F67656E657261746564203D2067656E6572617465526567696F6E28704F7074696F6E732E736368656D61';
wwv_flow_api.g_varchar2_table(956) := '2C2067446174612C206E756C6C2C20704F7074696F6E732E646174616974656D2C20302C2066616C73652C2074727565293B0A202020206C6574206C5F68746D6C203D206C5F67656E6572617465642E68746D6C3B0A20202020696628704F7074696F6E';
wwv_flow_api.g_varchar2_table(957) := '732E617065785F76657273696F6E203C435F415045585F56455253494F4E5F32323032297B0A2020202020206C5F68746D6C202B3D206C6F6164526571756972656446696C6573323231286974656D7479706573293B0A202020207D0A0A2F2A0A202020';
wwv_flow_api.g_varchar2_table(958) := '20696628704F7074696F6E732E617065785F76657273696F6E203E3D435F415045585F56455253494F4E5F32333032297B0A2020202020206C5F68746D6C202B3D20273C736372697074207372633D2227202B20704F7074696F6E732E617065785F6669';
wwv_flow_api.g_varchar2_table(959) := '6C6573202B20276C69627261726965732F6D61726B65646A732F27202B20617065782E6C696256657273696F6E732E6D61726B65644A73202B20272F6D61726B65642E6D696E2E6A73223E3C2F7363726970743E273B0A202020207D0A2A2F0A20202020';
wwv_flow_api.g_varchar2_table(960) := '202020202F2F206174746163682048544D4C20746F20726567696F6E0A2020202024282223222B70526567696F6E4964292E68746D6C286C5F68746D6C293B0A20202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E73';
wwv_flow_api.g_varchar2_table(961) := '686F774669656C647322293B0A20207D0A0A0A20202F2A0A2020202A207265667265736820746865204A534F4E2D726567696F6E0A20202A2F0A20206173796E632066756E6374696F6E2072656672657368286E65774974656D29207B0A202020206170';
wwv_flow_api.g_varchar2_table(962) := '65782E64656275672E747261636528223E3E6A736F6E526567696F6E2E7265667265736822293B0A20202020617065782E64656275672E747261636528276A736F6E526567696F6E2E72656672657368272C202764617461272C206E65774974656D2C20';
wwv_flow_api.g_varchar2_table(963) := '6744617461293B0A0A2020202061776169742072696368746578744861636B28293B0A2F2F20202020202020202F2F2061747461636820746865206669656C647320746F207468652067656E6572617465642055490A202020206174746163684F626A65';
wwv_flow_api.g_varchar2_table(964) := '637428704F7074696F6E732E646174616974656D2C2027272C20704F7074696F6E732E736368656D612C20704F7074696F6E732E726561646F6E6C792C2067446174612C206E65774974656D293B0A20202020617065784861636B7328293B0A20202020';
wwv_flow_api.g_varchar2_table(965) := '617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7265667265736822293B0A20207D0A0A20202F2A0A2020202A2052656D6F766520616C6C2070726F7065727469657320776974682076616C7565204E554C4C20746F20636F';
wwv_flow_api.g_varchar2_table(966) := '6D70616374207468652067656E657261746564204A534F4E0A20202A2F0A202066756E6374696F6E2072656D6F76654E756C6C7328646174612C20736561726368297B0A202020206966286461746129207B0A20202020202069662841727261792E6973';
wwv_flow_api.g_varchar2_table(967) := '4172726179286461746129297B0A2020202020202020646174612E666F72456163682866756E6374696F6E2876616C75652C20696478297B0A2020202020202020202072656D6F76654E756C6C7328646174615B6964785D2C20736561726368293B202F';
wwv_flow_api.g_varchar2_table(968) := '2F206B65657020617272617920656C656D656E74732C206265636175736520706F736974696F6E20636F756C64206265206D65616E696E6766756C6C0A20202020202020207D293B0A202020207D202020656C736520696628747970656F662864617461';
wwv_flow_api.g_varchar2_table(969) := '293D3D435F4A534F4E5F4F424A454354297B0A20202020202020204F626A6563742E6B6579732864617461292E666F72456163682866756E6374696F6E2876616C75652C20696478297B0A2020202020202020202069662872656D6F76654E756C6C7328';
wwv_flow_api.g_varchar2_table(970) := '646174615B76616C75655D2C20736561726368293D3D3D6E756C6C297B20202F2F2076616C7565206973206E756C6C2C20736F2072656D6F7665207468652077686F6C65206B65790A20202020202020202020202064656C65746528646174615B76616C';
wwv_flow_api.g_varchar2_table(971) := '75655D293B0A202020202020202020207D0A20202020202020207D293B0A2020202020202020696628214F626A6563742E6B6579732864617461292E6C656E677468297B202020202F2F204F626A65637420697320656D707479206E6F772C2072656D6F';
wwv_flow_api.g_varchar2_table(972) := '7665206974206C617465720A20202020202020202020646174613D6E756C6C3B0A20202020202020207D0A2020202020207D0A202020207D0A2020202072657475726E2864617461293B0A20207D0A0A20202F2A0A2020202A20636F6E76657274206469';
wwv_flow_api.g_varchar2_table(973) := '66666572656E74206461746120666F726D61747320696E20746865204A534F4E2D6461746120696E746F2073696E676C6520666F726D6174730A20202A2F0A202066756E6374696F6E207265666F726D617456616C75657328736368656D612C20646174';
wwv_flow_api.g_varchar2_table(974) := '612C2072656164297B0A20202020617065782E64656275672E747261636528223E3E7265666F726D617456616C756573222C20736368656D61293B200A20202020696628736368656D612026262064617461297B0A202020202020737769746368287363';
wwv_flow_api.g_varchar2_table(975) := '68656D612E74797065297B0A2020202020206361736520226F626A656374223A0A20202020202020206966286461746120696E7374616E63656F66204F626A65637429207B0A20202020202020202020666F7228636F6E7374206C5F6B657920696E2073';
wwv_flow_api.g_varchar2_table(976) := '6368656D612E70726F70657274696573297B0A20202020202020202020202020646174615B6C5F6B65795D203D207265666F726D617456616C75657328736368656D612E70726F706572746965735B6C5F6B65795D2C20646174615B6C5F6B65795D2C20';
wwv_flow_api.g_varchar2_table(977) := '72656164293B0A202020202020202020207D0A20202020202020207D20656C7365207B0A20202020202020202020617065782E64656275672E6572726F72282763616E206E6F7420646973706C617920646174613A272C20646174612C20276D75737420';
wwv_flow_api.g_varchar2_table(978) := '626520616E206F626A65637427293B0A20202020202020207D0A202020202020627265616B3B0A2020202020206361736520226172726179223A0A202020202020202069662841727261792E69734172726179286461746129297B0A2020202020202020';
wwv_flow_api.g_varchar2_table(979) := '2020666F72287661722069203D20303B2069203C20736368656D612E6974656D732E6C656E6774683B20692B2B297B0A20202020202020202020202020646174615B695D203D207265666F726D617456616C75657328736368656D612E6974656D735B69';
wwv_flow_api.g_varchar2_table(980) := '5D2C20646174615B695D2C2072656164293B0A202020202020202020207D0A20202020202020207D20656C7365207B0A20202020202020202020617065782E64656275672E6572726F72282763616E206E6F7420646973706C617920646174613A272C20';
wwv_flow_api.g_varchar2_table(981) := '646174612C20276D75737420626520616E20617272617927293B0A20202020202020207D20202020200A202020202020627265616B3B0A20202020202064656661756C743A0A202020202020627265616B3B0A2020202020207D200A0A20202020202069';
wwv_flow_api.g_varchar2_table(982) := '6628736368656D612E6966297B20202F2F20636F6E646974696F6E616C20736368656D612C20616464206576656E74206F6E206974656D730A2020202020202020696628736368656D612E7468656E297B200A20202020202020202020666F7228636F6E';
wwv_flow_api.g_varchar2_table(983) := '7374205B6C5F6E616D652C206C5F6974656D5D206F66204F626A6563742E656E747269657328736368656D612E7468656E2E70726F7065727469657329297B0A2020202020202020202020207265666F726D617456616C756573286C5F6974656D2C2064';
wwv_flow_api.g_varchar2_table(984) := '6174615B6C5F6E616D655D2C2072656164293B0A202020202020202020207D0A20202020202020207D0A0A2020202020202020696628736368656D612E656C7365297B200A20202020202020202020666F7228636F6E7374205B6C5F6E616D652C206C5F';
wwv_flow_api.g_varchar2_table(985) := '6974656D5D206F66204F626A6563742E656E747269657328736368656D612E656C73652E70726F7065727469657329297B0A2020202020202020202020207265666F726D617456616C756573286C5F6974656D2C20646174615B6C5F6E616D655D2C2072';
wwv_flow_api.g_varchar2_table(986) := '656164293B0A202020202020202020207D0A20202020202020207D0A2020202020207D2020202020200A202020207D200A20202020617065782E64656275672E747261636528223C3C7265666F726D617456616C756573222C2064617461293B2020200A';
wwv_flow_api.g_varchar2_table(987) := '2020202072657475726E2864617461293B0A20207D0A0A20202F2A0A2020202A2061646A7573742074686520736368656D610A20202A2F0A202066756E6374696F6E2061646A7573744F7074696F6E73286F7074696F6E73297B0A202020206F7074696F';
wwv_flow_api.g_varchar2_table(988) := '6E732E736368656D61203D2020202020202020202020206F7074696F6E732E736368656D61207C7C207B7D3B0A202020206F7074696F6E732E736368656D612E70726F70657274696573203D206F7074696F6E732E736368656D612E70726F7065727469';
wwv_flow_api.g_varchar2_table(989) := '6573207C7C207B7D3B0A202020206F7074696F6E732E736368656D612E61706578203D202020202020206F7074696F6E732E736368656D612E61706578207C7C207B7D3B0A202020206F7074696F6E732E736368656D612E617065782E6C6162656C203D';
wwv_flow_api.g_varchar2_table(990) := '206F7074696F6E732E736368656D612E617065782E6C6162656C207C7C206E756C6C3B0A2020202072657475726E206F7074696F6E733B0A20207D0A20202F2A202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(991) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A2020202A2068657265207468652066756E6374696F6E20636F6465207374617274730A20202A2F0A2020617065782E64656275672E747261636528223E3E696E69744A736F';
wwv_flow_api.g_varchar2_table(992) := '6E526567696F6E222C2070526567696F6E49642C20704E616D652C2070416A61784964656E7469666965722C20704F7074696F6E73293B200A0A2020696628704F7074696F6E732E6869646529207B202F2F2068696465207468652072656C6174656420';
wwv_flow_api.g_varchar2_table(993) := '4A534F4E2D6974656D0A20202020617065782E6974656D28704F7074696F6E732E646174616974656D292E6869646528293B0A20207D0A0A20207472797B0A20202020704F7074696F6E732E736368656D61203D204A534F4E2E706172736528704F7074';
wwv_flow_api.g_varchar2_table(994) := '696F6E732E736368656D61293B0A20207D206361746368286529207B0A20202020617065782E64656275672E6572726F7228276A736F6E2D726567696F6E3A20736368656D61272C20652C20704F7074696F6E732E736368656D61293B0A20202020704F';
wwv_flow_api.g_varchar2_table(995) := '7074696F6E732E736368656D61203D207B7D3B0A20207D0A0A202020202F2F2067656E657261746520746865204A534F4E2066726F6D20646174616974656D2D6669656C640A2020747279207B0A202020206744617461203D204A534F4E2E7061727365';
wwv_flow_api.g_varchar2_table(996) := '28617065782E6974656D28704F7074696F6E732E646174616974656D292E67657456616C756528297C7C277B7D27293B0A20207D206361746368286529207B0A20202020617065782E64656275672E6572726F7228276A736F6E2D726567696F6E3A2064';
wwv_flow_api.g_varchar2_table(997) := '6174616974656D272C20704F7074696F6E732E646174616974656D2C20652C20704F7074696F6E732E736368656D61293B0A202020206744617461203D207B7D3B0A20207D0A0A2020617065782E64656275672E74726163652827696E69744A736F6E52';
wwv_flow_api.g_varchar2_table(998) := '6567696F6E3A2064617461272C206744617461293B0A20206C6574206E65774974656D203D2021286744617461202626204F626A6563742E6B657973286744617461292E6C656E677468293B0A0A2020696628704F7074696F6E732E67656E6572617465';
wwv_flow_api.g_varchar2_table(999) := '536368656D61297B20202F2F2067656E6572617465204A534F4E2D736368656D61206261736564206F6E204A534F4E2D646174610A202020206C6574206C5F736368656D61203D7B7D3B0A202020206C5F736368656D61203D2067656E65726174655363';
wwv_flow_api.g_varchar2_table(1000) := '68656D61286C5F736368656D612C2067446174617C7C7B7D293B0A20202020636F6E736F6C652E696E666F28272B2B2B4A534F4E2D736368656D612B2B2B272C204A534F4E2E737472696E67696679286C5F736368656D6129293B0A20202020704F7074';
wwv_flow_api.g_varchar2_table(1001) := '696F6E732E736368656D61203D206C5F736368656D613B0A20207D0A0A2020704F7074696F6E73203D2061646A7573744F7074696F6E7328704F7074696F6E73293B0A0A202020202F2F207265736F6C766520616C6C2024726566730A2020704F707469';
wwv_flow_api.g_varchar2_table(1002) := '6F6E732E736368656D61203D2070726F7061676174655265667328704F7074696F6E732E736368656D61293B0A202070726F70616761746550726F7065727469657328704F7074696F6E732E736368656D612C20302C20704F7074696F6E732E72656164';
wwv_flow_api.g_varchar2_table(1003) := '6F6E6C792C2066616C73652C20704F7074696F6E732E6B656570417474726962757465732C2066616C7365293B0A0A202020202F2F2061646A75737420646966666572656E63657320696E200A20206744617461203D207265666F726D617456616C7565';
wwv_flow_api.g_varchar2_table(1004) := '7328704F7074696F6E732E736368656D612C2067446174612C2074727565293B0A0A202020202F2F2073686F77207468652055492D6669656C64730A0A20206C6574206C5F6974656D7479706573203D206E756C6C3B0A20206C5F6974656D7479706573';
wwv_flow_api.g_varchar2_table(1005) := '203D206765744974656D747970657328704F7074696F6E732E736368656D612C206C5F6974656D7479706573293B0A0A202073686F774669656C6473286C5F6974656D7479706573293B200A20200A202020202F2F207374617274206865726520616C6C';
wwv_flow_api.g_varchar2_table(1006) := '207374756666207769686963682072756E73206173796E630A2020286173796E632066756E6374696F6E28297B0A20202F2A0A2020202A206372656174652074686520726567696F6E20616E64206174746163682064656661756C742068616E646C6572';
wwv_flow_api.g_varchar2_table(1007) := '730A20202A2F0A2020202066756E6374696F6E20637265617465526567696F6E28297B0A202020202020617065782E64656275672E747261636528223E3E637265617465526567696F6E22293B0A2020202020202F2F2069662072656167696F6E20616C';
wwv_flow_api.g_varchar2_table(1008) := '7265616479206578697374732064657374726F792069742066697273740A202020202020696628617065782E726567696F6E2E6973526567696F6E2870526567696F6E49642929207B0A2020202020202020617065782E64656275672E74726163652827';
wwv_flow_api.g_varchar2_table(1009) := '44455354524F5920524547494F4E272C2070526567696F6E4964293B0A2020202020202020617065782E726567696F6E2E64657374726F792870526567696F6E4964293B0A2020202020207D0A202020202020617065782E726567696F6E2E6372656174';
wwv_flow_api.g_varchar2_table(1010) := '65282070526567696F6E49642C2063616C6C6261636B73293B0A202020202020617065782E6974656D2E617474616368282428272327202B2070526567696F6E496429293B0A202020202020617065782E64656275672E747261636528223C3C63726561';
wwv_flow_api.g_varchar2_table(1011) := '7465526567696F6E22293B2020200A202020207D0A0A20202020617065782E64656275672E7472616365282772657175697265642066696C6573206C6F64696E672E2E2E27293B0A202020206177616974206C6F6164526571756972656446696C657328';
wwv_flow_api.g_varchar2_table(1012) := '6C5F6974656D7479706573293B0A20202020617065782E64656275672E7472616365282772657175697265642066696C6573206C6F6164656427293B0A2020202061776169742072656672657368286E65774974656D293B0A0A20202020636F6E737420';
wwv_flow_api.g_varchar2_table(1013) := '63616C6C6261636B73203D207B0A20202020202020202F2F2043616C6C6261636B20666F722072656672657368696E67206F6620746865204A534F4E2D726567696F6E2C2069732063616C6C656420627920415045582D726566726573680A2020202020';
wwv_flow_api.g_varchar2_table(1014) := '20726566726573683A2066756E6374696F6E2829207B0A2020202020202020617065782E64656275672E747261636528273E3E63616C6C6261636B2E726566726573683A20272C2070526567696F6E49642C2070416A61784964656E7469666965722C20';
wwv_flow_api.g_varchar2_table(1015) := '704F7074696F6E732C206744617461293B0A2020202020202020696628704F7074696F6E732E697344796E616D6963297B0A2020202020202020202020617065782E7365727665722E706C7567696E2028200A20202020202020202020202070416A6178';
wwv_flow_api.g_varchar2_table(1016) := '4964656E7469666965722C200A2020202020202020202020207B20706167654974656D733A20704F7074696F6E732E71756572796974656D737D2C200A2020202020202020202020207B20737563636573733A206173796E632066756E6374696F6E2820';
wwv_flow_api.g_varchar2_table(1017) := '646174612029207B0A202020202020202020202020202020202F2F20666F7220736F6D6520726561736F6E207468652024646566732070726F70657274792069732072657475726E656420617320222464656673220A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(1018) := '20206C6574206C5F6E65776974656D203D2128674461746120262620284F626A6563742E6B657973286744617461292E6C656E6774683E3029293B0A20202020202020202020202020202020646174615B222464656673225D3D646174615B2722246465';
wwv_flow_api.g_varchar2_table(1019) := '667322275D3B0A20202020202020202020202020202020617065782E64656275672E74726163652827574F524152524F554E4420246465667327293B0A20202020202020202020202020202020704F7074696F6E732E736368656D61203D20646174613B';
wwv_flow_api.g_varchar2_table(1020) := '0A20202020202020202020202020202020704F7074696F6E73203D2061646A7573744F7074696F6E7328704F7074696F6E73293B0A20202020202020202020202020202020704F7074696F6E732E736368656D61203D2070726F70616761746552656673';
wwv_flow_api.g_varchar2_table(1021) := '28704F7074696F6E732E736368656D61293B0A2020202020202020202020202020202070726F70616761746550726F7065727469657328704F7074696F6E732E736368656D612C20302C20704F7074696F6E732E726561646F6E6C792C2066616C73652C';
wwv_flow_api.g_varchar2_table(1022) := '20704F7074696F6E732E6B656570417474726962757465732C2066616C7365293B0A202020202020202020202020202020206C6574206C5F6974656D7479706573203D206E756C6C3B0A202020202020202020202020202020206C5F6974656D74797065';
wwv_flow_api.g_varchar2_table(1023) := '73203D206765744974656D747970657328704F7074696F6E732E736368656D612C206C5F6974656D7479706573293B0A20202020202020202020202020202020617065782E64656275672E74726163652827704F7074696F6E733A272C20704F7074696F';
wwv_flow_api.g_varchar2_table(1024) := '6E73293B0A2020202020202020202020202020202073686F774669656C6473286C5F6974656D7479706573293B0A202020202020202020202020202020206177616974206C6F6164526571756972656446696C6573286C5F6974656D7479706573293B0A';
wwv_flow_api.g_varchar2_table(1025) := '2020202020202020202020202020202061776169742072696368746578744861636B28293B0A202020202020202020202020202020206174746163684F626A65637428704F7074696F6E732E646174616974656D2C2027272C20704F7074696F6E732E73';
wwv_flow_api.g_varchar2_table(1026) := '6368656D612C20704F7074696F6E732E726561646F6E6C792C2067446174612C206C5F6E65776974656D293B0A20202020202020202020202020202020617065784861636B7328293B0A202020202020202020202020202020207365744F626A65637456';
wwv_flow_api.g_varchar2_table(1027) := '616C75657328704F7074696F6E732E646174616974656D2C2027272C20704F7074696F6E732E736368656D612C20704F7074696F6E732E726561646F6E6C792C206744617461290A20202020202020202020202020202020637265617465526567696F6E';
wwv_flow_api.g_varchar2_table(1028) := '28293B0A20202020202020202020202020207D0A2020202020202020202020207D20200A20202020202020202020293B0A20202020202020207D0A2020202020202020617065782E64656275672E747261636528273C3C63616C6C6261636B2E72656672';
wwv_flow_api.g_varchar2_table(1029) := '65736827290A2020202020207D2C0A0A20202020202020202F2F2043616C6C6261636B2063616C6C6564206279206576656E742022617065786265666F7265706167657375626D6974220A2020202020206265666F72655375626D69743A2066756E6374';
wwv_flow_api.g_varchar2_table(1030) := '696F6E2028297B0A2020202020202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E6265666F72655375626D6974222C2070526567696F6E49642C20704F7074696F6E732E646174616974656D2C20704F7074696F6E73';
wwv_flow_api.g_varchar2_table(1031) := '2E736368656D61293B0A202020202020202069662821704F7074696F6E732E726561646F6E6C79297B20202F2F20646F206E6F7468696E6720666F7220726561646F6E6C79206A736F6E2D726567696F6E0A20202020202020202020617065782E646562';
wwv_flow_api.g_varchar2_table(1032) := '75672E747261636528276A736F6E526567696F6E272C20704F7074696F6E73293B0A202020202020202020206C6574206C5F6A736F6E3D6765744F626A65637456616C75657328704F7074696F6E732E646174616974656D2C2027272C20704F7074696F';
wwv_flow_api.g_varchar2_table(1033) := '6E732E736368656D612C206744617461293B0A20202020202020202020696628704F7074696F6E732E72656D6F76654E756C6C73297B0A2020202020202020202020206C5F6A736F6E203D2072656D6F76654E756C6C73286C5F6A736F6E293B0A202020';
wwv_flow_api.g_varchar2_table(1034) := '202020202020202020617065782E64656275672E7472616365282772656D6F766564204E554C4C73272C206C5F6A736F6E293B0A202020202020202020207D0A20202020202020202020617065782E64656275672E7472616365282767656E6572617465';
wwv_flow_api.g_varchar2_table(1035) := '64204A534F4E272C206C5F6A736F6E293B0A20202020202020202020617065782E6974656D28704F7074696F6E732E646174616974656D292E73657456616C7565284A534F4E2E737472696E67696679286C5F6A736F6E29293B0A20202020202020207D';
wwv_flow_api.g_varchar2_table(1036) := '0A2020202020202020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E6265666F72655375626D697422293B0A2020202020207D2C0A0A20202020202020202F2F2043616C6C6261636B2063616C6C6564206279206576656E';
wwv_flow_api.g_varchar2_table(1037) := '74202261706578706167657375626D6974220A2020202020207375626D69743A2066756E6374696F6E28297B0A2020202020202020617065782E64656275672E747261636528223E3E6A736F6E526567696F6E2E7375626D697422293B0A202020202020';
wwv_flow_api.g_varchar2_table(1038) := '202020202F2F204861636B20746F2072656D6F7665207468652064796E616D6963616C6C792067656E657261746564206974656D2066726F6D20636C69656E742D726573706F6E73650A20202020202020202428272327202B2070526567696F6E496420';
wwv_flow_api.g_varchar2_table(1039) := '2B202720696E70757427292E72656D6F76654174747228276E616D6527293B0A20202020202020202428272327202B2070526567696F6E4964202B202720746578746172656127292E72656D6F76654174747228276E616D6527293B0A20202020202020';
wwv_flow_api.g_varchar2_table(1040) := '202428272327202B2070526567696F6E4964202B20272073656C65637427292E72656D6F76654174747228276E616D6527293B20200A20202020202020202428272327202B2070526567696F6E4964202B202720612D636F6D626F626F7827292E72656D';
wwv_flow_api.g_varchar2_table(1041) := '6F76654174747228276E616D6527293B0A20202020202020202428272327202B2070526567696F6E4964202B202720612D726963682D746578742D656469746F7227292E72656D6F76654174747228276E616D6527293B2020202020200A202020202020';
wwv_flow_api.g_varchar2_table(1042) := '2020617065782E64656275672E747261636528223C3C6A736F6E526567696F6E2E7375626D697422293B0A2020202020207D0A202020207D3B0A0A20202020617065782E6A517565727928617065782E6750616765436F6E7465787424292E62696E6428';
wwv_flow_api.g_varchar2_table(1043) := '2022617065786265666F7265706167657375626D6974222C2066756E6374696F6E2829207B0A20202020202063616C6C6261636B732E6265666F72655375626D697428293B0A202020207D293B0A20202020617065782E6A51756572792820617065782E';
wwv_flow_api.g_varchar2_table(1044) := '6750616765436F6E746578742420292E6F6E28202261706578706167657375626D6974222C2066756E6374696F6E2829207B0A20202020202063616C6C6261636B732E7375626D697428293B0A202020207D293B0A20202020617065782E6A5175657279';
wwv_flow_api.g_varchar2_table(1045) := '282077696E646F7720292E6F6E282022617065786265666F726572656672657368222C2066756E6374696F6E2829207B0A202020202020617065782E64656275672E747261636528274556454E543A272C2027617065786265666F726572656672657368';
wwv_flow_api.g_varchar2_table(1046) := '27293B0A202020207D293B0A20202020617065782E6A5175657279282077696E646F7720292E6F6E28202261706578616674657272656672657368222C2066756E6374696F6E2829207B0A202020202020617065782E64656275672E7472616365282745';
wwv_flow_api.g_varchar2_table(1047) := '56454E543A272C20276170657861667465727265667265736827293B0A202020207D293B0A0A20202020617065782E6A5175657279282077696E646F7720292E6F6E282022617065787265616479656E64222C2066756E6374696F6E2820652029207B0A';
wwv_flow_api.g_varchar2_table(1048) := '202020202020617065782E64656275672E747261636528274556454E543A272C2027617065787265616479656E6427293B0A202020207D293B0A0A20202020617065782E6A5175657279282077696E646F7720292E6F6E2820226170657877696E646F77';
wwv_flow_api.g_varchar2_table(1049) := '726573697A6564222C2066756E6374696F6E28206576656E742029207B0A202020202020617065782E64656275672E747261636528274556454E543A272C20276170657877696E646F77726573697A656427293B0A202020207D293B0A0A202020202428';
wwv_flow_api.g_varchar2_table(1050) := '272327202B2070526567696F6E4964292E72656164792866756E6374696F6E2829207B0A202020202020617065782E64656275672E747261636528274556454E543A272C20274A517565727920726561647927293B0A2020202020207365744F626A6563';
wwv_flow_api.g_varchar2_table(1051) := '7456616C75657328704F7074696F6E732E646174616974656D2C2027272C20704F7074696F6E732E736368656D612C20704F7074696F6E732E726561646F6E6C792C206744617461293B0A202020207D293B0A20202020637265617465526567696F6E28';
wwv_flow_api.g_varchar2_table(1052) := '293B0A20207D2928293B0A0A2020617065782E64656275672E747261636528223C3C696E69744A736F6E526567696F6E22293B20200A7D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(6724445789938499)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_file_name=>'json-region.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6A736F6E726567696F6E207B0A20206D617267696E2D6C6566743A202D302E3572656D3B0A20206D617267696E2D72696768743A202D302E3572656D3B0A7D0A0A2E6A736F6E726567696F6E202E742D526567696F6E2D686561646572207B0A202062';
wwv_flow_api.g_varchar2_table(2) := '6F726465722D626C6F636B2D656E642D7374796C653A206E6F6E653B0A7D0A0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696D67207B0A20206D61782D6865696768743A20313030253B0A20206D61782D77696474';
wwv_flow_api.g_varchar2_table(3) := '683A20313030253B0A7D0A0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220737667207B0A20206865696768743A20313030253B0A7D0A0A2E6A736F6E726567696F6E202E742D526567696F6E2D686561646572207B0A';
wwv_flow_api.g_varchar2_table(4) := '20206D617267696E2D746F703A203870783B0A20206D617267696E2D626F74746F6D3A203470783B0A7D0A0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D74696D655D3A3A2D7765626B69';
wwv_flow_api.g_varchar2_table(5) := '742D63616C656E6461722D7069636B65722D696E64696361746F722C0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D646174655D3A3A2D7765626B69742D63616C656E6461722D7069636B';
wwv_flow_api.g_varchar2_table(6) := '65722D696E64696361746F722C0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D6461746574696D652D6C6F63616C5D3A3A2D7765626B69742D63616C656E6461722D7069636B65722D696E';
wwv_flow_api.g_varchar2_table(7) := '64696361746F720A207B0A2020706F736974696F6E3A2072656C61746976653B0A2020746F703A202D313070783B0A7D0A0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D74696D655D2C0A';
wwv_flow_api.g_varchar2_table(8) := '2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D646174655D2C0A2E6A736F6E726567696F6E202E742D466F726D2D6974656D5772617070657220696E7075745B747970653D6461746574696D';
wwv_flow_api.g_varchar2_table(9) := '652D6C6F63616C5D7B0A20206865696768743A203372656D3B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(12140779524910065)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_file_name=>'json-region.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0A202A206D61726B6564207631322E302E31202D2061206D61726B646F776E207061727365720A202A20436F707972696768742028632920323031312D323032342C204368726973746F70686572204A6566667265792E20284D4954204C696365';
wwv_flow_api.g_varchar2_table(2) := '6E736564290A202A2068747470733A2F2F6769746875622E636F6D2F6D61726B65646A732F6D61726B65640A202A2F0A0A2F2A2A0A202A20444F204E4F54204544495420544849532046494C450A202A2054686520636F646520696E2074686973206669';
wwv_flow_api.g_varchar2_table(3) := '6C652069732067656E6572617465642066726F6D2066696C657320696E202E2F7372632F0A202A2F0A0A2F2A2A0A202A204765747320746865206F726967696E616C206D61726B65642064656661756C74206F7074696F6E732E0A202A2F0A66756E6374';
wwv_flow_api.g_varchar2_table(4) := '696F6E205F67657444656661756C74732829207B0A2020202072657475726E207B0A20202020202020206173796E633A2066616C73652C0A2020202020202020627265616B733A2066616C73652C0A2020202020202020657874656E73696F6E733A206E';
wwv_flow_api.g_varchar2_table(5) := '756C6C2C0A202020202020202067666D3A20747275652C0A2020202020202020686F6F6B733A206E756C6C2C0A2020202020202020706564616E7469633A2066616C73652C0A202020202020202072656E64657265723A206E756C6C2C0A202020202020';
wwv_flow_api.g_varchar2_table(6) := '202073696C656E743A2066616C73652C0A2020202020202020746F6B656E697A65723A206E756C6C2C0A202020202020202077616C6B546F6B656E733A206E756C6C0A202020207D3B0A7D0A6C6574205F64656661756C7473203D205F67657444656661';
wwv_flow_api.g_varchar2_table(7) := '756C747328293B0A66756E6374696F6E206368616E676544656661756C7473286E657744656661756C747329207B0A202020205F64656661756C7473203D206E657744656661756C74733B0A7D0A0A2F2A2A0A202A2048656C706572730A202A2F0A636F';
wwv_flow_api.g_varchar2_table(8) := '6E73742065736361706554657374203D202F5B263C3E22275D2F3B0A636F6E7374206573636170655265706C616365203D206E65772052656745787028657363617065546573742E736F757263652C20276727293B0A636F6E7374206573636170655465';
wwv_flow_api.g_varchar2_table(9) := '73744E6F456E636F6465203D202F5B3C3E22275D7C26283F2128235C647B312C377D7C235B58785D5B612D66412D46302D395D7B312C367D7C5C772B293B292F3B0A636F6E7374206573636170655265706C6163654E6F456E636F6465203D206E657720';
wwv_flow_api.g_varchar2_table(10) := '52656745787028657363617065546573744E6F456E636F64652E736F757263652C20276727293B0A636F6E7374206573636170655265706C6163656D656E7473203D207B0A202020202726273A202726616D703B272C0A20202020273C273A2027266C74';
wwv_flow_api.g_varchar2_table(11) := '3B272C0A20202020273E273A20272667743B272C0A202020202722273A20272671756F743B272C0A202020202227223A2027262333393B270A7D3B0A636F6E7374206765744573636170655265706C6163656D656E74203D2028636829203D3E20657363';
wwv_flow_api.g_varchar2_table(12) := '6170655265706C6163656D656E74735B63685D3B0A66756E6374696F6E2065736361706524312868746D6C2C20656E636F646529207B0A2020202069662028656E636F646529207B0A202020202020202069662028657363617065546573742E74657374';
wwv_flow_api.g_varchar2_table(13) := '2868746D6C2929207B0A20202020202020202020202072657475726E2068746D6C2E7265706C616365286573636170655265706C6163652C206765744573636170655265706C6163656D656E74293B0A20202020202020207D0A202020207D0A20202020';
wwv_flow_api.g_varchar2_table(14) := '656C7365207B0A202020202020202069662028657363617065546573744E6F456E636F64652E746573742868746D6C2929207B0A20202020202020202020202072657475726E2068746D6C2E7265706C616365286573636170655265706C6163654E6F45';
wwv_flow_api.g_varchar2_table(15) := '6E636F64652C206765744573636170655265706C6163656D656E74293B0A20202020202020207D0A202020207D0A2020202072657475726E2068746D6C3B0A7D0A636F6E737420756E65736361706554657374203D202F262823283F3A5C642B297C283F';
wwv_flow_api.g_varchar2_table(16) := '3A23785B302D39412D46612D665D2B297C283F3A5C772B29293B3F2F69673B0A66756E6374696F6E20756E6573636170652868746D6C29207B0A202020202F2F206578706C696369746C79206D6174636820646563696D616C2C206865782C20616E6420';
wwv_flow_api.g_varchar2_table(17) := '6E616D65642048544D4C20656E7469746965730A2020202072657475726E2068746D6C2E7265706C61636528756E657363617065546573742C20285F2C206E29203D3E207B0A20202020202020206E203D206E2E746F4C6F7765724361736528293B0A20';
wwv_flow_api.g_varchar2_table(18) := '20202020202020696620286E203D3D3D2027636F6C6F6E27290A20202020202020202020202072657475726E20273A273B0A2020202020202020696620286E2E636861724174283029203D3D3D2027232729207B0A202020202020202020202020726574';
wwv_flow_api.g_varchar2_table(19) := '75726E206E2E636861724174283129203D3D3D202778270A202020202020202020202020202020203F20537472696E672E66726F6D43686172436F6465287061727365496E74286E2E737562737472696E672832292C20313629290A2020202020202020';
wwv_flow_api.g_varchar2_table(20) := '20202020202020203A20537472696E672E66726F6D43686172436F6465282B6E2E737562737472696E67283129293B0A20202020202020207D0A202020202020202072657475726E2027273B0A202020207D293B0A7D0A636F6E7374206361726574203D';
wwv_flow_api.g_varchar2_table(21) := '202F285E7C5B5E5C5B5D295C5E2F673B0A66756E6374696F6E20656469742872656765782C206F707429207B0A202020206C657420736F75726365203D20747970656F66207265676578203D3D3D2027737472696E6727203F207265676578203A207265';
wwv_flow_api.g_varchar2_table(22) := '6765782E736F757263653B0A202020206F7074203D206F7074207C7C2027273B0A20202020636F6E7374206F626A203D207B0A20202020202020207265706C6163653A20286E616D652C2076616C29203D3E207B0A2020202020202020202020206C6574';
wwv_flow_api.g_varchar2_table(23) := '2076616C536F75726365203D20747970656F662076616C203D3D3D2027737472696E6727203F2076616C203A2076616C2E736F757263653B0A20202020202020202020202076616C536F75726365203D2076616C536F757263652E7265706C6163652863';
wwv_flow_api.g_varchar2_table(24) := '617265742C2027243127293B0A202020202020202020202020736F75726365203D20736F757263652E7265706C616365286E616D652C2076616C536F75726365293B0A20202020202020202020202072657475726E206F626A3B0A20202020202020207D';
wwv_flow_api.g_varchar2_table(25) := '2C0A202020202020202067657452656765783A202829203D3E207B0A20202020202020202020202072657475726E206E65772052656745787028736F757263652C206F7074293B0A20202020202020207D0A202020207D3B0A2020202072657475726E20';
wwv_flow_api.g_varchar2_table(26) := '6F626A3B0A7D0A66756E6374696F6E20636C65616E55726C286872656629207B0A20202020747279207B0A202020202020202068726566203D20656E636F64655552492868726566292E7265706C616365282F2532352F672C20272527293B0A20202020';
wwv_flow_api.g_varchar2_table(27) := '7D0A20202020636174636820286529207B0A202020202020202072657475726E206E756C6C3B0A202020207D0A2020202072657475726E20687265663B0A7D0A636F6E7374206E6F6F7054657374203D207B20657865633A202829203D3E206E756C6C20';
wwv_flow_api.g_varchar2_table(28) := '7D3B0A66756E6374696F6E2073706C697443656C6C73287461626C65526F772C20636F756E7429207B0A202020202F2F20656E7375726520746861742065766572792063656C6C2D64656C696D6974696E6720706970652068617320612073706163650A';
wwv_flow_api.g_varchar2_table(29) := '202020202F2F206265666F726520697420746F2064697374696E67756973682069742066726F6D20616E206573636170656420706970650A20202020636F6E737420726F77203D207461626C65526F772E7265706C616365282F5C7C2F672C20286D6174';
wwv_flow_api.g_varchar2_table(30) := '63682C206F66667365742C2073747229203D3E207B0A20202020202020206C65742065736361706564203D2066616C73653B0A20202020202020206C65742063757272203D206F66667365743B0A20202020202020207768696C6520282D2D6375727220';
wwv_flow_api.g_varchar2_table(31) := '3E3D2030202626207374725B637572725D203D3D3D20275C5C27290A20202020202020202020202065736361706564203D2021657363617065643B0A2020202020202020696620286573636170656429207B0A2020202020202020202020202F2F206F64';
wwv_flow_api.g_varchar2_table(32) := '64206E756D626572206F6620736C6173686573206D65616E73207C20697320657363617065640A2020202020202020202020202F2F20736F207765206C6561766520697420616C6F6E650A20202020202020202020202072657475726E20277C273B0A20';
wwv_flow_api.g_varchar2_table(33) := '202020202020207D0A2020202020202020656C7365207B0A2020202020202020202020202F2F20616464207370616365206265666F726520756E65736361706564207C0A20202020202020202020202072657475726E2027207C273B0A20202020202020';
wwv_flow_api.g_varchar2_table(34) := '207D0A202020207D292C2063656C6C73203D20726F772E73706C6974282F205C7C2F293B0A202020206C65742069203D20303B0A202020202F2F2046697273742F6C6173742063656C6C20696E206120726F772063616E6E6F7420626520656D70747920';
wwv_flow_api.g_varchar2_table(35) := '696620697420686173206E6F206C656164696E672F747261696C696E6720706970650A20202020696620282163656C6C735B305D2E7472696D282929207B0A202020202020202063656C6C732E736869667428293B0A202020207D0A2020202069662028';
wwv_flow_api.g_varchar2_table(36) := '63656C6C732E6C656E677468203E2030202626202163656C6C735B63656C6C732E6C656E677468202D20315D2E7472696D282929207B0A202020202020202063656C6C732E706F7028293B0A202020207D0A2020202069662028636F756E7429207B0A20';
wwv_flow_api.g_varchar2_table(37) := '202020202020206966202863656C6C732E6C656E677468203E20636F756E7429207B0A20202020202020202020202063656C6C732E73706C69636528636F756E74293B0A20202020202020207D0A2020202020202020656C7365207B0A20202020202020';
wwv_flow_api.g_varchar2_table(38) := '20202020207768696C65202863656C6C732E6C656E677468203C20636F756E74290A2020202020202020202020202020202063656C6C732E70757368282727293B0A20202020202020207D0A202020207D0A20202020666F7220283B2069203C2063656C';
wwv_flow_api.g_varchar2_table(39) := '6C732E6C656E6774683B20692B2B29207B0A20202020202020202F2F206C656164696E67206F7220747261696C696E6720776869746573706163652069732069676E6F72656420706572207468652067666D20737065630A202020202020202063656C6C';
wwv_flow_api.g_varchar2_table(40) := '735B695D203D2063656C6C735B695D2E7472696D28292E7265706C616365282F5C5C5C7C2F672C20277C27293B0A202020207D0A2020202072657475726E2063656C6C733B0A7D0A2F2A2A0A202A2052656D6F766520747261696C696E6720276327732E';
wwv_flow_api.g_varchar2_table(41) := '204571756976616C656E7420746F207374722E7265706C616365282F632A242F2C202727292E0A202A202F632A242F2069732076756C6E657261626C6520746F205245444F532E0A202A0A202A2040706172616D207374720A202A2040706172616D2063';
wwv_flow_api.g_varchar2_table(42) := '0A202A2040706172616D20696E766572742052656D6F766520737566666978206F66206E6F6E2D6320636861727320696E73746561642E2044656661756C742066616C7365792E0A202A2F0A66756E6374696F6E20727472696D287374722C20632C2069';
wwv_flow_api.g_varchar2_table(43) := '6E7665727429207B0A20202020636F6E7374206C203D207374722E6C656E6774683B0A20202020696620286C203D3D3D203029207B0A202020202020202072657475726E2027273B0A202020207D0A202020202F2F204C656E677468206F662073756666';
wwv_flow_api.g_varchar2_table(44) := '6978206D61746368696E672074686520696E7665727420636F6E646974696F6E2E0A202020206C657420737566664C656E203D20303B0A202020202F2F2053746570206C65667420756E74696C207765206661696C20746F206D61746368207468652069';
wwv_flow_api.g_varchar2_table(45) := '6E7665727420636F6E646974696F6E2E0A202020207768696C652028737566664C656E203C206C29207B0A2020202020202020636F6E7374206375727243686172203D207374722E636861724174286C202D20737566664C656E202D2031293B0A202020';
wwv_flow_api.g_varchar2_table(46) := '2020202020696620286375727243686172203D3D3D20632026262021696E7665727429207B0A202020202020202020202020737566664C656E2B2B3B0A20202020202020207D0A2020202020202020656C73652069662028637572724368617220213D3D';
wwv_flow_api.g_varchar2_table(47) := '206320262620696E7665727429207B0A202020202020202020202020737566664C656E2B2B3B0A20202020202020207D0A2020202020202020656C7365207B0A202020202020202020202020627265616B3B0A20202020202020207D0A202020207D0A20';
wwv_flow_api.g_varchar2_table(48) := '20202072657475726E207374722E736C69636528302C206C202D20737566664C656E293B0A7D0A66756E6374696F6E2066696E64436C6F73696E67427261636B6574287374722C206229207B0A20202020696620287374722E696E6465784F6628625B31';
wwv_flow_api.g_varchar2_table(49) := '5D29203D3D3D202D3129207B0A202020202020202072657475726E202D313B0A202020207D0A202020206C6574206C6576656C203D20303B0A20202020666F7220286C65742069203D20303B2069203C207374722E6C656E6774683B20692B2B29207B0A';
wwv_flow_api.g_varchar2_table(50) := '2020202020202020696620287374725B695D203D3D3D20275C5C2729207B0A202020202020202020202020692B2B3B0A20202020202020207D0A2020202020202020656C736520696620287374725B695D203D3D3D20625B305D29207B0A202020202020';
wwv_flow_api.g_varchar2_table(51) := '2020202020206C6576656C2B2B3B0A20202020202020207D0A2020202020202020656C736520696620287374725B695D203D3D3D20625B315D29207B0A2020202020202020202020206C6576656C2D2D3B0A202020202020202020202020696620286C65';
wwv_flow_api.g_varchar2_table(52) := '76656C203C203029207B0A2020202020202020202020202020202072657475726E20693B0A2020202020202020202020207D0A20202020202020207D0A202020207D0A2020202072657475726E202D313B0A7D0A0A66756E6374696F6E206F7574707574';
wwv_flow_api.g_varchar2_table(53) := '4C696E6B286361702C206C696E6B2C207261772C206C6578657229207B0A20202020636F6E73742068726566203D206C696E6B2E687265663B0A20202020636F6E7374207469746C65203D206C696E6B2E7469746C65203F206573636170652431286C69';
wwv_flow_api.g_varchar2_table(54) := '6E6B2E7469746C6529203A206E756C6C3B0A20202020636F6E73742074657874203D206361705B315D2E7265706C616365282F5C5C285B5C5B5C5D5D292F672C2027243127293B0A20202020696620286361705B305D2E63686172417428302920213D3D';
wwv_flow_api.g_varchar2_table(55) := '2027212729207B0A20202020202020206C657865722E73746174652E696E4C696E6B203D20747275653B0A2020202020202020636F6E737420746F6B656E203D207B0A202020202020202020202020747970653A20276C696E6B272C0A20202020202020';
wwv_flow_api.g_varchar2_table(56) := '20202020207261772C0A202020202020202020202020687265662C0A2020202020202020202020207469746C652C0A202020202020202020202020746578742C0A202020202020202020202020746F6B656E733A206C657865722E696E6C696E65546F6B';
wwv_flow_api.g_varchar2_table(57) := '656E732874657874290A20202020202020207D3B0A20202020202020206C657865722E73746174652E696E4C696E6B203D2066616C73653B0A202020202020202072657475726E20746F6B656E3B0A202020207D0A2020202072657475726E207B0A2020';
wwv_flow_api.g_varchar2_table(58) := '202020202020747970653A2027696D616765272C0A20202020202020207261772C0A2020202020202020687265662C0A20202020202020207469746C652C0A2020202020202020746578743A2065736361706524312874657874290A202020207D3B0A7D';
wwv_flow_api.g_varchar2_table(59) := '0A66756E6374696F6E20696E64656E74436F6465436F6D70656E736174696F6E287261772C207465787429207B0A20202020636F6E7374206D61746368496E64656E74546F436F6465203D207261772E6D61746368282F5E285C732B29283F3A60606029';
wwv_flow_api.g_varchar2_table(60) := '2F293B0A20202020696620286D61746368496E64656E74546F436F6465203D3D3D206E756C6C29207B0A202020202020202072657475726E20746578743B0A202020207D0A20202020636F6E737420696E64656E74546F436F6465203D206D6174636849';
wwv_flow_api.g_varchar2_table(61) := '6E64656E74546F436F64655B315D3B0A2020202072657475726E20746578740A20202020202020202E73706C697428275C6E27290A20202020202020202E6D6170286E6F6465203D3E207B0A2020202020202020636F6E7374206D61746368496E64656E';
wwv_flow_api.g_varchar2_table(62) := '74496E4E6F6465203D206E6F64652E6D61746368282F5E5C732B2F293B0A2020202020202020696620286D61746368496E64656E74496E4E6F6465203D3D3D206E756C6C29207B0A20202020202020202020202072657475726E206E6F64653B0A202020';
wwv_flow_api.g_varchar2_table(63) := '20202020207D0A2020202020202020636F6E7374205B696E64656E74496E4E6F64655D203D206D61746368496E64656E74496E4E6F64653B0A202020202020202069662028696E64656E74496E4E6F64652E6C656E677468203E3D20696E64656E74546F';
wwv_flow_api.g_varchar2_table(64) := '436F64652E6C656E67746829207B0A20202020202020202020202072657475726E206E6F64652E736C69636528696E64656E74546F436F64652E6C656E677468293B0A20202020202020207D0A202020202020202072657475726E206E6F64653B0A2020';
wwv_flow_api.g_varchar2_table(65) := '20207D290A20202020202020202E6A6F696E28275C6E27293B0A7D0A2F2A2A0A202A20546F6B656E697A65720A202A2F0A636C617373205F546F6B656E697A6572207B0A202020206F7074696F6E733B0A2020202072756C65733B202F2F207365742062';
wwv_flow_api.g_varchar2_table(66) := '7920746865206C657865720A202020206C657865723B202F2F2073657420627920746865206C657865720A20202020636F6E7374727563746F72286F7074696F6E7329207B0A2020202020202020746869732E6F7074696F6E73203D206F7074696F6E73';
wwv_flow_api.g_varchar2_table(67) := '207C7C205F64656661756C74733B0A202020207D0A2020202073706163652873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E6E65776C696E652E6578656328737263293B0A202020202020';
wwv_flow_api.g_varchar2_table(68) := '202069662028636170202626206361705B305D2E6C656E677468203E203029207B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A20277370616365272C0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(69) := '20207261773A206361705B305D0A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A20202020636F64652873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E636F';
wwv_flow_api.g_varchar2_table(70) := '64652E6578656328737263293B0A20202020202020206966202863617029207B0A202020202020202020202020636F6E73742074657874203D206361705B305D2E7265706C616365282F5E207B312C347D2F676D2C202727293B0A202020202020202020';
wwv_flow_api.g_varchar2_table(71) := '20202072657475726E207B0A20202020202020202020202020202020747970653A2027636F6465272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020202020202020202020636F6465426C6F636B5374796C';
wwv_flow_api.g_varchar2_table(72) := '653A2027696E64656E746564272C0A20202020202020202020202020202020746578743A2021746869732E6F7074696F6E732E706564616E7469630A20202020202020202020202020202020202020203F20727472696D28746578742C20275C6E27290A';
wwv_flow_api.g_varchar2_table(73) := '20202020202020202020202020202020202020203A20746578740A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A2020202066656E6365732873726329207B0A2020202020202020636F6E737420636170203D2074686973';
wwv_flow_api.g_varchar2_table(74) := '2E72756C65732E626C6F636B2E66656E6365732E6578656328737263293B0A20202020202020206966202863617029207B0A202020202020202020202020636F6E737420726177203D206361705B305D3B0A202020202020202020202020636F6E737420';
wwv_flow_api.g_varchar2_table(75) := '74657874203D20696E64656E74436F6465436F6D70656E736174696F6E287261772C206361705B335D207C7C202727293B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A2027636F6465272C';
wwv_flow_api.g_varchar2_table(76) := '0A202020202020202020202020202020207261772C0A202020202020202020202020202020206C616E673A206361705B325D203F206361705B325D2E7472696D28292E7265706C61636528746869732E72756C65732E696E6C696E652E616E7950756E63';
wwv_flow_api.g_varchar2_table(77) := '74756174696F6E2C202724312729203A206361705B325D2C0A20202020202020202020202020202020746578740A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A2020202068656164696E672873726329207B0A20202020';
wwv_flow_api.g_varchar2_table(78) := '20202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E68656164696E672E6578656328737263293B0A20202020202020206966202863617029207B0A2020202020202020202020206C65742074657874203D206361705B325D';
wwv_flow_api.g_varchar2_table(79) := '2E7472696D28293B0A2020202020202020202020202F2F2072656D6F766520747261696C696E672023730A202020202020202020202020696620282F23242F2E7465737428746578742929207B0A20202020202020202020202020202020636F6E737420';
wwv_flow_api.g_varchar2_table(80) := '7472696D6D6564203D20727472696D28746578742C20272327293B0A2020202020202020202020202020202069662028746869732E6F7074696F6E732E706564616E74696329207B0A202020202020202020202020202020202020202074657874203D20';
wwv_flow_api.g_varchar2_table(81) := '7472696D6D65642E7472696D28293B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C73652069662028217472696D6D6564207C7C202F20242F2E74657374287472696D6D65642929207B0A20202020202020';
wwv_flow_api.g_varchar2_table(82) := '202020202020202020202020202F2F20436F6D6D6F6E4D61726B207265717569726573207370616365206265666F726520747261696C696E672023730A202020202020202020202020202020202020202074657874203D207472696D6D65642E7472696D';
wwv_flow_api.g_varchar2_table(83) := '28293B0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A202768656164696E67272C0A20202020202020202020';
wwv_flow_api.g_varchar2_table(84) := '2020202020207261773A206361705B305D2C0A2020202020202020202020202020202064657074683A206361705B315D2E6C656E6774682C0A20202020202020202020202020202020746578742C0A20202020202020202020202020202020746F6B656E';
wwv_flow_api.g_varchar2_table(85) := '733A20746869732E6C657865722E696E6C696E652874657874290A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A2020202068722873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C';
wwv_flow_api.g_varchar2_table(86) := '65732E626C6F636B2E68722E6578656328737263293B0A20202020202020206966202863617029207B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A20276872272C0A202020202020202020';
wwv_flow_api.g_varchar2_table(87) := '202020202020207261773A206361705B305D0A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A20202020626C6F636B71756F74652873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C';
wwv_flow_api.g_varchar2_table(88) := '65732E626C6F636B2E626C6F636B71756F74652E6578656328737263293B0A20202020202020206966202863617029207B0A202020202020202020202020636F6E73742074657874203D20727472696D286361705B305D2E7265706C616365282F5E202A';
wwv_flow_api.g_varchar2_table(89) := '3E5B205C745D3F2F676D2C202727292C20275C6E27293B0A202020202020202020202020636F6E737420746F70203D20746869732E6C657865722E73746174652E746F703B0A202020202020202020202020746869732E6C657865722E73746174652E74';
wwv_flow_api.g_varchar2_table(90) := '6F70203D20747275653B0A202020202020202020202020636F6E737420746F6B656E73203D20746869732E6C657865722E626C6F636B546F6B656E732874657874293B0A202020202020202020202020746869732E6C657865722E73746174652E746F70';
wwv_flow_api.g_varchar2_table(91) := '203D20746F703B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A2027626C6F636B71756F7465272C0A202020202020202020202020202020207261773A206361705B305D2C0A202020202020';
wwv_flow_api.g_varchar2_table(92) := '20202020202020202020746F6B656E732C0A20202020202020202020202020202020746578740A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A202020206C6973742873726329207B0A20202020202020206C6574206361';
wwv_flow_api.g_varchar2_table(93) := '70203D20746869732E72756C65732E626C6F636B2E6C6973742E6578656328737263293B0A20202020202020206966202863617029207B0A2020202020202020202020206C65742062756C6C203D206361705B315D2E7472696D28293B0A202020202020';
wwv_flow_api.g_varchar2_table(94) := '202020202020636F6E73742069736F726465726564203D2062756C6C2E6C656E677468203E20313B0A202020202020202020202020636F6E7374206C697374203D207B0A20202020202020202020202020202020747970653A20276C697374272C0A2020';
wwv_flow_api.g_varchar2_table(95) := '20202020202020202020202020207261773A2027272C0A202020202020202020202020202020206F7264657265643A2069736F7264657265642C0A2020202020202020202020202020202073746172743A2069736F726465726564203F202B62756C6C2E';
wwv_flow_api.g_varchar2_table(96) := '736C69636528302C202D3129203A2027272C0A202020202020202020202020202020206C6F6F73653A2066616C73652C0A202020202020202020202020202020206974656D733A205B5D0A2020202020202020202020207D3B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(97) := '202062756C6C203D2069736F726465726564203F20605C5C647B312C397D5C5C247B62756C6C2E736C696365282D31297D60203A20605C5C247B62756C6C7D603B0A20202020202020202020202069662028746869732E6F7074696F6E732E706564616E';
wwv_flow_api.g_varchar2_table(98) := '74696329207B0A2020202020202020202020202020202062756C6C203D2069736F726465726564203F2062756C6C203A20275B2A2B2D5D273B0A2020202020202020202020207D0A2020202020202020202020202F2F20476574206E657874206C697374';
wwv_flow_api.g_varchar2_table(99) := '206974656D0A202020202020202020202020636F6E7374206974656D5265676578203D206E65772052656745787028605E28207B302C337D247B62756C6C7D2928283F3A5B5C74205D5B5E5C5C6E5D2A293F283F3A5C5C6E7C24292960293B0A20202020';
wwv_flow_api.g_varchar2_table(100) := '20202020202020206C657420726177203D2027273B0A2020202020202020202020206C6574206974656D436F6E74656E7473203D2027273B0A2020202020202020202020206C657420656E647357697468426C616E6B4C696E65203D2066616C73653B0A';
wwv_flow_api.g_varchar2_table(101) := '2020202020202020202020202F2F20436865636B2069662063757272656E742062756C6C657420706F696E742063616E2073746172742061206E6577204C697374204974656D0A2020202020202020202020207768696C65202873726329207B0A202020';
wwv_flow_api.g_varchar2_table(102) := '202020202020202020202020206C657420656E644561726C79203D2066616C73653B0A20202020202020202020202020202020696620282128636170203D206974656D52656765782E6578656328737263292929207B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(103) := '20202020202020627265616B3B0A202020202020202020202020202020207D0A2020202020202020202020202020202069662028746869732E72756C65732E626C6F636B2E68722E74657374287372632929207B202F2F20456E64206C69737420696620';
wwv_flow_api.g_varchar2_table(104) := '62756C6C6574207761732061637475616C6C792048522028706F737369626C79206D6F766520696E746F206974656D52656765783F290A2020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A';
wwv_flow_api.g_varchar2_table(105) := '20202020202020202020202020202020726177203D206361705B305D3B0A20202020202020202020202020202020737263203D207372632E737562737472696E67287261772E6C656E677468293B0A202020202020202020202020202020206C6574206C';
wwv_flow_api.g_varchar2_table(106) := '696E65203D206361705B325D2E73706C697428275C6E272C2031295B305D2E7265706C616365282F5E5C742B2F2C20287429203D3E202720272E7265706561742833202A20742E6C656E67746829293B0A202020202020202020202020202020206C6574';
wwv_flow_api.g_varchar2_table(107) := '206E6578744C696E65203D207372632E73706C697428275C6E272C2031295B305D3B0A202020202020202020202020202020206C657420696E64656E74203D20303B0A2020202020202020202020202020202069662028746869732E6F7074696F6E732E';
wwv_flow_api.g_varchar2_table(108) := '706564616E74696329207B0A2020202020202020202020202020202020202020696E64656E74203D20323B0A20202020202020202020202020202020202020206974656D436F6E74656E7473203D206C696E652E7472696D537461727428293B0A202020';
wwv_flow_api.g_varchar2_table(109) := '202020202020202020202020207D0A20202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020202020696E64656E74203D206361705B325D2E736561726368282F5B5E205D2F293B202F2F2046696E64206669';
wwv_flow_api.g_varchar2_table(110) := '727374206E6F6E2D737061636520636861720A2020202020202020202020202020202020202020696E64656E74203D20696E64656E74203E2034203F2031203A20696E64656E743B202F2F20547265617420696E64656E74656420636F646520626C6F63';
wwv_flow_api.g_varchar2_table(111) := '6B7320283E2034207370616365732920617320686176696E67206F6E6C79203120696E64656E740A20202020202020202020202020202020202020206974656D436F6E74656E7473203D206C696E652E736C69636528696E64656E74293B0A2020202020';
wwv_flow_api.g_varchar2_table(112) := '202020202020202020202020202020696E64656E74202B3D206361705B315D2E6C656E6774683B0A202020202020202020202020202020207D0A202020202020202020202020202020206C657420626C616E6B4C696E65203D2066616C73653B0A202020';
wwv_flow_api.g_varchar2_table(113) := '2020202020202020202020202069662028216C696E65202626202F5E202A242F2E74657374286E6578744C696E652929207B202F2F204974656D7320626567696E2077697468206174206D6F7374206F6E6520626C616E6B206C696E650A202020202020';
wwv_flow_api.g_varchar2_table(114) := '2020202020202020202020202020726177202B3D206E6578744C696E65202B20275C6E273B0A2020202020202020202020202020202020202020737263203D207372632E737562737472696E67286E6578744C696E652E6C656E677468202B2031293B0A';
wwv_flow_api.g_varchar2_table(115) := '2020202020202020202020202020202020202020656E644561726C79203D20747275653B0A202020202020202020202020202020207D0A202020202020202020202020202020206966202821656E644561726C7929207B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(116) := '2020202020202020636F6E7374206E65787442756C6C65745265676578203D206E65772052656745787028605E207B302C247B4D6174682E6D696E28332C20696E64656E74202D2031297D7D283F3A5B2A2B2D5D7C5C5C647B312C397D5B2E295D292828';
wwv_flow_api.g_varchar2_table(117) := '3F3A5B205C745D5B5E5C5C6E5D2A293F283F3A5C5C6E7C24292960293B0A2020202020202020202020202020202020202020636F6E73742068725265676578203D206E65772052656745787028605E207B302C247B4D6174682E6D696E28332C20696E64';
wwv_flow_api.g_varchar2_table(118) := '656E74202D2031297D7D28283F3A2D202A297B332C7D7C283F3A5F202A297B332C7D7C283F3A5C5C2A202A297B332C7D29283F3A5C5C6E2B7C242960293B0A2020202020202020202020202020202020202020636F6E73742066656E636573426567696E';
wwv_flow_api.g_varchar2_table(119) := '5265676578203D206E65772052656745787028605E207B302C247B4D6174682E6D696E28332C20696E64656E74202D2031297D7D283F3A5C605C605C607C7E7E7E2960293B0A2020202020202020202020202020202020202020636F6E73742068656164';
wwv_flow_api.g_varchar2_table(120) := '696E67426567696E5265676578203D206E65772052656745787028605E207B302C247B4D6174682E6D696E28332C20696E64656E74202D2031297D7D2360293B0A20202020202020202020202020202020202020202F2F20436865636B20696620666F6C';
wwv_flow_api.g_varchar2_table(121) := '6C6F77696E67206C696E65732073686F756C6420626520696E636C7564656420696E204C697374204974656D0A20202020202020202020202020202020202020207768696C65202873726329207B0A202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(122) := '202020636F6E7374207261774C696E65203D207372632E73706C697428275C6E272C2031295B305D3B0A2020202020202020202020202020202020202020202020206E6578744C696E65203D207261774C696E653B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(123) := '202020202020202020202F2F2052652D616C69676E20746F20666F6C6C6F7720636F6D6D6F6E6D61726B206E657374696E672072756C65730A20202020202020202020202020202020202020202020202069662028746869732E6F7074696F6E732E7065';
wwv_flow_api.g_varchar2_table(124) := '64616E74696329207B0A202020202020202020202020202020202020202020202020202020206E6578744C696E65203D206E6578744C696E652E7265706C616365282F5E207B312C347D283F3D28207B347D292A5B5E205D292F672C2027202027293B0A';
wwv_flow_api.g_varchar2_table(125) := '2020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020202F2F20456E64206C697374206974656D20696620666F756E6420636F64652066656E6365730A202020202020202020202020';
wwv_flow_api.g_varchar2_table(126) := '2020202020202020202020206966202866656E636573426567696E52656765782E74657374286E6578744C696E652929207B0A20202020202020202020202020202020202020202020202020202020627265616B3B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(127) := '202020202020202020207D0A2020202020202020202020202020202020202020202020202F2F20456E64206C697374206974656D20696620666F756E64207374617274206F66206E65772068656164696E670A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(128) := '202020202020206966202868656164696E67426567696E52656765782E74657374286E6578744C696E652929207B0A20202020202020202020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(129) := '2020202020207D0A2020202020202020202020202020202020202020202020202F2F20456E64206C697374206974656D20696620666F756E64207374617274206F66206E65772062756C6C65740A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(130) := '2020696620286E65787442756C6C657452656765782E74657374286E6578744C696E652929207B0A20202020202020202020202020202020202020202020202020202020627265616B3B0A2020202020202020202020202020202020202020202020207D';
wwv_flow_api.g_varchar2_table(131) := '0A2020202020202020202020202020202020202020202020202F2F20486F72697A6F6E74616C2072756C6520666F756E640A20202020202020202020202020202020202020202020202069662028687252656765782E74657374287372632929207B0A20';
wwv_flow_api.g_varchar2_table(132) := '202020202020202020202020202020202020202020202020202020627265616B3B0A2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020696620286E6578744C696E652E736561';
wwv_flow_api.g_varchar2_table(133) := '726368282F5B5E205D2F29203E3D20696E64656E74207C7C20216E6578744C696E652E7472696D282929207B202F2F20446564656E7420696620706F737369626C650A202020202020202020202020202020202020202020202020202020206974656D43';
wwv_flow_api.g_varchar2_table(134) := '6F6E74656E7473202B3D20275C6E27202B206E6578744C696E652E736C69636528696E64656E74293B0A2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020656C7365207B0A20';
wwv_flow_api.g_varchar2_table(135) := '2020202020202020202020202020202020202020202020202020202F2F206E6F7420656E6F75676820696E64656E746174696F6E0A2020202020202020202020202020202020202020202020202020202069662028626C616E6B4C696E6529207B0A2020';
wwv_flow_api.g_varchar2_table(136) := '202020202020202020202020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020202F2F207061';
wwv_flow_api.g_varchar2_table(137) := '7261677261706820636F6E74696E756174696F6E20756E6C657373206C617374206C696E6520776173206120646966666572656E7420626C6F636B206C6576656C20656C656D656E740A2020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(138) := '2020696620286C696E652E736561726368282F5B5E205D2F29203E3D203429207B202F2F20696E64656E74656420636F646520626C6F636B0A2020202020202020202020202020202020202020202020202020202020202020627265616B3B0A20202020';
wwv_flow_api.g_varchar2_table(139) := '2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020206966202866656E636573426567696E52656765782E74657374286C696E652929207B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(140) := '202020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020206966202868656164696E67426567';
wwv_flow_api.g_varchar2_table(141) := '696E52656765782E74657374286C696E652929207B0A2020202020202020202020202020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020202020202020202020202020207D0A202020202020202020';
wwv_flow_api.g_varchar2_table(142) := '2020202020202020202020202020202020202069662028687252656765782E74657374286C696E652929207B0A2020202020202020202020202020202020202020202020202020202020202020627265616B3B0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(143) := '2020202020202020202020207D0A202020202020202020202020202020202020202020202020202020206974656D436F6E74656E7473202B3D20275C6E27202B206E6578744C696E653B0A2020202020202020202020202020202020202020202020207D';
wwv_flow_api.g_varchar2_table(144) := '0A2020202020202020202020202020202020202020202020206966202821626C616E6B4C696E6520262620216E6578744C696E652E7472696D282929207B202F2F20436865636B2069662063757272656E74206C696E6520697320626C616E6B0A202020';
wwv_flow_api.g_varchar2_table(145) := '20202020202020202020202020202020202020202020202020626C616E6B4C696E65203D20747275653B0A2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020726177202B3D20';
wwv_flow_api.g_varchar2_table(146) := '7261774C696E65202B20275C6E273B0A202020202020202020202020202020202020202020202020737263203D207372632E737562737472696E67287261774C696E652E6C656E677468202B2031293B0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(147) := '20202020206C696E65203D206E6578744C696E652E736C69636528696E64656E74293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A2020202020202020202020202020202069662028216C6973';
wwv_flow_api.g_varchar2_table(148) := '742E6C6F6F736529207B0A20202020202020202020202020202020202020202F2F204966207468652070726576696F7573206974656D20656E6465642077697468206120626C616E6B206C696E652C20746865206C697374206973206C6F6F73650A2020';
wwv_flow_api.g_varchar2_table(149) := '20202020202020202020202020202020202069662028656E647357697468426C616E6B4C696E6529207B0A2020202020202020202020202020202020202020202020206C6973742E6C6F6F7365203D20747275653B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(150) := '2020202020207D0A2020202020202020202020202020202020202020656C736520696620282F5C6E202A5C6E202A242F2E74657374287261772929207B0A202020202020202020202020202020202020202020202020656E647357697468426C616E6B4C';
wwv_flow_api.g_varchar2_table(151) := '696E65203D20747275653B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A202020202020202020202020202020206C65742069737461736B203D206E756C6C3B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(152) := '2020206C6574206973636865636B65643B0A202020202020202020202020202020202F2F20436865636B20666F72207461736B206C697374206974656D730A2020202020202020202020202020202069662028746869732E6F7074696F6E732E67666D29';
wwv_flow_api.g_varchar2_table(153) := '207B0A202020202020202020202020202020202020202069737461736B203D202F5E5C5B5B2078585D5C5D202F2E65786563286974656D436F6E74656E7473293B0A20202020202020202020202020202020202020206966202869737461736B29207B0A';
wwv_flow_api.g_varchar2_table(154) := '2020202020202020202020202020202020202020202020206973636865636B6564203D2069737461736B5B305D20213D3D20275B205D20273B0A2020202020202020202020202020202020202020202020206974656D436F6E74656E7473203D20697465';
wwv_flow_api.g_varchar2_table(155) := '6D436F6E74656E74732E7265706C616365282F5E5C5B5B2078585D5C5D202B2F2C202727293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A202020202020202020202020202020206C6973742E';
wwv_flow_api.g_varchar2_table(156) := '6974656D732E70757368287B0A2020202020202020202020202020202020202020747970653A20276C6973745F6974656D272C0A20202020202020202020202020202020202020207261772C0A2020202020202020202020202020202020202020746173';
wwv_flow_api.g_varchar2_table(157) := '6B3A20212169737461736B2C0A2020202020202020202020202020202020202020636865636B65643A206973636865636B65642C0A20202020202020202020202020202020202020206C6F6F73653A2066616C73652C0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(158) := '20202020202020746578743A206974656D436F6E74656E74732C0A2020202020202020202020202020202020202020746F6B656E733A205B5D0A202020202020202020202020202020207D293B0A202020202020202020202020202020206C6973742E72';
wwv_flow_api.g_varchar2_table(159) := '6177202B3D207261773B0A2020202020202020202020207D0A2020202020202020202020202F2F20446F206E6F7420636F6E73756D65206E65776C696E657320617420656E64206F662066696E616C206974656D2E20416C7465726E61746976656C792C';
wwv_flow_api.g_varchar2_table(160) := '206D616B65206974656D5265676578202A73746172742A207769746820616E79206E65776C696E657320746F2073696D706C6966792F737065656420757020656E647357697468426C616E6B4C696E65206C6F6769630A2020202020202020202020206C';
wwv_flow_api.g_varchar2_table(161) := '6973742E6974656D735B6C6973742E6974656D732E6C656E677468202D20315D2E726177203D207261772E7472696D456E6428293B0A202020202020202020202020286C6973742E6974656D735B6C6973742E6974656D732E6C656E677468202D20315D';
wwv_flow_api.g_varchar2_table(162) := '292E74657874203D206974656D436F6E74656E74732E7472696D456E6428293B0A2020202020202020202020206C6973742E726177203D206C6973742E7261772E7472696D456E6428293B0A2020202020202020202020202F2F204974656D206368696C';
wwv_flow_api.g_varchar2_table(163) := '6420746F6B656E732068616E646C6564206865726520617420656E642062656361757365207765206E656564656420746F2068617665207468652066696E616C206974656D20746F207472696D2069742066697273740A20202020202020202020202066';
wwv_flow_api.g_varchar2_table(164) := '6F7220286C65742069203D20303B2069203C206C6973742E6974656D732E6C656E6774683B20692B2B29207B0A20202020202020202020202020202020746869732E6C657865722E73746174652E746F70203D2066616C73653B0A202020202020202020';
wwv_flow_api.g_varchar2_table(165) := '202020202020206C6973742E6974656D735B695D2E746F6B656E73203D20746869732E6C657865722E626C6F636B546F6B656E73286C6973742E6974656D735B695D2E746578742C205B5D293B0A2020202020202020202020202020202069662028216C';
wwv_flow_api.g_varchar2_table(166) := '6973742E6C6F6F736529207B0A20202020202020202020202020202020202020202F2F20436865636B206966206C6973742073686F756C64206265206C6F6F73650A2020202020202020202020202020202020202020636F6E7374207370616365727320';
wwv_flow_api.g_varchar2_table(167) := '3D206C6973742E6974656D735B695D2E746F6B656E732E66696C7465722874203D3E20742E74797065203D3D3D2027737061636527293B0A2020202020202020202020202020202020202020636F6E7374206861734D756C7469706C654C696E65427265';
wwv_flow_api.g_varchar2_table(168) := '616B73203D20737061636572732E6C656E677468203E203020262620737061636572732E736F6D652874203D3E202F5C6E2E2A5C6E2F2E7465737428742E72617729293B0A20202020202020202020202020202020202020206C6973742E6C6F6F736520';
wwv_flow_api.g_varchar2_table(169) := '3D206861734D756C7469706C654C696E65427265616B733B0A202020202020202020202020202020207D0A2020202020202020202020207D0A2020202020202020202020202F2F2053657420616C6C206974656D7320746F206C6F6F7365206966206C69';
wwv_flow_api.g_varchar2_table(170) := '7374206973206C6F6F73650A202020202020202020202020696620286C6973742E6C6F6F736529207B0A20202020202020202020202020202020666F7220286C65742069203D20303B2069203C206C6973742E6974656D732E6C656E6774683B20692B2B';
wwv_flow_api.g_varchar2_table(171) := '29207B0A20202020202020202020202020202020202020206C6973742E6974656D735B695D2E6C6F6F7365203D20747275653B0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020202020202072657475';
wwv_flow_api.g_varchar2_table(172) := '726E206C6973743B0A20202020202020207D0A202020207D0A2020202068746D6C2873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E68746D6C2E6578656328737263293B0A202020202020';
wwv_flow_api.g_varchar2_table(173) := '20206966202863617029207B0A202020202020202020202020636F6E737420746F6B656E203D207B0A20202020202020202020202020202020747970653A202768746D6C272C0A20202020202020202020202020202020626C6F636B3A20747275652C0A';
wwv_flow_api.g_varchar2_table(174) := '202020202020202020202020202020207261773A206361705B305D2C0A202020202020202020202020202020207072653A206361705B315D203D3D3D202770726527207C7C206361705B315D203D3D3D202773637269707427207C7C206361705B315D20';
wwv_flow_api.g_varchar2_table(175) := '3D3D3D20277374796C65272C0A20202020202020202020202020202020746578743A206361705B305D0A2020202020202020202020207D3B0A20202020202020202020202072657475726E20746F6B656E3B0A20202020202020207D0A202020207D0A20';
wwv_flow_api.g_varchar2_table(176) := '2020206465662873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E6465662E6578656328737263293B0A20202020202020206966202863617029207B0A202020202020202020202020636F6E';
wwv_flow_api.g_varchar2_table(177) := '737420746167203D206361705B315D2E746F4C6F7765724361736528292E7265706C616365282F5C732B2F672C20272027293B0A202020202020202020202020636F6E73742068726566203D206361705B325D203F206361705B325D2E7265706C616365';
wwv_flow_api.g_varchar2_table(178) := '282F5E3C282E2A293E242F2C2027243127292E7265706C61636528746869732E72756C65732E696E6C696E652E616E7950756E6374756174696F6E2C202724312729203A2027273B0A202020202020202020202020636F6E7374207469746C65203D2063';
wwv_flow_api.g_varchar2_table(179) := '61705B335D203F206361705B335D2E737562737472696E6728312C206361705B335D2E6C656E677468202D2031292E7265706C61636528746869732E72756C65732E696E6C696E652E616E7950756E6374756174696F6E2C202724312729203A20636170';
wwv_flow_api.g_varchar2_table(180) := '5B335D3B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A2027646566272C0A202020202020202020202020202020207461672C0A202020202020202020202020202020207261773A20636170';
wwv_flow_api.g_varchar2_table(181) := '5B305D2C0A20202020202020202020202020202020687265662C0A202020202020202020202020202020207469746C650A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A202020207461626C652873726329207B0A202020';
wwv_flow_api.g_varchar2_table(182) := '2020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E7461626C652E6578656328737263293B0A2020202020202020696620282163617029207B0A20202020202020202020202072657475726E3B0A20202020202020207D';
wwv_flow_api.g_varchar2_table(183) := '0A202020202020202069662028212F5B3A7C5D2F2E74657374286361705B325D2929207B0A2020202020202020202020202F2F2064656C696D6974657220726F77206D75737420686176652061207069706520287C29206F7220636F6C6F6E20283A2920';
wwv_flow_api.g_varchar2_table(184) := '6F74686572776973652069742069732061207365746578742068656164696E670A20202020202020202020202072657475726E3B0A20202020202020207D0A2020202020202020636F6E73742068656164657273203D2073706C697443656C6C73286361';
wwv_flow_api.g_varchar2_table(185) := '705B315D293B0A2020202020202020636F6E737420616C69676E73203D206361705B325D2E7265706C616365282F5E5C7C7C5C7C202A242F672C202727292E73706C697428277C27293B0A2020202020202020636F6E737420726F7773203D206361705B';
wwv_flow_api.g_varchar2_table(186) := '335D202626206361705B335D2E7472696D2829203F206361705B335D2E7265706C616365282F5C6E5B205C745D2A242F2C202727292E73706C697428275C6E2729203A205B5D3B0A2020202020202020636F6E7374206974656D203D207B0A2020202020';
wwv_flow_api.g_varchar2_table(187) := '20202020202020747970653A20277461626C65272C0A2020202020202020202020207261773A206361705B305D2C0A2020202020202020202020206865616465723A205B5D2C0A202020202020202020202020616C69676E3A205B5D2C0A202020202020';
wwv_flow_api.g_varchar2_table(188) := '202020202020726F77733A205B5D0A20202020202020207D3B0A202020202020202069662028686561646572732E6C656E67746820213D3D20616C69676E732E6C656E67746829207B0A2020202020202020202020202F2F2068656164657220616E6420';
wwv_flow_api.g_varchar2_table(189) := '616C69676E20636F6C756D6E73206D75737420626520657175616C2C20726F77732063616E20626520646966666572656E742E0A20202020202020202020202072657475726E3B0A20202020202020207D0A2020202020202020666F722028636F6E7374';
wwv_flow_api.g_varchar2_table(190) := '20616C69676E206F6620616C69676E7329207B0A202020202020202020202020696620282F5E202A2D2B3A202A242F2E7465737428616C69676E2929207B0A202020202020202020202020202020206974656D2E616C69676E2E70757368282772696768';
wwv_flow_api.g_varchar2_table(191) := '7427293B0A2020202020202020202020207D0A202020202020202020202020656C736520696620282F5E202A3A2D2B3A202A242F2E7465737428616C69676E2929207B0A202020202020202020202020202020206974656D2E616C69676E2E7075736828';
wwv_flow_api.g_varchar2_table(192) := '2763656E74657227293B0A2020202020202020202020207D0A202020202020202020202020656C736520696620282F5E202A3A2D2B202A242F2E7465737428616C69676E2929207B0A202020202020202020202020202020206974656D2E616C69676E2E';
wwv_flow_api.g_varchar2_table(193) := '7075736828276C65667427293B0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A202020202020202020202020202020206974656D2E616C69676E2E70757368286E756C6C293B0A2020202020202020202020207D0A';
wwv_flow_api.g_varchar2_table(194) := '20202020202020207D0A2020202020202020666F722028636F6E737420686561646572206F66206865616465727329207B0A2020202020202020202020206974656D2E6865616465722E70757368287B0A20202020202020202020202020202020746578';
wwv_flow_api.g_varchar2_table(195) := '743A206865616465722C0A20202020202020202020202020202020746F6B656E733A20746869732E6C657865722E696E6C696E6528686561646572290A2020202020202020202020207D293B0A20202020202020207D0A2020202020202020666F722028';
wwv_flow_api.g_varchar2_table(196) := '636F6E737420726F77206F6620726F777329207B0A2020202020202020202020206974656D2E726F77732E707573682873706C697443656C6C7328726F772C206974656D2E6865616465722E6C656E677468292E6D61702863656C6C203D3E207B0A2020';
wwv_flow_api.g_varchar2_table(197) := '202020202020202020202020202072657475726E207B0A2020202020202020202020202020202020202020746578743A2063656C6C2C0A2020202020202020202020202020202020202020746F6B656E733A20746869732E6C657865722E696E6C696E65';
wwv_flow_api.g_varchar2_table(198) := '2863656C6C290A202020202020202020202020202020207D3B0A2020202020202020202020207D29293B0A20202020202020207D0A202020202020202072657475726E206974656D3B0A202020207D0A202020206C68656164696E672873726329207B0A';
wwv_flow_api.g_varchar2_table(199) := '2020202020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E6C68656164696E672E6578656328737263293B0A20202020202020206966202863617029207B0A20202020202020202020202072657475726E207B0A202020';
wwv_flow_api.g_varchar2_table(200) := '20202020202020202020202020747970653A202768656164696E67272C0A202020202020202020202020202020207261773A206361705B305D2C0A2020202020202020202020202020202064657074683A206361705B325D2E636861724174283029203D';
wwv_flow_api.g_varchar2_table(201) := '3D3D20273D27203F2031203A20322C0A20202020202020202020202020202020746578743A206361705B315D2C0A20202020202020202020202020202020746F6B656E733A20746869732E6C657865722E696E6C696E65286361705B315D290A20202020';
wwv_flow_api.g_varchar2_table(202) := '20202020202020207D3B0A20202020202020207D0A202020207D0A202020207061726167726170682873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E7061726167726170682E6578656328';
wwv_flow_api.g_varchar2_table(203) := '737263293B0A20202020202020206966202863617029207B0A202020202020202020202020636F6E73742074657874203D206361705B315D2E636861724174286361705B315D2E6C656E677468202D203129203D3D3D20275C6E270A2020202020202020';
wwv_flow_api.g_varchar2_table(204) := '20202020202020203F206361705B315D2E736C69636528302C202D31290A202020202020202020202020202020203A206361705B315D3B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A2027';
wwv_flow_api.g_varchar2_table(205) := '706172616772617068272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020202020202020202020746578742C0A20202020202020202020202020202020746F6B656E733A20746869732E6C657865722E696E';
wwv_flow_api.g_varchar2_table(206) := '6C696E652874657874290A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A20202020746578742873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E626C6F636B2E746578742E';
wwv_flow_api.g_varchar2_table(207) := '6578656328737263293B0A20202020202020206966202863617029207B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A202774657874272C0A20202020202020202020202020202020726177';
wwv_flow_api.g_varchar2_table(208) := '3A206361705B305D2C0A20202020202020202020202020202020746578743A206361705B305D2C0A20202020202020202020202020202020746F6B656E733A20746869732E6C657865722E696E6C696E65286361705B305D290A20202020202020202020';
wwv_flow_api.g_varchar2_table(209) := '20207D3B0A20202020202020207D0A202020207D0A202020206573636170652873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E696E6C696E652E6573636170652E6578656328737263293B0A2020202020';
wwv_flow_api.g_varchar2_table(210) := '2020206966202863617029207B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A2027657363617065272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020';
wwv_flow_api.g_varchar2_table(211) := '202020202020202020202020746578743A206573636170652431286361705B315D290A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A202020207461672873726329207B0A2020202020202020636F6E737420636170203D';
wwv_flow_api.g_varchar2_table(212) := '20746869732E72756C65732E696E6C696E652E7461672E6578656328737263293B0A20202020202020206966202863617029207B0A2020202020202020202020206966202821746869732E6C657865722E73746174652E696E4C696E6B202626202F5E3C';
wwv_flow_api.g_varchar2_table(213) := '61202F692E74657374286361705B305D2929207B0A20202020202020202020202020202020746869732E6C657865722E73746174652E696E4C696E6B203D20747275653B0A2020202020202020202020207D0A202020202020202020202020656C736520';
wwv_flow_api.g_varchar2_table(214) := '69662028746869732E6C657865722E73746174652E696E4C696E6B202626202F5E3C5C2F613E2F692E74657374286361705B305D2929207B0A20202020202020202020202020202020746869732E6C657865722E73746174652E696E4C696E6B203D2066';
wwv_flow_api.g_varchar2_table(215) := '616C73653B0A2020202020202020202020207D0A2020202020202020202020206966202821746869732E6C657865722E73746174652E696E526177426C6F636B202626202F5E3C287072657C636F64657C6B62647C73637269707429285C737C3E292F69';
wwv_flow_api.g_varchar2_table(216) := '2E74657374286361705B305D2929207B0A20202020202020202020202020202020746869732E6C657865722E73746174652E696E526177426C6F636B203D20747275653B0A2020202020202020202020207D0A202020202020202020202020656C736520';
wwv_flow_api.g_varchar2_table(217) := '69662028746869732E6C657865722E73746174652E696E526177426C6F636B202626202F5E3C5C2F287072657C636F64657C6B62647C73637269707429285C737C3E292F692E74657374286361705B305D2929207B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(218) := '2020746869732E6C657865722E73746174652E696E526177426C6F636B203D2066616C73653B0A2020202020202020202020207D0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A202768746D';
wwv_flow_api.g_varchar2_table(219) := '6C272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020202020202020202020696E4C696E6B3A20746869732E6C657865722E73746174652E696E4C696E6B2C0A20202020202020202020202020202020696E';
wwv_flow_api.g_varchar2_table(220) := '526177426C6F636B3A20746869732E6C657865722E73746174652E696E526177426C6F636B2C0A20202020202020202020202020202020626C6F636B3A2066616C73652C0A20202020202020202020202020202020746578743A206361705B305D0A2020';
wwv_flow_api.g_varchar2_table(221) := '202020202020202020207D3B0A20202020202020207D0A202020207D0A202020206C696E6B2873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E696E6C696E652E6C696E6B2E6578656328737263293B0A20';
wwv_flow_api.g_varchar2_table(222) := '202020202020206966202863617029207B0A202020202020202020202020636F6E7374207472696D6D656455726C203D206361705B325D2E7472696D28293B0A2020202020202020202020206966202821746869732E6F7074696F6E732E706564616E74';
wwv_flow_api.g_varchar2_table(223) := '6963202626202F5E3C2F2E74657374287472696D6D656455726C2929207B0A202020202020202020202020202020202F2F20636F6D6D6F6E6D61726B207265717569726573206D61746368696E6720616E676C6520627261636B6574730A202020202020';
wwv_flow_api.g_varchar2_table(224) := '202020202020202020206966202821282F3E242F2E74657374287472696D6D656455726C292929207B0A202020202020202020202020202020202020202072657475726E3B0A202020202020202020202020202020207D0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(225) := '202020202F2F20656E64696E6720616E676C6520627261636B65742063616E6E6F7420626520657363617065640A20202020202020202020202020202020636F6E737420727472696D536C617368203D20727472696D287472696D6D656455726C2E736C';
wwv_flow_api.g_varchar2_table(226) := '69636528302C202D31292C20275C5C27293B0A2020202020202020202020202020202069662028287472696D6D656455726C2E6C656E677468202D20727472696D536C6173682E6C656E6774682920252032203D3D3D203029207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(227) := '20202020202020202020202072657475726E3B0A202020202020202020202020202020207D0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A202020202020202020202020202020202F2F2066696E6420636C6F7369';
wwv_flow_api.g_varchar2_table(228) := '6E6720706172656E7468657369730A20202020202020202020202020202020636F6E7374206C617374506172656E496E646578203D2066696E64436C6F73696E67427261636B6574286361705B325D2C2027282927293B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(229) := '20202020696620286C617374506172656E496E646578203E202D3129207B0A2020202020202020202020202020202020202020636F6E7374207374617274203D206361705B305D2E696E6465784F662827212729203D3D3D2030203F2035203A20343B0A';
wwv_flow_api.g_varchar2_table(230) := '2020202020202020202020202020202020202020636F6E7374206C696E6B4C656E203D207374617274202B206361705B315D2E6C656E677468202B206C617374506172656E496E6465783B0A20202020202020202020202020202020202020206361705B';
wwv_flow_api.g_varchar2_table(231) := '325D203D206361705B325D2E737562737472696E6728302C206C617374506172656E496E646578293B0A20202020202020202020202020202020202020206361705B305D203D206361705B305D2E737562737472696E6728302C206C696E6B4C656E292E';
wwv_flow_api.g_varchar2_table(232) := '7472696D28293B0A20202020202020202020202020202020202020206361705B335D203D2027273B0A202020202020202020202020202020207D0A2020202020202020202020207D0A2020202020202020202020206C65742068726566203D206361705B';
wwv_flow_api.g_varchar2_table(233) := '325D3B0A2020202020202020202020206C6574207469746C65203D2027273B0A20202020202020202020202069662028746869732E6F7074696F6E732E706564616E74696329207B0A202020202020202020202020202020202F2F2073706C6974207065';
wwv_flow_api.g_varchar2_table(234) := '64616E746963206872656620616E64207469746C650A20202020202020202020202020202020636F6E7374206C696E6B203D202F5E285B5E27225D2A5B5E5C735D295C732B285B27225D29282E2A295C322F2E657865632868726566293B0A2020202020';
wwv_flow_api.g_varchar2_table(235) := '2020202020202020202020696620286C696E6B29207B0A202020202020202020202020202020202020202068726566203D206C696E6B5B315D3B0A20202020202020202020202020202020202020207469746C65203D206C696E6B5B335D3B0A20202020';
wwv_flow_api.g_varchar2_table(236) := '2020202020202020202020207D0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A202020202020202020202020202020207469746C65203D206361705B335D203F206361705B335D2E736C69636528312C202D312920';
wwv_flow_api.g_varchar2_table(237) := '3A2027273B0A2020202020202020202020207D0A20202020202020202020202068726566203D20687265662E7472696D28293B0A202020202020202020202020696620282F5E3C2F2E7465737428687265662929207B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(238) := '20202069662028746869732E6F7074696F6E732E706564616E7469632026262021282F3E242F2E74657374287472696D6D656455726C292929207B0A20202020202020202020202020202020202020202F2F20706564616E74696320616C6C6F77732073';
wwv_flow_api.g_varchar2_table(239) := '74617274696E6720616E676C6520627261636B657420776974686F757420656E64696E6720616E676C6520627261636B65740A202020202020202020202020202020202020202068726566203D20687265662E736C6963652831293B0A20202020202020';
wwv_flow_api.g_varchar2_table(240) := '2020202020202020207D0A20202020202020202020202020202020656C7365207B0A202020202020202020202020202020202020202068726566203D20687265662E736C69636528312C202D31293B0A202020202020202020202020202020207D0A2020';
wwv_flow_api.g_varchar2_table(241) := '202020202020202020207D0A20202020202020202020202072657475726E206F75747075744C696E6B286361702C207B0A20202020202020202020202020202020687265663A2068726566203F20687265662E7265706C61636528746869732E72756C65';
wwv_flow_api.g_varchar2_table(242) := '732E696E6C696E652E616E7950756E6374756174696F6E2C202724312729203A20687265662C0A202020202020202020202020202020207469746C653A207469746C65203F207469746C652E7265706C61636528746869732E72756C65732E696E6C696E';
wwv_flow_api.g_varchar2_table(243) := '652E616E7950756E6374756174696F6E2C202724312729203A207469746C650A2020202020202020202020207D2C206361705B305D2C20746869732E6C65786572293B0A20202020202020207D0A202020207D0A202020207265666C696E6B287372632C';
wwv_flow_api.g_varchar2_table(244) := '206C696E6B7329207B0A20202020202020206C6574206361703B0A20202020202020206966202828636170203D20746869732E72756C65732E696E6C696E652E7265666C696E6B2E657865632873726329290A2020202020202020202020207C7C202863';
wwv_flow_api.g_varchar2_table(245) := '6170203D20746869732E72756C65732E696E6C696E652E6E6F6C696E6B2E6578656328737263292929207B0A202020202020202020202020636F6E7374206C696E6B537472696E67203D20286361705B325D207C7C206361705B315D292E7265706C6163';
wwv_flow_api.g_varchar2_table(246) := '65282F5C732B2F672C20272027293B0A202020202020202020202020636F6E7374206C696E6B203D206C696E6B735B6C696E6B537472696E672E746F4C6F7765724361736528295D3B0A20202020202020202020202069662028216C696E6B29207B0A20';
wwv_flow_api.g_varchar2_table(247) := '202020202020202020202020202020636F6E73742074657874203D206361705B305D2E6368617241742830293B0A2020202020202020202020202020202072657475726E207B0A2020202020202020202020202020202020202020747970653A20277465';
wwv_flow_api.g_varchar2_table(248) := '7874272C0A20202020202020202020202020202020202020207261773A20746578742C0A2020202020202020202020202020202020202020746578740A202020202020202020202020202020207D3B0A2020202020202020202020207D0A202020202020';
wwv_flow_api.g_varchar2_table(249) := '20202020202072657475726E206F75747075744C696E6B286361702C206C696E6B2C206361705B305D2C20746869732E6C65786572293B0A20202020202020207D0A202020207D0A20202020656D5374726F6E67287372632C206D61736B65645372632C';
wwv_flow_api.g_varchar2_table(250) := '207072657643686172203D20272729207B0A20202020202020206C6574206D61746368203D20746869732E72756C65732E696E6C696E652E656D5374726F6E674C44656C696D2E6578656328737263293B0A202020202020202069662028216D61746368';
wwv_flow_api.g_varchar2_table(251) := '290A20202020202020202020202072657475726E3B0A20202020202020202F2F205F2063616E2774206265206265747765656E2074776F20616C7068616E756D65726963732E205C707B4C7D5C707B4E7D20696E636C75646573206E6F6E2D656E676C69';
wwv_flow_api.g_varchar2_table(252) := '736820616C7068616265742F6E756D626572732061732077656C6C0A2020202020202020696620286D617463685B335D2026262070726576436861722E6D61746368282F5B5C707B4C7D5C707B4E7D5D2F7529290A202020202020202020202020726574';
wwv_flow_api.g_varchar2_table(253) := '75726E3B0A2020202020202020636F6E7374206E65787443686172203D206D617463685B315D207C7C206D617463685B325D207C7C2027273B0A202020202020202069662028216E65787443686172207C7C20217072657643686172207C7C2074686973';
wwv_flow_api.g_varchar2_table(254) := '2E72756C65732E696E6C696E652E70756E6374756174696F6E2E657865632870726576436861722929207B0A2020202020202020202020202F2F20756E69636F646520526567657820636F756E747320656D6F6A69206173203120636861723B20737072';
wwv_flow_api.g_varchar2_table(255) := '65616420696E746F20617272617920666F722070726F70657220636F756E74202875736564206D756C7469706C652074696D65732062656C6F77290A202020202020202020202020636F6E7374206C4C656E677468203D205B2E2E2E6D617463685B305D';
wwv_flow_api.g_varchar2_table(256) := '5D2E6C656E677468202D20313B0A2020202020202020202020206C6574207244656C696D2C20724C656E6774682C2064656C696D546F74616C203D206C4C656E6774682C206D696444656C696D546F74616C203D20303B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(257) := '636F6E737420656E64526567203D206D617463685B305D5B305D203D3D3D20272A27203F20746869732E72756C65732E696E6C696E652E656D5374726F6E675244656C696D417374203A20746869732E72756C65732E696E6C696E652E656D5374726F6E';
wwv_flow_api.g_varchar2_table(258) := '675244656C696D556E643B0A202020202020202020202020656E645265672E6C617374496E646578203D20303B0A2020202020202020202020202F2F20436C6970206D61736B656453726320746F2073616D652073656374696F6E206F6620737472696E';
wwv_flow_api.g_varchar2_table(259) := '672061732073726320286D6F766520746F206C657865723F290A2020202020202020202020206D61736B6564537263203D206D61736B65645372632E736C696365282D31202A207372632E6C656E677468202B206C4C656E677468293B0A202020202020';
wwv_flow_api.g_varchar2_table(260) := '2020202020207768696C652028286D61746368203D20656E645265672E65786563286D61736B6564537263292920213D206E756C6C29207B0A202020202020202020202020202020207244656C696D203D206D617463685B315D207C7C206D617463685B';
wwv_flow_api.g_varchar2_table(261) := '325D207C7C206D617463685B335D207C7C206D617463685B345D207C7C206D617463685B355D207C7C206D617463685B365D3B0A2020202020202020202020202020202069662028217244656C696D290A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(262) := '20636F6E74696E75653B202F2F20736B69702073696E676C65202A20696E205F5F6162632A6162635F5F0A20202020202020202020202020202020724C656E677468203D205B2E2E2E7244656C696D5D2E6C656E6774683B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(263) := '2020202020696620286D617463685B335D207C7C206D617463685B345D29207B202F2F20666F756E6420616E6F74686572204C6566742044656C696D0A202020202020202020202020202020202020202064656C696D546F74616C202B3D20724C656E67';
wwv_flow_api.g_varchar2_table(264) := '74683B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C736520696620286D617463685B355D207C7C206D617463685B365D29207B';
wwv_flow_api.g_varchar2_table(265) := '202F2F20656974686572204C656674206F722052696768742044656C696D0A2020202020202020202020202020202020202020696620286C4C656E67746820252033202626202128286C4C656E677468202B20724C656E67746829202520332929207B0A';
wwv_flow_api.g_varchar2_table(266) := '2020202020202020202020202020202020202020202020206D696444656C696D546F74616C202B3D20724C656E6774683B0A202020202020202020202020202020202020202020202020636F6E74696E75653B202F2F20436F6D6D6F6E4D61726B20456D';
wwv_flow_api.g_varchar2_table(267) := '7068617369732052756C657320392D31300A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A2020202020202020202020202020202064656C696D546F74616C202D3D20724C656E6774683B0A202020';
wwv_flow_api.g_varchar2_table(268) := '202020202020202020202020206966202864656C696D546F74616C203E2030290A2020202020202020202020202020202020202020636F6E74696E75653B202F2F20486176656E277420666F756E6420656E6F75676820636C6F73696E672064656C696D';
wwv_flow_api.g_varchar2_table(269) := '69746572730A202020202020202020202020202020202F2F2052656D6F766520657874726120636861726163746572732E202A612A2A2A202D3E202A612A0A20202020202020202020202020202020724C656E677468203D204D6174682E6D696E28724C';
wwv_flow_api.g_varchar2_table(270) := '656E6774682C20724C656E677468202B2064656C696D546F74616C202B206D696444656C696D546F74616C293B0A202020202020202020202020202020202F2F2063686172206C656E6774682063616E206265203E3120666F7220756E69636F64652063';
wwv_flow_api.g_varchar2_table(271) := '6861726163746572733B0A20202020202020202020202020202020636F6E7374206C617374436861724C656E677468203D205B2E2E2E6D617463685B305D5D5B305D2E6C656E6774683B0A20202020202020202020202020202020636F6E737420726177';
wwv_flow_api.g_varchar2_table(272) := '203D207372632E736C69636528302C206C4C656E677468202B206D617463682E696E646578202B206C617374436861724C656E677468202B20724C656E677468293B0A202020202020202020202020202020202F2F204372656174652060656D60206966';
wwv_flow_api.g_varchar2_table(273) := '20736D616C6C6573742064656C696D6974657220686173206F6464206368617220636F756E742E202A612A2A2A0A20202020202020202020202020202020696620284D6174682E6D696E286C4C656E6774682C20724C656E677468292025203229207B0A';
wwv_flow_api.g_varchar2_table(274) := '2020202020202020202020202020202020202020636F6E73742074657874203D207261772E736C69636528312C202D31293B0A202020202020202020202020202020202020202072657475726E207B0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(275) := '20202020747970653A2027656D272C0A2020202020202020202020202020202020202020202020207261772C0A202020202020202020202020202020202020202020202020746578742C0A20202020202020202020202020202020202020202020202074';
wwv_flow_api.g_varchar2_table(276) := '6F6B656E733A20746869732E6C657865722E696E6C696E65546F6B656E732874657874290A20202020202020202020202020202020202020207D3B0A202020202020202020202020202020207D0A202020202020202020202020202020202F2F20437265';
wwv_flow_api.g_varchar2_table(277) := '61746520277374726F6E672720696620736D616C6C6573742064656C696D6974657220686173206576656E206368617220636F756E742E202A2A612A2A2A0A20202020202020202020202020202020636F6E73742074657874203D207261772E736C6963';
wwv_flow_api.g_varchar2_table(278) := '6528322C202D32293B0A2020202020202020202020202020202072657475726E207B0A2020202020202020202020202020202020202020747970653A20277374726F6E67272C0A20202020202020202020202020202020202020207261772C0A20202020';
wwv_flow_api.g_varchar2_table(279) := '20202020202020202020202020202020746578742C0A2020202020202020202020202020202020202020746F6B656E733A20746869732E6C657865722E696E6C696E65546F6B656E732874657874290A202020202020202020202020202020207D3B0A20';
wwv_flow_api.g_varchar2_table(280) := '20202020202020202020207D0A20202020202020207D0A202020207D0A20202020636F64657370616E2873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E696E6C696E652E636F64652E6578656328737263';
wwv_flow_api.g_varchar2_table(281) := '293B0A20202020202020206966202863617029207B0A2020202020202020202020206C65742074657874203D206361705B325D2E7265706C616365282F5C6E2F672C20272027293B0A202020202020202020202020636F6E7374206861734E6F6E537061';
wwv_flow_api.g_varchar2_table(282) := '63654368617273203D202F5B5E205D2F2E746573742874657874293B0A202020202020202020202020636F6E737420686173537061636543686172734F6E426F7468456E6473203D202F5E202F2E74657374287465787429202626202F20242F2E746573';
wwv_flow_api.g_varchar2_table(283) := '742874657874293B0A202020202020202020202020696620286861734E6F6E5370616365436861727320262620686173537061636543686172734F6E426F7468456E647329207B0A2020202020202020202020202020202074657874203D20746578742E';
wwv_flow_api.g_varchar2_table(284) := '737562737472696E6728312C20746578742E6C656E677468202D2031293B0A2020202020202020202020207D0A20202020202020202020202074657874203D20657363617065243128746578742C2074727565293B0A2020202020202020202020207265';
wwv_flow_api.g_varchar2_table(285) := '7475726E207B0A20202020202020202020202020202020747970653A2027636F64657370616E272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020202020202020202020746578740A202020202020202020';
wwv_flow_api.g_varchar2_table(286) := '2020207D3B0A20202020202020207D0A202020207D0A2020202062722873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E696E6C696E652E62722E6578656328737263293B0A202020202020202069662028';
wwv_flow_api.g_varchar2_table(287) := '63617029207B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A20276272272C0A202020202020202020202020202020207261773A206361705B305D0A2020202020202020202020207D3B0A20';
wwv_flow_api.g_varchar2_table(288) := '202020202020207D0A202020207D0A2020202064656C2873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E696E6C696E652E64656C2E6578656328737263293B0A2020202020202020696620286361702920';
wwv_flow_api.g_varchar2_table(289) := '7B0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A202764656C272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020202020202020202020746578';
wwv_flow_api.g_varchar2_table(290) := '743A206361705B325D2C0A20202020202020202020202020202020746F6B656E733A20746869732E6C657865722E696E6C696E65546F6B656E73286361705B325D290A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A2020';
wwv_flow_api.g_varchar2_table(291) := '20206175746F6C696E6B2873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E696E6C696E652E6175746F6C696E6B2E6578656328737263293B0A20202020202020206966202863617029207B0A2020202020';
wwv_flow_api.g_varchar2_table(292) := '202020202020206C657420746578742C20687265663B0A202020202020202020202020696620286361705B325D203D3D3D2027402729207B0A2020202020202020202020202020202074657874203D206573636170652431286361705B315D293B0A2020';
wwv_flow_api.g_varchar2_table(293) := '202020202020202020202020202068726566203D20276D61696C746F3A27202B20746578743B0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A2020202020202020202020202020202074657874203D206573636170';
wwv_flow_api.g_varchar2_table(294) := '652431286361705B315D293B0A2020202020202020202020202020202068726566203D20746578743B0A2020202020202020202020207D0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A2027';
wwv_flow_api.g_varchar2_table(295) := '6C696E6B272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020202020202020202020746578742C0A20202020202020202020202020202020687265662C0A20202020202020202020202020202020746F6B65';
wwv_flow_api.g_varchar2_table(296) := '6E733A205B0A20202020202020202020202020202020202020207B0A202020202020202020202020202020202020202020202020747970653A202774657874272C0A2020202020202020202020202020202020202020202020207261773A20746578742C';
wwv_flow_api.g_varchar2_table(297) := '0A202020202020202020202020202020202020202020202020746578740A20202020202020202020202020202020202020207D0A202020202020202020202020202020205D0A2020202020202020202020207D3B0A20202020202020207D0A202020207D';
wwv_flow_api.g_varchar2_table(298) := '0A2020202075726C2873726329207B0A20202020202020206C6574206361703B0A202020202020202069662028636170203D20746869732E72756C65732E696E6C696E652E75726C2E65786563287372632929207B0A2020202020202020202020206C65';
wwv_flow_api.g_varchar2_table(299) := '7420746578742C20687265663B0A202020202020202020202020696620286361705B325D203D3D3D2027402729207B0A2020202020202020202020202020202074657874203D206573636170652431286361705B305D293B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(300) := '202020202068726566203D20276D61696C746F3A27202B20746578743B0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A202020202020202020202020202020202F2F20646F20657874656E646564206175746F6C69';
wwv_flow_api.g_varchar2_table(301) := '6E6B20706174682076616C69646174696F6E0A202020202020202020202020202020206C657420707265764361705A65726F3B0A20202020202020202020202020202020646F207B0A202020202020202020202020202020202020202070726576436170';
wwv_flow_api.g_varchar2_table(302) := '5A65726F203D206361705B305D3B0A20202020202020202020202020202020202020206361705B305D203D20746869732E72756C65732E696E6C696E652E5F6261636B706564616C2E65786563286361705B305D293F2E5B305D203F3F2027273B0A2020';
wwv_flow_api.g_varchar2_table(303) := '20202020202020202020202020207D207768696C652028707265764361705A65726F20213D3D206361705B305D293B0A2020202020202020202020202020202074657874203D206573636170652431286361705B305D293B0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(304) := '2020202020696620286361705B315D203D3D3D20277777772E2729207B0A202020202020202020202020202020202020202068726566203D2027687474703A2F2F27202B206361705B305D3B0A202020202020202020202020202020207D0A2020202020';
wwv_flow_api.g_varchar2_table(305) := '2020202020202020202020656C7365207B0A202020202020202020202020202020202020202068726566203D206361705B305D3B0A202020202020202020202020202020207D0A2020202020202020202020207D0A202020202020202020202020726574';
wwv_flow_api.g_varchar2_table(306) := '75726E207B0A20202020202020202020202020202020747970653A20276C696E6B272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020202020202020202020746578742C0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(307) := '202020687265662C0A20202020202020202020202020202020746F6B656E733A205B0A20202020202020202020202020202020202020207B0A202020202020202020202020202020202020202020202020747970653A202774657874272C0A2020202020';
wwv_flow_api.g_varchar2_table(308) := '202020202020202020202020202020202020207261773A20746578742C0A202020202020202020202020202020202020202020202020746578740A20202020202020202020202020202020202020207D0A202020202020202020202020202020205D0A20';
wwv_flow_api.g_varchar2_table(309) := '20202020202020202020207D3B0A20202020202020207D0A202020207D0A20202020696E6C696E65546578742873726329207B0A2020202020202020636F6E737420636170203D20746869732E72756C65732E696E6C696E652E746578742E6578656328';
wwv_flow_api.g_varchar2_table(310) := '737263293B0A20202020202020206966202863617029207B0A2020202020202020202020206C657420746578743B0A20202020202020202020202069662028746869732E6C657865722E73746174652E696E526177426C6F636B29207B0A202020202020';
wwv_flow_api.g_varchar2_table(311) := '2020202020202020202074657874203D206361705B305D3B0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A2020202020202020202020202020202074657874203D206573636170652431286361705B305D293B0A20';
wwv_flow_api.g_varchar2_table(312) := '20202020202020202020207D0A20202020202020202020202072657475726E207B0A20202020202020202020202020202020747970653A202774657874272C0A202020202020202020202020202020207261773A206361705B305D2C0A20202020202020';
wwv_flow_api.g_varchar2_table(313) := '202020202020202020746578740A2020202020202020202020207D3B0A20202020202020207D0A202020207D0A7D0A0A2F2A2A0A202A20426C6F636B2D4C6576656C204772616D6D61720A202A2F0A636F6E7374206E65776C696E65203D202F5E283F3A';
wwv_flow_api.g_varchar2_table(314) := '202A283F3A5C6E7C2429292B2F3B0A636F6E737420626C6F636B436F6465203D202F5E28207B347D5B5E5C6E5D2B283F3A5C6E283F3A202A283F3A5C6E7C2429292A293F292B2F3B0A636F6E73742066656E636573203D202F5E207B302C337D28607B33';
wwv_flow_api.g_varchar2_table(315) := '2C7D283F3D5B5E605C6E5D2A283F3A5C6E7C2429297C7E7B332C7D29285B5E5C6E5D2A29283F3A5C6E7C2429283F3A7C285B5C735C535D2A3F29283F3A5C6E7C242929283F3A207B302C337D5C315B7E605D2A202A283F3D5C6E7C24297C24292F3B0A63';
wwv_flow_api.g_varchar2_table(316) := '6F6E7374206872203D202F5E207B302C337D28283F3A2D5B5C74205D2A297B332C7D7C283F3A5F5B205C745D2A297B332C7D7C283F3A5C2A5B205C745D2A297B332C7D29283F3A5C6E2B7C24292F3B0A636F6E73742068656164696E67203D202F5E207B';
wwv_flow_api.g_varchar2_table(317) := '302C337D28237B312C367D29283F3D5C737C2429282E2A29283F3A5C6E2B7C24292F3B0A636F6E73742062756C6C6574203D202F283F3A5B2A2B2D5D7C5C647B312C397D5B2E295D292F3B0A636F6E7374206C68656164696E67203D2065646974282F5E';
wwv_flow_api.g_varchar2_table(318) := '283F2162756C6C207C626C6F636B436F64657C66656E6365737C626C6F636B71756F74657C68656164696E677C68746D6C2928283F3A2E7C5C6E283F215C732A3F5C6E7C62756C6C207C626C6F636B436F64657C66656E6365737C626C6F636B71756F74';
wwv_flow_api.g_varchar2_table(319) := '657C68656164696E677C68746D6C29292B3F295C6E207B302C337D283D2B7C2D2B29202A283F3A5C6E2B7C24292F290A202020202E7265706C616365282F62756C6C2F672C2062756C6C657429202F2F206C697374732063616E20696E74657272757074';
wwv_flow_api.g_varchar2_table(320) := '0A202020202E7265706C616365282F626C6F636B436F64652F672C202F207B347D2F29202F2F20696E64656E74656420636F646520626C6F636B732063616E20696E746572727570740A202020202E7265706C616365282F66656E6365732F672C202F20';
wwv_flow_api.g_varchar2_table(321) := '7B302C337D283F3A607B332C7D7C7E7B332C7D292F29202F2F2066656E63656420636F646520626C6F636B732063616E20696E746572727570740A202020202E7265706C616365282F626C6F636B71756F74652F672C202F207B302C337D3E2F29202F2F';
wwv_flow_api.g_varchar2_table(322) := '20626C6F636B71756F74652063616E20696E746572727570740A202020202E7265706C616365282F68656164696E672F672C202F207B302C337D237B312C367D2F29202F2F204154582068656164696E672063616E20696E746572727570740A20202020';
wwv_flow_api.g_varchar2_table(323) := '2E7265706C616365282F68746D6C2F672C202F207B302C337D3C5B5E5C6E3E5D2B3E5C6E2F29202F2F20626C6F636B2068746D6C2063616E20696E746572727570740A202020202E676574526567657828293B0A636F6E7374205F706172616772617068';
wwv_flow_api.g_varchar2_table(324) := '203D202F5E285B5E5C6E5D2B283F3A5C6E283F2168727C68656164696E677C6C68656164696E677C626C6F636B71756F74657C66656E6365737C6C6973747C68746D6C7C7461626C657C202B5C6E295B5E5C6E5D2B292A292F3B0A636F6E737420626C6F';
wwv_flow_api.g_varchar2_table(325) := '636B54657874203D202F5E5B5E5C6E5D2B2F3B0A636F6E7374205F626C6F636B4C6162656C203D202F283F215C732A5C5D29283F3A5C5C2E7C5B5E5C5B5C5D5C5C5D292B2F3B0A636F6E737420646566203D2065646974282F5E207B302C337D5C5B286C';
wwv_flow_api.g_varchar2_table(326) := '6162656C295C5D3A202A283F3A5C6E202A293F285B5E3C5C735D5B5E5C735D2A7C3C2E2A3F3E29283F3A283F3A202B283F3A5C6E202A293F7C202A5C6E202A29287469746C6529293F202A283F3A5C6E2B7C24292F290A202020202E7265706C61636528';
wwv_flow_api.g_varchar2_table(327) := '276C6162656C272C205F626C6F636B4C6162656C290A202020202E7265706C61636528277469746C65272C202F283F3A22283F3A5C5C223F7C5B5E225C5C5D292A227C275B5E275C6E5D2A283F3A5C6E5B5E275C6E5D2B292A5C6E3F277C5C285B5E2829';
wwv_flow_api.g_varchar2_table(328) := '5D2A5C29292F290A202020202E676574526567657828293B0A636F6E7374206C697374203D2065646974282F5E28207B302C337D62756C6C29285B205C745D5B5E5C6E5D2B3F293F283F3A5C6E7C24292F290A202020202E7265706C616365282F62756C';
wwv_flow_api.g_varchar2_table(329) := '6C2F672C2062756C6C6574290A202020202E676574526567657828293B0A636F6E7374205F746167203D2027616464726573737C61727469636C657C61736964657C626173657C62617365666F6E747C626C6F636B71756F74657C626F64797C63617074';
wwv_flow_api.g_varchar2_table(330) := '696F6E270A202020202B20277C63656E7465727C636F6C7C636F6C67726F75707C64647C64657461696C737C6469616C6F677C6469727C6469767C646C7C64747C6669656C647365747C66696763617074696F6E270A202020202B20277C666967757265';
wwv_flow_api.g_varchar2_table(331) := '7C666F6F7465727C666F726D7C6672616D657C6672616D657365747C685B312D365D7C686561647C6865616465727C68727C68746D6C7C696672616D65270A202020202B20277C6C6567656E647C6C697C6C696E6B7C6D61696E7C6D656E757C6D656E75';
wwv_flow_api.g_varchar2_table(332) := '6974656D7C6D6574617C6E61767C6E6F6672616D65737C6F6C7C6F707467726F75707C6F7074696F6E270A202020202B20277C707C706172616D7C7365617263687C73656374696F6E7C73756D6D6172797C7461626C657C74626F64797C74647C74666F';
wwv_flow_api.g_varchar2_table(333) := '6F747C74687C74686561647C7469746C65270A202020202B20277C74727C747261636B7C756C273B0A636F6E7374205F636F6D6D656E74203D202F3C212D2D283F3A2D3F3E7C5B5C735C535D2A3F283F3A2D2D3E7C2429292F3B0A636F6E73742068746D';
wwv_flow_api.g_varchar2_table(334) := '6C203D206564697428275E207B302C337D283F3A27202F2F206F7074696F6E616C20696E64656E746174696F6E0A202020202B20273C287363726970747C7072657C7374796C657C7465787461726561295B5C5C733E5D5B5C5C735C5C535D2A3F283F3A';
wwv_flow_api.g_varchar2_table(335) := '3C2F5C5C313E5B5E5C5C6E5D2A5C5C6E2B7C242927202F2F202831290A202020202B20277C636F6D6D656E745B5E5C5C6E5D2A285C5C6E2B7C242927202F2F202832290A202020202B20277C3C5C5C3F5B5C5C735C5C535D2A3F283F3A5C5C3F3E5C5C6E';
wwv_flow_api.g_varchar2_table(336) := '2A7C242927202F2F202833290A202020202B20277C3C215B412D5A5D5B5C5C735C5C535D2A3F283F3A3E5C5C6E2A7C242927202F2F202834290A202020202B20277C3C215C5C5B43444154415C5C5B5B5C5C735C5C535D2A3F283F3A5C5C5D5C5C5D3E5C';
wwv_flow_api.g_varchar2_table(337) := '5C6E2A7C242927202F2F202835290A202020202B20277C3C2F3F2874616729283F3A202B7C5C5C6E7C2F3F3E295B5C5C735C5C535D2A3F283F3A283F3A5C5C6E202A292B5C5C6E7C242927202F2F202836290A202020202B20277C3C283F217363726970';
wwv_flow_api.g_varchar2_table(338) := '747C7072657C7374796C657C746578746172656129285B612D7A5D5B5C5C772D5D2A29283F3A617474726962757465292A3F202A2F3F3E283F3D5B205C5C745D2A283F3A5C5C6E7C2429295B5C5C735C5C535D2A3F283F3A283F3A5C5C6E202A292B5C5C';
wwv_flow_api.g_varchar2_table(339) := '6E7C242927202F2F20283729206F70656E207461670A202020202B20277C3C2F283F217363726970747C7072657C7374796C657C7465787461726561295B612D7A5D5B5C5C772D5D2A5C5C732A3E283F3D5B205C5C745D2A283F3A5C5C6E7C2429295B5C';
wwv_flow_api.g_varchar2_table(340) := '5C735C5C535D2A3F283F3A283F3A5C5C6E202A292B5C5C6E7C242927202F2F2028372920636C6F73696E67207461670A202020202B202729272C20276927290A202020202E7265706C6163652827636F6D6D656E74272C205F636F6D6D656E74290A2020';
wwv_flow_api.g_varchar2_table(341) := '20202E7265706C6163652827746167272C205F746167290A202020202E7265706C6163652827617474726962757465272C202F202B5B612D7A412D5A3A5F5D5B5C772E3A2D5D2A283F3A202A3D202A225B5E225C6E5D2A227C202A3D202A275B5E275C6E';
wwv_flow_api.g_varchar2_table(342) := '5D2A277C202A3D202A5B5E5C7322273D3C3E605D2B293F2F290A202020202E676574526567657828293B0A636F6E737420706172616772617068203D2065646974285F706172616772617068290A202020202E7265706C61636528276872272C20687229';
wwv_flow_api.g_varchar2_table(343) := '0A202020202E7265706C616365282768656164696E67272C2027207B302C337D237B312C367D283F3A5C5C737C242927290A202020202E7265706C61636528277C6C68656164696E67272C20272729202F2F2073657465782068656164696E677320646F';
wwv_flow_api.g_varchar2_table(344) := '6E277420696E7465727275707420636F6D6D6F6E6D61726B20706172616772617068730A202020202E7265706C61636528277C7461626C65272C202727290A202020202E7265706C6163652827626C6F636B71756F7465272C2027207B302C337D3E2729';
wwv_flow_api.g_varchar2_table(345) := '0A202020202E7265706C616365282766656E636573272C2027207B302C337D283F3A607B332C7D283F3D5B5E605C5C6E5D2A5C5C6E297C7E7B332C7D295B5E5C5C6E5D2A5C5C6E27290A202020202E7265706C61636528276C697374272C2027207B302C';
wwv_flow_api.g_varchar2_table(346) := '337D283F3A5B2A2B2D5D7C315B2E295D29202729202F2F206F6E6C79206C69737473207374617274696E672066726F6D20312063616E20696E746572727570740A202020202E7265706C616365282768746D6C272C20273C2F3F283F3A74616729283F3A';
wwv_flow_api.g_varchar2_table(347) := '202B7C5C5C6E7C2F3F3E297C3C283F3A7363726970747C7072657C7374796C657C74657874617265617C212D2D2927290A202020202E7265706C6163652827746167272C205F74616729202F2F20706172732063616E20626520696E7465727275707465';
wwv_flow_api.g_varchar2_table(348) := '642062792074797065202836292068746D6C20626C6F636B730A202020202E676574526567657828293B0A636F6E737420626C6F636B71756F7465203D2065646974282F5E28207B302C337D3E203F287061726167726170687C5B5E5C6E5D2A29283F3A';
wwv_flow_api.g_varchar2_table(349) := '5C6E7C2429292B2F290A202020202E7265706C6163652827706172616772617068272C20706172616772617068290A202020202E676574526567657828293B0A2F2A2A0A202A204E6F726D616C20426C6F636B204772616D6D61720A202A2F0A636F6E73';
wwv_flow_api.g_varchar2_table(350) := '7420626C6F636B4E6F726D616C203D207B0A20202020626C6F636B71756F74652C0A20202020636F64653A20626C6F636B436F64652C0A202020206465662C0A2020202066656E6365732C0A2020202068656164696E672C0A2020202068722C0A202020';
wwv_flow_api.g_varchar2_table(351) := '2068746D6C2C0A202020206C68656164696E672C0A202020206C6973742C0A202020206E65776C696E652C0A202020207061726167726170682C0A202020207461626C653A206E6F6F70546573742C0A20202020746578743A20626C6F636B546578740A';
wwv_flow_api.g_varchar2_table(352) := '7D3B0A2F2A2A0A202A2047464D20426C6F636B204772616D6D61720A202A2F0A636F6E73742067666D5461626C65203D206564697428275E202A285B5E5C5C6E205D2E2A295C5C6E27202F2F204865616465720A202020202B2027207B302C337D28283F';
wwv_flow_api.g_varchar2_table(353) := '3A5C5C7C202A293F3A3F2D2B3A3F202A283F3A5C5C7C202A3A3F2D2B3A3F202A292A283F3A5C5C7C202A293F2927202F2F20416C69676E0A202020202B2027283F3A5C5C6E28283F3A283F21202A5C5C6E7C68727C68656164696E677C626C6F636B7175';
wwv_flow_api.g_varchar2_table(354) := '6F74657C636F64657C66656E6365737C6C6973747C68746D6C292E2A283F3A5C5C6E7C2429292A295C5C6E2A7C24292729202F2F2043656C6C730A202020202E7265706C61636528276872272C206872290A202020202E7265706C616365282768656164';
wwv_flow_api.g_varchar2_table(355) := '696E67272C2027207B302C337D237B312C367D283F3A5C5C737C242927290A202020202E7265706C6163652827626C6F636B71756F7465272C2027207B302C337D3E27290A202020202E7265706C6163652827636F6465272C2027207B347D5B5E5C5C6E';
wwv_flow_api.g_varchar2_table(356) := '5D27290A202020202E7265706C616365282766656E636573272C2027207B302C337D283F3A607B332C7D283F3D5B5E605C5C6E5D2A5C5C6E297C7E7B332C7D295B5E5C5C6E5D2A5C5C6E27290A202020202E7265706C61636528276C697374272C202720';
wwv_flow_api.g_varchar2_table(357) := '7B302C337D283F3A5B2A2B2D5D7C315B2E295D29202729202F2F206F6E6C79206C69737473207374617274696E672066726F6D20312063616E20696E746572727570740A202020202E7265706C616365282768746D6C272C20273C2F3F283F3A74616729';
wwv_flow_api.g_varchar2_table(358) := '283F3A202B7C5C5C6E7C2F3F3E297C3C283F3A7363726970747C7072657C7374796C657C74657874617265617C212D2D2927290A202020202E7265706C6163652827746167272C205F74616729202F2F207461626C65732063616E20626520696E746572';
wwv_flow_api.g_varchar2_table(359) := '7275707465642062792074797065202836292068746D6C20626C6F636B730A202020202E676574526567657828293B0A636F6E737420626C6F636B47666D203D207B0A202020202E2E2E626C6F636B4E6F726D616C2C0A202020207461626C653A206766';
wwv_flow_api.g_varchar2_table(360) := '6D5461626C652C0A202020207061726167726170683A2065646974285F706172616772617068290A20202020202020202E7265706C61636528276872272C206872290A20202020202020202E7265706C616365282768656164696E67272C2027207B302C';
wwv_flow_api.g_varchar2_table(361) := '337D237B312C367D283F3A5C5C737C242927290A20202020202020202E7265706C61636528277C6C68656164696E67272C20272729202F2F2073657465782068656164696E677320646F6E277420696E7465727275707420636F6D6D6F6E6D61726B2070';
wwv_flow_api.g_varchar2_table(362) := '6172616772617068730A20202020202020202E7265706C61636528277461626C65272C2067666D5461626C6529202F2F20696E7465727275707420706172616772617068732077697468207461626C650A20202020202020202E7265706C616365282762';
wwv_flow_api.g_varchar2_table(363) := '6C6F636B71756F7465272C2027207B302C337D3E27290A20202020202020202E7265706C616365282766656E636573272C2027207B302C337D283F3A607B332C7D283F3D5B5E605C5C6E5D2A5C5C6E297C7E7B332C7D295B5E5C5C6E5D2A5C5C6E27290A';
wwv_flow_api.g_varchar2_table(364) := '20202020202020202E7265706C61636528276C697374272C2027207B302C337D283F3A5B2A2B2D5D7C315B2E295D29202729202F2F206F6E6C79206C69737473207374617274696E672066726F6D20312063616E20696E746572727570740A2020202020';
wwv_flow_api.g_varchar2_table(365) := '2020202E7265706C616365282768746D6C272C20273C2F3F283F3A74616729283F3A202B7C5C5C6E7C2F3F3E297C3C283F3A7363726970747C7072657C7374796C657C74657874617265617C212D2D2927290A20202020202020202E7265706C61636528';
wwv_flow_api.g_varchar2_table(366) := '27746167272C205F74616729202F2F20706172732063616E20626520696E7465727275707465642062792074797065202836292068746D6C20626C6F636B730A20202020202020202E676574526567657828290A7D3B0A2F2A2A0A202A20506564616E74';
wwv_flow_api.g_varchar2_table(367) := '6963206772616D6D617220286F726967696E616C204A6F686E204772756265722773206C6F6F7365206D61726B646F776E2073706563696669636174696F6E290A202A2F0A636F6E737420626C6F636B506564616E746963203D207B0A202020202E2E2E';
wwv_flow_api.g_varchar2_table(368) := '626C6F636B4E6F726D616C2C0A2020202068746D6C3A206564697428275E202A283F3A636F6D6D656E74202A283F3A5C5C6E7C5C5C732A2429270A20202020202020202B20277C3C28746167295B5C5C735C5C535D2B3F3C2F5C5C313E202A283F3A5C5C';
wwv_flow_api.g_varchar2_table(369) := '6E7B322C7D7C5C5C732A242927202F2F20636C6F736564207461670A20202020202020202B20277C3C746167283F3A225B5E225D2A227C5C275B5E5C275D2A5C277C5C5C735B5E5C27222F3E5C5C735D2A292A3F2F3F3E202A283F3A5C5C6E7B322C7D7C';
wwv_flow_api.g_varchar2_table(370) := '5C5C732A24292927290A20202020202020202E7265706C6163652827636F6D6D656E74272C205F636F6D6D656E74290A20202020202020202E7265706C616365282F7461672F672C2027283F21283F3A270A20202020202020202B2027617C656D7C7374';
wwv_flow_api.g_varchar2_table(371) := '726F6E677C736D616C6C7C737C636974657C717C64666E7C616262727C646174617C74696D657C636F64657C7661727C73616D707C6B62647C737562270A20202020202020202B20277C7375707C697C627C757C6D61726B7C727562797C72747C72707C';
wwv_flow_api.g_varchar2_table(372) := '6264697C62646F7C7370616E7C62727C7762727C696E737C64656C7C696D6729270A20202020202020202B20275C5C62295C5C772B283F213A7C5B5E5C5C775C5C73405D2A40295C5C6227290A20202020202020202E676574526567657828292C0A2020';
wwv_flow_api.g_varchar2_table(373) := '20206465663A202F5E202A5C5B285B5E5C5D5D2B295C5D3A202A3C3F285B5E5C733E5D2B293E3F283F3A202B285B22285D5B5E5C6E5D2B5B22295D29293F202A283F3A5C6E2B7C24292F2C0A2020202068656164696E673A202F5E28237B312C367D2928';
wwv_flow_api.g_varchar2_table(374) := '2E2A29283F3A5C6E2B7C24292F2C0A2020202066656E6365733A206E6F6F70546573742C202F2F2066656E636573206E6F7420737570706F727465640A202020206C68656164696E673A202F5E282E2B3F295C6E207B302C337D283D2B7C2D2B29202A28';
wwv_flow_api.g_varchar2_table(375) := '3F3A5C6E2B7C24292F2C0A202020207061726167726170683A2065646974285F706172616772617068290A20202020202020202E7265706C61636528276872272C206872290A20202020202020202E7265706C616365282768656164696E67272C202720';
wwv_flow_api.g_varchar2_table(376) := '2A237B312C367D202A5B5E5C6E5D27290A20202020202020202E7265706C61636528276C68656164696E67272C206C68656164696E67290A20202020202020202E7265706C61636528277C7461626C65272C202727290A20202020202020202E7265706C';
wwv_flow_api.g_varchar2_table(377) := '6163652827626C6F636B71756F7465272C2027207B302C337D3E27290A20202020202020202E7265706C61636528277C66656E636573272C202727290A20202020202020202E7265706C61636528277C6C697374272C202727290A20202020202020202E';
wwv_flow_api.g_varchar2_table(378) := '7265706C61636528277C68746D6C272C202727290A20202020202020202E7265706C61636528277C746167272C202727290A20202020202020202E676574526567657828290A7D3B0A2F2A2A0A202A20496E6C696E652D4C6576656C204772616D6D6172';
wwv_flow_api.g_varchar2_table(379) := '0A202A2F0A636F6E737420657363617065203D202F5E5C5C285B2122232425262728292A2B2C5C2D2E2F3A3B3C3D3E3F405C5B5C5D5C5C5E5F607B7C7D7E5D292F3B0A636F6E737420696E6C696E65436F6465203D202F5E28602B29285B5E605D7C5B5E';
wwv_flow_api.g_varchar2_table(380) := '605D5B5C735C535D2A3F5B5E605D295C31283F2160292F3B0A636F6E7374206272203D202F5E28207B322C7D7C5C5C295C6E283F215C732A24292F3B0A636F6E737420696E6C696E6554657874203D202F5E28602B7C5B5E605D29283F3A283F3D207B32';
wwv_flow_api.g_varchar2_table(381) := '2C7D5C6E297C5B5C735C535D2A3F283F3A283F3D5B5C5C3C215C5B602A5F5D7C5C625F7C24297C5B5E205D283F3D207B322C7D5C6E2929292F3B0A2F2F206C697374206F6620756E69636F64652070756E6374756174696F6E206D61726B732C20706C75';
wwv_flow_api.g_varchar2_table(382) := '7320616E79206D697373696E6720636861726163746572732066726F6D20436F6D6D6F6E4D61726B20737065630A636F6E7374205F70756E6374756174696F6E203D20275C5C707B507D5C5C707B537D273B0A636F6E73742070756E6374756174696F6E';
wwv_flow_api.g_varchar2_table(383) := '203D2065646974282F5E28283F215B2A5F5D295B5C7370756E6374756174696F6E5D292F2C20277527290A202020202E7265706C616365282F70756E6374756174696F6E2F672C205F70756E6374756174696F6E292E676574526567657828293B0A2F2F';
wwv_flow_api.g_varchar2_table(384) := '2073657175656E63657320656D2073686F756C6420736B6970206F766572205B7469746C655D286C696E6B292C2060636F6465602C203C68746D6C3E0A636F6E737420626C6F636B536B6970203D202F5C5B5B5E5B5C5D5D2A3F5C5D5C285B5E5C285C29';
wwv_flow_api.g_varchar2_table(385) := '5D2A3F5C297C605B5E605D2A3F607C3C5B5E3C3E5D2A3F3E2F673B0A636F6E737420656D5374726F6E674C44656C696D203D2065646974282F5E283F3A5C2A2B283F3A28283F215C2A295B70756E63745D297C5B5E5C732A5D29297C5E5F2B283F3A2828';
wwv_flow_api.g_varchar2_table(386) := '3F215F295B70756E63745D297C285B5E5C735F5D29292F2C20277527290A202020202E7265706C616365282F70756E63742F672C205F70756E6374756174696F6E290A202020202E676574526567657828293B0A636F6E737420656D5374726F6E675244';
wwv_flow_api.g_varchar2_table(387) := '656C696D417374203D206564697428275E5B5E5F2A5D2A3F5F5F5B5E5F2A5D2A3F5C5C2A5B5E5F2A5D2A3F283F3D5F5F2927202F2F20536B6970206F727068616E20696E73696465207374726F6E670A202020202B20277C5B5E2A5D2B283F3D5B5E2A5D';
wwv_flow_api.g_varchar2_table(388) := '2927202F2F20436F6E73756D6520746F2064656C696D0A202020202B20277C283F215C5C2A295B70756E63745D285C5C2A2B29283F3D5B5C5C735D7C242927202F2F2028312920232A2A2A2063616E206F6E6C7920626520612052696768742044656C69';
wwv_flow_api.g_varchar2_table(389) := '6D697465720A202020202B20277C5B5E70756E63745C5C735D285C5C2A2B29283F215C5C2A29283F3D5B70756E63745C5C735D7C242927202F2F2028322920612A2A2A232C20612A2A2A2063616E206F6E6C7920626520612052696768742044656C696D';
wwv_flow_api.g_varchar2_table(390) := '697465720A202020202B20277C283F215C5C2A295B70756E63745C5C735D285C5C2A2B29283F3D5B5E70756E63745C5C735D2927202F2F2028332920232A2A2A612C202A2A2A612063616E206F6E6C79206265204C6566742044656C696D697465720A20';
wwv_flow_api.g_varchar2_table(391) := '2020202B20277C5B5C5C735D285C5C2A2B29283F215C5C2A29283F3D5B70756E63745D2927202F2F20283429202A2A2A232063616E206F6E6C79206265204C6566742044656C696D697465720A202020202B20277C283F215C5C2A295B70756E63745D28';
wwv_flow_api.g_varchar2_table(392) := '5C5C2A2B29283F215C5C2A29283F3D5B70756E63745D2927202F2F2028352920232A2A2A232063616E20626520656974686572204C656674206F722052696768742044656C696D697465720A202020202B20277C5B5E70756E63745C5C735D285C5C2A2B';
wwv_flow_api.g_varchar2_table(393) := '29283F3D5B5E70756E63745C5C735D29272C202767752729202F2F2028362920612A2A2A612063616E20626520656974686572204C656674206F722052696768742044656C696D697465720A202020202E7265706C616365282F70756E63742F672C205F';
wwv_flow_api.g_varchar2_table(394) := '70756E6374756174696F6E290A202020202E676574526567657828293B0A2F2F20283629204E6F7420616C6C6F77656420666F72205F0A636F6E737420656D5374726F6E675244656C696D556E64203D206564697428275E5B5E5F2A5D2A3F5C5C2A5C5C';
wwv_flow_api.g_varchar2_table(395) := '2A5B5E5F2A5D2A3F5F5B5E5F2A5D2A3F283F3D5C5C2A5C5C2A2927202F2F20536B6970206F727068616E20696E73696465207374726F6E670A202020202B20277C5B5E5F5D2B283F3D5B5E5F5D2927202F2F20436F6E73756D6520746F2064656C696D0A';
wwv_flow_api.g_varchar2_table(396) := '202020202B20277C283F215F295B70756E63745D285F2B29283F3D5B5C5C735D7C242927202F2F2028312920235F5F5F2063616E206F6E6C7920626520612052696768742044656C696D697465720A202020202B20277C5B5E70756E63745C5C735D285F';
wwv_flow_api.g_varchar2_table(397) := '2B29283F215F29283F3D5B70756E63745C5C735D7C242927202F2F2028322920615F5F5F232C20615F5F5F2063616E206F6E6C7920626520612052696768742044656C696D697465720A202020202B20277C283F215F295B70756E63745C5C735D285F2B';
wwv_flow_api.g_varchar2_table(398) := '29283F3D5B5E70756E63745C5C735D2927202F2F2028332920235F5F5F612C205F5F5F612063616E206F6E6C79206265204C6566742044656C696D697465720A202020202B20277C5B5C5C735D285F2B29283F215F29283F3D5B70756E63745D2927202F';
wwv_flow_api.g_varchar2_table(399) := '2F20283429205F5F5F232063616E206F6E6C79206265204C6566742044656C696D697465720A202020202B20277C283F215F295B70756E63745D285F2B29283F215F29283F3D5B70756E63745D29272C202767752729202F2F2028352920235F5F5F2320';
wwv_flow_api.g_varchar2_table(400) := '63616E20626520656974686572204C656674206F722052696768742044656C696D697465720A202020202E7265706C616365282F70756E63742F672C205F70756E6374756174696F6E290A202020202E676574526567657828293B0A636F6E737420616E';
wwv_flow_api.g_varchar2_table(401) := '7950756E6374756174696F6E203D2065646974282F5C5C285B70756E63745D292F2C2027677527290A202020202E7265706C616365282F70756E63742F672C205F70756E6374756174696F6E290A202020202E676574526567657828293B0A636F6E7374';
wwv_flow_api.g_varchar2_table(402) := '206175746F6C696E6B203D2065646974282F5E3C28736368656D653A5B5E5C735C7830302D5C7831663C3E5D2A7C656D61696C293E2F290A202020202E7265706C6163652827736368656D65272C202F5B612D7A412D5A5D5B612D7A412D5A302D392B2E';
wwv_flow_api.g_varchar2_table(403) := '2D5D7B312C33317D2F290A202020202E7265706C6163652827656D61696C272C202F5B612D7A412D5A302D392E2123242526272A2B2F3D3F5E5F607B7C7D7E2D5D2B2840295B612D7A412D5A302D395D283F3A5B612D7A412D5A302D392D5D7B302C3631';
wwv_flow_api.g_varchar2_table(404) := '7D5B612D7A412D5A302D395D293F283F3A5C2E5B612D7A412D5A302D395D283F3A5B612D7A412D5A302D392D5D7B302C36317D5B612D7A412D5A302D395D293F292B283F215B2D5F5D292F290A202020202E676574526567657828293B0A636F6E737420';
wwv_flow_api.g_varchar2_table(405) := '5F696E6C696E65436F6D6D656E74203D2065646974285F636F6D6D656E74292E7265706C6163652827283F3A2D2D3E7C2429272C20272D2D3E27292E676574526567657828293B0A636F6E737420746167203D206564697428275E636F6D6D656E74270A';
wwv_flow_api.g_varchar2_table(406) := '202020202B20277C5E3C2F5B612D7A412D5A5D5B5C5C773A2D5D2A5C5C732A3E27202F2F2073656C662D636C6F73696E67207461670A202020202B20277C5E3C5B612D7A412D5A5D5B5C5C772D5D2A283F3A617474726962757465292A3F5C5C732A2F3F';
wwv_flow_api.g_varchar2_table(407) := '3E27202F2F206F70656E207461670A202020202B20277C5E3C5C5C3F5B5C5C735C5C535D2A3F5C5C3F3E27202F2F2070726F63657373696E6720696E737472756374696F6E2C20652E672E203C3F706870203F3E0A202020202B20277C5E3C215B612D7A';
wwv_flow_api.g_varchar2_table(408) := '412D5A5D2B5C5C735B5C5C735C5C535D2A3F3E27202F2F206465636C61726174696F6E2C20652E672E203C21444F43545950452068746D6C3E0A202020202B20277C5E3C215C5C5B43444154415C5C5B5B5C5C735C5C535D2A3F5C5C5D5C5C5D3E272920';
wwv_flow_api.g_varchar2_table(409) := '2F2F2043444154412073656374696F6E0A202020202E7265706C6163652827636F6D6D656E74272C205F696E6C696E65436F6D6D656E74290A202020202E7265706C6163652827617474726962757465272C202F5C732B5B612D7A412D5A3A5F5D5B5C77';
wwv_flow_api.g_varchar2_table(410) := '2E3A2D5D2A283F3A5C732A3D5C732A225B5E225D2A227C5C732A3D5C732A275B5E275D2A277C5C732A3D5C732A5B5E5C7322273D3C3E605D2B293F2F290A202020202E676574526567657828293B0A636F6E7374205F696E6C696E654C6162656C203D20';
wwv_flow_api.g_varchar2_table(411) := '2F283F3A5C5B283F3A5C5C2E7C5B5E5C5B5C5D5C5C5D292A5C5D7C5C5C2E7C605B5E605D2A607C5B5E5C5B5C5D5C5C605D292A3F2F3B0A636F6E7374206C696E6B203D2065646974282F5E213F5C5B286C6162656C295C5D5C285C732A28687265662928';
wwv_flow_api.g_varchar2_table(412) := '3F3A5C732B287469746C6529293F5C732A5C292F290A202020202E7265706C61636528276C6162656C272C205F696E6C696E654C6162656C290A202020202E7265706C616365282768726566272C202F3C283F3A5C5C2E7C5B5E5C6E3C3E5C5C5D292B3E';
wwv_flow_api.g_varchar2_table(413) := '7C5B5E5C735C7830302D5C7831665D2A2F290A202020202E7265706C61636528277469746C65272C202F22283F3A5C5C223F7C5B5E225C5C5D292A227C27283F3A5C5C273F7C5B5E275C5C5D292A277C5C28283F3A5C5C5C293F7C5B5E295C5C5D292A5C';
wwv_flow_api.g_varchar2_table(414) := '292F290A202020202E676574526567657828293B0A636F6E7374207265666C696E6B203D2065646974282F5E213F5C5B286C6162656C295C5D5C5B28726566295C5D2F290A202020202E7265706C61636528276C6162656C272C205F696E6C696E654C61';
wwv_flow_api.g_varchar2_table(415) := '62656C290A202020202E7265706C6163652827726566272C205F626C6F636B4C6162656C290A202020202E676574526567657828293B0A636F6E7374206E6F6C696E6B203D2065646974282F5E213F5C5B28726566295C5D283F3A5C5B5C5D293F2F290A';
wwv_flow_api.g_varchar2_table(416) := '202020202E7265706C6163652827726566272C205F626C6F636B4C6162656C290A202020202E676574526567657828293B0A636F6E7374207265666C696E6B536561726368203D206564697428277265666C696E6B7C6E6F6C696E6B283F215C5C282927';
wwv_flow_api.g_varchar2_table(417) := '2C20276727290A202020202E7265706C61636528277265666C696E6B272C207265666C696E6B290A202020202E7265706C61636528276E6F6C696E6B272C206E6F6C696E6B290A202020202E676574526567657828293B0A2F2A2A0A202A204E6F726D61';
wwv_flow_api.g_varchar2_table(418) := '6C20496E6C696E65204772616D6D61720A202A2F0A636F6E737420696E6C696E654E6F726D616C203D207B0A202020205F6261636B706564616C3A206E6F6F70546573742C202F2F206F6E6C79207573656420666F722047464D2075726C0A2020202061';
wwv_flow_api.g_varchar2_table(419) := '6E7950756E6374756174696F6E2C0A202020206175746F6C696E6B2C0A20202020626C6F636B536B69702C0A2020202062722C0A20202020636F64653A20696E6C696E65436F64652C0A2020202064656C3A206E6F6F70546573742C0A20202020656D53';
wwv_flow_api.g_varchar2_table(420) := '74726F6E674C44656C696D2C0A20202020656D5374726F6E675244656C696D4173742C0A20202020656D5374726F6E675244656C696D556E642C0A202020206573636170652C0A202020206C696E6B2C0A202020206E6F6C696E6B2C0A2020202070756E';
wwv_flow_api.g_varchar2_table(421) := '6374756174696F6E2C0A202020207265666C696E6B2C0A202020207265666C696E6B5365617263682C0A202020207461672C0A20202020746578743A20696E6C696E65546578742C0A2020202075726C3A206E6F6F70546573740A7D3B0A2F2A2A0A202A';
wwv_flow_api.g_varchar2_table(422) := '20506564616E74696320496E6C696E65204772616D6D61720A202A2F0A636F6E737420696E6C696E65506564616E746963203D207B0A202020202E2E2E696E6C696E654E6F726D616C2C0A202020206C696E6B3A2065646974282F5E213F5C5B286C6162';
wwv_flow_api.g_varchar2_table(423) := '656C295C5D5C28282E2A3F295C292F290A20202020202020202E7265706C61636528276C6162656C272C205F696E6C696E654C6162656C290A20202020202020202E676574526567657828292C0A202020207265666C696E6B3A2065646974282F5E213F';
wwv_flow_api.g_varchar2_table(424) := '5C5B286C6162656C295C5D5C732A5C5B285B5E5C5D5D2A295C5D2F290A20202020202020202E7265706C61636528276C6162656C272C205F696E6C696E654C6162656C290A20202020202020202E676574526567657828290A7D3B0A2F2A2A0A202A2047';
wwv_flow_api.g_varchar2_table(425) := '464D20496E6C696E65204772616D6D61720A202A2F0A636F6E737420696E6C696E6547666D203D207B0A202020202E2E2E696E6C696E654E6F726D616C2C0A202020206573636170653A206564697428657363617065292E7265706C61636528275D2927';
wwv_flow_api.g_varchar2_table(426) := '2C20277E7C5D2927292E676574526567657828292C0A2020202075726C3A2065646974282F5E28283F3A6674707C68747470733F293A5C2F5C2F7C7777775C2E29283F3A5B612D7A412D5A302D395C2D5D2B5C2E3F292B5B5E5C733C5D2A7C5E656D6169';
wwv_flow_api.g_varchar2_table(427) := '6C2F2C20276927290A20202020202020202E7265706C6163652827656D61696C272C202F5B412D5A612D7A302D392E5F2B2D5D2B2840295B612D7A412D5A302D392D5F5D2B283F3A5C2E5B612D7A412D5A302D392D5F5D2A5B612D7A412D5A302D395D29';
wwv_flow_api.g_varchar2_table(428) := '2B283F215B2D5F5D292F290A20202020202020202E676574526567657828292C0A202020205F6261636B706564616C3A202F283F3A5B5E3F212E2C3A3B2A5F27227E2829265D2B7C5C285B5E295D2A5C297C26283F215B612D7A412D5A302D395D2B3B24';
wwv_flow_api.g_varchar2_table(429) := '297C5B3F212E2C3A3B2A5F27227E295D2B283F212429292B2F2C0A2020202064656C3A202F5E287E7E3F29283F3D5B5E5C737E5D29285B5C735C535D2A3F5B5E5C737E5D295C31283F3D5B5E7E5D7C24292F2C0A20202020746578743A202F5E285B607E';
wwv_flow_api.g_varchar2_table(430) := '5D2B7C5B5E607E5D29283F3A283F3D207B322C7D5C6E297C283F3D5B612D7A412D5A302D392E2123242526272A2B5C2F3D3F5F607B5C7C7D7E2D5D2B40297C5B5C735C535D2A3F283F3A283F3D5B5C5C3C215C5B602A7E5F5D7C5C625F7C68747470733F';
wwv_flow_api.g_varchar2_table(431) := '3A5C2F5C2F7C6674703A5C2F5C2F7C7777775C2E7C24297C5B5E205D283F3D207B322C7D5C6E297C5B5E612D7A412D5A302D392E2123242526272A2B5C2F3D3F5F607B5C7C7D7E2D5D283F3D5B612D7A412D5A302D392E2123242526272A2B5C2F3D3F5F';
wwv_flow_api.g_varchar2_table(432) := '607B5C7C7D7E2D5D2B402929292F0A7D3B0A2F2A2A0A202A2047464D202B204C696E6520427265616B7320496E6C696E65204772616D6D61720A202A2F0A636F6E737420696E6C696E65427265616B73203D207B0A202020202E2E2E696E6C696E654766';
wwv_flow_api.g_varchar2_table(433) := '6D2C0A2020202062723A2065646974286272292E7265706C61636528277B322C7D272C20272A27292E676574526567657828292C0A20202020746578743A206564697428696E6C696E6547666D2E74657874290A20202020202020202E7265706C616365';
wwv_flow_api.g_varchar2_table(434) := '28275C5C625F272C20275C5C625F7C207B322C7D5C5C6E27290A20202020202020202E7265706C616365282F5C7B322C5C7D2F672C20272A27290A20202020202020202E676574526567657828290A7D3B0A2F2A2A0A202A206578706F7274730A202A2F';
wwv_flow_api.g_varchar2_table(435) := '0A636F6E737420626C6F636B203D207B0A202020206E6F726D616C3A20626C6F636B4E6F726D616C2C0A2020202067666D3A20626C6F636B47666D2C0A20202020706564616E7469633A20626C6F636B506564616E7469630A7D3B0A636F6E737420696E';
wwv_flow_api.g_varchar2_table(436) := '6C696E65203D207B0A202020206E6F726D616C3A20696E6C696E654E6F726D616C2C0A2020202067666D3A20696E6C696E6547666D2C0A20202020627265616B733A20696E6C696E65427265616B732C0A20202020706564616E7469633A20696E6C696E';
wwv_flow_api.g_varchar2_table(437) := '65506564616E7469630A7D3B0A0A2F2A2A0A202A20426C6F636B204C657865720A202A2F0A636C617373205F4C65786572207B0A20202020746F6B656E733B0A202020206F7074696F6E733B0A2020202073746174653B0A20202020746F6B656E697A65';
wwv_flow_api.g_varchar2_table(438) := '723B0A20202020696E6C696E6551756575653B0A20202020636F6E7374727563746F72286F7074696F6E7329207B0A20202020202020202F2F20546F6B656E4C6973742063616E6E6F74206265206372656174656420696E206F6E6520676F0A20202020';
wwv_flow_api.g_varchar2_table(439) := '20202020746869732E746F6B656E73203D205B5D3B0A2020202020202020746869732E746F6B656E732E6C696E6B73203D204F626A6563742E637265617465286E756C6C293B0A2020202020202020746869732E6F7074696F6E73203D206F7074696F6E';
wwv_flow_api.g_varchar2_table(440) := '73207C7C205F64656661756C74733B0A2020202020202020746869732E6F7074696F6E732E746F6B656E697A6572203D20746869732E6F7074696F6E732E746F6B656E697A6572207C7C206E6577205F546F6B656E697A657228293B0A20202020202020';
wwv_flow_api.g_varchar2_table(441) := '20746869732E746F6B656E697A6572203D20746869732E6F7074696F6E732E746F6B656E697A65723B0A2020202020202020746869732E746F6B656E697A65722E6F7074696F6E73203D20746869732E6F7074696F6E733B0A2020202020202020746869';
wwv_flow_api.g_varchar2_table(442) := '732E746F6B656E697A65722E6C65786572203D20746869733B0A2020202020202020746869732E696E6C696E655175657565203D205B5D3B0A2020202020202020746869732E7374617465203D207B0A202020202020202020202020696E4C696E6B3A20';
wwv_flow_api.g_varchar2_table(443) := '66616C73652C0A202020202020202020202020696E526177426C6F636B3A2066616C73652C0A202020202020202020202020746F703A20747275650A20202020202020207D3B0A2020202020202020636F6E73742072756C6573203D207B0A2020202020';
wwv_flow_api.g_varchar2_table(444) := '20202020202020626C6F636B3A20626C6F636B2E6E6F726D616C2C0A202020202020202020202020696E6C696E653A20696E6C696E652E6E6F726D616C0A20202020202020207D3B0A202020202020202069662028746869732E6F7074696F6E732E7065';
wwv_flow_api.g_varchar2_table(445) := '64616E74696329207B0A20202020202020202020202072756C65732E626C6F636B203D20626C6F636B2E706564616E7469633B0A20202020202020202020202072756C65732E696E6C696E65203D20696E6C696E652E706564616E7469633B0A20202020';
wwv_flow_api.g_varchar2_table(446) := '202020207D0A2020202020202020656C73652069662028746869732E6F7074696F6E732E67666D29207B0A20202020202020202020202072756C65732E626C6F636B203D20626C6F636B2E67666D3B0A2020202020202020202020206966202874686973';
wwv_flow_api.g_varchar2_table(447) := '2E6F7074696F6E732E627265616B7329207B0A2020202020202020202020202020202072756C65732E696E6C696E65203D20696E6C696E652E627265616B733B0A2020202020202020202020207D0A202020202020202020202020656C7365207B0A2020';
wwv_flow_api.g_varchar2_table(448) := '202020202020202020202020202072756C65732E696E6C696E65203D20696E6C696E652E67666D3B0A2020202020202020202020207D0A20202020202020207D0A2020202020202020746869732E746F6B656E697A65722E72756C6573203D2072756C65';
wwv_flow_api.g_varchar2_table(449) := '733B0A202020207D0A202020202F2A2A0A20202020202A204578706F73652052756C65730A20202020202A2F0A20202020737461746963206765742072756C65732829207B0A202020202020202072657475726E207B0A20202020202020202020202062';
wwv_flow_api.g_varchar2_table(450) := '6C6F636B2C0A202020202020202020202020696E6C696E650A20202020202020207D3B0A202020207D0A202020202F2A2A0A20202020202A20537461746963204C6578204D6574686F640A20202020202A2F0A20202020737461746963206C6578287372';
wwv_flow_api.g_varchar2_table(451) := '632C206F7074696F6E7329207B0A2020202020202020636F6E7374206C65786572203D206E6577205F4C65786572286F7074696F6E73293B0A202020202020202072657475726E206C657865722E6C657828737263293B0A202020207D0A202020202F2A';
wwv_flow_api.g_varchar2_table(452) := '2A0A20202020202A20537461746963204C657820496E6C696E65204D6574686F640A20202020202A2F0A20202020737461746963206C6578496E6C696E65287372632C206F7074696F6E7329207B0A2020202020202020636F6E7374206C65786572203D';
wwv_flow_api.g_varchar2_table(453) := '206E6577205F4C65786572286F7074696F6E73293B0A202020202020202072657475726E206C657865722E696E6C696E65546F6B656E7328737263293B0A202020207D0A202020202F2A2A0A20202020202A2050726570726F63657373696E670A202020';
wwv_flow_api.g_varchar2_table(454) := '20202A2F0A202020206C65782873726329207B0A2020202020202020737263203D207372630A2020202020202020202020202E7265706C616365282F5C725C6E7C5C722F672C20275C6E27293B0A2020202020202020746869732E626C6F636B546F6B65';
wwv_flow_api.g_varchar2_table(455) := '6E73287372632C20746869732E746F6B656E73293B0A2020202020202020666F7220286C65742069203D20303B2069203C20746869732E696E6C696E6551756575652E6C656E6774683B20692B2B29207B0A202020202020202020202020636F6E737420';
wwv_flow_api.g_varchar2_table(456) := '6E657874203D20746869732E696E6C696E6551756575655B695D3B0A202020202020202020202020746869732E696E6C696E65546F6B656E73286E6578742E7372632C206E6578742E746F6B656E73293B0A20202020202020207D0A2020202020202020';
wwv_flow_api.g_varchar2_table(457) := '746869732E696E6C696E655175657565203D205B5D3B0A202020202020202072657475726E20746869732E746F6B656E733B0A202020207D0A20202020626C6F636B546F6B656E73287372632C20746F6B656E73203D205B5D29207B0A20202020202020';
wwv_flow_api.g_varchar2_table(458) := '2069662028746869732E6F7074696F6E732E706564616E74696329207B0A202020202020202020202020737263203D207372632E7265706C616365282F5C742F672C20272020202027292E7265706C616365282F5E202B242F676D2C202727293B0A2020';
wwv_flow_api.g_varchar2_table(459) := '2020202020207D0A2020202020202020656C7365207B0A202020202020202020202020737263203D207372632E7265706C616365282F5E28202A29285C742B292F676D2C20285F2C206C656164696E672C207461627329203D3E207B0A20202020202020';
wwv_flow_api.g_varchar2_table(460) := '20202020202020202072657475726E206C656164696E67202B202720202020272E72657065617428746162732E6C656E677468293B0A2020202020202020202020207D293B0A20202020202020207D0A20202020202020206C657420746F6B656E3B0A20';
wwv_flow_api.g_varchar2_table(461) := '202020202020206C6574206C617374546F6B656E3B0A20202020202020206C6574206375745372633B0A20202020202020206C6574206C617374506172616772617068436C69707065643B0A20202020202020207768696C65202873726329207B0A2020';
wwv_flow_api.g_varchar2_table(462) := '2020202020202020202069662028746869732E6F7074696F6E732E657874656E73696F6E730A20202020202020202020202020202020262620746869732E6F7074696F6E732E657874656E73696F6E732E626C6F636B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(463) := '202020262620746869732E6F7074696F6E732E657874656E73696F6E732E626C6F636B2E736F6D652828657874546F6B656E697A657229203D3E207B0A202020202020202020202020202020202020202069662028746F6B656E203D20657874546F6B65';
wwv_flow_api.g_varchar2_table(464) := '6E697A65722E63616C6C287B206C657865723A2074686973207D2C207372632C20746F6B656E732929207B0A202020202020202020202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C65';
wwv_flow_api.g_varchar2_table(465) := '6E677468293B0A202020202020202020202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020202020202020202072657475726E20747275653B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(466) := '20202020202020207D0A202020202020202020202020202020202020202072657475726E2066616C73653B0A202020202020202020202020202020207D2929207B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020';
wwv_flow_api.g_varchar2_table(467) := '202020207D0A2020202020202020202020202F2F206E65776C696E650A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E7370616365287372632929207B0A202020202020202020202020202020207372';
wwv_flow_api.g_varchar2_table(468) := '63203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A2020202020202020202020202020202069662028746F6B656E2E7261772E6C656E677468203D3D3D203120262620746F6B656E732E6C656E677468203E2030';
wwv_flow_api.g_varchar2_table(469) := '29207B0A20202020202020202020202020202020202020202F2F206966207468657265277320612073696E676C65205C6E2061732061207370616365722C2069742773207465726D696E6174696E6720746865206C617374206C696E652C0A2020202020';
wwv_flow_api.g_varchar2_table(470) := '2020202020202020202020202020202F2F20736F206D6F766520697420746865726520736F207468617420776520646F6E27742067657420756E6E65636573736172792070617261677261706820746167730A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(471) := '202020746F6B656E735B746F6B656E732E6C656E677468202D20315D2E726177202B3D20275C6E273B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(472) := '202020746F6B656E732E7075736828746F6B656E293B0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F20636F6465';
wwv_flow_api.g_varchar2_table(473) := '0A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E636F6465287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C';
wwv_flow_api.g_varchar2_table(474) := '656E677468293B0A202020202020202020202020202020206C617374546F6B656E203D20746F6B656E735B746F6B656E732E6C656E677468202D20315D3B0A202020202020202020202020202020202F2F20416E20696E64656E74656420636F64652062';
wwv_flow_api.g_varchar2_table(475) := '6C6F636B2063616E6E6F7420696E746572727570742061207061726167726170682E0A20202020202020202020202020202020696620286C617374546F6B656E20262620286C617374546F6B656E2E74797065203D3D3D20277061726167726170682720';
wwv_flow_api.g_varchar2_table(476) := '7C7C206C617374546F6B656E2E74797065203D3D3D202774657874272929207B0A20202020202020202020202020202020202020206C617374546F6B656E2E726177202B3D20275C6E27202B20746F6B656E2E7261773B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(477) := '20202020202020206C617374546F6B656E2E74657874202B3D20275C6E27202B20746F6B656E2E746578743B0A2020202020202020202020202020202020202020746869732E696E6C696E6551756575655B746869732E696E6C696E6551756575652E6C';
wwv_flow_api.g_varchar2_table(478) := '656E677468202D20315D2E737263203D206C617374546F6B656E2E746578743B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020202020746F6B656E73';
wwv_flow_api.g_varchar2_table(479) := '2E7075736828746F6B656E293B0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F2066656E6365730A202020202020';
wwv_flow_api.g_varchar2_table(480) := '20202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E66656E636573287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468';
wwv_flow_api.g_varchar2_table(481) := '293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F2068656164696E';
wwv_flow_api.g_varchar2_table(482) := '670A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E68656164696E67287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E72';
wwv_flow_api.g_varchar2_table(483) := '61772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(484) := '2F2F2068720A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E6872287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261';
wwv_flow_api.g_varchar2_table(485) := '772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F';
wwv_flow_api.g_varchar2_table(486) := '2F20626C6F636B71756F74650A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E626C6F636B71756F7465287372632929207B0A20202020202020202020202020202020737263203D207372632E737562';
wwv_flow_api.g_varchar2_table(487) := '737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(488) := '7D0A2020202020202020202020202F2F206C6973740A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E6C697374287372632929207B0A20202020202020202020202020202020737263203D207372632E';
wwv_flow_api.g_varchar2_table(489) := '737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A202020202020202020';
wwv_flow_api.g_varchar2_table(490) := '2020207D0A2020202020202020202020202F2F2068746D6C0A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E68746D6C287372632929207B0A20202020202020202020202020202020737263203D2073';
wwv_flow_api.g_varchar2_table(491) := '72632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A202020202020';
wwv_flow_api.g_varchar2_table(492) := '2020202020207D0A2020202020202020202020202F2F206465660A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E646566287372632929207B0A20202020202020202020202020202020737263203D20';
wwv_flow_api.g_varchar2_table(493) := '7372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A202020202020202020202020202020206C617374546F6B656E203D20746F6B656E735B746F6B656E732E6C656E677468202D20315D3B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(494) := '20202020696620286C617374546F6B656E20262620286C617374546F6B656E2E74797065203D3D3D202770617261677261706827207C7C206C617374546F6B656E2E74797065203D3D3D202774657874272929207B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(495) := '2020202020206C617374546F6B656E2E726177202B3D20275C6E27202B20746F6B656E2E7261773B0A20202020202020202020202020202020202020206C617374546F6B656E2E74657874202B3D20275C6E27202B20746F6B656E2E7261773B0A202020';
wwv_flow_api.g_varchar2_table(496) := '2020202020202020202020202020202020746869732E696E6C696E6551756575655B746869732E696E6C696E6551756575652E6C656E677468202D20315D2E737263203D206C617374546F6B656E2E746578743B0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(497) := '207D0A20202020202020202020202020202020656C7365206966202821746869732E746F6B656E732E6C696E6B735B746F6B656E2E7461675D29207B0A2020202020202020202020202020202020202020746869732E746F6B656E732E6C696E6B735B74';
wwv_flow_api.g_varchar2_table(498) := '6F6B656E2E7461675D203D207B0A202020202020202020202020202020202020202020202020687265663A20746F6B656E2E687265662C0A2020202020202020202020202020202020202020202020207469746C653A20746F6B656E2E7469746C650A20';
wwv_flow_api.g_varchar2_table(499) := '202020202020202020202020202020202020207D3B0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F207461626C65';
wwv_flow_api.g_varchar2_table(500) := '202867666D290A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E7461626C65287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B65';
wwv_flow_api.g_varchar2_table(501) := '6E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A202020202020202020';
wwv_flow_api.g_varchar2_table(502) := '2020202F2F206C68656164696E670A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E6C68656164696E67287372632929207B0A20202020202020202020202020202020737263203D207372632E737562';
wwv_flow_api.g_varchar2_table(503) := '737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(504) := '7D0A2020202020202020202020202F2F20746F702D6C6576656C207061726167726170680A2020202020202020202020202F2F2070726576656E742070617261677261706820636F6E73756D696E6720657874656E73696F6E7320627920636C69707069';
wwv_flow_api.g_varchar2_table(505) := '6E6720277372632720746F20657874656E73696F6E2073746172740A202020202020202020202020637574537263203D207372633B0A20202020202020202020202069662028746869732E6F7074696F6E732E657874656E73696F6E7320262620746869';
wwv_flow_api.g_varchar2_table(506) := '732E6F7074696F6E732E657874656E73696F6E732E7374617274426C6F636B29207B0A202020202020202020202020202020206C6574207374617274496E646578203D20496E66696E6974793B0A20202020202020202020202020202020636F6E737420';
wwv_flow_api.g_varchar2_table(507) := '74656D70537263203D207372632E736C6963652831293B0A202020202020202020202020202020206C65742074656D7053746172743B0A20202020202020202020202020202020746869732E6F7074696F6E732E657874656E73696F6E732E7374617274';
wwv_flow_api.g_varchar2_table(508) := '426C6F636B2E666F724561636828286765745374617274496E64657829203D3E207B0A202020202020202020202020202020202020202074656D705374617274203D206765745374617274496E6465782E63616C6C287B206C657865723A207468697320';
wwv_flow_api.g_varchar2_table(509) := '7D2C2074656D70537263293B0A202020202020202020202020202020202020202069662028747970656F662074656D705374617274203D3D3D20276E756D626572272026262074656D705374617274203E3D203029207B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(510) := '2020202020202020202020207374617274496E646578203D204D6174682E6D696E287374617274496E6465782C2074656D705374617274293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D293B0A';
wwv_flow_api.g_varchar2_table(511) := '20202020202020202020202020202020696620287374617274496E646578203C20496E66696E697479202626207374617274496E646578203E3D203029207B0A2020202020202020202020202020202020202020637574537263203D207372632E737562';
wwv_flow_api.g_varchar2_table(512) := '737472696E6728302C207374617274496E646578202B2031293B0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020202020202069662028746869732E73746174652E746F702026262028746F6B656E20';
wwv_flow_api.g_varchar2_table(513) := '3D20746869732E746F6B656E697A65722E70617261677261706828637574537263292929207B0A202020202020202020202020202020206C617374546F6B656E203D20746F6B656E735B746F6B656E732E6C656E677468202D20315D3B0A202020202020';
wwv_flow_api.g_varchar2_table(514) := '20202020202020202020696620286C617374506172616772617068436C6970706564202626206C617374546F6B656E2E74797065203D3D3D20277061726167726170682729207B0A20202020202020202020202020202020202020206C617374546F6B65';
wwv_flow_api.g_varchar2_table(515) := '6E2E726177202B3D20275C6E27202B20746F6B656E2E7261773B0A20202020202020202020202020202020202020206C617374546F6B656E2E74657874202B3D20275C6E27202B20746F6B656E2E746578743B0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(516) := '20202020746869732E696E6C696E6551756575652E706F7028293B0A2020202020202020202020202020202020202020746869732E696E6C696E6551756575655B746869732E696E6C696E6551756575652E6C656E677468202D20315D2E737263203D20';
wwv_flow_api.g_varchar2_table(517) := '6C617374546F6B656E2E746578743B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A202020';
wwv_flow_api.g_varchar2_table(518) := '202020202020202020202020207D0A202020202020202020202020202020206C617374506172616772617068436C6970706564203D20286375745372632E6C656E67746820213D3D207372632E6C656E677468293B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(519) := '2020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F2074657874';
wwv_flow_api.g_varchar2_table(520) := '0A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E74657874287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C';
wwv_flow_api.g_varchar2_table(521) := '656E677468293B0A202020202020202020202020202020206C617374546F6B656E203D20746F6B656E735B746F6B656E732E6C656E677468202D20315D3B0A20202020202020202020202020202020696620286C617374546F6B656E202626206C617374';
wwv_flow_api.g_varchar2_table(522) := '546F6B656E2E74797065203D3D3D2027746578742729207B0A20202020202020202020202020202020202020206C617374546F6B656E2E726177202B3D20275C6E27202B20746F6B656E2E7261773B0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(523) := '6C617374546F6B656E2E74657874202B3D20275C6E27202B20746F6B656E2E746578743B0A2020202020202020202020202020202020202020746869732E696E6C696E6551756575652E706F7028293B0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(524) := '20746869732E696E6C696E6551756575655B746869732E696E6C696E6551756575652E6C656E677468202D20315D2E737263203D206C617374546F6B656E2E746578743B0A202020202020202020202020202020207D0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(525) := '202020656C7365207B0A2020202020202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E74696E75653B0A202020202020';
wwv_flow_api.g_varchar2_table(526) := '2020202020207D0A2020202020202020202020206966202873726329207B0A20202020202020202020202020202020636F6E7374206572724D7367203D2027496E66696E697465206C6F6F70206F6E20627974653A2027202B207372632E63686172436F';
wwv_flow_api.g_varchar2_table(527) := '646541742830293B0A2020202020202020202020202020202069662028746869732E6F7074696F6E732E73696C656E7429207B0A2020202020202020202020202020202020202020636F6E736F6C652E6572726F72286572724D7367293B0A2020202020';
wwv_flow_api.g_varchar2_table(528) := '202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C7365207B0A20202020202020202020202020202020202020207468726F77206E6577204572726F722865';
wwv_flow_api.g_varchar2_table(529) := '72724D7367293B0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020207D0A2020202020202020746869732E73746174652E746F70203D20747275653B0A202020202020202072657475726E20746F6B65';
wwv_flow_api.g_varchar2_table(530) := '6E733B0A202020207D0A20202020696E6C696E65287372632C20746F6B656E73203D205B5D29207B0A2020202020202020746869732E696E6C696E6551756575652E70757368287B207372632C20746F6B656E73207D293B0A2020202020202020726574';
wwv_flow_api.g_varchar2_table(531) := '75726E20746F6B656E733B0A202020207D0A202020202F2A2A0A20202020202A204C6578696E672F436F6D70696C696E670A20202020202A2F0A20202020696E6C696E65546F6B656E73287372632C20746F6B656E73203D205B5D29207B0A2020202020';
wwv_flow_api.g_varchar2_table(532) := '2020206C657420746F6B656E2C206C617374546F6B656E2C206375745372633B0A20202020202020202F2F20537472696E672077697468206C696E6B73206D61736B656420746F2061766F696420696E746572666572656E6365207769746820656D2061';
wwv_flow_api.g_varchar2_table(533) := '6E64207374726F6E670A20202020202020206C6574206D61736B6564537263203D207372633B0A20202020202020206C6574206D617463683B0A20202020202020206C6574206B65657050726576436861722C2070726576436861723B0A202020202020';
wwv_flow_api.g_varchar2_table(534) := '20202F2F204D61736B206F7574207265666C696E6B730A202020202020202069662028746869732E746F6B656E732E6C696E6B7329207B0A202020202020202020202020636F6E7374206C696E6B73203D204F626A6563742E6B65797328746869732E74';
wwv_flow_api.g_varchar2_table(535) := '6F6B656E732E6C696E6B73293B0A202020202020202020202020696620286C696E6B732E6C656E677468203E203029207B0A202020202020202020202020202020207768696C652028286D61746368203D20746869732E746F6B656E697A65722E72756C';
wwv_flow_api.g_varchar2_table(536) := '65732E696E6C696E652E7265666C696E6B5365617263682E65786563286D61736B6564537263292920213D206E756C6C29207B0A2020202020202020202020202020202020202020696620286C696E6B732E696E636C75646573286D617463685B305D2E';
wwv_flow_api.g_varchar2_table(537) := '736C696365286D617463685B305D2E6C617374496E6465784F6628275B2729202B20312C202D31292929207B0A2020202020202020202020202020202020202020202020206D61736B6564537263203D206D61736B65645372632E736C69636528302C20';
wwv_flow_api.g_varchar2_table(538) := '6D617463682E696E64657829202B20275B27202B202761272E726570656174286D617463685B305D2E6C656E677468202D203229202B20275D27202B206D61736B65645372632E736C69636528746869732E746F6B656E697A65722E72756C65732E696E';
wwv_flow_api.g_varchar2_table(539) := '6C696E652E7265666C696E6B5365617263682E6C617374496E646578293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020207D0A2020202020';
wwv_flow_api.g_varchar2_table(540) := '2020202F2F204D61736B206F7574206F7468657220626C6F636B730A20202020202020207768696C652028286D61746368203D20746869732E746F6B656E697A65722E72756C65732E696E6C696E652E626C6F636B536B69702E65786563286D61736B65';
wwv_flow_api.g_varchar2_table(541) := '64537263292920213D206E756C6C29207B0A2020202020202020202020206D61736B6564537263203D206D61736B65645372632E736C69636528302C206D617463682E696E64657829202B20275B27202B202761272E726570656174286D617463685B30';
wwv_flow_api.g_varchar2_table(542) := '5D2E6C656E677468202D203229202B20275D27202B206D61736B65645372632E736C69636528746869732E746F6B656E697A65722E72756C65732E696E6C696E652E626C6F636B536B69702E6C617374496E646578293B0A20202020202020207D0A2020';
wwv_flow_api.g_varchar2_table(543) := '2020202020202F2F204D61736B206F7574206573636170656420636861726163746572730A20202020202020207768696C652028286D61746368203D20746869732E746F6B656E697A65722E72756C65732E696E6C696E652E616E7950756E6374756174';
wwv_flow_api.g_varchar2_table(544) := '696F6E2E65786563286D61736B6564537263292920213D206E756C6C29207B0A2020202020202020202020206D61736B6564537263203D206D61736B65645372632E736C69636528302C206D617463682E696E64657829202B20272B2B27202B206D6173';
wwv_flow_api.g_varchar2_table(545) := '6B65645372632E736C69636528746869732E746F6B656E697A65722E72756C65732E696E6C696E652E616E7950756E6374756174696F6E2E6C617374496E646578293B0A20202020202020207D0A20202020202020207768696C65202873726329207B0A';
wwv_flow_api.g_varchar2_table(546) := '20202020202020202020202069662028216B656570507265764368617229207B0A202020202020202020202020202020207072657643686172203D2027273B0A2020202020202020202020207D0A2020202020202020202020206B656570507265764368';
wwv_flow_api.g_varchar2_table(547) := '6172203D2066616C73653B0A2020202020202020202020202F2F20657874656E73696F6E730A20202020202020202020202069662028746869732E6F7074696F6E732E657874656E73696F6E730A20202020202020202020202020202020262620746869';
wwv_flow_api.g_varchar2_table(548) := '732E6F7074696F6E732E657874656E73696F6E732E696E6C696E650A20202020202020202020202020202020262620746869732E6F7074696F6E732E657874656E73696F6E732E696E6C696E652E736F6D652828657874546F6B656E697A657229203D3E';
wwv_flow_api.g_varchar2_table(549) := '207B0A202020202020202020202020202020202020202069662028746F6B656E203D20657874546F6B656E697A65722E63616C6C287B206C657865723A2074686973207D2C207372632C20746F6B656E732929207B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(550) := '20202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A202020202020202020202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020';
wwv_flow_api.g_varchar2_table(551) := '202020202020202020202020202020202072657475726E20747275653B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020202020202072657475726E2066616C73653B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(552) := '20207D2929207B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F206573636170650A20202020202020202020202069662028746F6B656E203D20746869732E74';
wwv_flow_api.g_varchar2_table(553) := '6F6B656E697A65722E657363617065287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E';
wwv_flow_api.g_varchar2_table(554) := '732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F207461670A20202020202020202020202069662028746F6B656E203D207468';
wwv_flow_api.g_varchar2_table(555) := '69732E746F6B656E697A65722E746167287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A202020202020202020202020202020206C617374';
wwv_flow_api.g_varchar2_table(556) := '546F6B656E203D20746F6B656E735B746F6B656E732E6C656E677468202D20315D3B0A20202020202020202020202020202020696620286C617374546F6B656E20262620746F6B656E2E74797065203D3D3D20277465787427202626206C617374546F6B';
wwv_flow_api.g_varchar2_table(557) := '656E2E74797065203D3D3D2027746578742729207B0A20202020202020202020202020202020202020206C617374546F6B656E2E726177202B3D20746F6B656E2E7261773B0A20202020202020202020202020202020202020206C617374546F6B656E2E';
wwv_flow_api.g_varchar2_table(558) := '74657874202B3D20746F6B656E2E746578743B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B';
wwv_flow_api.g_varchar2_table(559) := '0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F206C696E6B0A20202020202020202020202069662028746F6B656E';
wwv_flow_api.g_varchar2_table(560) := '203D20746869732E746F6B656E697A65722E6C696E6B287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(561) := '2020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F207265666C696E6B2C206E6F6C696E6B0A20202020202020';
wwv_flow_api.g_varchar2_table(562) := '202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E7265666C696E6B287372632C20746869732E746F6B656E732E6C696E6B732929207B0A20202020202020202020202020202020737263203D207372632E73756273747269';
wwv_flow_api.g_varchar2_table(563) := '6E6728746F6B656E2E7261772E6C656E677468293B0A202020202020202020202020202020206C617374546F6B656E203D20746F6B656E735B746F6B656E732E6C656E677468202D20315D3B0A20202020202020202020202020202020696620286C6173';
wwv_flow_api.g_varchar2_table(564) := '74546F6B656E20262620746F6B656E2E74797065203D3D3D20277465787427202626206C617374546F6B656E2E74797065203D3D3D2027746578742729207B0A20202020202020202020202020202020202020206C617374546F6B656E2E726177202B3D';
wwv_flow_api.g_varchar2_table(565) := '20746F6B656E2E7261773B0A20202020202020202020202020202020202020206C617374546F6B656E2E74657874202B3D20746F6B656E2E746578743B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C7365';
wwv_flow_api.g_varchar2_table(566) := '207B0A2020202020202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D';
wwv_flow_api.g_varchar2_table(567) := '0A2020202020202020202020202F2F20656D2026207374726F6E670A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E656D5374726F6E67287372632C206D61736B65645372632C207072657643686172';
wwv_flow_api.g_varchar2_table(568) := '2929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020';
wwv_flow_api.g_varchar2_table(569) := '202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F20636F64650A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E636F646573';
wwv_flow_api.g_varchar2_table(570) := '70616E287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E';
wwv_flow_api.g_varchar2_table(571) := '293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F2062720A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E';
wwv_flow_api.g_varchar2_table(572) := '6272287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E29';
wwv_flow_api.g_varchar2_table(573) := '3B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F2064656C202867666D290A20202020202020202020202069662028746F6B656E203D20746869732E746F6B65';
wwv_flow_api.g_varchar2_table(574) := '6E697A65722E64656C287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E70757368';
wwv_flow_api.g_varchar2_table(575) := '28746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F206175746F6C696E6B0A20202020202020202020202069662028746F6B656E203D20746869';
wwv_flow_api.g_varchar2_table(576) := '732E746F6B656E697A65722E6175746F6C696E6B287372632929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(577) := '746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A2020202020202020202020202F2F2075726C202867666D290A202020202020202020202020696620';
wwv_flow_api.g_varchar2_table(578) := '2821746869732E73746174652E696E4C696E6B2026262028746F6B656E203D20746869732E746F6B656E697A65722E75726C28737263292929207B0A20202020202020202020202020202020737263203D207372632E737562737472696E6728746F6B65';
wwv_flow_api.g_varchar2_table(579) := '6E2E7261772E6C656E677468293B0A20202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A202020202020202020';
wwv_flow_api.g_varchar2_table(580) := '2020202F2F20746578740A2020202020202020202020202F2F2070726576656E7420696E6C696E655465787420636F6E73756D696E6720657874656E73696F6E7320627920636C697070696E6720277372632720746F20657874656E73696F6E20737461';
wwv_flow_api.g_varchar2_table(581) := '72740A202020202020202020202020637574537263203D207372633B0A20202020202020202020202069662028746869732E6F7074696F6E732E657874656E73696F6E7320262620746869732E6F7074696F6E732E657874656E73696F6E732E73746172';
wwv_flow_api.g_varchar2_table(582) := '74496E6C696E6529207B0A202020202020202020202020202020206C6574207374617274496E646578203D20496E66696E6974793B0A20202020202020202020202020202020636F6E73742074656D70537263203D207372632E736C6963652831293B0A';
wwv_flow_api.g_varchar2_table(583) := '202020202020202020202020202020206C65742074656D7053746172743B0A20202020202020202020202020202020746869732E6F7074696F6E732E657874656E73696F6E732E7374617274496E6C696E652E666F724561636828286765745374617274';
wwv_flow_api.g_varchar2_table(584) := '496E64657829203D3E207B0A202020202020202020202020202020202020202074656D705374617274203D206765745374617274496E6465782E63616C6C287B206C657865723A2074686973207D2C2074656D70537263293B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(585) := '2020202020202020202069662028747970656F662074656D705374617274203D3D3D20276E756D626572272026262074656D705374617274203E3D203029207B0A2020202020202020202020202020202020202020202020207374617274496E64657820';
wwv_flow_api.g_varchar2_table(586) := '3D204D6174682E6D696E287374617274496E6465782C2074656D705374617274293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D293B0A2020202020202020202020202020202069662028737461';
wwv_flow_api.g_varchar2_table(587) := '7274496E646578203C20496E66696E697479202626207374617274496E646578203E3D203029207B0A2020202020202020202020202020202020202020637574537263203D207372632E737562737472696E6728302C207374617274496E646578202B20';
wwv_flow_api.g_varchar2_table(588) := '31293B0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020202020202069662028746F6B656E203D20746869732E746F6B656E697A65722E696E6C696E6554657874286375745372632929207B0A202020';
wwv_flow_api.g_varchar2_table(589) := '20202020202020202020202020737263203D207372632E737562737472696E6728746F6B656E2E7261772E6C656E677468293B0A2020202020202020202020202020202069662028746F6B656E2E7261772E736C696365282D312920213D3D20275F2729';
wwv_flow_api.g_varchar2_table(590) := '207B202F2F20547261636B207072657643686172206265666F726520737472696E67206F66205F5F5F5F20737461727465640A20202020202020202020202020202020202020207072657643686172203D20746F6B656E2E7261772E736C696365282D31';
wwv_flow_api.g_varchar2_table(591) := '293B0A202020202020202020202020202020207D0A202020202020202020202020202020206B6565705072657643686172203D20747275653B0A202020202020202020202020202020206C617374546F6B656E203D20746F6B656E735B746F6B656E732E';
wwv_flow_api.g_varchar2_table(592) := '6C656E677468202D20315D3B0A20202020202020202020202020202020696620286C617374546F6B656E202626206C617374546F6B656E2E74797065203D3D3D2027746578742729207B0A20202020202020202020202020202020202020206C61737454';
wwv_flow_api.g_varchar2_table(593) := '6F6B656E2E726177202B3D20746F6B656E2E7261773B0A20202020202020202020202020202020202020206C617374546F6B656E2E74657874202B3D20746F6B656E2E746578743B0A202020202020202020202020202020207D0A202020202020202020';
wwv_flow_api.g_varchar2_table(594) := '20202020202020656C7365207B0A2020202020202020202020202020202020202020746F6B656E732E7075736828746F6B656E293B0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E74696E75653B0A2020';
wwv_flow_api.g_varchar2_table(595) := '202020202020202020207D0A2020202020202020202020206966202873726329207B0A20202020202020202020202020202020636F6E7374206572724D7367203D2027496E66696E697465206C6F6F70206F6E20627974653A2027202B207372632E6368';
wwv_flow_api.g_varchar2_table(596) := '6172436F646541742830293B0A2020202020202020202020202020202069662028746869732E6F7074696F6E732E73696C656E7429207B0A2020202020202020202020202020202020202020636F6E736F6C652E6572726F72286572724D7367293B0A20';
wwv_flow_api.g_varchar2_table(597) := '20202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A20202020202020202020202020202020656C7365207B0A20202020202020202020202020202020202020207468726F77206E657720457272';
wwv_flow_api.g_varchar2_table(598) := '6F72286572724D7367293B0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020207D0A202020202020202072657475726E20746F6B656E733B0A202020207D0A7D0A0A2F2A2A0A202A2052656E64657265';
wwv_flow_api.g_varchar2_table(599) := '720A202A2F0A636C617373205F52656E6465726572207B0A202020206F7074696F6E733B0A20202020636F6E7374727563746F72286F7074696F6E7329207B0A2020202020202020746869732E6F7074696F6E73203D206F7074696F6E73207C7C205F64';
wwv_flow_api.g_varchar2_table(600) := '656661756C74733B0A202020207D0A20202020636F646528636F64652C20696E666F737472696E672C206573636170656429207B0A2020202020202020636F6E7374206C616E67203D2028696E666F737472696E67207C7C202727292E6D61746368282F';
wwv_flow_api.g_varchar2_table(601) := '5E5C532A2F293F2E5B305D3B0A2020202020202020636F6465203D20636F64652E7265706C616365282F5C6E242F2C20272729202B20275C6E273B0A202020202020202069662028216C616E6729207B0A20202020202020202020202072657475726E20';
wwv_flow_api.g_varchar2_table(602) := '273C7072653E3C636F64653E270A202020202020202020202020202020202B202865736361706564203F20636F6465203A20657363617065243128636F64652C207472756529290A202020202020202020202020202020202B20273C2F636F64653E3C2F';
wwv_flow_api.g_varchar2_table(603) := '7072653E5C6E273B0A20202020202020207D0A202020202020202072657475726E20273C7072653E3C636F646520636C6173733D226C616E67756167652D270A2020202020202020202020202B206573636170652431286C616E67290A20202020202020';
wwv_flow_api.g_varchar2_table(604) := '20202020202B2027223E270A2020202020202020202020202B202865736361706564203F20636F6465203A20657363617065243128636F64652C207472756529290A2020202020202020202020202B20273C2F636F64653E3C2F7072653E5C6E273B0A20';
wwv_flow_api.g_varchar2_table(605) := '2020207D0A20202020626C6F636B71756F74652871756F746529207B0A202020202020202072657475726E20603C626C6F636B71756F74653E5C6E247B71756F74657D3C2F626C6F636B71756F74653E5C6E603B0A202020207D0A2020202068746D6C28';
wwv_flow_api.g_varchar2_table(606) := '68746D6C2C20626C6F636B29207B0A202020202020202072657475726E2068746D6C3B0A202020207D0A2020202068656164696E6728746578742C206C6576656C2C2072617729207B0A20202020202020202F2F2069676E6F7265204944730A20202020';
wwv_flow_api.g_varchar2_table(607) := '2020202072657475726E20603C68247B6C6576656C7D3E247B746578747D3C2F68247B6C6576656C7D3E5C6E603B0A202020207D0A2020202068722829207B0A202020202020202072657475726E20273C68723E5C6E273B0A202020207D0A202020206C';
wwv_flow_api.g_varchar2_table(608) := '69737428626F64792C206F7264657265642C20737461727429207B0A2020202020202020636F6E73742074797065203D206F726465726564203F20276F6C27203A2027756C273B0A2020202020202020636F6E7374207374617274617474203D20286F72';
wwv_flow_api.g_varchar2_table(609) := '646572656420262620737461727420213D3D203129203F2028272073746172743D2227202B207374617274202B2027222729203A2027273B0A202020202020202072657475726E20273C27202B2074797065202B207374617274617474202B20273E5C6E';
wwv_flow_api.g_varchar2_table(610) := '27202B20626F6479202B20273C2F27202B2074797065202B20273E5C6E273B0A202020207D0A202020206C6973746974656D28746578742C207461736B2C20636865636B656429207B0A202020202020202072657475726E20603C6C693E247B74657874';
wwv_flow_api.g_varchar2_table(611) := '7D3C2F6C693E5C6E603B0A202020207D0A20202020636865636B626F7828636865636B656429207B0A202020202020202072657475726E20273C696E70757420270A2020202020202020202020202B2028636865636B6564203F2027636865636B65643D';
wwv_flow_api.g_varchar2_table(612) := '22222027203A202727290A2020202020202020202020202B202764697361626C65643D222220747970653D22636865636B626F78223E273B0A202020207D0A20202020706172616772617068287465787429207B0A202020202020202072657475726E20';
wwv_flow_api.g_varchar2_table(613) := '603C703E247B746578747D3C2F703E5C6E603B0A202020207D0A202020207461626C65286865616465722C20626F647929207B0A202020202020202069662028626F6479290A202020202020202020202020626F6479203D20603C74626F64793E247B62';
wwv_flow_api.g_varchar2_table(614) := '6F64797D3C2F74626F64793E603B0A202020202020202072657475726E20273C7461626C653E5C6E270A2020202020202020202020202B20273C74686561643E5C6E270A2020202020202020202020202B206865616465720A2020202020202020202020';
wwv_flow_api.g_varchar2_table(615) := '202B20273C2F74686561643E5C6E270A2020202020202020202020202B20626F64790A2020202020202020202020202B20273C2F7461626C653E5C6E273B0A202020207D0A202020207461626C65726F7728636F6E74656E7429207B0A20202020202020';
wwv_flow_api.g_varchar2_table(616) := '2072657475726E20603C74723E5C6E247B636F6E74656E747D3C2F74723E5C6E603B0A202020207D0A202020207461626C6563656C6C28636F6E74656E742C20666C61677329207B0A2020202020202020636F6E73742074797065203D20666C6167732E';
wwv_flow_api.g_varchar2_table(617) := '686561646572203F2027746827203A20277464273B0A2020202020202020636F6E737420746167203D20666C6167732E616C69676E0A2020202020202020202020203F20603C247B747970657D20616C69676E3D22247B666C6167732E616C69676E7D22';
wwv_flow_api.g_varchar2_table(618) := '3E600A2020202020202020202020203A20603C247B747970657D3E603B0A202020202020202072657475726E20746167202B20636F6E74656E74202B20603C2F247B747970657D3E5C6E603B0A202020207D0A202020202F2A2A0A20202020202A207370';
wwv_flow_api.g_varchar2_table(619) := '616E206C6576656C2072656E64657265720A20202020202A2F0A202020207374726F6E67287465787429207B0A202020202020202072657475726E20603C7374726F6E673E247B746578747D3C2F7374726F6E673E603B0A202020207D0A20202020656D';
wwv_flow_api.g_varchar2_table(620) := '287465787429207B0A202020202020202072657475726E20603C656D3E247B746578747D3C2F656D3E603B0A202020207D0A20202020636F64657370616E287465787429207B0A202020202020202072657475726E20603C636F64653E247B746578747D';
wwv_flow_api.g_varchar2_table(621) := '3C2F636F64653E603B0A202020207D0A2020202062722829207B0A202020202020202072657475726E20273C62723E273B0A202020207D0A2020202064656C287465787429207B0A202020202020202072657475726E20603C64656C3E247B746578747D';
wwv_flow_api.g_varchar2_table(622) := '3C2F64656C3E603B0A202020207D0A202020206C696E6B28687265662C207469746C652C207465787429207B0A2020202020202020636F6E737420636C65616E48726566203D20636C65616E55726C2868726566293B0A20202020202020206966202863';
wwv_flow_api.g_varchar2_table(623) := '6C65616E48726566203D3D3D206E756C6C29207B0A20202020202020202020202072657475726E20746578743B0A20202020202020207D0A202020202020202068726566203D20636C65616E487265663B0A20202020202020206C6574206F7574203D20';
wwv_flow_api.g_varchar2_table(624) := '273C6120687265663D2227202B2068726566202B202722273B0A2020202020202020696620287469746C6529207B0A2020202020202020202020206F7574202B3D2027207469746C653D2227202B207469746C65202B202722273B0A2020202020202020';
wwv_flow_api.g_varchar2_table(625) := '7D0A20202020202020206F7574202B3D20273E27202B2074657874202B20273C2F613E273B0A202020202020202072657475726E206F75743B0A202020207D0A20202020696D61676528687265662C207469746C652C207465787429207B0A2020202020';
wwv_flow_api.g_varchar2_table(626) := '202020636F6E737420636C65616E48726566203D20636C65616E55726C2868726566293B0A202020202020202069662028636C65616E48726566203D3D3D206E756C6C29207B0A20202020202020202020202072657475726E20746578743B0A20202020';
wwv_flow_api.g_varchar2_table(627) := '202020207D0A202020202020202068726566203D20636C65616E487265663B0A20202020202020206C6574206F7574203D20603C696D67207372633D22247B687265667D2220616C743D22247B746578747D22603B0A2020202020202020696620287469';
wwv_flow_api.g_varchar2_table(628) := '746C6529207B0A2020202020202020202020206F7574202B3D2060207469746C653D22247B7469746C657D22603B0A20202020202020207D0A20202020202020206F7574202B3D20273E273B0A202020202020202072657475726E206F75743B0A202020';
wwv_flow_api.g_varchar2_table(629) := '207D0A2020202074657874287465787429207B0A202020202020202072657475726E20746578743B0A202020207D0A7D0A0A2F2A2A0A202A205465787452656E64657265720A202A2072657475726E73206F6E6C7920746865207465787475616C207061';
wwv_flow_api.g_varchar2_table(630) := '7274206F662074686520746F6B656E0A202A2F0A636C617373205F5465787452656E6465726572207B0A202020202F2F206E6F206E65656420666F7220626C6F636B206C6576656C2072656E6465726572730A202020207374726F6E6728746578742920';
wwv_flow_api.g_varchar2_table(631) := '7B0A202020202020202072657475726E20746578743B0A202020207D0A20202020656D287465787429207B0A202020202020202072657475726E20746578743B0A202020207D0A20202020636F64657370616E287465787429207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(632) := '72657475726E20746578743B0A202020207D0A2020202064656C287465787429207B0A202020202020202072657475726E20746578743B0A202020207D0A2020202068746D6C287465787429207B0A202020202020202072657475726E20746578743B0A';
wwv_flow_api.g_varchar2_table(633) := '202020207D0A2020202074657874287465787429207B0A202020202020202072657475726E20746578743B0A202020207D0A202020206C696E6B28687265662C207469746C652C207465787429207B0A202020202020202072657475726E202727202B20';
wwv_flow_api.g_varchar2_table(634) := '746578743B0A202020207D0A20202020696D61676528687265662C207469746C652C207465787429207B0A202020202020202072657475726E202727202B20746578743B0A202020207D0A2020202062722829207B0A202020202020202072657475726E';
wwv_flow_api.g_varchar2_table(635) := '2027273B0A202020207D0A7D0A0A2F2A2A0A202A2050617273696E67202620436F6D70696C696E670A202A2F0A636C617373205F506172736572207B0A202020206F7074696F6E733B0A2020202072656E64657265723B0A202020207465787452656E64';
wwv_flow_api.g_varchar2_table(636) := '657265723B0A20202020636F6E7374727563746F72286F7074696F6E7329207B0A2020202020202020746869732E6F7074696F6E73203D206F7074696F6E73207C7C205F64656661756C74733B0A2020202020202020746869732E6F7074696F6E732E72';
wwv_flow_api.g_varchar2_table(637) := '656E6465726572203D20746869732E6F7074696F6E732E72656E6465726572207C7C206E6577205F52656E646572657228293B0A2020202020202020746869732E72656E6465726572203D20746869732E6F7074696F6E732E72656E64657265723B0A20';
wwv_flow_api.g_varchar2_table(638) := '20202020202020746869732E72656E64657265722E6F7074696F6E73203D20746869732E6F7074696F6E733B0A2020202020202020746869732E7465787452656E6465726572203D206E6577205F5465787452656E646572657228293B0A202020207D0A';
wwv_flow_api.g_varchar2_table(639) := '202020202F2A2A0A20202020202A20537461746963205061727365204D6574686F640A20202020202A2F0A2020202073746174696320706172736528746F6B656E732C206F7074696F6E7329207B0A2020202020202020636F6E73742070617273657220';
wwv_flow_api.g_varchar2_table(640) := '3D206E6577205F506172736572286F7074696F6E73293B0A202020202020202072657475726E207061727365722E706172736528746F6B656E73293B0A202020207D0A202020202F2A2A0A20202020202A2053746174696320506172736520496E6C696E';
wwv_flow_api.g_varchar2_table(641) := '65204D6574686F640A20202020202A2F0A20202020737461746963207061727365496E6C696E6528746F6B656E732C206F7074696F6E7329207B0A2020202020202020636F6E737420706172736572203D206E6577205F506172736572286F7074696F6E';
wwv_flow_api.g_varchar2_table(642) := '73293B0A202020202020202072657475726E207061727365722E7061727365496E6C696E6528746F6B656E73293B0A202020207D0A202020202F2A2A0A20202020202A205061727365204C6F6F700A20202020202A2F0A20202020706172736528746F6B';
wwv_flow_api.g_varchar2_table(643) := '656E732C20746F70203D207472756529207B0A20202020202020206C6574206F7574203D2027273B0A2020202020202020666F7220286C65742069203D20303B2069203C20746F6B656E732E6C656E6774683B20692B2B29207B0A202020202020202020';
wwv_flow_api.g_varchar2_table(644) := '202020636F6E737420746F6B656E203D20746F6B656E735B695D3B0A2020202020202020202020202F2F2052756E20616E792072656E646572657220657874656E73696F6E730A20202020202020202020202069662028746869732E6F7074696F6E732E';
wwv_flow_api.g_varchar2_table(645) := '657874656E73696F6E7320262620746869732E6F7074696F6E732E657874656E73696F6E732E72656E64657265727320262620746869732E6F7074696F6E732E657874656E73696F6E732E72656E6465726572735B746F6B656E2E747970655D29207B0A';
wwv_flow_api.g_varchar2_table(646) := '20202020202020202020202020202020636F6E73742067656E65726963546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020636F6E737420726574203D20746869732E6F7074696F6E732E657874656E73696F6E732E72656E64';
wwv_flow_api.g_varchar2_table(647) := '65726572735B67656E65726963546F6B656E2E747970655D2E63616C6C287B207061727365723A2074686973207D2C2067656E65726963546F6B656E293B0A202020202020202020202020202020206966202872657420213D3D2066616C7365207C7C20';
wwv_flow_api.g_varchar2_table(648) := '215B277370616365272C20276872272C202768656164696E67272C2027636F6465272C20277461626C65272C2027626C6F636B71756F7465272C20276C697374272C202768746D6C272C2027706172616772617068272C202774657874275D2E696E636C';
wwv_flow_api.g_varchar2_table(649) := '756465732867656E65726963546F6B656E2E747970652929207B0A20202020202020202020202020202020202020206F7574202B3D20726574207C7C2027273B0A2020202020202020202020202020202020202020636F6E74696E75653B0A2020202020';
wwv_flow_api.g_varchar2_table(650) := '20202020202020202020207D0A2020202020202020202020207D0A2020202020202020202020207377697463682028746F6B656E2E7479706529207B0A202020202020202020202020202020206361736520277370616365273A207B0A20202020202020';
wwv_flow_api.g_varchar2_table(651) := '20202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A202020202020202020202020202020206361736520276872273A207B0A20202020202020202020202020202020202020206F7574202B3D20746869';
wwv_flow_api.g_varchar2_table(652) := '732E72656E64657265722E687228293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A2020202020202020202020202020202063617365202768656164696E67273A207B0A20';
wwv_flow_api.g_varchar2_table(653) := '20202020202020202020202020202020202020636F6E73742068656164696E67546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D20746869732E72656E64657265722E68656164696E672874686973';
wwv_flow_api.g_varchar2_table(654) := '2E7061727365496E6C696E652868656164696E67546F6B656E2E746F6B656E73292C2068656164696E67546F6B656E2E64657074682C20756E65736361706528746869732E7061727365496E6C696E652868656164696E67546F6B656E2E746F6B656E73';
wwv_flow_api.g_varchar2_table(655) := '2C20746869732E7465787452656E64657265722929293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A20202020202020202020202020202020636173652027636F6465273A';
wwv_flow_api.g_varchar2_table(656) := '207B0A2020202020202020202020202020202020202020636F6E737420636F6465546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D20746869732E72656E64657265722E636F646528636F6465546F';
wwv_flow_api.g_varchar2_table(657) := '6B656E2E746578742C20636F6465546F6B656E2E6C616E672C202121636F6465546F6B656E2E65736361706564293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A20202020';
wwv_flow_api.g_varchar2_table(658) := '2020202020202020202020206361736520277461626C65273A207B0A2020202020202020202020202020202020202020636F6E7374207461626C65546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206C6574206865';
wwv_flow_api.g_varchar2_table(659) := '61646572203D2027273B0A20202020202020202020202020202020202020202F2F206865616465720A20202020202020202020202020202020202020206C65742063656C6C203D2027273B0A2020202020202020202020202020202020202020666F7220';
wwv_flow_api.g_varchar2_table(660) := '286C6574206A203D20303B206A203C207461626C65546F6B656E2E6865616465722E6C656E6774683B206A2B2B29207B0A20202020202020202020202020202020202020202020202063656C6C202B3D20746869732E72656E64657265722E7461626C65';
wwv_flow_api.g_varchar2_table(661) := '63656C6C28746869732E7061727365496E6C696E65287461626C65546F6B656E2E6865616465725B6A5D2E746F6B656E73292C207B206865616465723A20747275652C20616C69676E3A207461626C65546F6B656E2E616C69676E5B6A5D207D293B0A20';
wwv_flow_api.g_varchar2_table(662) := '202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020686561646572202B3D20746869732E72656E64657265722E7461626C65726F772863656C6C293B0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(663) := '206C657420626F6479203D2027273B0A2020202020202020202020202020202020202020666F7220286C6574206A203D20303B206A203C207461626C65546F6B656E2E726F77732E6C656E6774683B206A2B2B29207B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(664) := '2020202020202020202020636F6E737420726F77203D207461626C65546F6B656E2E726F77735B6A5D3B0A20202020202020202020202020202020202020202020202063656C6C203D2027273B0A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(665) := '2020666F7220286C6574206B203D20303B206B203C20726F772E6C656E6774683B206B2B2B29207B0A2020202020202020202020202020202020202020202020202020202063656C6C202B3D20746869732E72656E64657265722E7461626C6563656C6C';
wwv_flow_api.g_varchar2_table(666) := '28746869732E7061727365496E6C696E6528726F775B6B5D2E746F6B656E73292C207B206865616465723A2066616C73652C20616C69676E3A207461626C65546F6B656E2E616C69676E5B6B5D207D293B0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(667) := '2020202020207D0A202020202020202020202020202020202020202020202020626F6479202B3D20746869732E72656E64657265722E7461626C65726F772863656C6C293B0A20202020202020202020202020202020202020207D0A2020202020202020';
wwv_flow_api.g_varchar2_table(668) := '2020202020202020202020206F7574202B3D20746869732E72656E64657265722E7461626C65286865616465722C20626F6479293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(669) := '7D0A20202020202020202020202020202020636173652027626C6F636B71756F7465273A207B0A2020202020202020202020202020202020202020636F6E737420626C6F636B71756F7465546F6B656E203D20746F6B656E3B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(670) := '20202020202020202020636F6E737420626F6479203D20746869732E706172736528626C6F636B71756F7465546F6B656E2E746F6B656E73293B0A20202020202020202020202020202020202020206F7574202B3D20746869732E72656E64657265722E';
wwv_flow_api.g_varchar2_table(671) := '626C6F636B71756F746528626F6479293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A202020202020202020202020202020206361736520276C697374273A207B0A202020';
wwv_flow_api.g_varchar2_table(672) := '2020202020202020202020202020202020636F6E7374206C697374546F6B656E203D20746F6B656E3B0A2020202020202020202020202020202020202020636F6E7374206F726465726564203D206C697374546F6B656E2E6F7264657265643B0A202020';
wwv_flow_api.g_varchar2_table(673) := '2020202020202020202020202020202020636F6E7374207374617274203D206C697374546F6B656E2E73746172743B0A2020202020202020202020202020202020202020636F6E7374206C6F6F7365203D206C697374546F6B656E2E6C6F6F73653B0A20';
wwv_flow_api.g_varchar2_table(674) := '202020202020202020202020202020202020206C657420626F6479203D2027273B0A2020202020202020202020202020202020202020666F7220286C6574206A203D20303B206A203C206C697374546F6B656E2E6974656D732E6C656E6774683B206A2B';
wwv_flow_api.g_varchar2_table(675) := '2B29207B0A202020202020202020202020202020202020202020202020636F6E7374206974656D203D206C697374546F6B656E2E6974656D735B6A5D3B0A202020202020202020202020202020202020202020202020636F6E737420636865636B656420';
wwv_flow_api.g_varchar2_table(676) := '3D206974656D2E636865636B65643B0A202020202020202020202020202020202020202020202020636F6E7374207461736B203D206974656D2E7461736B3B0A2020202020202020202020202020202020202020202020206C6574206974656D426F6479';
wwv_flow_api.g_varchar2_table(677) := '203D2027273B0A202020202020202020202020202020202020202020202020696620286974656D2E7461736B29207B0A20202020202020202020202020202020202020202020202020202020636F6E737420636865636B626F78203D20746869732E7265';
wwv_flow_api.g_varchar2_table(678) := '6E64657265722E636865636B626F78282121636865636B6564293B0A20202020202020202020202020202020202020202020202020202020696620286C6F6F736529207B0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(679) := '20696620286974656D2E746F6B656E732E6C656E677468203E2030202626206974656D2E746F6B656E735B305D2E74797065203D3D3D20277061726167726170682729207B0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(680) := '2020202020206974656D2E746F6B656E735B305D2E74657874203D20636865636B626F78202B20272027202B206974656D2E746F6B656E735B305D2E746578743B0A20202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(681) := '2020696620286974656D2E746F6B656E735B305D2E746F6B656E73202626206974656D2E746F6B656E735B305D2E746F6B656E732E6C656E677468203E2030202626206974656D2E746F6B656E735B305D2E746F6B656E735B305D2E74797065203D3D3D';
wwv_flow_api.g_varchar2_table(682) := '2027746578742729207B0A202020202020202020202020202020202020202020202020202020202020202020202020202020206974656D2E746F6B656E735B305D2E746F6B656E735B305D2E74657874203D20636865636B626F78202B20272027202B20';
wwv_flow_api.g_varchar2_table(683) := '6974656D2E746F6B656E735B305D2E746F6B656E735B305D2E746578743B0A2020202020202020202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(684) := '207D0A2020202020202020202020202020202020202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020202020202020202020202020202020202020206974656D2E746F6B656E732E756E7368696674287B0A';
wwv_flow_api.g_varchar2_table(685) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020747970653A202774657874272C0A20202020202020202020202020202020202020202020202020202020202020202020202020202020746578743A20';
wwv_flow_api.g_varchar2_table(686) := '636865636B626F78202B202720270A2020202020202020202020202020202020202020202020202020202020202020202020207D293B0A20202020202020202020202020202020202020202020202020202020202020207D0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(687) := '20202020202020202020202020202020207D0A20202020202020202020202020202020202020202020202020202020656C7365207B0A20202020202020202020202020202020202020202020202020202020202020206974656D426F6479202B3D206368';
wwv_flow_api.g_varchar2_table(688) := '65636B626F78202B202720273B0A202020202020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020206974656D426F';
wwv_flow_api.g_varchar2_table(689) := '6479202B3D20746869732E7061727365286974656D2E746F6B656E732C206C6F6F7365293B0A202020202020202020202020202020202020202020202020626F6479202B3D20746869732E72656E64657265722E6C6973746974656D286974656D426F64';
wwv_flow_api.g_varchar2_table(690) := '792C207461736B2C202121636865636B6564293B0A20202020202020202020202020202020202020207D0A20202020202020202020202020202020202020206F7574202B3D20746869732E72656E64657265722E6C69737428626F64792C206F72646572';
wwv_flow_api.g_varchar2_table(691) := '65642C207374617274293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A2020202020202020202020202020202063617365202768746D6C273A207B0A202020202020202020';
wwv_flow_api.g_varchar2_table(692) := '2020202020202020202020636F6E73742068746D6C546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D20746869732E72656E64657265722E68746D6C2868746D6C546F6B656E2E746578742C206874';
wwv_flow_api.g_varchar2_table(693) := '6D6C546F6B656E2E626C6F636B293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A20202020202020202020202020202020636173652027706172616772617068273A207B0A';
wwv_flow_api.g_varchar2_table(694) := '2020202020202020202020202020202020202020636F6E737420706172616772617068546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D20746869732E72656E64657265722E706172616772617068';
wwv_flow_api.g_varchar2_table(695) := '28746869732E7061727365496E6C696E6528706172616772617068546F6B656E2E746F6B656E7329293B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A202020202020202020';
wwv_flow_api.g_varchar2_table(696) := '2020202020202063617365202774657874273A207B0A20202020202020202020202020202020202020206C65742074657874546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206C657420626F6479203D2074657874';
wwv_flow_api.g_varchar2_table(697) := '546F6B656E2E746F6B656E73203F20746869732E7061727365496E6C696E652874657874546F6B656E2E746F6B656E7329203A2074657874546F6B656E2E746578743B0A20202020202020202020202020202020202020207768696C65202869202B2031';
wwv_flow_api.g_varchar2_table(698) := '203C20746F6B656E732E6C656E67746820262620746F6B656E735B69202B20315D2E74797065203D3D3D2027746578742729207B0A20202020202020202020202020202020202020202020202074657874546F6B656E203D20746F6B656E735B2B2B695D';
wwv_flow_api.g_varchar2_table(699) := '3B0A202020202020202020202020202020202020202020202020626F6479202B3D20275C6E27202B202874657874546F6B656E2E746F6B656E73203F20746869732E7061727365496E6C696E652874657874546F6B656E2E746F6B656E7329203A207465';
wwv_flow_api.g_varchar2_table(700) := '7874546F6B656E2E74657874293B0A20202020202020202020202020202020202020207D0A20202020202020202020202020202020202020206F7574202B3D20746F70203F20746869732E72656E64657265722E70617261677261706828626F64792920';
wwv_flow_api.g_varchar2_table(701) := '3A20626F64793B0A2020202020202020202020202020202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A2020202020202020202020202020202064656661756C743A207B0A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(702) := '202020636F6E7374206572724D7367203D2027546F6B656E2077697468202227202B20746F6B656E2E74797065202B202722207479706520776173206E6F7420666F756E642E273B0A202020202020202020202020202020202020202069662028746869';
wwv_flow_api.g_varchar2_table(703) := '732E6F7074696F6E732E73696C656E7429207B0A202020202020202020202020202020202020202020202020636F6E736F6C652E6572726F72286572724D7367293B0A20202020202020202020202020202020202020202020202072657475726E202727';
wwv_flow_api.g_varchar2_table(704) := '3B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020202020202020207468726F77206E6577204572726F72286572724D7367293B0A';
wwv_flow_api.g_varchar2_table(705) := '20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020207D0A202020202020202072657475726E206F75743B0A202020207D0A202020202F2A2A0A2020';
wwv_flow_api.g_varchar2_table(706) := '2020202A20506172736520496E6C696E6520546F6B656E730A20202020202A2F0A202020207061727365496E6C696E6528746F6B656E732C2072656E646572657229207B0A202020202020202072656E6465726572203D2072656E6465726572207C7C20';
wwv_flow_api.g_varchar2_table(707) := '746869732E72656E64657265723B0A20202020202020206C6574206F7574203D2027273B0A2020202020202020666F7220286C65742069203D20303B2069203C20746F6B656E732E6C656E6774683B20692B2B29207B0A20202020202020202020202063';
wwv_flow_api.g_varchar2_table(708) := '6F6E737420746F6B656E203D20746F6B656E735B695D3B0A2020202020202020202020202F2F2052756E20616E792072656E646572657220657874656E73696F6E730A20202020202020202020202069662028746869732E6F7074696F6E732E65787465';
wwv_flow_api.g_varchar2_table(709) := '6E73696F6E7320262620746869732E6F7074696F6E732E657874656E73696F6E732E72656E64657265727320262620746869732E6F7074696F6E732E657874656E73696F6E732E72656E6465726572735B746F6B656E2E747970655D29207B0A20202020';
wwv_flow_api.g_varchar2_table(710) := '202020202020202020202020636F6E737420726574203D20746869732E6F7074696F6E732E657874656E73696F6E732E72656E6465726572735B746F6B656E2E747970655D2E63616C6C287B207061727365723A2074686973207D2C20746F6B656E293B';
wwv_flow_api.g_varchar2_table(711) := '0A202020202020202020202020202020206966202872657420213D3D2066616C7365207C7C20215B27657363617065272C202768746D6C272C20276C696E6B272C2027696D616765272C20277374726F6E67272C2027656D272C2027636F64657370616E';
wwv_flow_api.g_varchar2_table(712) := '272C20276272272C202764656C272C202774657874275D2E696E636C7564657328746F6B656E2E747970652929207B0A20202020202020202020202020202020202020206F7574202B3D20726574207C7C2027273B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(713) := '202020202020636F6E74696E75653B0A202020202020202020202020202020207D0A2020202020202020202020207D0A2020202020202020202020207377697463682028746F6B656E2E7479706529207B0A202020202020202020202020202020206361';
wwv_flow_api.g_varchar2_table(714) := '73652027657363617065273A207B0A2020202020202020202020202020202020202020636F6E737420657363617065546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E7465';
wwv_flow_api.g_varchar2_table(715) := '787428657363617065546F6B656E2E74657874293B0A2020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A2020202020202020202020202020202063617365202768746D6C273A207B0A2020';
wwv_flow_api.g_varchar2_table(716) := '202020202020202020202020202020202020636F6E737420746167546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E68746D6C28746167546F6B656E2E74657874293B0A20';
wwv_flow_api.g_varchar2_table(717) := '20202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A202020202020202020202020202020206361736520276C696E6B273A207B0A2020202020202020202020202020202020202020636F6E7374';
wwv_flow_api.g_varchar2_table(718) := '206C696E6B546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E6C696E6B286C696E6B546F6B656E2E687265662C206C696E6B546F6B656E2E7469746C652C20746869732E70';
wwv_flow_api.g_varchar2_table(719) := '61727365496E6C696E65286C696E6B546F6B656E2E746F6B656E732C2072656E646572657229293B0A2020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(720) := '2020636173652027696D616765273A207B0A2020202020202020202020202020202020202020636F6E737420696D616765546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E';
wwv_flow_api.g_varchar2_table(721) := '696D61676528696D616765546F6B656E2E687265662C20696D616765546F6B656E2E7469746C652C20696D616765546F6B656E2E74657874293B0A2020202020202020202020202020202020202020627265616B3B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(722) := '20207D0A202020202020202020202020202020206361736520277374726F6E67273A207B0A2020202020202020202020202020202020202020636F6E7374207374726F6E67546F6B656E203D20746F6B656E3B0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(723) := '202020206F7574202B3D2072656E64657265722E7374726F6E6728746869732E7061727365496E6C696E65287374726F6E67546F6B656E2E746F6B656E732C2072656E646572657229293B0A202020202020202020202020202020202020202062726561';
wwv_flow_api.g_varchar2_table(724) := '6B3B0A202020202020202020202020202020207D0A20202020202020202020202020202020636173652027656D273A207B0A2020202020202020202020202020202020202020636F6E737420656D546F6B656E203D20746F6B656E3B0A20202020202020';
wwv_flow_api.g_varchar2_table(725) := '202020202020202020202020206F7574202B3D2072656E64657265722E656D28746869732E7061727365496E6C696E6528656D546F6B656E2E746F6B656E732C2072656E646572657229293B0A2020202020202020202020202020202020202020627265';
wwv_flow_api.g_varchar2_table(726) := '616B3B0A202020202020202020202020202020207D0A20202020202020202020202020202020636173652027636F64657370616E273A207B0A2020202020202020202020202020202020202020636F6E737420636F64657370616E546F6B656E203D2074';
wwv_flow_api.g_varchar2_table(727) := '6F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E636F64657370616E28636F64657370616E546F6B656E2E74657874293B0A2020202020202020202020202020202020202020627265616B3B0A20';
wwv_flow_api.g_varchar2_table(728) := '2020202020202020202020202020207D0A202020202020202020202020202020206361736520276272273A207B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E627228293B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(729) := '2020202020202020627265616B3B0A202020202020202020202020202020207D0A2020202020202020202020202020202063617365202764656C273A207B0A2020202020202020202020202020202020202020636F6E73742064656C546F6B656E203D20';
wwv_flow_api.g_varchar2_table(730) := '746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E64656C28746869732E7061727365496E6C696E652864656C546F6B656E2E746F6B656E732C2072656E646572657229293B0A20202020202020';
wwv_flow_api.g_varchar2_table(731) := '20202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A2020202020202020202020202020202063617365202774657874273A207B0A2020202020202020202020202020202020202020636F6E7374207465787454';
wwv_flow_api.g_varchar2_table(732) := '6F6B656E203D20746F6B656E3B0A20202020202020202020202020202020202020206F7574202B3D2072656E64657265722E746578742874657874546F6B656E2E74657874293B0A2020202020202020202020202020202020202020627265616B3B0A20';
wwv_flow_api.g_varchar2_table(733) := '2020202020202020202020202020207D0A2020202020202020202020202020202064656661756C743A207B0A2020202020202020202020202020202020202020636F6E7374206572724D7367203D2027546F6B656E2077697468202227202B20746F6B65';
wwv_flow_api.g_varchar2_table(734) := '6E2E74797065202B202722207479706520776173206E6F7420666F756E642E273B0A202020202020202020202020202020202020202069662028746869732E6F7074696F6E732E73696C656E7429207B0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(735) := '2020202020636F6E736F6C652E6572726F72286572724D7367293B0A20202020202020202020202020202020202020202020202072657475726E2027273B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(736) := '2020202020656C7365207B0A2020202020202020202020202020202020202020202020207468726F77206E6577204572726F72286572724D7367293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D';
wwv_flow_api.g_varchar2_table(737) := '0A2020202020202020202020207D0A20202020202020207D0A202020202020202072657475726E206F75743B0A202020207D0A7D0A0A636C617373205F486F6F6B73207B0A202020206F7074696F6E733B0A20202020636F6E7374727563746F72286F70';
wwv_flow_api.g_varchar2_table(738) := '74696F6E7329207B0A2020202020202020746869732E6F7074696F6E73203D206F7074696F6E73207C7C205F64656661756C74733B0A202020207D0A2020202073746174696320706173735468726F756768486F6F6B73203D206E657720536574285B0A';
wwv_flow_api.g_varchar2_table(739) := '20202020202020202770726570726F63657373272C0A202020202020202027706F737470726F63657373272C0A20202020202020202770726F63657373416C6C546F6B656E73270A202020205D293B0A202020202F2A2A0A20202020202A2050726F6365';
wwv_flow_api.g_varchar2_table(740) := '7373206D61726B646F776E206265666F7265206D61726B65640A20202020202A2F0A2020202070726570726F63657373286D61726B646F776E29207B0A202020202020202072657475726E206D61726B646F776E3B0A202020207D0A202020202F2A2A0A';
wwv_flow_api.g_varchar2_table(741) := '20202020202A2050726F636573732048544D4C206166746572206D61726B65642069732066696E69736865640A20202020202A2F0A20202020706F737470726F636573732868746D6C29207B0A202020202020202072657475726E2068746D6C3B0A2020';
wwv_flow_api.g_varchar2_table(742) := '20207D0A202020202F2A2A0A20202020202A2050726F6365737320616C6C20746F6B656E73206265666F72652077616C6B20746F6B656E730A20202020202A2F0A2020202070726F63657373416C6C546F6B656E7328746F6B656E7329207B0A20202020';
wwv_flow_api.g_varchar2_table(743) := '2020202072657475726E20746F6B656E733B0A202020207D0A7D0A0A636C617373204D61726B6564207B0A2020202064656661756C7473203D205F67657444656661756C747328293B0A202020206F7074696F6E73203D20746869732E7365744F707469';
wwv_flow_api.g_varchar2_table(744) := '6F6E733B0A202020207061727365203D20746869732E2370617273654D61726B646F776E285F4C657865722E6C65782C205F5061727365722E7061727365293B0A202020207061727365496E6C696E65203D20746869732E2370617273654D61726B646F';
wwv_flow_api.g_varchar2_table(745) := '776E285F4C657865722E6C6578496E6C696E652C205F5061727365722E7061727365496E6C696E65293B0A20202020506172736572203D205F5061727365723B0A2020202052656E6465726572203D205F52656E64657265723B0A202020205465787452';
wwv_flow_api.g_varchar2_table(746) := '656E6465726572203D205F5465787452656E64657265723B0A202020204C65786572203D205F4C657865723B0A20202020546F6B656E697A6572203D205F546F6B656E697A65723B0A20202020486F6F6B73203D205F486F6F6B733B0A20202020636F6E';
wwv_flow_api.g_varchar2_table(747) := '7374727563746F72282E2E2E6172677329207B0A2020202020202020746869732E757365282E2E2E61726773293B0A202020207D0A202020202F2A2A0A20202020202A2052756E2063616C6C6261636B20666F7220657665727920746F6B656E0A202020';
wwv_flow_api.g_varchar2_table(748) := '20202A2F0A2020202077616C6B546F6B656E7328746F6B656E732C2063616C6C6261636B29207B0A20202020202020206C65742076616C756573203D205B5D3B0A2020202020202020666F722028636F6E737420746F6B656E206F6620746F6B656E7329';
wwv_flow_api.g_varchar2_table(749) := '207B0A20202020202020202020202076616C756573203D2076616C7565732E636F6E6361742863616C6C6261636B2E63616C6C28746869732C20746F6B656E29293B0A2020202020202020202020207377697463682028746F6B656E2E7479706529207B';
wwv_flow_api.g_varchar2_table(750) := '0A202020202020202020202020202020206361736520277461626C65273A207B0A2020202020202020202020202020202020202020636F6E7374207461626C65546F6B656E203D20746F6B656E3B0A202020202020202020202020202020202020202066';
wwv_flow_api.g_varchar2_table(751) := '6F722028636F6E73742063656C6C206F66207461626C65546F6B656E2E68656164657229207B0A20202020202020202020202020202020202020202020202076616C756573203D2076616C7565732E636F6E63617428746869732E77616C6B546F6B656E';
wwv_flow_api.g_varchar2_table(752) := '732863656C6C2E746F6B656E732C2063616C6C6261636B29293B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020666F722028636F6E737420726F77206F66207461626C65546F6B656E2E726F';
wwv_flow_api.g_varchar2_table(753) := '777329207B0A202020202020202020202020202020202020202020202020666F722028636F6E73742063656C6C206F6620726F7729207B0A2020202020202020202020202020202020202020202020202020202076616C756573203D2076616C7565732E';
wwv_flow_api.g_varchar2_table(754) := '636F6E63617428746869732E77616C6B546F6B656E732863656C6C2E746F6B656E732C2063616C6C6261636B29293B0A2020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020207D0A20202020';
wwv_flow_api.g_varchar2_table(755) := '20202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A202020202020202020202020202020206361736520276C697374273A207B0A2020202020202020202020202020202020202020636F6E7374206C69';
wwv_flow_api.g_varchar2_table(756) := '7374546F6B656E203D20746F6B656E3B0A202020202020202020202020202020202020202076616C756573203D2076616C7565732E636F6E63617428746869732E77616C6B546F6B656E73286C697374546F6B656E2E6974656D732C2063616C6C626163';
wwv_flow_api.g_varchar2_table(757) := '6B29293B0A2020202020202020202020202020202020202020627265616B3B0A202020202020202020202020202020207D0A2020202020202020202020202020202064656661756C743A207B0A2020202020202020202020202020202020202020636F6E';
wwv_flow_api.g_varchar2_table(758) := '73742067656E65726963546F6B656E203D20746F6B656E3B0A202020202020202020202020202020202020202069662028746869732E64656661756C74732E657874656E73696F6E733F2E6368696C64546F6B656E733F2E5B67656E65726963546F6B65';
wwv_flow_api.g_varchar2_table(759) := '6E2E747970655D29207B0A202020202020202020202020202020202020202020202020746869732E64656661756C74732E657874656E73696F6E732E6368696C64546F6B656E735B67656E65726963546F6B656E2E747970655D2E666F72456163682828';
wwv_flow_api.g_varchar2_table(760) := '6368696C64546F6B656E7329203D3E207B0A20202020202020202020202020202020202020202020202020202020636F6E737420746F6B656E73203D2067656E65726963546F6B656E5B6368696C64546F6B656E735D2E666C617428496E66696E697479';
wwv_flow_api.g_varchar2_table(761) := '293B0A2020202020202020202020202020202020202020202020202020202076616C756573203D2076616C7565732E636F6E63617428746869732E77616C6B546F6B656E7328746F6B656E732C2063616C6C6261636B29293B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(762) := '20202020202020202020202020207D293B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020656C7365206966202867656E65726963546F6B656E2E746F6B656E7329207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(763) := '2020202020202020202020202020202076616C756573203D2076616C7565732E636F6E63617428746869732E77616C6B546F6B656E732867656E65726963546F6B656E2E746F6B656E732C2063616C6C6261636B29293B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(764) := '20202020202020207D0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020207D0A202020202020202072657475726E2076616C7565733B0A202020207D0A20202020757365282E2E2E6172677329207B0A';
wwv_flow_api.g_varchar2_table(765) := '2020202020202020636F6E737420657874656E73696F6E73203D20746869732E64656661756C74732E657874656E73696F6E73207C7C207B2072656E6465726572733A207B7D2C206368696C64546F6B656E733A207B7D207D3B0A202020202020202061';
wwv_flow_api.g_varchar2_table(766) := '7267732E666F724561636828287061636B29203D3E207B0A2020202020202020202020202F2F20636F7079206F7074696F6E7320746F206E6577206F626A6563740A202020202020202020202020636F6E7374206F707473203D207B202E2E2E7061636B';
wwv_flow_api.g_varchar2_table(767) := '207D3B0A2020202020202020202020202F2F20736574206173796E6320746F2074727565206966206974207761732073657420746F2074727565206265666F72650A2020202020202020202020206F7074732E6173796E63203D20746869732E64656661';
wwv_flow_api.g_varchar2_table(768) := '756C74732E6173796E63207C7C206F7074732E6173796E63207C7C2066616C73653B0A2020202020202020202020202F2F203D3D2D2D20506172736520226164646F6E2220657874656E73696F6E73202D2D3D3D202F2F0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(769) := '696620287061636B2E657874656E73696F6E7329207B0A202020202020202020202020202020207061636B2E657874656E73696F6E732E666F7245616368282865787429203D3E207B0A2020202020202020202020202020202020202020696620282165';
wwv_flow_api.g_varchar2_table(770) := '78742E6E616D6529207B0A2020202020202020202020202020202020202020202020207468726F77206E6577204572726F722827657874656E73696F6E206E616D6520726571756972656427293B0A20202020202020202020202020202020202020207D';
wwv_flow_api.g_varchar2_table(771) := '0A2020202020202020202020202020202020202020696620282772656E64657265722720696E2065787429207B202F2F2052656E646572657220657874656E73696F6E730A202020202020202020202020202020202020202020202020636F6E73742070';
wwv_flow_api.g_varchar2_table(772) := '72657652656E6465726572203D20657874656E73696F6E732E72656E6465726572735B6578742E6E616D655D3B0A202020202020202020202020202020202020202020202020696620287072657652656E646572657229207B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(773) := '2020202020202020202020202020202020202F2F205265706C61636520657874656E73696F6E20776974682066756E6320746F2072756E206E657720657874656E73696F6E206275742066616C6C206261636B2069662066616C73650A20202020202020';
wwv_flow_api.g_varchar2_table(774) := '202020202020202020202020202020202020202020657874656E73696F6E732E72656E6465726572735B6578742E6E616D655D203D2066756E6374696F6E20282E2E2E6172677329207B0A20202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(775) := '202020202020206C657420726574203D206578742E72656E64657265722E6170706C7928746869732C2061726773293B0A202020202020202020202020202020202020202020202020202020202020202069662028726574203D3D3D2066616C73652920';
wwv_flow_api.g_varchar2_table(776) := '7B0A202020202020202020202020202020202020202020202020202020202020202020202020726574203D207072657652656E64657265722E6170706C7928746869732C2061726773293B0A202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(777) := '20202020202020207D0A202020202020202020202020202020202020202020202020202020202020202072657475726E207265743B0A202020202020202020202020202020202020202020202020202020207D3B0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(778) := '2020202020202020207D0A202020202020202020202020202020202020202020202020656C7365207B0A20202020202020202020202020202020202020202020202020202020657874656E73696F6E732E72656E6465726572735B6578742E6E616D655D';
wwv_flow_api.g_varchar2_table(779) := '203D206578742E72656E64657265723B0A2020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020207D0A20202020202020202020202020202020202020206966202827746F6B656E697A657227';
wwv_flow_api.g_varchar2_table(780) := '20696E2065787429207B202F2F20546F6B656E697A657220457874656E73696F6E730A20202020202020202020202020202020202020202020202069662028216578742E6C6576656C207C7C20286578742E6C6576656C20213D3D2027626C6F636B2720';
wwv_flow_api.g_varchar2_table(781) := '2626206578742E6C6576656C20213D3D2027696E6C696E65272929207B0A202020202020202020202020202020202020202020202020202020207468726F77206E6577204572726F722822657874656E73696F6E206C6576656C206D7573742062652027';
wwv_flow_api.g_varchar2_table(782) := '626C6F636B27206F722027696E6C696E652722293B0A2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020636F6E7374206578744C6576656C203D20657874656E73696F6E735B';
wwv_flow_api.g_varchar2_table(783) := '6578742E6C6576656C5D3B0A202020202020202020202020202020202020202020202020696620286578744C6576656C29207B0A202020202020202020202020202020202020202020202020202020206578744C6576656C2E756E736869667428657874';
wwv_flow_api.g_varchar2_table(784) := '2E746F6B656E697A6572293B0A2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020656C7365207B0A202020202020202020202020202020202020202020202020202020206578';
wwv_flow_api.g_varchar2_table(785) := '74656E73696F6E735B6578742E6C6576656C5D203D205B6578742E746F6B656E697A65725D3B0A2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020696620286578742E737461';
wwv_flow_api.g_varchar2_table(786) := '727429207B202F2F2046756E6374696F6E20746F20636865636B20666F72207374617274206F6620746F6B656E0A20202020202020202020202020202020202020202020202020202020696620286578742E6C6576656C203D3D3D2027626C6F636B2729';
wwv_flow_api.g_varchar2_table(787) := '207B0A202020202020202020202020202020202020202020202020202020202020202069662028657874656E73696F6E732E7374617274426C6F636B29207B0A202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(788) := '657874656E73696F6E732E7374617274426C6F636B2E70757368286578742E7374617274293B0A20202020202020202020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(789) := '2020202020656C7365207B0A202020202020202020202020202020202020202020202020202020202020202020202020657874656E73696F6E732E7374617274426C6F636B203D205B6578742E73746172745D3B0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(790) := '20202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020202020202020202020656C736520696620286578742E6C6576656C203D3D3D20';
wwv_flow_api.g_varchar2_table(791) := '27696E6C696E652729207B0A202020202020202020202020202020202020202020202020202020202020202069662028657874656E73696F6E732E7374617274496E6C696E6529207B0A2020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(792) := '20202020202020202020657874656E73696F6E732E7374617274496E6C696E652E70757368286578742E7374617274293B0A20202020202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(793) := '20202020202020202020202020202020656C7365207B0A202020202020202020202020202020202020202020202020202020202020202020202020657874656E73696F6E732E7374617274496E6C696E65203D205B6578742E73746172745D3B0A202020';
wwv_flow_api.g_varchar2_table(794) := '20202020202020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020202020207D0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(795) := '202020202020207D0A202020202020202020202020202020202020202069662028276368696C64546F6B656E732720696E20657874202626206578742E6368696C64546F6B656E7329207B202F2F204368696C6420746F6B656E7320746F206265207669';
wwv_flow_api.g_varchar2_table(796) := '73697465642062792077616C6B546F6B656E730A202020202020202020202020202020202020202020202020657874656E73696F6E732E6368696C64546F6B656E735B6578742E6E616D655D203D206578742E6368696C64546F6B656E733B0A20202020';
wwv_flow_api.g_varchar2_table(797) := '202020202020202020202020202020207D0A202020202020202020202020202020207D293B0A202020202020202020202020202020206F7074732E657874656E73696F6E73203D20657874656E73696F6E733B0A2020202020202020202020207D0A2020';
wwv_flow_api.g_varchar2_table(798) := '202020202020202020202F2F203D3D2D2D20506172736520226F76657277726974652220657874656E73696F6E73202D2D3D3D202F2F0A202020202020202020202020696620287061636B2E72656E646572657229207B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(799) := '20202020636F6E73742072656E6465726572203D20746869732E64656661756C74732E72656E6465726572207C7C206E6577205F52656E646572657228746869732E64656661756C7473293B0A20202020202020202020202020202020666F722028636F';
wwv_flow_api.g_varchar2_table(800) := '6E73742070726F7020696E207061636B2E72656E646572657229207B0A202020202020202020202020202020202020202069662028212870726F7020696E2072656E64657265722929207B0A202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(801) := '7468726F77206E6577204572726F72286072656E64657265722027247B70726F707D2720646F6573206E6F7420657869737460293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020202020202069662028';
wwv_flow_api.g_varchar2_table(802) := '70726F70203D3D3D20276F7074696F6E732729207B0A2020202020202020202020202020202020202020202020202F2F2069676E6F7265206F7074696F6E732070726F70657274790A202020202020202020202020202020202020202020202020636F6E';
wwv_flow_api.g_varchar2_table(803) := '74696E75653B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020636F6E73742072656E646572657250726F70203D2070726F703B0A2020202020202020202020202020202020202020636F6E73';
wwv_flow_api.g_varchar2_table(804) := '742072656E646572657246756E63203D207061636B2E72656E64657265725B72656E646572657250726F705D3B0A2020202020202020202020202020202020202020636F6E7374207072657652656E6465726572203D2072656E64657265725B72656E64';
wwv_flow_api.g_varchar2_table(805) := '6572657250726F705D3B0A20202020202020202020202020202020202020202F2F205265706C6163652072656E646572657220776974682066756E6320746F2072756E20657874656E73696F6E2C206275742066616C6C206261636B2069662066616C73';
wwv_flow_api.g_varchar2_table(806) := '650A202020202020202020202020202020202020202072656E64657265725B72656E646572657250726F705D203D20282E2E2E6172677329203D3E207B0A2020202020202020202020202020202020202020202020206C657420726574203D2072656E64';
wwv_flow_api.g_varchar2_table(807) := '6572657246756E632E6170706C792872656E64657265722C2061726773293B0A20202020202020202020202020202020202020202020202069662028726574203D3D3D2066616C736529207B0A2020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(808) := '2020202020726574203D207072657652656E64657265722E6170706C792872656E64657265722C2061726773293B0A2020202020202020202020202020202020202020202020207D0A202020202020202020202020202020202020202020202020726574';
wwv_flow_api.g_varchar2_table(809) := '75726E20726574207C7C2027273B0A20202020202020202020202020202020202020207D3B0A202020202020202020202020202020207D0A202020202020202020202020202020206F7074732E72656E6465726572203D2072656E64657265723B0A2020';
wwv_flow_api.g_varchar2_table(810) := '202020202020202020207D0A202020202020202020202020696620287061636B2E746F6B656E697A657229207B0A20202020202020202020202020202020636F6E737420746F6B656E697A6572203D20746869732E64656661756C74732E746F6B656E69';
wwv_flow_api.g_varchar2_table(811) := '7A6572207C7C206E6577205F546F6B656E697A657228746869732E64656661756C7473293B0A20202020202020202020202020202020666F722028636F6E73742070726F7020696E207061636B2E746F6B656E697A657229207B0A202020202020202020';
wwv_flow_api.g_varchar2_table(812) := '202020202020202020202069662028212870726F7020696E20746F6B656E697A65722929207B0A2020202020202020202020202020202020202020202020207468726F77206E6577204572726F722860746F6B656E697A65722027247B70726F707D2720';
wwv_flow_api.g_varchar2_table(813) := '646F6573206E6F7420657869737460293B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020696620285B276F7074696F6E73272C202772756C6573272C20276C65786572275D2E696E636C7564';
wwv_flow_api.g_varchar2_table(814) := '65732870726F702929207B0A2020202020202020202020202020202020202020202020202F2F2069676E6F7265206F7074696F6E732C2072756C65732C20616E64206C657865722070726F706572746965730A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(815) := '20202020202020636F6E74696E75653B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020636F6E737420746F6B656E697A657250726F70203D2070726F703B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(816) := '20202020202020636F6E737420746F6B656E697A657246756E63203D207061636B2E746F6B656E697A65725B746F6B656E697A657250726F705D3B0A2020202020202020202020202020202020202020636F6E73742070726576546F6B656E697A657220';
wwv_flow_api.g_varchar2_table(817) := '3D20746F6B656E697A65725B746F6B656E697A657250726F705D3B0A20202020202020202020202020202020202020202F2F205265706C61636520746F6B656E697A657220776974682066756E6320746F2072756E20657874656E73696F6E2C20627574';
wwv_flow_api.g_varchar2_table(818) := '2066616C6C206261636B2069662066616C73650A20202020202020202020202020202020202020202F2F204074732D6578706563742D6572726F722063616E6E6F74207479706520746F6B656E697A65722066756E6374696F6E2064796E616D6963616C';
wwv_flow_api.g_varchar2_table(819) := '6C790A2020202020202020202020202020202020202020746F6B656E697A65725B746F6B656E697A657250726F705D203D20282E2E2E6172677329203D3E207B0A2020202020202020202020202020202020202020202020206C657420726574203D2074';
wwv_flow_api.g_varchar2_table(820) := '6F6B656E697A657246756E632E6170706C7928746F6B656E697A65722C2061726773293B0A20202020202020202020202020202020202020202020202069662028726574203D3D3D2066616C736529207B0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(821) := '20202020202020202020726574203D2070726576546F6B656E697A65722E6170706C7928746F6B656E697A65722C2061726773293B0A2020202020202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(822) := '2020202072657475726E207265743B0A20202020202020202020202020202020202020207D3B0A202020202020202020202020202020207D0A202020202020202020202020202020206F7074732E746F6B656E697A6572203D20746F6B656E697A65723B';
wwv_flow_api.g_varchar2_table(823) := '0A2020202020202020202020207D0A2020202020202020202020202F2F203D3D2D2D20506172736520486F6F6B7320657874656E73696F6E73202D2D3D3D202F2F0A202020202020202020202020696620287061636B2E686F6F6B7329207B0A20202020';
wwv_flow_api.g_varchar2_table(824) := '202020202020202020202020636F6E737420686F6F6B73203D20746869732E64656661756C74732E686F6F6B73207C7C206E6577205F486F6F6B7328293B0A20202020202020202020202020202020666F722028636F6E73742070726F7020696E207061';
wwv_flow_api.g_varchar2_table(825) := '636B2E686F6F6B7329207B0A202020202020202020202020202020202020202069662028212870726F7020696E20686F6F6B732929207B0A2020202020202020202020202020202020202020202020207468726F77206E6577204572726F722860686F6F';
wwv_flow_api.g_varchar2_table(826) := '6B2027247B70726F707D2720646F6573206E6F7420657869737460293B0A20202020202020202020202020202020202020207D0A20202020202020202020202020202020202020206966202870726F70203D3D3D20276F7074696F6E732729207B0A2020';
wwv_flow_api.g_varchar2_table(827) := '202020202020202020202020202020202020202020202F2F2069676E6F7265206F7074696F6E732070726F70657274790A202020202020202020202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(828) := '2020207D0A2020202020202020202020202020202020202020636F6E737420686F6F6B7350726F70203D2070726F703B0A2020202020202020202020202020202020202020636F6E737420686F6F6B7346756E63203D207061636B2E686F6F6B735B686F';
wwv_flow_api.g_varchar2_table(829) := '6F6B7350726F705D3B0A2020202020202020202020202020202020202020636F6E73742070726576486F6F6B203D20686F6F6B735B686F6F6B7350726F705D3B0A2020202020202020202020202020202020202020696620285F486F6F6B732E70617373';
wwv_flow_api.g_varchar2_table(830) := '5468726F756768486F6F6B732E6861732870726F702929207B0A2020202020202020202020202020202020202020202020202F2F204074732D6578706563742D6572726F722063616E6E6F74207479706520686F6F6B2066756E6374696F6E2064796E61';
wwv_flow_api.g_varchar2_table(831) := '6D6963616C6C790A202020202020202020202020202020202020202020202020686F6F6B735B686F6F6B7350726F705D203D202861726729203D3E207B0A2020202020202020202020202020202020202020202020202020202069662028746869732E64';
wwv_flow_api.g_varchar2_table(832) := '656661756C74732E6173796E6329207B0A202020202020202020202020202020202020202020202020202020202020202072657475726E2050726F6D6973652E7265736F6C766528686F6F6B7346756E632E63616C6C28686F6F6B732C2061726729292E';
wwv_flow_api.g_varchar2_table(833) := '7468656E28726574203D3E207B0A20202020202020202020202020202020202020202020202020202020202020202020202072657475726E2070726576486F6F6B2E63616C6C28686F6F6B732C20726574293B0A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(834) := '202020202020202020202020202020207D293B0A202020202020202020202020202020202020202020202020202020207D0A20202020202020202020202020202020202020202020202020202020636F6E737420726574203D20686F6F6B7346756E632E';
wwv_flow_api.g_varchar2_table(835) := '63616C6C28686F6F6B732C20617267293B0A2020202020202020202020202020202020202020202020202020202072657475726E2070726576486F6F6B2E63616C6C28686F6F6B732C20726574293B0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(836) := '202020207D3B0A20202020202020202020202020202020202020207D0A2020202020202020202020202020202020202020656C7365207B0A2020202020202020202020202020202020202020202020202F2F204074732D6578706563742D6572726F7220';
wwv_flow_api.g_varchar2_table(837) := '63616E6E6F74207479706520686F6F6B2066756E6374696F6E2064796E616D6963616C6C790A202020202020202020202020202020202020202020202020686F6F6B735B686F6F6B7350726F705D203D20282E2E2E6172677329203D3E207B0A20202020';
wwv_flow_api.g_varchar2_table(838) := '2020202020202020202020202020202020202020202020206C657420726574203D20686F6F6B7346756E632E6170706C7928686F6F6B732C2061726773293B0A202020202020202020202020202020202020202020202020202020206966202872657420';
wwv_flow_api.g_varchar2_table(839) := '3D3D3D2066616C736529207B0A2020202020202020202020202020202020202020202020202020202020202020726574203D2070726576486F6F6B2E6170706C7928686F6F6B732C2061726773293B0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(840) := '20202020202020207D0A2020202020202020202020202020202020202020202020202020202072657475726E207265743B0A2020202020202020202020202020202020202020202020207D3B0A20202020202020202020202020202020202020207D0A20';
wwv_flow_api.g_varchar2_table(841) := '2020202020202020202020202020207D0A202020202020202020202020202020206F7074732E686F6F6B73203D20686F6F6B733B0A2020202020202020202020207D0A2020202020202020202020202F2F203D3D2D2D2050617273652057616C6B546F6B';
wwv_flow_api.g_varchar2_table(842) := '656E7320657874656E73696F6E73202D2D3D3D202F2F0A202020202020202020202020696620287061636B2E77616C6B546F6B656E7329207B0A20202020202020202020202020202020636F6E73742077616C6B546F6B656E73203D20746869732E6465';
wwv_flow_api.g_varchar2_table(843) := '6661756C74732E77616C6B546F6B656E733B0A20202020202020202020202020202020636F6E7374207061636B57616C6B746F6B656E73203D207061636B2E77616C6B546F6B656E733B0A202020202020202020202020202020206F7074732E77616C6B';
wwv_flow_api.g_varchar2_table(844) := '546F6B656E73203D2066756E6374696F6E2028746F6B656E29207B0A20202020202020202020202020202020202020206C65742076616C756573203D205B5D3B0A202020202020202020202020202020202020202076616C7565732E7075736828706163';
wwv_flow_api.g_varchar2_table(845) := '6B57616C6B746F6B656E732E63616C6C28746869732C20746F6B656E29293B0A20202020202020202020202020202020202020206966202877616C6B546F6B656E7329207B0A20202020202020202020202020202020202020202020202076616C756573';
wwv_flow_api.g_varchar2_table(846) := '203D2076616C7565732E636F6E6361742877616C6B546F6B656E732E63616C6C28746869732C20746F6B656E29293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020202020202072657475726E2076616C';
wwv_flow_api.g_varchar2_table(847) := '7565733B0A202020202020202020202020202020207D3B0A2020202020202020202020207D0A202020202020202020202020746869732E64656661756C7473203D207B202E2E2E746869732E64656661756C74732C202E2E2E6F707473207D3B0A202020';
wwv_flow_api.g_varchar2_table(848) := '20202020207D293B0A202020202020202072657475726E20746869733B0A202020207D0A202020207365744F7074696F6E73286F707429207B0A2020202020202020746869732E64656661756C7473203D207B202E2E2E746869732E64656661756C7473';
wwv_flow_api.g_varchar2_table(849) := '2C202E2E2E6F7074207D3B0A202020202020202072657475726E20746869733B0A202020207D0A202020206C65786572287372632C206F7074696F6E7329207B0A202020202020202072657475726E205F4C657865722E6C6578287372632C206F707469';
wwv_flow_api.g_varchar2_table(850) := '6F6E73203F3F20746869732E64656661756C7473293B0A202020207D0A2020202070617273657228746F6B656E732C206F7074696F6E7329207B0A202020202020202072657475726E205F5061727365722E706172736528746F6B656E732C206F707469';
wwv_flow_api.g_varchar2_table(851) := '6F6E73203F3F20746869732E64656661756C7473293B0A202020207D0A202020202370617273654D61726B646F776E286C657865722C2070617273657229207B0A202020202020202072657475726E20287372632C206F7074696F6E7329203D3E207B0A';
wwv_flow_api.g_varchar2_table(852) := '202020202020202020202020636F6E7374206F7269674F7074203D207B202E2E2E6F7074696F6E73207D3B0A202020202020202020202020636F6E7374206F7074203D207B202E2E2E746869732E64656661756C74732C202E2E2E6F7269674F7074207D';
wwv_flow_api.g_varchar2_table(853) := '3B0A2020202020202020202020202F2F2053686F77207761726E696E6720696620616E20657874656E73696F6E20736574206173796E6320746F20747275652062757420746865207061727365207761732063616C6C65642077697468206173796E633A';
wwv_flow_api.g_varchar2_table(854) := '2066616C73650A20202020202020202020202069662028746869732E64656661756C74732E6173796E63203D3D3D2074727565202626206F7269674F70742E6173796E63203D3D3D2066616C736529207B0A202020202020202020202020202020206966';
wwv_flow_api.g_varchar2_table(855) := '2028216F70742E73696C656E7429207B0A2020202020202020202020202020202020202020636F6E736F6C652E7761726E28276D61726B656428293A20546865206173796E63206F7074696F6E207761732073657420746F207472756520627920616E20';
wwv_flow_api.g_varchar2_table(856) := '657874656E73696F6E2E20546865206173796E633A2066616C7365206F7074696F6E2073656E7420746F2070617273652077696C6C2062652069676E6F7265642E27293B0A202020202020202020202020202020207D0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(857) := '2020206F70742E6173796E63203D20747275653B0A2020202020202020202020207D0A202020202020202020202020636F6E7374207468726F774572726F72203D20746869732E236F6E4572726F722821216F70742E73696C656E742C2021216F70742E';
wwv_flow_api.g_varchar2_table(858) := '6173796E63293B0A2020202020202020202020202F2F207468726F77206572726F7220696E2063617365206F66206E6F6E20737472696E6720696E7075740A20202020202020202020202069662028747970656F6620737263203D3D3D2027756E646566';
wwv_flow_api.g_varchar2_table(859) := '696E656427207C7C20737263203D3D3D206E756C6C29207B0A2020202020202020202020202020202072657475726E207468726F774572726F72286E6577204572726F7228276D61726B656428293A20696E70757420706172616D657465722069732075';
wwv_flow_api.g_varchar2_table(860) := '6E646566696E6564206F72206E756C6C2729293B0A2020202020202020202020207D0A20202020202020202020202069662028747970656F662073726320213D3D2027737472696E672729207B0A2020202020202020202020202020202072657475726E';
wwv_flow_api.g_varchar2_table(861) := '207468726F774572726F72286E6577204572726F7228276D61726B656428293A20696E70757420706172616D65746572206973206F66207479706520270A20202020202020202020202020202020202020202B204F626A6563742E70726F746F74797065';
wwv_flow_api.g_varchar2_table(862) := '2E746F537472696E672E63616C6C2873726329202B20272C20737472696E672065787065637465642729293B0A2020202020202020202020207D0A202020202020202020202020696620286F70742E686F6F6B7329207B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(863) := '202020206F70742E686F6F6B732E6F7074696F6E73203D206F70743B0A2020202020202020202020207D0A202020202020202020202020696620286F70742E6173796E6329207B0A2020202020202020202020202020202072657475726E2050726F6D69';
wwv_flow_api.g_varchar2_table(864) := '73652E7265736F6C7665286F70742E686F6F6B73203F206F70742E686F6F6B732E70726570726F636573732873726329203A20737263290A20202020202020202020202020202020202020202E7468656E28737263203D3E206C65786572287372632C20';
wwv_flow_api.g_varchar2_table(865) := '6F707429290A20202020202020202020202020202020202020202E7468656E28746F6B656E73203D3E206F70742E686F6F6B73203F206F70742E686F6F6B732E70726F63657373416C6C546F6B656E7328746F6B656E7329203A20746F6B656E73290A20';
wwv_flow_api.g_varchar2_table(866) := '202020202020202020202020202020202020202E7468656E28746F6B656E73203D3E206F70742E77616C6B546F6B656E73203F2050726F6D6973652E616C6C28746869732E77616C6B546F6B656E7328746F6B656E732C206F70742E77616C6B546F6B65';
wwv_flow_api.g_varchar2_table(867) := '6E7329292E7468656E282829203D3E20746F6B656E7329203A20746F6B656E73290A20202020202020202020202020202020202020202E7468656E28746F6B656E73203D3E2070617273657228746F6B656E732C206F707429290A202020202020202020';
wwv_flow_api.g_varchar2_table(868) := '20202020202020202020202E7468656E2868746D6C203D3E206F70742E686F6F6B73203F206F70742E686F6F6B732E706F737470726F636573732868746D6C29203A2068746D6C290A20202020202020202020202020202020202020202E636174636828';
wwv_flow_api.g_varchar2_table(869) := '7468726F774572726F72293B0A2020202020202020202020207D0A202020202020202020202020747279207B0A20202020202020202020202020202020696620286F70742E686F6F6B7329207B0A20202020202020202020202020202020202020207372';
wwv_flow_api.g_varchar2_table(870) := '63203D206F70742E686F6F6B732E70726570726F6365737328737263293B0A202020202020202020202020202020207D0A202020202020202020202020202020206C657420746F6B656E73203D206C65786572287372632C206F7074293B0A2020202020';
wwv_flow_api.g_varchar2_table(871) := '2020202020202020202020696620286F70742E686F6F6B7329207B0A2020202020202020202020202020202020202020746F6B656E73203D206F70742E686F6F6B732E70726F63657373416C6C546F6B656E7328746F6B656E73293B0A20202020202020';
wwv_flow_api.g_varchar2_table(872) := '2020202020202020207D0A20202020202020202020202020202020696620286F70742E77616C6B546F6B656E7329207B0A2020202020202020202020202020202020202020746869732E77616C6B546F6B656E7328746F6B656E732C206F70742E77616C';
wwv_flow_api.g_varchar2_table(873) := '6B546F6B656E73293B0A202020202020202020202020202020207D0A202020202020202020202020202020206C65742068746D6C203D2070617273657228746F6B656E732C206F7074293B0A20202020202020202020202020202020696620286F70742E';
wwv_flow_api.g_varchar2_table(874) := '686F6F6B7329207B0A202020202020202020202020202020202020202068746D6C203D206F70742E686F6F6B732E706F737470726F636573732868746D6C293B0A202020202020202020202020202020207D0A2020202020202020202020202020202072';
wwv_flow_api.g_varchar2_table(875) := '657475726E2068746D6C3B0A2020202020202020202020207D0A202020202020202020202020636174636820286529207B0A2020202020202020202020202020202072657475726E207468726F774572726F722865293B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(876) := '7D0A20202020202020207D3B0A202020207D0A20202020236F6E4572726F722873696C656E742C206173796E6329207B0A202020202020202072657475726E20286529203D3E207B0A202020202020202020202020652E6D657373616765202B3D20275C';
wwv_flow_api.g_varchar2_table(877) := '6E506C65617365207265706F7274207468697320746F2068747470733A2F2F6769746875622E636F6D2F6D61726B65646A732F6D61726B65642E273B0A2020202020202020202020206966202873696C656E7429207B0A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(878) := '202020636F6E7374206D7367203D20273C703E416E206572726F72206F636375727265643A3C2F703E3C7072653E270A20202020202020202020202020202020202020202B20657363617065243128652E6D657373616765202B2027272C207472756529';
wwv_flow_api.g_varchar2_table(879) := '0A20202020202020202020202020202020202020202B20273C2F7072653E273B0A20202020202020202020202020202020696620286173796E6329207B0A202020202020202020202020202020202020202072657475726E2050726F6D6973652E726573';
wwv_flow_api.g_varchar2_table(880) := '6F6C7665286D7367293B0A202020202020202020202020202020207D0A2020202020202020202020202020202072657475726E206D73673B0A2020202020202020202020207D0A202020202020202020202020696620286173796E6329207B0A20202020';
wwv_flow_api.g_varchar2_table(881) := '20202020202020202020202072657475726E2050726F6D6973652E72656A6563742865293B0A2020202020202020202020207D0A2020202020202020202020207468726F7720653B0A20202020202020207D3B0A202020207D0A7D0A0A636F6E7374206D';
wwv_flow_api.g_varchar2_table(882) := '61726B6564496E7374616E6365203D206E6577204D61726B656428293B0A66756E6374696F6E206D61726B6564287372632C206F707429207B0A2020202072657475726E206D61726B6564496E7374616E63652E7061727365287372632C206F7074293B';
wwv_flow_api.g_varchar2_table(883) := '0A7D0A2F2A2A0A202A2053657473207468652064656661756C74206F7074696F6E732E0A202A0A202A2040706172616D206F7074696F6E732048617368206F66206F7074696F6E730A202A2F0A6D61726B65642E6F7074696F6E73203D0A202020206D61';
wwv_flow_api.g_varchar2_table(884) := '726B65642E7365744F7074696F6E73203D2066756E6374696F6E20286F7074696F6E7329207B0A20202020202020206D61726B6564496E7374616E63652E7365744F7074696F6E73286F7074696F6E73293B0A20202020202020206D61726B65642E6465';
wwv_flow_api.g_varchar2_table(885) := '6661756C7473203D206D61726B6564496E7374616E63652E64656661756C74733B0A20202020202020206368616E676544656661756C7473286D61726B65642E64656661756C7473293B0A202020202020202072657475726E206D61726B65643B0A2020';
wwv_flow_api.g_varchar2_table(886) := '20207D3B0A2F2A2A0A202A204765747320746865206F726967696E616C206D61726B65642064656661756C74206F7074696F6E732E0A202A2F0A6D61726B65642E67657444656661756C7473203D205F67657444656661756C74733B0A6D61726B65642E';
wwv_flow_api.g_varchar2_table(887) := '64656661756C7473203D205F64656661756C74733B0A2F2A2A0A202A2055736520457874656E73696F6E0A202A2F0A6D61726B65642E757365203D2066756E6374696F6E20282E2E2E6172677329207B0A202020206D61726B6564496E7374616E63652E';
wwv_flow_api.g_varchar2_table(888) := '757365282E2E2E61726773293B0A202020206D61726B65642E64656661756C7473203D206D61726B6564496E7374616E63652E64656661756C74733B0A202020206368616E676544656661756C7473286D61726B65642E64656661756C7473293B0A2020';
wwv_flow_api.g_varchar2_table(889) := '202072657475726E206D61726B65643B0A7D3B0A2F2A2A0A202A2052756E2063616C6C6261636B20666F7220657665727920746F6B656E0A202A2F0A6D61726B65642E77616C6B546F6B656E73203D2066756E6374696F6E2028746F6B656E732C206361';
wwv_flow_api.g_varchar2_table(890) := '6C6C6261636B29207B0A2020202072657475726E206D61726B6564496E7374616E63652E77616C6B546F6B656E7328746F6B656E732C2063616C6C6261636B293B0A7D3B0A2F2A2A0A202A20436F6D70696C6573206D61726B646F776E20746F2048544D';
wwv_flow_api.g_varchar2_table(891) := '4C20776974686F757420656E636C6F73696E6720607060207461672E0A202A0A202A2040706172616D2073726320537472696E67206F66206D61726B646F776E20736F7572636520746F20626520636F6D70696C65640A202A2040706172616D206F7074';
wwv_flow_api.g_varchar2_table(892) := '696F6E732048617368206F66206F7074696F6E730A202A204072657475726E20537472696E67206F6620636F6D70696C65642048544D4C0A202A2F0A6D61726B65642E7061727365496E6C696E65203D206D61726B6564496E7374616E63652E70617273';
wwv_flow_api.g_varchar2_table(893) := '65496E6C696E653B0A2F2A2A0A202A204578706F73650A202A2F0A6D61726B65642E506172736572203D205F5061727365723B0A6D61726B65642E706172736572203D205F5061727365722E70617273653B0A6D61726B65642E52656E6465726572203D';
wwv_flow_api.g_varchar2_table(894) := '205F52656E64657265723B0A6D61726B65642E5465787452656E6465726572203D205F5465787452656E64657265723B0A6D61726B65642E4C65786572203D205F4C657865723B0A6D61726B65642E6C65786572203D205F4C657865722E6C65783B0A6D';
wwv_flow_api.g_varchar2_table(895) := '61726B65642E546F6B656E697A6572203D205F546F6B656E697A65723B0A6D61726B65642E486F6F6B73203D205F486F6F6B733B0A6D61726B65642E7061727365203D206D61726B65643B0A636F6E7374206F7074696F6E73203D206D61726B65642E6F';
wwv_flow_api.g_varchar2_table(896) := '7074696F6E733B0A636F6E7374207365744F7074696F6E73203D206D61726B65642E7365744F7074696F6E733B0A636F6E737420757365203D206D61726B65642E7573653B0A636F6E73742077616C6B546F6B656E73203D206D61726B65642E77616C6B';
wwv_flow_api.g_varchar2_table(897) := '546F6B656E733B0A636F6E7374207061727365496E6C696E65203D206D61726B65642E7061727365496E6C696E653B0A636F6E7374207061727365203D206D61726B65643B0A636F6E737420706172736572203D205F5061727365722E70617273653B0A';
wwv_flow_api.g_varchar2_table(898) := '636F6E7374206C65786572203D205F4C657865722E6C65783B0A0A6578706F7274207B205F486F6F6B7320617320486F6F6B732C205F4C65786572206173204C657865722C204D61726B65642C205F506172736572206173205061727365722C205F5265';
wwv_flow_api.g_varchar2_table(899) := '6E64657265722061732052656E64657265722C205F5465787452656E6465726572206173205465787452656E64657265722C205F546F6B656E697A657220617320546F6B656E697A65722C205F64656661756C74732061732064656661756C74732C205F';
wwv_flow_api.g_varchar2_table(900) := '67657444656661756C74732061732067657444656661756C74732C206C657865722C206D61726B65642C206F7074696F6E732C2070617273652C207061727365496E6C696E652C207061727365722C207365744F7074696F6E732C207573652C2077616C';
wwv_flow_api.g_varchar2_table(901) := '6B546F6B656E73207D3B0A2F2F2320736F757263654D617070696E6755524C3D6D61726B65642E65736D2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(44713808922353503)
,p_plugin_id=>wwv_flow_api.id(44707756106280238)
,p_file_name=>'marked.esm.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(3785766145688155)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(3646011438688042)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(3749224600688109)
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_css_file_urls=>'#APP_IMAGES#app-icon.css?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(3785476894688154)
,p_nav_bar_list_template_id=>wwv_flow_api.id(3752094912688111)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240523165707'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'json-region-demo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531151827'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3796731617688227)
,p_plug_name=>'json-region-demo'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(3691838030688078)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'objects23ai'
,p_alias=>'OBJECTS23AI'
,p_step_title=>'objects23ai'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531151343'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6193870259989096)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3676898744688071)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'OBJECT23AI'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Report 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6194214350989096)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_OBJECT_ID:\#OBJECT_ID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_owner=>'UWE'
,p_internal_uid=>6194214350989096
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6194356344989099)
,p_db_column_name=>'OBJECT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Object Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6194713250989106)
,p_db_column_name=>'OBJECT_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Object Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6195107631989107)
,p_db_column_name=>'DATA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Data'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6196982463990089)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'61970'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBJECT_ID:OBJECT_NAME:DATA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6386503797265509)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6196341465989111)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6193870259989096)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'object23ai'
,p_alias=>'OBJECT23AI'
,p_page_mode=>'MODAL'
,p_step_title=>'Object23ai'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531151403'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6188028441989065)
,p_plug_name=>'Object23ai'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'OBJECT23AI'
,p_query_order_by=>'object_name'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4434438412426906)
,p_plug_name=>'JSON_REGION'
,p_parent_plug_id=>wwv_flow_api.id(6188028441989065)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_JSON_REGION.UWESIMON.SELFHOST.E'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'250'
,p_attribute_02=>'1'
,p_attribute_05=>'3'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'P3_DATA'
,p_attribute_11=>'floating'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6386450716265508)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6191637461989086)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6188028441989065)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P3_OBJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6190490886989083)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6188028441989065)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6192051202989086)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6188028441989065)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P3_OBJECT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6191220102989085)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6188028441989065)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P3_OBJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4438085591426942)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(6188028441989065)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3_OBJECT_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4437993592426941)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(6188028441989065)
,p_button_name=>'PREV'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Prev'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3_OBJECT_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6387760373265521)
,p_branch_name=>'PREV'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_OBJECT_ID:&P3_OBJECT_ID_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4437993592426941)
,p_branch_sequence=>11
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6387618509265520)
,p_branch_name=>'NEXT'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_OBJECT_ID:&P3_OBJECT_ID_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4438085591426942)
,p_branch_sequence=>21
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6388152261265525)
,p_branch_name=>'LIST'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6191220102989085)
,p_branch_sequence=>31
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6188327463989068)
,p_name=>'P3_OBJECT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6188028441989065)
,p_item_source_plug_id=>wwv_flow_api.id(6188028441989065)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Object Id'
,p_source=>'OBJECT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761901888688116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6188757898989077)
,p_name=>'P3_OBJECT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6188028441989065)
,p_item_source_plug_id=>wwv_flow_api.id(6188028441989065)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Object Name'
,p_source=>'OBJECT_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3762275193688117)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6189124900989080)
,p_name=>'P3_DATA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6188028441989065)
,p_item_source_plug_id=>wwv_flow_api.id(6188028441989065)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Data'
,p_source=>'DATA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>8200
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761901888688116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6387317643265517)
,p_name=>'P3_OBJECT_ID_NEXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6188028441989065)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6387427797265518)
,p_name=>'P3_OBJECT_ID_COUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6188028441989065)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6387519060265519)
,p_name=>'P3_OBJECT_ID_PREV'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6188028441989065)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6193261547989088)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6188028441989065)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form object23ai'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6192885751989088)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(6188028441989065)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form object23ai'
,p_attribute_01=>'P3_OBJECT_ID_NEXT'
,p_attribute_02=>'P3_OBJECT_ID_PREV'
,p_attribute_03=>'P3_OBJECT_ID_COUNT'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'jsons23ai'
,p_alias=>'JSONS23AI'
,p_step_title=>'Jsons23ai'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531152148'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6369654175945961)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3676898744688071)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'JSON23AI'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Report 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6370048856945961)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP:P6_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_owner=>'UWE'
,p_internal_uid=>6370048856945961
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6370150093945963)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6370535278945964)
,p_db_column_name=>'DATA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Data'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6373439148948930)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'63735'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:DATA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6371867933945968)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6373092129945969)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6369654175945961)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'json23ai'
,p_alias=>'JSON23AI'
,p_page_mode=>'MODAL'
,p_step_title=>'Json23ai'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531152539'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6364511646945936)
,p_plug_name=>'Json23ai'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'JSON23AI'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6389701245265541)
,p_plug_name=>'JSON_REGION'
,p_parent_plug_id=>wwv_flow_api.id(6364511646945936)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_JSON_REGION.UWESIMON.SELFHOST.E'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'300'
,p_attribute_02=>'1'
,p_attribute_05=>'3'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'P6_DATA'
,p_attribute_11=>'floating'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6372493497945969)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6367404072945953)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6364511646945936)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P6_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6366278702945951)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6364511646945936)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6367829283945953)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6364511646945936)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P6_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6367002496945953)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6364511646945936)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P6_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4438222449426944)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(6364511646945936)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P6_ROWID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4438114275426943)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(6364511646945936)
,p_button_name=>'PREV'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Prev'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P6_ROWID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6386905124265513)
,p_branch_name=>'PREV'
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ROWID:&P6_ROWID_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4438114275426943)
,p_branch_sequence=>11
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6387065200265514)
,p_branch_name=>'NEXT'
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ROWID:&P6_ROWID_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4438222449426944)
,p_branch_sequence=>21
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6388293172265526)
,p_branch_name=>'LIST'
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6367002496945953)
,p_branch_sequence=>31
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4438470518426946)
,p_name=>'P6_ROWID_NEXT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6364511646945936)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4438549320426947)
,p_name=>'P6_ROWID_COUNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6364511646945936)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4438626314426948)
,p_name=>'P6_ROWID_PREV'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6364511646945936)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6364935794945937)
,p_name=>'P6_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6364511646945936)
,p_item_source_plug_id=>wwv_flow_api.id(6364511646945936)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rowid'
,p_source=>'ROWID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761901888688116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6365222397945948)
,p_name=>'P6_DATA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6364511646945936)
,p_item_source_plug_id=>wwv_flow_api.id(6364511646945936)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Data'
,p_source=>'DATA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>32600
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761901888688116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6369031694945954)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6364511646945936)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form json23ai'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6368680245945954)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(6364511646945936)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form json23ai'
,p_attribute_01=>'P6_ROWID_NEXT'
,p_attribute_02=>'P6_ROWID_PREV'
,p_attribute_03=>'P6_ROWID_COUNT'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Objects'
,p_alias=>'OBJECTS'
,p_step_title=>'Objects'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531151323'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6534017274653016)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3676898744688071)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'OBJECT'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Report 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6534441372653016)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,:P11_OBJECT_ID:\#OBJECT_ID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_owner=>'UWE'
,p_internal_uid=>6534441372653016
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6534561722653018)
,p_db_column_name=>'OBJECT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Object Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6534913058653018)
,p_db_column_name=>'OBJECT_TYPE_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Object Type Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(4432723080402672)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6535323318653019)
,p_db_column_name=>'OBJECT_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Object Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6535792650653019)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Created At'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6536178648653019)
,p_db_column_name=>'DATA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Data'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6539929519653851)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65400'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBJECT_ID:OBJECT_TYPE_ID:OBJECT_NAME:CREATED_AT:DATA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6538376392653026)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6539507234653027)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6534017274653016)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:8::'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6537214315653023)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(6534017274653016)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6537754312653024)
,p_event_id=>wwv_flow_api.id(6537214315653023)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(6534017274653016)
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Object_types'
,p_alias=>'OBJECT-TYPES'
,p_step_title=>'Object_types'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531152046'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4624316651240627)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3676898744688071)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'OBJECT_TYPE'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Report 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(4624708307240628)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP:P10_OBJECT_TYPE_ID:\#OBJECT_TYPE_ID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_detail_link_auth_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_owner=>'UWE'
,p_internal_uid=>4624708307240628
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4624873998240629)
,p_db_column_name=>'OBJECT_TYPE_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Object Type Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4625294830240635)
,p_db_column_name=>'OBJECT_TYPE_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Object Type Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4625635803240635)
,p_db_column_name=>'OBJECT_SCHEMA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Object Schema'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4628720815241539)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46288'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBJECT_TYPE_ID:OBJECT_TYPE_NAME:OBJECT_SCHEMA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4626915671240640)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4628152250240642)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4624316651240627)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:10'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Object_type'
,p_alias=>'OBJECT-TYPE'
,p_page_mode=>'MODAL'
,p_step_title=>'Object_type'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240530073022'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4618567220240603)
,p_plug_name=>'Object_type'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'OBJECT_TYPE'
,p_query_order_by=>'object_type_name'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4627573639240642)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4622143923240620)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4618567220240603)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P10_OBJECT_TYPE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4620921127240618)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4618567220240603)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4622532284240620)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4618567220240603)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P10_OBJECT_TYPE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4621777790240620)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4618567220240603)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P10_OBJECT_TYPE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4437659036426938)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(4618567220240603)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P10_OBJECT_TYPE_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4437515765426937)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(4618567220240603)
,p_button_name=>'PREV'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Prev'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P10_OBJECT_TYPE_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4437757307426939)
,p_branch_name=>'PREV'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_OBJECT_TYPE_ID:&P10_OBJECT_TYPE_ID_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4437515765426937)
,p_branch_sequence=>11
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4437820750426940)
,p_branch_name=>'NEXT'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_OBJECT_TYPE_ID:&P10_OBJECT_TYPE_ID_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4437659036426938)
,p_branch_sequence=>21
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6387958228265523)
,p_branch_name=>'LIST'
,p_branch_action=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4621777790240620)
,p_branch_sequence=>31
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4437209850426934)
,p_name=>'P10_OBJECT_TYPE_ID_PREV'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4618567220240603)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4437365903426935)
,p_name=>'P10_OBJECT_TYPE_ID_NEXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4618567220240603)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4437400127426936)
,p_name=>'P10_OBJECT_TYPE_ID_COUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4618567220240603)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4618933805240605)
,p_name=>'P10_OBJECT_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4618567220240603)
,p_item_source_plug_id=>wwv_flow_api.id(4618567220240603)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Object Type Id'
,p_source=>'OBJECT_TYPE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761901888688116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4619210628240613)
,p_name=>'P10_OBJECT_TYPE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4618567220240603)
,p_item_source_plug_id=>wwv_flow_api.id(4618567220240603)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Object Type Name'
,p_source=>'OBJECT_TYPE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3762275193688117)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4619637364240616)
,p_name=>'P10_OBJECT_SCHEMA'
,p_source_data_type=>'CLOB'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4618567220240603)
,p_item_source_plug_id=>wwv_flow_api.id(4618567220240603)
,p_prompt=>'Object Schema'
,p_source=>'OBJECT_SCHEMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(3762275193688117)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4623793939240622)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4618567220240603)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Object_type'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4623393742240622)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(4618567220240603)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Object_type'
,p_attribute_01=>'P10_OBJECT_TYPE_ID_NEXT'
,p_attribute_02=>'P10_OBJECT_TYPE_ID_PREV'
,p_attribute_03=>'P10_OBJECT_TYPE_ID_COUNT'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Object'
,p_alias=>'OBJECT'
,p_page_mode=>'MODAL'
,p_step_title=>'Object'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240531151301'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6619879425564469)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6620408895564507)
,p_plug_name=>'Object'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'OBJECT'
,p_query_order_by=>'object_name'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6388973917265533)
,p_plug_name=>'JSON_REGION'
,p_parent_plug_id=>wwv_flow_api.id(6620408895564507)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_JSON_REGION.UWESIMON.SELFHOST.E'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'250'
,p_attribute_02=>'SQL-Query'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_schema',
'from object_type',
'where object_type_id=:P11_OBJECT_TYPE_ID'))
,p_attribute_05=>'3'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'P11_DATA'
,p_attribute_11=>'floating'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6625583070564534)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(6620408895564507)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P11_OBJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6624356210564531)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6620408895564507)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6625908350564534)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(6620408895564507)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P11_OBJECT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6625159593564533)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6620408895564507)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P11_OBJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6388890350265532)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6620408895564507)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P11_OBJECT_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6388726798265531)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6620408895564507)
,p_button_name=>'PREV'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3762395612688117)
,p_button_image_alt=>'Prev'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P11_OBJECT_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6626245854564534)
,p_branch_name=>'LIST'
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6625159593564533)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6389018343265534)
,p_branch_name=>'PREV'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::P11_OBJECT_ID:&P11_OBJECT_ID_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6388726798265531)
,p_branch_sequence=>11
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6389193095265535)
,p_branch_name=>'NEXT'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::P11_OBJECT_ID:&P11_OBJECT_ID_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6388890350265532)
,p_branch_sequence=>21
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6389207146265536)
,p_name=>'P11_OBJECT_ID_PREV'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6389391610265537)
,p_name=>'P11_OBJECT_ID_NEXT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6389450970265538)
,p_name=>'P11_OBJECT_ID_COUNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6620842544564507)
,p_name=>'P11_OBJECT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_item_source_plug_id=>wwv_flow_api.id(6620408895564507)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Object Id'
,p_source=>'OBJECT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761901888688116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6621231308564518)
,p_name=>'P11_OBJECT_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_item_source_plug_id=>wwv_flow_api.id(6620408895564507)
,p_prompt=>'Object Type Id'
,p_source=>'OBJECT_TYPE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'OBJECT_TYPE.OBJECT_TYPE_NAME'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P11_OBJECT_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(3762275193688117)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6621641206564523)
,p_name=>'P11_OBJECT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_item_source_plug_id=>wwv_flow_api.id(6620408895564507)
,p_prompt=>'Object Name'
,p_source=>'OBJECT_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(3762275193688117)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6622063300564526)
,p_name=>'P11_CREATED_AT'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_item_source_plug_id=>wwv_flow_api.id(6620408895564507)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Created At'
,p_format_mask=>'dd.mm.yyyy hh24:mi'
,p_source=>'CREATED_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(3762275193688117)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6622405099564530)
,p_name=>'P11_DATA'
,p_source_data_type=>'CLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6620408895564507)
,p_item_source_plug_id=>wwv_flow_api.id(6620408895564507)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Data'
,p_source=>'DATA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761901888688116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6389541632265539)
,p_name=>'REFRESH'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_OBJECT_TYPE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6389629394265540)
,p_event_id=>wwv_flow_api.id(6389541632265539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(6388973917265533)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6627135375564535)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6620408895564507)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Object'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6626774429564535)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(6620408895564507)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Object'
,p_attribute_01=>'P11_OBJECT_ID_NEXT'
,p_attribute_02=>'P11_OBJECT_ID_PREV'
,p_attribute_03=>'P11_OBJECT_ID_COUNT'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'json-region-demo - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(3661561697688060)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240523165708'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3790041990688205)
,p_plug_name=>'json-region-demo'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3693934569688079)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3794650887688217)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(3790041990688205)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(3712040877688087)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3792704893688215)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(3790041990688205)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3763036896688118)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3790364929688208)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3790041990688205)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761648956688115)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3790713425688208)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3790041990688205)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(3761648956688115)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3791884767688212)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3790041990688205)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(3791064779688209)||'.'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_api.id(3761648956688115)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3793510536688216)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3793116771688216)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3794384291688216)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3793942837688216)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
);
end;
/
prompt --application/pages/page_10000
begin
wwv_flow_api.create_page(
 p_id=>10000
,p_user_interface_id=>wwv_flow_api.id(3785766145688155)
,p_name=>'Administration'
,p_alias=>'ADMIN'
,p_step_title=>'Administration'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(3789105044688195)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(3788587042688193)
,p_protection_level=>'C'
,p_deep_linking=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The administration page allows application owners (Administrators) to configure the application and maintain common data used across the application.',
'By selecting one of the available settings, administrators can potentially change how the application is displayed and/or features available to the end users.</p>',
'<p>Access to this page should be limited to Administrators only.</p>'))
,p_last_updated_by=>'UWE'
,p_last_upd_yyyymmddhh24miss=>'20240523165708'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3806357847688265)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(3682711375688074)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(3645560497688040)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(3764491432688119)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3807660844688267)
,p_plug_name=>'Column 1'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(3704446588688083)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3808079451688267)
,p_plug_name=>'Configuration'
,p_parent_plug_id=>wwv_flow_api.id(3807660844688267)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(3705216470688084)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(3806967881688266)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(3746270396688108)
,p_plug_query_num_rows=>15
,p_required_patch=>wwv_flow_api.id(3787636662688191)
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
