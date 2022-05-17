/// @description Insert description here
// You can write your code in this editor
audio = 1
function press()
{
	audio_play_sound(sfx_accept,0,false);
	image_xscale = 2
	image_yscale = 2
	ctrl.change(0);
}