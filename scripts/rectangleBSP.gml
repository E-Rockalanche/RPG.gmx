/// rectangleBSP(rectangle, min_size, max_size, seperation)

var root_rectangle = argument0;
var min_size = argument1;
var max_size = argument2;
var seperation = argument3;

var rect_list = List(root_rectangle);

var queue = ds_queue_create();

ds_queue_enqueue(queue, root_rectangle);

while(!ds_queue_empty(queue)) {
    var rect = ds_queue_dequeue(queue);
    var position_index, length_index, other_length;
    if (RectangleWidth(rect) > RectangleHeight(rect)) {
        position_index = Rect.LEFT;
        length_index = Rect.WIDTH;
        other_length = RectangleHeight(rect);
    } else {
        position_index = Rect.TOP;
        length_index = Rect.HEIGHT;
        other_length = RectangleWidth(rect);
    }
    
    var min_length = max(other_length div 3, min_size)
    if (rect[? length_index] >= (min_length*2 + seperation)) {
        // rectangle can be split
        if (rect[? length_index] > max_size || chance(50)) {
            // split
            var new_length = irandom_range(min_length, rect[? length_index] - min_length - seperation);
            var create_position = rect[? position_index] + new_length + seperation;
            var create_length = rect[? length_index] - new_length - seperation;
            var new_rect = ds_map_clone(rect);
            rect[? length_index] = new_length;
            new_rect[? length_index] = create_length;
            new_rect[? position_index] = create_position;
            ds_queue_enqueue(queue, rect);
            ds_queue_enqueue(queue, new_rect);
            ds_list_add(rect_list, new_rect);
        }
    }
}

return rect_list;
