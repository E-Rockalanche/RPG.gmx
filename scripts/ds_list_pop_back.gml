var list = argument0;
var size = ds_list_size(list);
var value = list[| size-1];
ds_list_delete(list, size-1);
return value;
