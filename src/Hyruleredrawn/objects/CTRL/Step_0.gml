/// @description Insert description here
// You can write your code in this editor

// Adapt viewport size on screen resize when running in browser
if (!window_get_fullscreen() && global.os_mode == "HTML5") {
	if (window_lastx != window_get_width() || window_lasty = window_get_height()) {
		scr_windowResizeRatio();
	} else {
		window_lastx = window_get_width();
		window_lasty = window_get_height();
	}
}
