/// array_to_string

// converts array to JS style string

var arr = argument0;
var str = "[";
for(var n = 0; n < array_length_1d(arr); n++) {
    if (n > 0) {
        str += ", ";
    }
    var element = arr[n];
    if (is_string(element)) {
        str += '"'+element+'"';
    } else {
        str += string(element);
    }
}
str += "]";
return str;
