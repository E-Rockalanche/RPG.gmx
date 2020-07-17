randomize();

// dirs 1 record coordinate directions first, then diagonals
// dirs 2 records counter clockwise from angle 0
globalvar x_dirs, y_dirs, x_dirs2, y_dirs2;
x_dirs = Array(1, 0, -1, 0, 1, -1, -1, 1);
y_dirs = Array(0, -1, 0, 1, -1, -1, 1, 1);
x_dirs2 = Array(1, 1, 0, -1, -1, -1, 0, 1);
y_dirs2 = Array(0, -1, -1, -1, 0, 1, 1, 1);

enum Tile {
    WATER,
    LAND,
    MOUNTAIN,
    DESERT,
    FOREST,
    GRASS,
    LAKE,
    RIVER,
    
    LENGTH
};

enum TownTile {
    GRASS,
    TALL_GRASS,
    HOUSE,
    DOOR,
    TREE,
    WATER,
    BRIDGE,
    BUSH,
    
    LENGTH
};

globalvar tilemap;
tilemap = Array(-1, -1, -1, 6, -1, -1, 8, 7, -1, 0, -1, 3, 2, 1, 5, 4);
tilemap[16] = 10;
tilemap[17] = 9;
tilemap[18] = 12;
tilemap[19] = 13;

globalvar default_birth_rules, default_survive_rules;
default_birth_rules = Array(0, 0, 0, 0, 0, 1, 1, 1, 1);
default_survive_rules = Array(0, 0, 0, 0, 1, 1, 1, 1, 1);

enum Rect {
    LEFT,
    TOP,
    WIDTH,
    HEIGHT
};
