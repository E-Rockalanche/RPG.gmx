/// gridSeedGradient(ds_grid, middle_chance, outside_chance)

var grid = argument0;
var middle_chance = argument1;
var outside_chance = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var i = 0; i < width; i++) {
    for(var j = 0; j < height; j++) {
        var xdist = min(abs(width/2 - i - 0.5), abs(i + 0.5 - width/2)) * 2 / width;
        var ydist = min(abs(height/2 - j - 0.5), abs(j + 0.5 - height/2)) * 2 / height;
        var dist = max(xdist, ydist);
        var cur_chance = middle_chance + dist * (outside_chance - middle_chance);
        grid[# i, j] = chance(cur_chance);
    }
}
