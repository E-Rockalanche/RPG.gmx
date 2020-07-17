var list = argument0;
var size = ds_list_size(list);
return list[| irandom(size-1)];
