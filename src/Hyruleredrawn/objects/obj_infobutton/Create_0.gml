/// @description Insert description here
// You can write your code in this editor


function press()
{
	global.info_overlay = !global.info_overlay;
	
	audio_play_sound(sfx_accept,0,false);
	image_xscale  =2;
	image_yscale = 2;
}