// Step Event for obj_button

// Check if the mouse is over the button (using room coordinates)
hovering = position_meeting(mouse_x, mouse_y, id);

// Detect mouse click (when the left mouse button is pressed)
if (mouse_check_button_pressed(mb_left) && hovering) {
    clicked = true;  // Button is clicked
    // You can add actions to perform here (e.g., opening a menu, changing a variable, etc.)
    audio_play_sound(snd_buttonClick, 1, false, 0.5);  // Play the sound on click
    show_debug_message("Button Clicked!");
	if(!audio_is_paused(snd_backgroundMusic))
	{
		audio_pause_all()
		obj_game_manager.play_audio = false
	}
	else if(obj_game_manager.game_type != 5 && obj_game_manager.game_type != 6)
	{
		audio_resume_all()
		obj_game_manager.play_audio = true
	}
}


// Reset click state when the mouse button is released
if (mouse_check_button_released(mb_left)) {
    clicked = false;
}

// Change button's image based on mouse state
if (clicked) {
    image_index = 2; // Set image to clicked state (frame 2)
} else if (hovering) {
    image_index = 1; // Set image to hovered state (frame 1)
} else {
    image_index = 0; // Set image to normal state (frame 0)
}
