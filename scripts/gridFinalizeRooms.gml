/// gridFinalizeRooms(grid);

var grid = argument0;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        if (grid[# i, j] == 0) {
            for(var d = 0; d < 8; ++d) {
                var ii = i + x_dirs[d];
                var jj = j + y_dirs[d];
                if (point_in_rectangle(ii, jj, 0, 0, width-1, height-1) && grid[# ii, jj]) {
                    grid[# i, j] = -1;
                    break;
                }
            }
        } else {
            grid[# i, j] = 2;
        }
    }
}
