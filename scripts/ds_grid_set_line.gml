/// ds_grid_set_line(grid, x1, y1, x2, y2, value)

var grid = argument0;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;
var value = argument5;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var dx = x2 - x1;
var dy = y2 - y1;

if (abs(dx) >= abs(dy)) {
    var left, right, y_start;
    if (x2 < x1) {
        left = x2
        right = min(x2, width-1);
        y_start = y2;
    } else {
        left = x1
        right = min(x1, width-1);
        y_start = y1;
    }
    for(var i = max(0, left); i <= right; ++i) {
        var j = y_start + round((i - left) * dy / dx);
        grid[# i, j] = value;
    }
} else {
    var top, bottom, x_start;
    if (y2 < y1) {
        left = y2
        right = min(y2, height-1);
        x_start = x2;
    } else {
        left = y1
        right = min(y1, height-1);
        x_start = x1;
    }
    for(var j = max(0, top); j <= bottom; ++j) {
        var i = x_start + round((j - top) * dx / dy);
        grid[# i, j] = value;
    }
}
