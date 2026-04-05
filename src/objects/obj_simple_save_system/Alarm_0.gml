/// @desc Check/Save

// Take a NEW snapshot of the current data
var _current_snapshot = json_stringify(SAVE);

// Compare the new snapshot to the old one. Did anything change?
if (_current_snapshot != previous_snapshot) {
	// It changed! Save the game.
	save_game();
	
	// Update our old snapshot
	previous_snapshot = _current_snapshot; 
}

// Reset the timer
alarm[0] = check_freq;