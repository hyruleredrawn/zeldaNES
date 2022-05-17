// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_windowSetup(){
	// Window Setup
	gpu_set_tex_filter(false);
	window_set_fullscreen(false);
	window_center();
	global.screenWidth = 480		
	global.screenHeight = 270
	global.screen_bordersafe = 20;	// Prevents the window border from escaping
	global.screenScale = 1;
	scr_windowResizeRatio();
}

function scr_windowResizeRatio() {
	global.physical_display_width = display_get_width();	// Get display properties
	global.physical_display_height = display_get_height();
	
	for (i=2; i<20; i++) {	// Calculate best ratio
		if (global.screenWidth * i > global.physical_display_width - global.screen_bordersafe ||
			global.screenHeight * i > global.physical_display_height - global.screen_bordersafe) {
				global.screenScale = i - 1;
				break;
		}
	}
	
	// Adjust viewport scale
	view_wport[view_current] = global.screenWidth * global.screenScale;
	view_hport[view_current] = global.screenHeight * global.screenScale; 
	window_set_size(global.screenWidth * global.screenScale, 
					global.screenHeight * global.screenScale);
}
