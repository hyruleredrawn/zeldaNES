 /// @description Insert description here
// You can write your code in this editor
event_inherited();
x = global.screenWidth - (sprite_height/4) -3;
y = global.screenHeight/2 - (sprite_width/2);

image_angle = 180;

function pressed()
{
	image_xscale = 2
	image_yscale = 2
	ctrl.right();
}