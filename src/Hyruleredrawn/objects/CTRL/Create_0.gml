/// @description Grand ol' initialization
// You can write your code in this editor
// SET GLOBALSSETTINGS

// Singleton
global.CTRL = self;

// Window Setup
scr_windowSetup();

window_lastx = window_get_width();
window_lasty = window_get_height();

// Audio Setup
global.audio_default_gain = 0.5;
audio_master_gain(global.audio_default_gain);
audio_play_sound(bgm_title,1,true);

//VARIABLES
hStep = 256;
vStep = 176;

objtv = noone
viewmode = 0;

posX = 7;
posY = 7;
previousPosX =7;
previousPosY =7;

marginY = 48 
marginX = 108

nameY = 240	// Name field position
nameX = 265

wxPadding = 20;	// Button border
wyPadding = 15;
bxSpacing = 30; // Button spacing
bzSpacing = -100; // Button depth

depth = -90;	// CTRL depth (and its drawn elements)

global.info_overlay = false;
mouse_over_info = false;

enum buttonOrder {	// Manage button order
	fs,
	shader,
	audio,
	info,
	change,
}

state = "title"		// Current 'screen'

draw_set_font(fnt_alttp);
title = instance_create_depth(global.screenWidth/2,global.screenHeight/2, bzSpacing,obj_title) // Title card
title.ctrl = self

// Instantiate navigation buttons
if (global.os_mode != "HTML5") {
	objfs = instance_create_depth(global.screenWidth - bxSpacing * buttonOrder.fs - wxPadding,
									wyPadding, bzSpacing, obj_fullscreen); // Fullscreen
	objfs.ctrl = self
}
else {
	// Since we're removing this button, shift the other buttons over with it
	wxPadding -= bxSpacing;
}

objshader = instance_create_depth(global.screenWidth - bxSpacing * buttonOrder.shader - wxPadding,
									wyPadding, bzSpacing, obj_shader); // Shader
objshader.ctrl = self;

audio = instance_create_depth(global.screenWidth - bxSpacing * buttonOrder.audio - wxPadding,
								wyPadding, bzSpacing, obj_audiobutton) // Audio
audio.ctrl = self;

info = instance_create_depth(global.screenWidth - bxSpacing * buttonOrder.info - wxPadding,
								wyPadding, bzSpacing, obj_infobutton) // Audio
info.ctrl = self;

