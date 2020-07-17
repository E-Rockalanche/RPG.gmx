/// generateBlob(min_width, min_height, max_width, max_height, seed_chance)

var min_width = argument0
var min_height = argument1;
var max_width = argument2;
var max_height = argument3;
var seed_chance = argument4;

assert(max_width >= min_width);
assert(max_height >= min_height);
assert(max_width >= 4);
assert(max_height >= 4);

var grid = ds_grid_create(max_width, max_height);

var size = 0;
var ok = false;

do {
    seedGrid(grid, seed_chance);
    gridCellularAutomata(grid, 8, 5, 4);
    seed_chance += 5;
    
    var largest_id = -1;
    var largest_size = 0;
    
    var next_id = 2;
    
    for(var i = 0; i < max_width; ++i) {
        for(var j = 0; j < max_height; ++j) {
            if (grid[# i, j] < 2) {
                var cur_id = next_id++;
                var cur_size = ds_grid_flood_fill(grid, i, j, cur_id);
                
                if (cur_size > largest_size) {
                    largest_id = cur_id;
                    largest_size = cur_size;
                }
            }
        }
    }
    
    if (largest_size > 0) {
        var left = max_width;
        var top = max_height;
        var right = -1;
        var bottom = -1;
        
        for(var i = 0; i < max_width; ++i) {
            for(var j = 0; j < max_height; ++j) {
                if (grid[# i, j] == largest_id) {
                    left = min(left, i);
                    top = min(top, j);
                    right = max(right, i);
                    bottom = max(bottom, j);
                }
            }
        }
        
        if (right - left + 1 >= min_width) && (bottom - top + 1 >= min_height) {
            ok = true;
            size = largest_size;
        }
    }
    
    if (!ok) {
        ds_grid_clear(grid, 0);
    }
} until (ok);

return size;
