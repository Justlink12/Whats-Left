/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_pause_menu) && obj_player.energies[0] >= 25)
{
	var is_event = floor(random(10000))
	var quote_num = irandom(10)
	if((is_event == 67) && !weath_evnt && weath_time <= 0 && !player_react)
	{
		sand = true
		weath_evnt = true
		weath_time = SAND_LEN
		weather_quote = obj_game_manager.dust[quote_num]
		obj_storm_sign.current_weath = "Sandstorm"
		obj_player.spd_adjust = SPD_CHANGE
	}
	if((is_event == 120) && !weath_evnt && weath_time <= 0 && obj_game_manager.cur_cyc == 1 && !player_react)
	{
		meteor = true
		weath_evnt = true
		weath_time = METEOR_LEN
		weather_quote = obj_game_manager.meteor[quote_num]
		obj_storm_sign.current_weath = "Meteor Shower"
	}
	if((is_event == 456) && !weath_evnt && weath_time <= 0 && obj_game_manager.cur_cyc == 1 && !player_react)
	{
		moon = true
		weath_evnt = true
		weath_time = MOON_LEN
		weather_quote = obj_game_manager.moon[quote_num]
		obj_player.extra_chrg = MOON_AI_EX
		obj_player.less_chrg = MOON_PL_PASS
		obj_storm_sign.current_weath = "Full Moon"
		if(audio_is_playing(snd_moon))
		{
			audio_sound_gain(snd_moon,1,600)	
		}
	
	}
	if((is_event == 674) && !weath_evnt && weath_time <= 0 && obj_game_manager.cur_cyc == 0 && !player_react)
	{
		sun = true
		weath_evnt = true
		weath_time = SUN_LEN
		obj_player.less_chrg = 0.01
		weather_quote = obj_game_manager.flare[quote_num]
		obj_storm_sign.current_weath = "Solar Flare"
	
	}

	if((is_event == 74) && !weath_evnt && weath_time <= 0 && obj_game_manager.cur_cyc == 0 && !player_react)
	{
		rain = true
		weath_evnt = true
		weath_time = RAIN_LEN
		obj_player.less_chrg = RAIN_PL_PASS
		weather_quote = obj_game_manager.rain[quote_num]
		obj_storm_sign.current_weath = "Nitrogen Rain"
	}
	
	if((is_event == 5) && !weath_evnt && weath_time <= 0 && obj_game_manager.cur_cyc == 0 && !player_react)
	{
		tornado = true
		weath_evnt = true
		weath_time = TORN_LEN
		obj_player.less_chrg = TORN_PL_PASS
		obj_player.spd_adjust = SPD_CHANGE
		obj_player.can_charge = TORN_AI_CHG
		weather_quote = obj_game_manager.tornado[quote_num]
		obj_storm_sign.current_weath = "Tornado"
	}
	if((is_event == 6) && !weath_evnt && weath_time <= 0 && !player_react)
	{
		volcano = true
		weath_evnt = true
		weath_time = TORN_LEN
		obj_player.less_chrg = VOLC_PL_PASS
		obj_player.can_charge = VOLC_AI_CHG
		weather_quote = obj_game_manager.volcano[quote_num]
		obj_storm_sign.current_weath = "Eruption"
	}
	if((is_event == 76) && !weath_evnt && weath_time <= 0 && !player_react)
	{
		light = true
		weath_evnt = true
		weath_time = LIGHT_LEN
		//obj_player.less_chrg = VOLC_PL_PASS
		obj_player.can_charge = LIGHT_AI_CHG
		weather_quote = obj_game_manager.electromagnetic[quote_num]
		obj_storm_sign.current_weath = "Lightning"
	}
	if((is_event == 420) && !weath_evnt && weath_time <= 0 && !player_react)
	{
		quake = true
		weath_evnt = true
		weath_time = QUAKE_LEN
		//obj_player.less_chrg = VOLC_PL_PASS
		weather_quote = obj_game_manager.earthquake[quote_num]
		obj_storm_sign.current_weath = "Earthquake"
	}
}

