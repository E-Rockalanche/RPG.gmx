var hex = argument0;

var length = string_length(hex);
var value = 0;
for(var n = length; n > max(0, length-8); n--) {
    var char = ord(string_char_at(hex, n));
    var nibble = 0;
    if (char >= 48 && char <= 57) {
        nibble = char-48;
    } else if (char >= 65 && char <= 70) {
        nibble = char-65+10;
    } else if (char >= 97 && char <= 102) {
        nibble = char-97+10;
    }
    value = ((value << 4) & $fffffff0) + nibble;
}
return value;
