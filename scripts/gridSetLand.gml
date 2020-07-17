var grid = argument0;
var water_height = argument1;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        if (grid[# i, j] > water_height) {
            grid[# i, j] = Tile.LAND;
        } else {
            grid[# i, j] = Tile.WATER;
        }
    }
}
