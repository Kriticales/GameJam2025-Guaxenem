// Move
x += moveX;
y += moveY;

// Check if it's at start position
if (going_to_start && point_distance(x, y, startX, startY) < current_speed) {
	going_to_start = false;
	current_speed = 0;
	alarm[0] = wait_time;
	show_debug_message("Tawo")
}
// Check if it's at ending position
else if (!going_to_start && point_distance(x, y, endX, endY) < current_speed) {
	going_to_start = true;
	current_speed = 0;
	alarm[0] = wait_time;
	show_debug_message("Inserty")
}

