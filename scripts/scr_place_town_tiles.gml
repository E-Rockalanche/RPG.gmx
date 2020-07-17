var time = current_time;

var tree_tilemap = Array(4, 5, 4, 5, 7, 6, 7, 6, 2, 1, 2, 1, 3, 2, 3, 2);
var grass_tilemap = Array(-1, -1, -1, 2, -1, -1, 3, 4, -1, 0, -1, 4, 1, 4, 4, 4);

var tileset = -1;
for(var i = 0; i < town_size; i++) {
    for(var j = 0; j < town_size; j++) {
        var tx = 0;
        var ty = 0;
        switch(grid[# i, j]) {
            case TownTile.GRASS:
                tileset = tls_hills;
                // var index = getTileIndex(grid, i, j, false);
                tx = 16;
                ty = 16;
                break;
            
            case TownTile.HOUSE:
                tileset = tls_house;
                tx = 16;
                ty = 32;
                break;
            
            case TownTile.DOOR:
                tileset = tls_house;
                tx = 0;
                ty = 32;
                break;
            
            case TownTile.TREE:
                tileset = tls_trees;
                var bitmask = getTileIndex(grid, i, j, false);
                var index = tree_tilemap[bitmask];
                tx = (index mod 4) * 16;
                ty = (index div 4) * 16;
                if (!(bitmask & $02)) {
                    tile_add(tls_trees, 0, 0, 16, 16, i*16, (j-1)*16, -1);
                }
                break;
            
            case TownTile.TALL_GRASS:
                tileset = tls_tall_grass;
                var bitmask = getTileIndex(grid, i, j, false);
                if (bitmask != -1) {
                    var index = grass_tilemap[bitmask];
                    tx = (index mod 2) * 16;
                    ty = (index div 2) * 16;
                } else {
                    tileset = tls_house;
                    tx = 0;
                    ty = 0;
                }
                break;
        }
        assert(tileset != -1);
        tile_add(tileset, tx, ty, 16, 16, i*16, j*16, 0);
    }
}

cout("town tile time: ", current_time - time, "ms");
