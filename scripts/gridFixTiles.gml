/// gridFixTiles(ds_grid)

/*
attempts to fix groups of non-land tiles
*/

var time = current_time;

var grid = argument0;

var has_corners = array_create(Tile.LENGTH);
has_corners[Tile.WATER] = true;
has_corners[Tile.DESERT] = true;
has_corners[Tile.GRASS] = true;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var good_bitmaps = Array(7, 28, 112, 193);
var good_bitmaps_length = 4;

var bad_corner_bitmaps = array_create(0);
for(var n = 0; n < 4; n++) {
    array_append(bad_corner_bitmaps, rotateByte(55, n*2));
    array_append(bad_corner_bitmaps, rotateByte(103, n*2));
}
for(var n = 0; n < 2; n++) {
    array_append(bad_corner_bitmaps, rotateByte(119, n*2));
}
var bad_corner_bitmaps_length = 10;

for(var j = 1; j < height-1; ++j) {
    for(var i = 1; i < width-1; ++i) {
        var tile = grid[# i, j];
        if (tile != Tile.LAND && tile != Tile.RIVER) {
            var bitmap = 0;
            for(var d = 0; d < 8; d++) {
                var ii = i+x_dirs2[d];
                var jj = j+y_dirs2[d];
                if (grid[# ii, jj] == tile) {
                    bitmap |= 1 << d;
                }
            }
            if (bitmap != 255) {
                var ok = false;
                for(var n = 0; n < good_bitmaps_length; n++) {
                    if (bitmapHasSignature(bitmap, good_bitmaps[n])) {
                        ok = true;
                        break;
                    }
                }
                if (ok) {
                    if (has_corners[tile]) {
                        for(var n = 0; n < bad_corner_bitmaps_length; n++) {
                            if (bitmap == bad_corner_bitmaps[n]) {
                                for(var ii = i; ii < i+2; ii++) {
                                    for(var jj = j; jj < j+2; jj++) {
                                        grid[# ii, jj] = tile;
                                    }
                                }
                                break;
                            }
                        }
                    }
                } else {
                    grid[# i, j] = Tile.LAND;
                }
            }
        }
    }
}

cout("tile fix time: ", current_time-time);
