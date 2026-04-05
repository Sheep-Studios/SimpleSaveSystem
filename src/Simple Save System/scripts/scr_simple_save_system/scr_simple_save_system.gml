/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
* SIMPLE SAVE SYSTEM by Sheep Studios 
* Just drop this script into your project and it works! 
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
*/

// --- System Settings ---
global.save_filename = "simple-save-system.dat";
#macro SAVE global.save_data

// --- YOUR VARIABLES HERE ---
// Anything added to the SAVE struct is saved auto-magically!
// Note: These values represent the starting state for a fresh game.
SAVE = {
	gold:		100,
	cool_peeps:	["Henry"],
};



#region 2. CORE SAVE/LOAD FUNCTIONS

	/// Converts SAVE to JSON, encodes it, and writes to local storage.
	function save_game() {
		// Convert to string and scramble (Base64)
		var _json_string = json_stringify(SAVE);
		var _encoded_data = base64_encode(_json_string);
	
		// Write to file
		var _file = file_text_open_write(global.save_filename);
		file_text_write_string(_file, _encoded_data);
		file_text_close(_file);
	
		show_debug_message(">> SIMPLE SAVE SYSTEM: Saved Successfully!");
	}

	/// Reads the file, unscrambles it, and merges data into SAVE.
	function load_game() {
		// If no file exists, we just stick with the default values!
		if (!file_exists(global.save_filename)) return;

		var _file = file_text_open_read(global.save_filename);
		var _save_string = "";
	
		while (!file_text_eof(_file)) {
			_save_string += file_text_read_string(_file);
			file_text_readln(_file);
		}
		file_text_close(_file);
	
		// Unscramble the data
		var _decoded_string = base64_decode(_save_string);
	
		// Safety Net: Merge loaded data into our defaults
		try {
			var _loaded_data = json_parse(_decoded_string);
			var _names = struct_get_names(_loaded_data);
		
			for (var i = 0; i < array_length(_names); i++) {
				var _key = _names[i];
				SAVE[$ _key] = _loaded_data[$ _key];
			}
		
			show_debug_message(">> SIMPLE SAVE SYSTEM: Save Loaded!");
		} catch (_exception) {
			show_debug_message(">> SIMPLE SAVE SYSTEM: WARNING! Save file is a corrupted--discarding.");
		}
	}

	/// Resets the game data to defaults.
	global.save_start = json_stringify(SAVE);
	function reset_save() {
		SAVE = json_parse(global.save_start);
		
		save_game();
		
		show_debug_message(">> SIMPLE SAVE SYSTEM: Game state reset to defaults!");
	}

#endregion


#region 3. AUTOMATIC BOOTSTRAPPER (Do Not Edit)
// ----------------------------------------------------------------------------------
// This section handles the "Plug & Play" magic. 
// It waits for the engine to wake up, then spawns the controller.
// ----------------------------------------------------------------------------------

var _init_timer = time_source_create(time_source_global, 0, time_source_units_frames, function() {
		
	// Spawn the controller if it doesn't exist yet
	instance_create_depth(0, 0, 0, obj_simple_save_system);
});

time_source_start(_init_timer);


#endregion