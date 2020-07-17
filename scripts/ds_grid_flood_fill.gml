/// ds_grid_flood_fill(grid, x, y, value)

var grid = argument0;
var x0 = argument1;
var y0 = argument2;
var value = argument3;

var count = 0;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var original = grid[# x0, y0];

var queue = ds_queue_create();
ds_queue_enqueue(queue, Position(x0, y0));

while(!ds_queue_empty(queue)) {
    var p = ds_queue_dequeue(queue);
    var i = PositionX(p);
    var j = PositionY(p);
    if (grid[# i, j] == original) {
        grid[# i, j] = value;
        ++count;
        for(var d = 0; d < 4; ++d) {
            var ii = i + x_dirs[d];
            var jj = j + y_dirs[d];
            if (point_in_rectangle(ii, jj, 0, 0, width-1, height-1)) {
                ds_queue_enqueue(queue, Position(ii, jj));
            }
        }
    }
}

ds_queue_destroy(queue);

return count;
