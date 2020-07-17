/// randomClumped(value, clumps)

var remaining = argument0;
var total = 0;
for(var clumps = argument1; clumps > 0; clumps--) {
    var cur = remaining div clumps;
    remaining -= cur;
    total += irandom(cur);
}
return total;
