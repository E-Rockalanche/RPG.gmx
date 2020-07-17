/// array_clear(array, value)

var array = argument0;
var value = argument1;

for(var n = 0; n < array_length_1d(array); n++) {
    array[@ n] = value;
}
