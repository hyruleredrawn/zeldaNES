/// @description Insert description here
// You can write your code in this editor

scr_windowSetup();

// Define OS settings
if (os_browser == browser_not_a_browser) {
	global.os_mode = "Desktop";
	room_goto_next(); // Skip pad if not running on a browser
} else {
	global.os_mode = "HTML5";
}
