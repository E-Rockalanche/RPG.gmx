/// gridCellularAutomata(grid, iterations, birth_rules, survive_rules)

var original_grid = argument0; // ds_grid
var iterations = argument1; // int
var birth_rules = argument2; // bool[9]
var survive_rules = argument3; // bool[9]

var width = ds_grid_width(original_grid);
var height = ds_grid_height(original_grid);

var old_grid = original_grid;
var new_grid = ds_grid_create(width, height);

for(var it = 0; it < iterations; ++it) {
    for(var i = 0; i < width; ++i) {
        for(var j = 0; j < height; ++j) {
            if (old_grid[# i, j] == 0 || old_grid[# i, j] == 1) {
                var neighbours = 0;
                for(var d = 0; d < 8; ++d) {
                    var ii = i + x_dirs[d];
                    var jj = j + y_dirs[d];
                    neighbours += (point_in_rectangle(ii, jj, 0, 0, width-1, height-1) && old_grid[# ii, jj]);
                }
                if (old_grid[# i, j]) {
                    new_grid[# i, j] = survive_rules[neighbours];
                } else {
                    new_grid[# i, j] = birth_rules[neighbours];
                }
            } else {
                new_grid[# i, j] = old_grid[# i, j];
            }
        }
    }
    
    var swap_temp = old_grid;
    old_grid = new_grid;
    new_grid = swap_temp;
}

if ((iterations mod 2) == 1) {
    ds_grid_copy(original_grid, old_grid);
    ds_grid_destroy(old_grid);
} else {
    ds_grid_destroy(new_grid);
}
