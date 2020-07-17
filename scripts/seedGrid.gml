/// seedGrid(grid, seed_chance)

var grid = argument0;
var seed_chance = argument1;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        if (grid[# i, j] == 0 || grid[# i, j] == 1) {
            grid[# i, j] = chance(seed_chance);
        }
    }
}
