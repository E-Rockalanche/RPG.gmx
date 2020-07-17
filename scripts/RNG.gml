#define RNG
/// RNG(seed)

var seed = argument0;
var state = array_create(4);
state[0] = $f1ea5eed;
state[1] = seed;
state[2] = seed;
state[3] = seed;
repeat(20) {
    rngNextValue(state);
}
return state;

#define rngNextValue
var state = argument0;
var e = state[0] - ((state[1] << 27) | (state[1] >> 5));
state[@ 0] = state[1] ^ ((state[2] << 17) | (state[2] >> 15));
state[@ 1] = state[2] + state[3];
state[@ 2] = state[3] + e;
state[@ 3] = state[0] + e;
return state[3] & $7fffffff;

#define rngRandom
/// rngRandom(rng, n)

var rng = argument0;
var n = argument1;
var r;
do{
    r = (rngNextValue(rng) / RAND_MAX) * n;
} until(r < n);
return r;

#define rngRandomRange
/// rngRandomRange(rng, low, high)

var rng = argument0;
var low = argument1;
var high = argument2;
return low + rngRandom(rng, high-low);

#define rngIRandom
/// rngIRandom(rng, n)

var rng = argument0;
var n = argument1;
var d = RAND_MAX div (n+1);
var r;
do{
    r = rngNextValue(rng) div d;
} until (r <= n);
return r;

#define rngIRandomRange
/// rngIRandomRange(rng, low, high)

var rng = argument0;
var low = argument1;
var high = argument2;
return low + rngIRandom(rng, high - low);