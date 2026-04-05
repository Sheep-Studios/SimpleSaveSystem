/// @desc Draw the Data (The Clean Way)

var _draw_x = room_width / 2;
var _line_height = 20; // One variable to rule all your spacing!

// --- 1. SET UP ---
draw_set_halign(fa_center);
draw_set_valign(fa_top); // Good habit to set this too!
draw_set_color(c_black);

// --- 2. HEADER & STATS ---
draw_text(_draw_x, 0, "--- SIMPLE SAVE SYSTEM DEMO ---");
draw_text(_draw_x, 40, "SAVE.gold = " + string(SAVE.gold));
draw_text_ext(_draw_x, 60, "SAVE.cool_peeps = " + string(SAVE.cool_peeps), _line_height, 400);

// --- 3. INSTRUCTIONS (THE ARRAY METHOD) ---
draw_set_color(c_purple);
var _yy = 140;

draw_text(_draw_x, _yy, "CONTROLS:");

// Storing controls in an array makes adding/removing them a breeze
var _controls = [
    "UP/DOWN: +/- 10 Gold",
    "ENTER: Add Random Person",
    "BACKSPACE: Remove Person",
    "S: Manual Save"
];

// Loop through the array and draw each line
for (var i = 0; i < array_length(_controls); i++) {
    draw_text(_draw_x, _yy + 20 + (i * _line_height), _controls[i]);
}