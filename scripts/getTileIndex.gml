/// getTileIndex(grid, x, y, has_corner_tiles)

var grid = argument0;
var i = argument1;
var j = argument2;
var has_corner_tiles = argument3;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var type = grid[# i, j];

var index = 0;
for(var d = 0; d < 4; d++) {
    var ii = i + x_dirs[d];
    var jj = j + y_dirs[d];
    
    if (point_in_rectangle(ii, jj, 0, 0, width-1, height-1)) {
        if (grid[# ii, jj] == type) {
            index |= Bit(d);
        }
    } else {
        index |= Bit(d);
    }
}

if (has_corner_tiles && index == 15) {
    var corner_index = 0;
    for(var d = 4; d < 8; ++d) { 
        var ii = i + x_dirs[d];
        var jj = j + y_dirs[d];
        
        if (point_in_rectangle(ii, jj, 0, 0, width-1, height-1)) {
            if (grid[# ii, jj] != type) {
                index = 12+d;
                break;
            }
        }
    }
}
return index;
