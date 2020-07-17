/// ds_grid_floors(grid);

var grid = argument0;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        if (grid[# i, j] == 1) {
            grid[# i, j] = 2;
        }
    }
}
