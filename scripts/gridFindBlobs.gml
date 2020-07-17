/// gridFindBlobs(grid, value)

var grid = argument0;
var value = argument1;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var id_grid = ds_grid_create(width, height);
for(var i = 0; i < width; i++) {
    for(var j = 0; j < height; j++) {
        if (grid[# i, j] == value) {
            id_grid[# i, j] = 1;
        }
    }
}

var next_id = 2;

var blob_list = ds_list_create();

for(var i = 0; i < width; i++) {
    for(var j = 0; j < height; j++) {
        var cur_id = id_grid[# i, j];
        if (cur_id == 1) {
            ds_grid_flood_fill(id_grid, i, j, next_id++);
            ds_list_add(blob_list, List(Position(i, j)));
        } else if (cur_id > 1) {
            var index = cur_id - 2;
            var tile_list = blob_list[| index];
            ds_list_add(tile_list, Position(i, j));
        }
    }
}

ds_grid_destroy(id_grid);

return blob_list;