// CREATE MAP & LOAD ALL DATA
function fnc_start()
	{
	audio_stop_all();				// Mute title audio
	audio_play_sound(bgm,1,true)	// Run game bgm
	fnc_spawnArrows();				// Create nav arrows
	
	namebox = instance_create_depth(268,235,3,obj_name)  // Name plate
	namebox.ctrl = self
	
	objchange = instance_create_depth(global.screenWidth - bxSpacing * buttonOrder.change - wxPadding,
										wyPadding, bzSpacing, obj_mapchange) // Change button
	objchange.ctrl = self

	map = instance_create_depth(0,0,2,obj_map) 
	map.ctrl = self;
	map.drawX = marginX - (posX * hStep)
	map.mapX = marginX - (posX * hStep)
	map.drawY = marginY - (posY * vStep)
	map.mapY = marginY - (posY * vStep)
	map.toDraw = "artist"
	
	var initLink = "https://discord.gg/nWj8jGEA"; // First link used
	link = initLink;
	
	entryButton = false;
	dungeon = -1			// Current accessed dungeon

	// Import Overworld arrays
	artistArrayOverworld = scr_artistArrayOverworld();
	artistArrayURLOverworld = scr_artistURLArrayOverworld();
	artistArrayOverworldLength = array_length(artistArrayOverworld)
	
	// Setup Dungeon arrays
	artistArrayDungeon = [
		"Zaebucca ",
		"Tippedchair",
		"Sazdx",
		"PeepingOwl",
		"AtticusFinn",
		"Pikabhooooo",
		"FullMetalBrando",
		"Crowno",
		"Juanito"
	]
	
	artistArrayURLDungeon = [
		"https://bsky.app/profile/zaebucca.itch.io",
		"https://bsky.app/profile/tippedchair.bsky.social",
		"https://linktr.ee/SazdxHikari",
		"https://bsky.app/profile/peepingowl.bsky.social",
		"https://linktr.ee/atticusfinn",
		"https://www.artstation.com/merlinmuret",
		"https://linktr.ee/brandoparm",
		"https://crowno.carrd.co/",
		"https://bsky.app/profile/juanitomedinart.bsky.social"
	]

	// Prepare map data storage from prepared Overworld arrays
	mapData = ds_grid_create(16,8);
	for(var i = 0; i <= 15; i++)
	{
		for (var j = 0; j <= 7; j++)
		{
			var artistData = instance_create_depth(0,0,0,obj_artistData);
			artistData.artistName = "unknown" + " " + string(i) + " , " + string(j);
			artistData.link = initLink;
			artistData.entry = -1;
		
			var getN = (j*16) + i;
			if ( getN < artistArrayOverworldLength)
			{
				artistData.artistName = artistArrayOverworld[getN];
				artistData.link = artistArrayURLOverworld[getN];
				
				// Dungeons
				if(i = 7 && j== 3)	
					artistData.entry = 1;
				if(i = 12 && j== 3)
					artistData.entry = 2;
				if(i = 4 && j== 7)
					artistData.entry = 3;
				if(i = 5 && j== 4)
					artistData.entry = 4;
				if(i = 11 && j== 0)
					artistData.entry = 5;
				if(i = 2 && j== 2)
					artistData.entry = 6;
				if(i = 2 && j== 4)
					artistData.entry = 7;
				if(i = 13 && j== 6)
					artistData.entry = 8;
				if(i = 5 && j== 0)
					artistData.entry = 9;
				
			}
		
			ds_grid_add(mapData, i,j, artistData)
			var artistReadData = ds_grid_get(mapData,i,j)
			show_debug_message(artistReadData.artistName)
		}
	}
	state = "map"
	posCheck();
}

// Swap between NES and Redraw views
function change()
{
	if (map.toDraw == "artist")
	{
		map.toDraw = "original"
	}
	else if (map.toDraw == "original")
	{
		map.toDraw = "artist"
	}
	show_debug_message("change= " + map.toDraw);
}

// Shift mapview down
function down()
{
	previousPosY = posY;
	previousPosX = posX;
	if(posY < 7)
	{
		posY++
		posCheck()
	}
	else
	{
		posY = 0;
		posCheck()
	}
}

// Shift mapview up
function up()
{
	previousPosY = posY;
	previousPosX = posX;
	if(posY > 0)
	{
		posY--;
		posCheck();
	}
	else
	{
		posY = 7;
		posCheck();
	}
}

// Shift mapview left
function left()
{
	previousPosY = posY;
	previousPosX = posX;
	if(posX > 0)
	{
		posX--;
		posCheck();
	}
	else
	{
		posX = 15;
		posCheck();
	}
}

// Shift mapview right
function right()
{
	previousPosY = posY;
	previousPosX = posX;
	if(posX > 14)
	{
		posX = 0;
		posCheck();
	}
	else
	{
		posX++;
		posCheck();
	}
}

