/// cout(strings, ...)
/*
prints multiple strings to the debug console
*/

var str = "";
for(var n = 0; n < argument_count; ++n) {
    str += string(argument[n]);
}
show_debug_message(str);
