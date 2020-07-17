var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var stats = array_create(Tile.LENGTH);
var total = width * height;

for(var i = 0; i < width; ++i) {
    for(var j = 0; j < height; ++j) {
        var type = grid[# i, j];
        stats[type]++;
    }
}

var land_count = total - stats[Tile.WATER];

cout("water%: ", 100*stats[Tile.WATER]/total);
cout("land%: ", 100*land_count/total);
cout("grass%: ", 100*stats[Tile.LAND]/total);
cout("mountain%: ", 100*stats[Tile.MOUNTAIN]/total);
cout("forest%: ", 100*stats[Tile.FOREST]/total);
cout("grass% (of land): ", 100*stats[Tile.LAND]/land_count);
cout("mountain% (of land): ", 100*stats[Tile.MOUNTAIN]/land_count);
cout("forest% (of land): ", 100*stats[Tile.FOREST]/land_count);
