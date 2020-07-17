var grid = argument0;
var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var j = 0; j < height; ++j) {
    var value = sin((j+0.5)/height*pi)*2 - 1;
    for(var i = 0; i < width; ++i) {
        grid[# i, j] = value;
    }
}
