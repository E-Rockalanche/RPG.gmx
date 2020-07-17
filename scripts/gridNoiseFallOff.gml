/// gridNoiseFallOff(ds_grid, exponent)

var time = current_time;

var grid = argument0;
var exponent = argument1;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        var xdist = 1 - min(i+0.5, width-i-0.5) * 2 / width;
        var ydist = 1 - min(j+0.5, height-j-0.5) * 2 / height;
        var dist = max(xdist, ydist);
        grid[# i, j] = (grid[# i, j] + 1) * (1 - power(dist, exponent)) - 1;
    }
}

cout("falloff time: ", current_time-time, "ms");
