#define Rectangle
/// Rectangle(left, top, width, height)

var rect = ds_map_create();
rect[? Rect.LEFT] = argument0;
rect[? Rect.TOP] = argument1;
rect[? Rect.WIDTH] = argument2;
rect[? Rect.HEIGHT] = argument3;

#define RectangleLeft
var rect = argument0;
return rect[? Rect.LEFT];

#define RectangleTop
var rect = argument0;
return rect[? Rect.TOP];

#define RectangleWidth
var rect = argument0;
return rect[? Rect.WIDTH];

#define RectangleHeight
var rect = argument0;
return rect[? Rect.HEIGHT];

#define RectangleRight
var rect = argument0;
return rect[? Rect.LEFT] + rect[Rect.WIDTH] - 1;

#define RectangleBottom
var rect = argument0;
return rect[? Rect.TOP] + rect[? Rect.HEIGHT] - 1;

#define RectangleDestroy
ds_map_destroy(argument0);