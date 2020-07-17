var low = argument0;
var high = argument1;
for(var layer = low; layer <= high; layer++) {
    tile_layer_delete(layer);
}
