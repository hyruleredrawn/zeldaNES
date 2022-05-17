// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_windowSetup(){
	// Window Setup
	gpu_set_tex_filter(false);
	window_set_fullscreen(false);
	window_set_size(1280,720);
	window_center();
	global.screenWidth = 480		
	global.screenHeight = 270
}