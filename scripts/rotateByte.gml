/// rotateByte(byte, rotation)

var rot = argument1 mod 8;
return 255 & ((argument0 << rot) | (argument0 >> (8 - rot)));
