/// array_concat(dest, src)

var dest_array = argument0;
var src_array = argument1;

var dest_length = array_length_1d(dest_array);
var src_length = array_length_1d(src_array);

for(var n = src_length - 1; n >= 0; n--) {
    dest_array[@ dest_length + n] = src_array[n];
}
