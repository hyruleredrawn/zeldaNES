/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_alttp);
draw_set_halign(fa_center);
var promptText = "Click to Start!\n\n(runs best on Desktop)";
draw_set_color(c_black);
draw_text(room_width/2, room_height/2 + 1, promptText);
draw_set_color(c_white);
draw_text(room_width/2, room_height/2, promptText);
