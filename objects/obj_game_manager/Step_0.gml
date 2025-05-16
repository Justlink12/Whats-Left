/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_pause_menu) && !instance_exists(obj_limb_menu))
{
	if(game_clock < DAY_LEN)
	{
		game_clock++	
	}
	else
	{
		game_clock = 0
		prior_cyc = cur_cyc
		cur_cyc++
		if(cur_cyc > array_length(weather)-1)
		{
			cur_cyc = 0	
		}
		fade = true
	}

	if(fade)
	{
		weather[prior_cyc].image_alpha -= fade_rate
		if(prior_cyc == 0 && !instance_exists(obj_background_night_bg))
		{
			instance_create_depth(0,0,-50,obj_background_night_bg)
		}
		if(prior_cyc == 0 && instance_exists(obj_background_night_bg))
		{
			obj_background_night_bg.image_alpha += fade_rate
		}
		if(prior_cyc == 1 && instance_exists(obj_background_night_bg))
		{
			obj_background_night_bg.image_alpha -= fade_rate
		}
		if(weather[prior_cyc].image_alpha <= 0)
		{
			weather[prior_cyc].depth = weather[prior_cyc].back_depth
			weather[prior_cyc].image_alpha = 1
			weather[cur_cyc].depth = weather[cur_cyc].need_depth
			fade = false
			if(prior_cyc == 1 && instance_exists(obj_background_night_bg))
			{
				instance_destroy(obj_background_night_bg)
			}
		}
	}
}