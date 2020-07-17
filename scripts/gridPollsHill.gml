var grid = argument0;
var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var j = 0; j < height; ++j) {
    var value = cos((j+0.5)/height*2*pi);
    for(var i = 0; i < width; ++i) {
        grid[# i, j] = value;
    }
}
