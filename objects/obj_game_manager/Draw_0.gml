/// @description Insert description here
// You can write your code in this editor
draw_self()
if(!instance_exists(obj_pause_menu))
{
	var _time = game_clock % 5
	if(_time == 1)
	{
		seconds+=1
		if(seconds == 60)
		{
			minutes+=1
			if(minutes >= 24)
			{
				minutes = 0
				hours += 1
			}
			seconds = 0
		}
	}
	sec_str = string(seconds)
	min_str = string(minutes)

	if(seconds < 10)
	{
		sec_str = "0"+string(seconds)	
	}
	if(minutes < 10)
	{
		min_str = "0"+string(minutes)
	}
}
quote_y = camera_get_view_height(view_camera[0])-128

draw_text_color(text_x,text_y,"Distance Traveled: "+string(obj_player.dist_trav)+"m",c_white,c_white,c_white,c_white,1)
draw_text_color(text_x+10,text_y+30,"Day "+string(hours) + "          "+ min_str +":"+sec_str+"",c_white,c_white,c_white,c_white,1)
draw_set_font(quote_font)
//draw_text_color(quote_x,quote_y, obj_weather_manager.weather_quote,c_white,c_white,c_white,c_white,1)
quote_wait += 1


split_quote = string_split(obj_weather_manager.weather_quote, " ")
//show_debug_message(array_length(split_quote))
if(quote_wait == 25 && quote_track < array_length(split_quote) && array_length(split_quote) > 1 && obj_weather_manager.player_react)
{
	quote_build += split_quote[quote_track] + " "
	if(!instance_exists(obj_black))
	{
		instance_create_depth(quote_x,quote_y,-499,obj_black)	
	}
	obj_black.image_xscale += string_length(split_quote[quote_track])/4.25
	quote_x = camera_get_view_width(view_camera[0]) - camera_get_view_width(view_camera[0])

	//quote_y = camera_get_view_height(view_camera[0]) - 128
	quote_track++;
}
else if(!obj_weather_manager.player_react)
{
	quote_track = 0
	if(instance_exists(obj_black))
	{
		instance_destroy(obj_black)
		quote_build = ""
	}
}
if(instance_exists(obj_black))
{
	obj_black.x = quote_x
	obj_black.y = quote_y
	draw_text_color(obj_black.x+10,obj_black.y, quote_build,c_white,c_white,c_white,c_white,1)
}

//draw_text_color(quote_x,quote_y, obj_weather_manager.weather_quote,c_white,c_white,c_white,c_white,1)
draw_set_font(def_font)
if(quote_wait >= 25)
{
	quote_wait = 0	
}