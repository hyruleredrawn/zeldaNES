/// @description Draw artist name
if(state == "map")
{
	draw_set_halign(fa_left);
	draw_set_color(c_black)
	draw_text_ext_transformed(nameX+2,nameY+2, "@ " + nameArtist,0,200,2,2,0)
	draw_set_color(c_white)
	draw_text_ext_transformed(nameX,nameY, "@ " + nameArtist,0,200,2,2,0)
}