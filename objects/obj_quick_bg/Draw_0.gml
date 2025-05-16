/// @description Insert description here
// You can write your code in this editor
draw_self()
if(wait_time > 0)
{
	draw_set_font(quote_font)
	draw_text(920,450,instruct[obj_game_manager.game_type])
}

if(wait_time <= 60 && wait_time  >0)
{
	draw_set_font(quote_font)
	draw_text(960,500,"Start!")
}

if(obj_game_manager.game_type == 0 && start_game && !end_game)
{
	draw_set_font(quote_font)
	//draw_text(980,500,letter_list[trace])

	//draw_text(0,50,countdown)

	draw_text(0,60,pts)
}

if(obj_game_manager.game_type == 1 && !obj_black_load.fade_out)
{
	draw_set_font(quote_font)
	draw_text(50,50,"Ducklings Saved: " +string(trace) + "/5    Ducklings Lost: "+ string(dead_duck))
	if(end_game)
	{
		if(trace==5)
		{
			draw_text(50,100,"You saved all of your ducklings!")
		}
		else if(trace>dead_duck)
		{
			draw_text(50,100,"You saved most of your ducklings!")
		}
		else if(dead_duck==5)
		{
			draw_text(50,100,"You couldn't save any...")
			
		}
		else if(trace<dead_duck)
		{
			draw_text(50,100,"You didn't save enough...")
		}	
	}
}

if(obj_game_manager.game_type == 2 && start_game && !end_game)
{
	draw_set_font(quote_font)
	//draw_text(980,500,letter_list[trace])

	draw_text(30,170,countdown/60)

	draw_text(20,0,"Correct holes: " + string(trace))
}

if(obj_game_manager.game_type == 5 && start_game)
{
	draw_set_font(quote_font)
	draw_set_halign(fa_center)
	draw_text(1000,300,ears[trace])
	draw_set_halign(fa_left)
	
	
}
if(obj_game_manager.game_type == 6)
{
	sprite_index = spr_zoom_1
}
/*if(obj_game_manager.game_type == 6 && start_game)
{
	draw_set_font(quote_font)
	draw_set_halign(fa_center)
	if(!instance_exists(obj_black_1))
	{
		instance_create_depth(500,300,-501,obj_black_1)
	}
	draw_set_color(c_white)
	draw_text(1000,300,eyes[trace])
	draw_set_halign(fa_left)
	draw_set_color(c_black)
}