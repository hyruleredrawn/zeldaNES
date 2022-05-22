/// @description Insert description here
// You can write your code in this editor
if (mouse_x >= x && mouse_x < x+ sprite_width &&
	mouse_y >= y && mouse_y < y+sprite_height) 
	{
		global.mouse_over_name = true;
	}
else {global.mouse_over_name = false;}
