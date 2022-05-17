/// @description Insert description here
// You can write your code in this editor
audio = 1
entered = false;
function press()
{
	image_xscale = 2
	image_yscale = 2
	image_angle += 180;
	if ( entered = false)
	{
		ctrl.entry(0);
		entered = true;
	}
	else
	{
		ctrl.returnToMap();
		entered = false;
	}
}