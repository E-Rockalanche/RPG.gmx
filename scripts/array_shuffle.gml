/// array_shuffle(array)

var array = argument0;
var length = array_length_1d(array);
for(var n = 0; n < length; n++) {
    var temp = array[n];
    var n2 = irandom(length-1);
    array[@ n] = array[n2];
    array[@ n2] = temp;
}
