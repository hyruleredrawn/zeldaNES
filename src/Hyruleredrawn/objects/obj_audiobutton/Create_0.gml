/// @description Insert description here
// You can write your code in this editor
audio = 1
function press()
{
	audio_play_sound(sfx_accept,0,false);
	audio *= -1		// Toggle
	if (audio == 1)		// Audio Enabled
	{
		audio_master_gain(global.audio_default_gain)
		sprite_index = spr_audio;
	} else {			// Audio Muted
		audio_master_gain(0.0)
		sprite_index = spr_audio_mute;
	}
	image_xscale = 2
	image_yscale = 2
}