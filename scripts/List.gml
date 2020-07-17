/// List(elements, ...)
/*
initializes a ds_list with arguments given
*/

var list = ds_list_create();
for(var n = 0; n < argument_count; ++n) {
    ds_list_add(list, argument[n]);
}
return list;
