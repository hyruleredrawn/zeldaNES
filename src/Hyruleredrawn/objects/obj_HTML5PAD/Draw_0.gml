/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_normal);
var promptText = "Click to Start";
var promptText2 = "(runs best on desktop)";
draw_set_color(c_black);
//draw_text(room_width/2, room_height/2 + 1, promptText);
draw_set_color(c_white);
draw_text(room_width/2, room_height/2, promptText);
draw_set_font(fnt_normal_sm);
draw_text(room_width/2, room_height*3/4, promptText2);
draw_set_valign(fa_top);
