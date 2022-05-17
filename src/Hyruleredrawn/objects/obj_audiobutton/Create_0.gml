/// @description Insert description here
// You can write your code in this editor
audio = 1
function press()
{
	audio_play_sound(sfx_accept,0,false);
	audio *= -1
	audio_master_gain(0.0)
	if (audio == 1)
	{
		audio_master_gain(0.5)
	}
	image_xscale = 2
	image_yscale = 2
}