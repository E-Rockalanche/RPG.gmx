/// Array(elements, ...)
/*
initializes and array with arguments given
*/

var arr = array_create(argument_count);
for(var n = 0; n < argument_count; n++) {
    arr[n] = argument[n];
}
return arr;
