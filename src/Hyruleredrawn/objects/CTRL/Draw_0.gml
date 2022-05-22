/// @description Draw credits
if (state == "map")
{
	// Draw Artist Name
	draw_set_halign(fa_left);
	draw_set_color(c_black)
	draw_text_ext_transformed(nameX+2,nameY+2, "@ " + nameArtist,0,200,2,2,0)
	if (link == "") {draw_set_color(c_grey);}	// Greyout linkless text
	else {	// Text Highlighting
		if (global.mouse_over_name) {draw_set_color(c_aqua);} // (global depends on "obj_name")
		else {draw_set_color(c_white);}}
	draw_text_ext_transformed(nameX,nameY, "@ " + nameArtist,0,200,2,2,0)
}

if (global.info_overlay) {
	
	var text_posy = room_height/2 + 40;
	var text_posh = 14 *3;
	
	if (mouse_x >= 0 && mouse_x < room_width &&
	mouse_y >= text_posy && mouse_y < text_posy + text_posh) 
		{
			mouse_over_info = true;
		}
	else {mouse_over_info = false;}
	
	// Draw team credits
	var team_credits = "Project organized by IllusionOfMana. \nBGM by Tori Roberts. \nInteractive element by Blindeduif and vvvultures."
	draw_set_color(#303030);
	draw_set_alpha(0.5);
	draw_rectangle(0,0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_rectangle(0, text_posy, room_width, text_posy + text_posh, false);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_black)
	draw_text_ext_transformed(room_width/2 + 1, text_posy + 1, team_credits, 14, room_width, 1,1,0);
	if (mouse_over_info) {draw_set_color(c_aqua);} // Link Highlighting
	else {draw_set_color(c_white);}
	draw_text_ext_transformed(room_width/2, text_posy, team_credits, 14, room_width ,1,1,0);
}
