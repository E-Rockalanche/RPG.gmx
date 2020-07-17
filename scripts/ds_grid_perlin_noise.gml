#define ds_grid_perlin_noise
/// ds_grid_perlin_noise(ds_grid, max_amplitude, frequency, octaves, wrap_x, wrap_y)

var time = current_time;

var grid = argument0; // ds_grid
var max_amplitude = argument1; // float
var frequency = abs(argument2); // int
var octaves = argument3; // int
var wrap_x = argument4; // bool
var wrap_y = argument5; // bool

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var max_dim = max(width, height);

if (octaves <= 0) exit;

if (wrap_x || wrap_y) {
    frequency = ceil(frequency);
}

var x_vectors = array_create(256);
var y_vectors = array_create(256);

for(var n = 0; n < 256; n++) {
    var angle = random(2*pi);
    x_vectors[n] = cos(angle);
    y_vectors[n] = sin(angle);
}

for(var o = 0; o < octaves; ++o) {
    var otime = current_time;
    
    var index_offset = o * 17;
    
    var max_height = ceil(height/frequency);
    var pyt_array = array_create(max_height);
    var y_lerp = array_create(max_height);
    
    if (width/frequency <= 1) {
        break;
    }
    
    cout("octave ", o, " box size: ", width/frequency);
    
    for(var bxl = 0; bxl < frequency; bxl++) {
        var bxr = bxl+1;
        if (wrap_x) {
            bxr = bxr mod frequency;
        }
        var left_offset = (index_offset + bxl)*31;
        var right_offset = (index_offset + bxr)*31;
        
        for(var byt = 0; byt < frequency; byt++) {
            var byb = byt+1;
            if (wrap_y) {
                byb = byb mod frequency;
            }
            
            var v_index_tl = ((left_offset + byt)*53) & 255;
            var v_index_tr = ((right_offset + byt)*53) & 255;
            var v_index_bl = ((left_offset + byb)*53) & 255;
            var v_index_br = ((right_offset + byb)*53) & 255;
            
            var vxtl = x_vectors[v_index_tl];
            var vytl = y_vectors[v_index_tl];
            
            var vxtr = x_vectors[v_index_tr];
            var vytr = y_vectors[v_index_tr];
            
            var vxbl = x_vectors[v_index_bl];
            var vybl = y_vectors[v_index_bl];
            
            var vxbr = x_vectors[v_index_br];
            var vybr = y_vectors[v_index_br];
            
            var start_i = floor(bxl*width/frequency);
            var end_i = floor((bxl+1)*width/frequency);
            var start_j = floor(byt*height/frequency);
            var end_j = floor((byt+1)*height/frequency);
            
            var cur_height = end_j - start_j;
            for(var j = start_j; j < end_j; j++) {
                var pyt = j*frequency/height - byt;
                pyt_array[j-start_j] = pyt;
                y_lerp_array[j-start_j] = noiseLerp(pyt);
            }
            
            for(var i = start_i; i < end_i; i++) {
                var pxl = i*frequency/width - bxl;
                var pxr = pxl - 1;
                var x_lerp = noiseLerp(pxl);
                    
                for(var j = 0; j < cur_height; j++) {
                    var pyt = pyt_array[j];
                    var pyb = pyt - 1;
                    var y_lerp = y_lerp_array[j];
            
                    var value_tl = pxl * vxtl + pyt * vytl;
                    var value_tr = pxr * vxtr + pyt * vytr;
                    var value_bl = pxl * vxbl + pyb * vybl;
                    var value_br = pxr * vxbr + pyb * vybr;
            
                    var value_top = value_tl + x_lerp * (value_tr - value_tl);
                    var value_bottom = value_bl + x_lerp * (value_br - value_bl);
                    var value = value_top + y_lerp * (value_bottom - value_top);
                    
                    grid[# i, j+start_j] += value / frequency;
                }
            }
        }
    }
    
    frequency *= 2;
    
    cout("octave ", o, " time: ", current_time - otime, "ms");
}

var max_value = max(ds_grid_get_max(grid, 0, 0, width-1, height-1), -ds_grid_get_min(grid, 0, 0, width-1, height-1));

ds_grid_multiply_region(grid, 0, 0, width-1, height-1,
    max_amplitude / max_value);

cout("perlin time: ", current_time - time, "ms");

#define noiseLerp
/// noiseLerp(x)

return argument0 * argument0 * argument0 * (10 + argument0 * (-15 + 6 * argument0));