// Read data based on current position
function posCheck()
{
	show_debug_message(string(previousPosX) + " prevX , " + string(previousPosY)+ " prevY")
	show_debug_message(string(posX) + " X , " + string(posY) + " Y " )
	map.mapX = marginX - (posX * hStep);
	map.mapY = marginY - (posY * vStep);
	audio_play_sound(sfx_paper,0,false);
	
	var artistReadData = ds_grid_get(mapData, posX, posY)
	nameArtist = artistReadData.artistName;
	link = artistReadData.link;
		
	var artistReadData = ds_grid_get(mapData,posX,posY)
	show_debug_message(artistReadData.artistName)
	

	if (posX == 3 && posY == 4 ||
		posX == 9 && posY == 3)	// Fairy Fountain 
	{
		audio_stop_all();
		audio_play_sound(bgm_fairy,1,true);
	}
	if (previousPosX == 3 && previousPosY == 4 ||
		previousPosX == 9 && previousPosY == 3 ) // Exit Fairy Fountain
	{
		audio_stop_all();
		audio_play_sound(bgm,1,true);
	}
	
	if(instance_exists(obj_entryButton))
	{
		instance_destroy(obj_entryButton)
		dungeon = -1;
	}
	if(artistReadData.entry != -1)
	{
		entryButton = instance_create_depth(251,230, bzSpacing, obj_entryButton) 
		entryButton.dungeon = artistReadData.entry
		dungeon = artistReadData.entry
		entryButton.ctrl = self
	}
}

// Open artist html link
function pressOnArtist()
{
	if (link != "")	url_open_ext(link,"_blank");
}

// Generate navigational arrows
function fnc_spawnArrows()
{
	a_down = instance_create_depth(0,0,-100,obj_arrowdown);
	a_down.ctrl = self;
	a_up = instance_create_depth(0,0,-100,obj_arrowup);
	a_up.ctrl = self;
	a_right = instance_create_depth(0,0,-100,obj_arrowright);
	a_right.ctrl = self;
	a_left = instance_create_depth(0,0,-100,obj_arrowleft);
	a_left.ctrl = self;
	
	// Assign buttons to touch zones
	for (var i = 0; i< instance_number(obj_touch_zone); i++) 
	{
		var zone = instance_find(obj_touch_zone, i);
		switch (zone.location) 
		{
			case "left": zone.arrow_button = a_left; break;
			case "right": zone.arrow_button = a_right; break;
			case "top": zone.arrow_button = a_up; break;
			case "bottom": zone.arrow_button = a_down; break;
			default: break;
		}
	}
}

// Eliminate navigational arrows
function fnc_despawnArrows()
{
	instance_destroy(a_down	); 
	instance_destroy(a_up	);
	instance_destroy(a_right);
	instance_destroy(a_left	);
}

// Enter a dungeon from the overworld
function entry()
{
	fnc_despawnArrows()
	audio_stop_all()
	audio_play_sound(bgm_dungeon,1,true);
	audio_play_sound(sfx_stairs,0,false);
	nameArtist = artistArrayDungeon[(dungeon-1)];
	link = artistArrayURLDungeon[(dungeon-1)];
	bossRoom = instance_create_depth(global.screenWidth/4,global.screenHeight/8,1,obj_dungeon) 
	var spr = asset_get_index("spr_boss"+ string(dungeon));
	bossRoom.sprite_index = spr;

	show_debug_message("entering Dungeon " + string(dungeon));
}

// Exit a dungeon back to the overworld
function returnToMap()
{
	if(instance_exists(bossRoom))
	{
		instance_destroy(bossRoom);
	}
	fnc_spawnArrows()
	audio_stop_all()
	audio_play_sound(sfx_stairs,0,false);
	audio_play_sound(bgm,1,true)
	show_debug_message("Exiting Dungeon " + string(dungeon) )
	posCheck();
}

// Toggle shader display
function shader()
{
	viewmode++
	if( viewmode == 2)	// CRT Filter
	{
		if(instance_exists(objtv) == false)
		{
			objtv = instance_create_depth(0,0,-100,obj_OLDTVFilter_RGB)
		}
		else
		{
			gpu_set_tex_filter(true);
			global.oldtvfilter_enabled = true;
			//application_surface_draw_enable(false)
		}
	}
	
	if (viewmode > 2) // Wrap viewmode
	{
		// Clear CRT filter
		if(instance_exists(objtv)) instance_destroy(objtv);
		global.oldtvfilter_enabled = false;
		gpu_set_tex_filter(false);
		application_surface_draw_enable(true);
		
		// Loop integer
		viewmode = 0;
	}
}

// Toggle fullscreen
function fullscreen()
{
	if(window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}