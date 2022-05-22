 /// @description Insert description here
// You can write your code in this editor
event_inherited();
x = (global.screenWidth/2 - (sprite_height/4) + sprite_width);
y = global.screenHeight - (sprite_width/2) - 3;

image_angle = 90;

function pressed()
{
	image_xscale = 2
	image_yscale = 2
	ctrl.down();
}