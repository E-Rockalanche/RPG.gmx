var list = argument0;
var index = argument1;
var value = list[| index];
ds_list_delete(list, index);
return value;
