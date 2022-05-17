/// @description Insert description here
// You can write your code in this editor
if(toDraw == "artist")
{
	draw_sprite(spr_Map1,0,drawX,drawY)
	draw_sprite(spr_Map2,0,mapTextureX+drawX,drawY)
	draw_sprite(spr_Map3,0,mapTextureX+mapTextureX+256+drawX,drawY)
}

if(toDraw == "original")
{
	draw_sprite(spr_oldMap1,0,drawX,drawY)
	draw_sprite(spr_oldMap2,0,mapTextureX+drawX,drawY)
	draw_sprite(spr_oldMap3,0,mapTextureX+mapTextureX+256+drawX,drawY)
}

if(ctrl.viewmode == 1)
{
	draw_sprite(spr_vignette,0,0,0)
}
if(ctrl.viewmode == 2)
{
	draw_sprite_ext(spr_vignette,0,0,0,1,1,0,0,0.6)
}