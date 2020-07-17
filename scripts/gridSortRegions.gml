/// gridSortRegions(grid, walkable_tiles, region_grid, region_list);

var time = current_time;

var grid = argument0;
var walkable_tiles = argument1;
var region_grid = argument2;
var region_list = argument3;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

assert(width == ds_grid_width(region_grid));
assert(height == ds_grid_height(region_grid));

for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        region_grid[# i, j] = -2 + !!walkable_tiles[grid[# i, j]];
    }
}

var region_count = 0;
for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        if (region_grid[# i, j] == -1) {
            var cur_id = region_count++;
            var cur_size = ds_grid_flood_fill(region_grid, i, j, cur_id);
            
            var region = ds_map_create();
            region[? "size"] = cur_size;
            region[? "id"] = cur_id;
            ds_map_add_list(region, "tiles", List(Position(i, j)));
            
            ds_list_add(region_list, region);
        } else if (region_grid[# i, j] >= 0){
            var region = region_list[| region_grid[# i, j]];
            var tile_list = region[? "tiles"];
            ds_list_add(tile_list, Position(i, j));
        }
    }
}

cout("region sort time: ", current_time-time, "ms");

return region_count;
