/// @desc Initialize...

// --- SINGLETON CHECK ---
// No need to drag this into your first room--it's created auto-majically!
if (instance_number(object_index) > 1) {
	 show_debug_message(">> SIMPLE SAVE SYSTEM: Duplicate controller detected! Self-destructing..\n>> (No need to drag this into your first room, it's created automatically.)");
	 instance_destroy();
	 exit;
}

// Load the game data
load_game();

// Take our first snapshot
previous_snapshot = json_stringify(SAVE);

// Check/save every 3 seconds
check_freq = 3 * game_get_speed(gamespeed_fps);
alarm[0] = check_freq;