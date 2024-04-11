/*
 * APEX JSON-Item-Display plugin
 * (c) Uwe Simon 2024
 * Apache License Version 2.0
*/

"use strict";

/*
 * use the format for list p_list for formatting the data in p_value
 * the format contains one or more JSON-path enclosed by #
 * Example "#$.lastname#, #$.firstname#" returns "Simon, Uwe"
*/
function formatValue(p_display, p_list, p_value){
  p_display =convertJsonParameter(p_display);
  p_value =convertJsonParameter(p_value);  
  // console.log('format value', p_display, p_list, p_value);
  p_display = p_display ||{};
  p_display.apex = p_display.apex ||{};
  p_display = p_display.apex.display;
  p_display = p_display||{};
  let l_format = p_display[p_list]||'';
  let l_result = l_format;
  let l_fields = l_format.match(/#[^#]+#/g) || [];
  for(const l_field of l_fields){
      let l_jsonpath = l_field.replaceAll('#', '');
      let l_value = JSONPath.JSONPath({path: l_jsonpath, json: p_value}) || [];
      l_result = l_result.replaceAll(l_field, l_value[0]?l_value[0]:'-');
  }

  // console.log('formatted value:', l_result);
  return (l_result);
}
    /*
     * convert quoted JSON string like '\"id\": \"abc\u000adef\"' into object
     */
function convertJsonParameter(p_str){
  let l_obj = undefined;
  let l_str = "";
// console.log('convert', p_str);
  try{
        // exclose with " so 2 parses will unquote all quoted characters
    if( typeof p_str == 'string'){
      l_str = JSON.parse(p_str);
//      l_str = JSON.parse('"' + p_str + '"');
    } else {
      l_str = p_str;
    }
    if( typeof l_str == 'string'){
      l_obj = JSON.parse(l_str);
    } else {
      l_obj=l_str;
    }
  } catch(e) {
    apex.debug.error('json-item-display: schema', e, p_str);
    l_obj = {};
  }
//  console.log(l_obj);
  return (l_obj);
} 
    /*
     * initialize the JSON-Item-Display plugin, call form inside PL/SQL when plugin is initialized
     */
function initJsonItemDisplay(p_item_name, pAjaxIdentifier, p_options, p_value){
  console.info('init JSON-Item-Display', p_item_name,  pAjaxIdentifier, p_options, p_value);
  p_options =convertJsonParameter(p_options);
  // p_options.schema is quotted too
  console.log('poptions', p_options);
  p_options.schema =convertJsonParameter('"' + (p_options.schema||"{}") + '"');
  p_options.schema.apex = p_options.schema.apex ||{};
  console.dir(p_options);

  let l_html = apex.util.applyTemplate(`
<div class="t-Form-itemWrapper">
  <input type="hidden" name="#ID#" id="#ID#" value="">
  <input type="hidden" data-for="#ID#" value="">
  <span id="#ID#_DISPLAY" class="display_only apex-item-display-only" data-escape="true">
#VALUE#
  </span>
</div>
`,
                                                {
                                                    placeholders: {
                                                      "ID":    p_item_name,
                                                      "VALUE": (formatValue(p_options.schema, p_options.list, '"' + p_value + '"'))
                                                   }
                                                });
  $('#' + p_item_name + '_CONTAINER .t-Form-itemWrapper').html(l_html);

  apex.item.create(p_item_name, {
    item_type: "json_item_display",
    displayValueFor:function(value) {
      console.log('DISPLAY:', value);
      return formatValue('"' + p_options.schema + '"', p_options.list, '"' + (value ||'{}') + '"');
    }
  });
}

function initJsonItemDisplayGrid(p_column_name, pAjaxIdentifier, p_options){
  console.info('init JSON-Item-Display-Grid', p_column_name, pAjaxIdentifier, p_options);

    // get the region containing the column 
  let l_region = $('#' + p_column_name).closest('.t-Region').attr("id");
  let l_data_column = null;
  console.log('REGION', l_region, apex.region(l_region).widget());

  $('#' + l_region).on( 'gridpagechange', function(event, data){
    // console.log('REFRESH', event, data);
    $('#' + l_region + ' .is-readonly.is-changed').removeClass('is-changed');
  });

  $('#' + l_region).on( "interactivegridviewmodelcreate", function( event, data ) {
    let l_view = apex.region(l_region).widget().interactiveGrid("getViews", "grid");
    let l_model = l_view.model;

    // get model columnname from grid columnname
    for (const [key, data] of Object.entries(l_view.modelColumns)) {
      if(p_column_name == data.elementId){
        l_data_column = key;
      }
    };

    l_view.modelColumns[l_data_column].dependsOn = []; 
    l_view.modelColumns[l_data_column].virtual   = true;
    l_view.modelColumns[l_data_column].readonly  = true;
   // l_view.modelColumns[l_data_column].volatile  = true;
    l_view.modelColumns[l_data_column].calcValue = function(_argsArray, model, record){
                                                let l_value = formatValue(model.getValue(record, p_options.schemaitem), p_options.list, model.getValue(record, p_options.dataitem));
                                                return(l_value);
                                               };
    console.log('data_column', l_data_column, l_view.modelColumns[l_data_column]);
  });

//  apex.item.create(p_column_name, {item_type: 'hidden', nullValue: 'xxxx', isChanged: function() { console.log('isChanged'); return false; }});

  p_options =convertJsonParameter(p_options);
  // p_options.schema is quotted too
  p_options.schema = convertJsonParameter(p_options.schema||"{}");
  p_options.schema.apex = p_options.schema.apex ||{};
}