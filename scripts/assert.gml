/// assert(condition [, message])
/*
terminates the program if the condition is false
*/

if (!argument[0]) {
    if (argument_count == 1) {
        show_error("assertion failed", true);
    } else {
        show_error(argument[1], true);
    }
}
