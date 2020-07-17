#define Astar
/// Astar(width, height)

var astar = instance_create(0, 0, obj_astar);
with(astar) {
    width = argument0;
    height = argument1;
    
    parent_grid = ds_grid_create(width, height);
    g_cost_grid = ds_grid_create(width, height);
    flag_grid = ds_grid_create(width, height);
}
return astar;

#define AstarFindPath
/// AstarFindPath(obj_astar, grid, start_x, start_y, goal_x, goal_y, move_costs, diagonal_cost_factor, allow_diagonal)

var time = current_time;

var astar = argument0; // obj_astar
var tile_grid = argument1; // ds_grid
var start_x = argument2; // int
var start_y = argument3; // int

var destroy_astar = false;
if (astar == -1) {
    astar = Astar(ds_grid_width(tile_grid), ds_grid_height(tile_grid));
    destroy_astar = true;
}

var tile_costs = argument6; // float
var allow_diagonal = argument7; // bool

var max_direction = 4 + 4*(!!allow_diagonal);
var found_path = false;

AstarReset(astar);
with(astar) {
    goal_x = argument4; // int
    goal_y = argument5; // int
    diagonal_cost_factor = argument7; // float
    
    var path = ds_stack_create();
    AstarAddPosition(start_x, start_y, 0, -1);
    
    while(!ds_priority_empty(open_list)) {
        var search_position = ds_priority_delete_min(open_list);
        var search_x = PositionX(search_position);
        var search_y = PositionY(search_position);
        
        if (search_x == goal_x && search_y == goal_y) {
            // found goal
            found_path = true;
            break;
        }
        
        flag_grid[# search_x, search_y] = CLOSED;
        var parent_g_cost = g_cost[# search_x, search_y];
        
        for(var d = 0; d < max_direction; d++) {
            var i = search_x + x_dirs[d];
            var j = search_y + y_dirs[d];
            
            if (!point_in_rectangle(i, j, 0, 0, width-1, height-1) || (flag_grid[# i, j] != UNEXPLORED)) {
                continue;
            }
            
            var tile_cost = tile_costs[tile_grid[# i, j]];
            
            if (tile_cost < 0) continue;
            
            g_cost = parent_g_cost + tile_cost;
            
            AstarAddPosition(i, j, g_cost, search_position);
        }
    }
}

var path = -1;
if (found_path) {
    path = AstarBuildPath(astar);
}
if (destroy_astar) {
    instance_destroy(astar);
}
cout("astar time: ", current_time-time, "ms");
return path;

#define AstarAddPosition
/// AstarAddPosition(x, y, g_cost, parent_position)

// private function of obj_astar

var i = argument0;
var j = argument1;
var g_cost = argument2;
var parent_position = argument3;

var dx = abs(goal_x - i);
var dy = abs(goal_y - j);

var min_distance = min(dx, dy);

var h_cost = MINIMUM_COST * (max(dx, dy) - min_distance + diagonal_cost_factor * min_distance);

flag_grid[# i, j] = OPEN;
g_cost_grid[# i, j] = g_cost;
parent_grid[# i, j] = parent_position;

ds_priority_add(open_list, Position(i, j), g_cost + h_cost);

#define AstarReset
/// AstarReset(obj_astar)

with(argument0) {
    ds_grid_clear(flag_grid, UNEXPLORED);
}

#define AstarBuildPath
with(argument0) {
    var path = ds_stack_create();
    
    var i = goal_x;
    var j = goal_y;
    var parent_position;
    
    do {
        parent_position = parent_grid[# i, j];
        if (parent_position != -1) {
            ds_stack_push(path, Position(i, j));
            i = PositionX(parent_position);
            j = PositionY(parent_position);
        }
    } until(parent_position == -1);
    
    return path;
}