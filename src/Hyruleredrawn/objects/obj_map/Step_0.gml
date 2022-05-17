/// @description Insert description here
// You can write your code in this editor
if(mapY != drawY)
{
	difference = (mapY-drawY)
	add= (difference/6)
	if(abs(difference) < 5)
	{
		drawY = mapY
	}else{
		drawY+= add
	}
}	
if(mapX != drawX)
{
	difference = (mapX-drawX)
	add= (difference/6)
	if(abs(difference) < 5)
	{
		drawX = mapX
	}else{
		drawX+= add
	}
}	

