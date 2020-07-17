var time = current_time;

var tileset_array = array_create(Tile.LENGTH);
tileset_array[Tile.WATER] = tls_ocean;
tileset_array[Tile.MOUNTAIN] = tls_mountain;
tileset_array[Tile.FOREST] = tls_forest;
tileset_array[Tile.DESERT] = tls_desert;
tileset_array[Tile.GRASS] = tls_grass;
tileset_array[Tile.LAKE] = tls_lake;

var has_corner_tiles = array_create(Tile.LENGTH);
has_corner_tiles[Tile.WATER] = true;
has_corner_tiles[Tile.DESERT] = true;
has_corner_tiles[Tile.GRASS] = true;

for(var j = 0; j < 256; ++j) {
    for(var i = 0; i < 256; ++i) {
        var tile = grid[# i, j];
        if (tile == Tile.LAND) {
            tile_add(bkr_land, 0, 0, 16, 16, i*16, j*16, 0);
        } else if (tile != Tile.RIVER) {
            var index = tilemap[getTileIndex(grid, i, j, has_corner_tiles[tile])];
            if (tile != Tile.WATER || index != 4) {
                var tx = (index mod 3)*16;
                var ty = (index div 3)*16;
                tile_add(tileset_array[tile], tx, ty, 16, 16, i*16, j*16, 0);
            }
        }
    }
}

cout("tile time: ", current_time-time, "ms");
