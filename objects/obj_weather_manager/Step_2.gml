/// @description Insert description here
// You can write your code in this editor
if(sand)
{
	
	if(weath_evnt != false)
	{
		dust_alp = 0
		if(obj_game_manager.play_audio)
		{
			audio_play_sound(snd_windy,2,1)
			audio_sound_gain(snd_windy,0,0)
			audio_sound_gain(snd_windy,0.4,500)
		}
		if(instance_exists(obj_sand_fg))
		{
			instance_destroy(obj_sand_fg)
		}
		part_emitter_enable(global.P_System,global.Emit,true)
		//part_particles_create(global.P_System, x, y, global.Dust, 10);
		//part_emitter_enable(global.P_System,global.Emit,true)
		part_emitter_region(global.P_System, global.Emit,-10,-10,0,1000,ps_shape_line,ps_distr_linear)
		part_emitter_stream(global.P_System, global.Emit,global.Dust,5)
		weath_evnt = false
		player_react = true
		obj_player.can_charge = SAND_AI_CHG
		instance_create_depth(0,0,-150,obj_sand_fg)
		obj_sand_fg.image_alpha = 0.01
	}
	
	if(weath_time > 330)
	{
		dust_alp+= 1/30
		obj_sand_fg.image_alpha += 0.01
		part_type_alpha1(global.Dust,dust_alp);
	}
	if(weath_time > 0)
	{
		weath_time -= 1	
	}
	if(weath_time < 70)
	{
		audio_sound_gain(snd_windy,0,200)
		dust_alp-= 1/30
		if(instance_exists(obj_sand_fg))
		{
			obj_sand_fg.image_alpha -= 0.01
		}
		if(instance_exists(obj_sand_fg) && obj_sand_fg.image_alpha <= 0)
		{
			instance_destroy(obj_sand_fg)
		}
		part_type_alpha1(global.Dust,dust_alp);
	}
	if(weath_time <= 0)
	{
		weath_time = 0
		dust_alp = 0
		audio_stop_sound(snd_windy)
		part_type_alpha1(global.Dust,dust_alp);
		part_emitter_enable(global.P_System,global.Emit,false)
		player_react = false
		sand = false
		weather_quote = ""
		obj_player.can_charge = true
		obj_player.spd_adjust = 0
		obj_storm_sign.current_weath = ""
	}
}

if(meteor)
{
	if(weath_evnt)
	{
		weath_evnt = false
		player_react = true
	}
	var rand_x = random_range(0,1900)
	var rand_y = random_range(0,500)
	if(weath_time > 60)
	{
		meteor_spawn_time++
	}
	if(meteor_spawn_time % MET_SPAWN_RATE == 0)
	{
		instance_create_depth(rand_x,rand_y,70,obj_comet_01)

	}
	if(weath_time > 0)
	{
		weath_time -= 1	
	}

	if(weath_time <= 0)
	{
		weath_time = 0
		player_react = false
		meteor = false
		weather_quote = ""
		obj_player.can_charge = true
		obj_storm_sign.current_weath = ""
	}
}

if(moon)
{
	if(weath_evnt)
	{
		audio_play_sound(snd_moon, 2,false,1)
		weath_evnt = false
		player_react = true
		obj_player.can_charge = MOON_AI_CHG
		if(!instance_exists(obj_moon))
		{
			instance_create_depth(1000,1000,97,obj_moon)
			//obj_moon.image_alpha = moon_alpha
		}
	}
	
	if(weath_time > MOON_LEN - 250)
	{
		
		obj_moon.y -= 2.5
		obj_moon.x += 2.15
		moon_alpha += 0.1
		if(instance_exists(obj_background_night_bg))
		{
			obj_background_night_bg.image_alpha = 1 - moon_alpha
		}
	}

	if(weath_time > 0)
	{
		weath_time -= 1	
	}

	if(weath_time <= 250)
	{
		
		
		obj_moon.y -= 2.5
		obj_moon.x += 2.15
		moon_alpha -= 0.1
		obj_player.can_charge = true
	}
	//if(instance_exists(obj_moon))
	//{
		//obj_moon.image_alpha = moon_alpha

	//}
	if(weath_time <= 0 && moon_alpha <= 0)
	{
		player_react = false
		instance_destroy(obj_moon)
		moon = false
		moon_alpha = 0
		weath_time = 0
		weather_quote = ""
		audio_sound_gain(snd_moon,0,600)
		obj_player.extra_chrg = 0
		obj_player.less_chrg = 0
		obj_storm_sign.current_weath = ""
	}
}

if(sun)
{
	if(weath_evnt)
	{
		instance_create_depth(0,655,-601,obj_storm_sign_2)
		weath_evnt = false
		player_react = true
		obj_player.can_charge = SUN_AI_CHG
		if(!instance_exists(obj_sun))
		{
			
			instance_create_depth(370,-512,94,obj_sun)
			//obj_moon.image_alpha = moon_alpha
		}
		audio_play_sound(snd_heatWave,2,1)
		audio_sound_gain(snd_heatWave,0,0)
		audio_sound_gain(snd_heatWave,1,800)
	}
	
	if(weath_time > SUN_LEN - 250)
	{
		
		obj_sun.y += 2.035
		//obj_moon.x += 4.3
		//moon_alpha += 0.1
	}

	if(weath_time > 0)
	{
		weath_time -= 1	
	}

	if(weath_time <= 250)
	{
		
		
		obj_sun.y -= 2.035
		audio_sound_gain(snd_heatWave,0,200)
		obj_player.can_charge = true
		obj_player.less_chrg = 0
		//obj_moon.x += 4.3
		//moon_alpha -= 0.1
	}
	//if(instance_exists(obj_moon))
	//{
		//obj_moon.image_alpha = moon_alpha

	//}
	if(weath_time <= 0)
	{
		player_react = false
		instance_destroy(obj_sun)
		sun = false
		//moon_alpha = 0
		weath_time = 0
		weather_quote = ""
		obj_storm_sign.current_weath = ""
		instance_destroy(obj_storm_sign_2)
	}
}

if(rain)
{
	if(weath_evnt != false)
	{
		audio_play_sound(snd_rain,2,1,1)
		audio_sound_gain(snd_rain,1,140)
		weath_evnt = false
		player_react = true
		instance_create_depth(0,655,70,obj_reg_cloud)
		var _spec = instance_create_depth(0,655,70,obj_reg_cloud)
		obj_reg_cloud.image_alpha = 0
		_spec.image_xscale = -1
		_spec.x = 2000
		part_emitter_enable(global.P_System_2,global.RainEmit,true)

		part_emitter_region(global.P_System_2, global.RainEmit,-200,2010,70,100,ps_shape_line,ps_distr_linear)
		part_emitter_stream(global.P_System_2, global.RainEmit,global.Rain,4)

		part_emitter_enable(global.P_System_2,global.HitEmit,true)

		part_emitter_region(global.P_System_2, global.HitEmit,-200,2010,600,1002,ps_shape_rectangle,ps_distr_linear)
		part_emitter_stream(global.P_System_2, global.HitEmit,global.RainHit,1)
		instance_create_depth(0,0,70,obj_clouds)
		obj_clouds.image_alpha = 0
		
	}

		
	if(weath_time > 530)
	{
		rain_alp += 1/70
		obj_clouds.image_alpha = rain_alp
		obj_reg_cloud.image_alpha = rain_alp
		part_type_alpha1(global.Rain,rain_alp);
		part_type_alpha1(global.RainHit,rain_alp);
	}
	if(weath_time > 0)
	{
		weath_time -= 1	
	}
	if(weath_time < 70)
	{
		rain_alp-= 1/70
		obj_clouds.image_alpha = rain_alp
		obj_reg_cloud.image_alpha = rain_alp
		part_type_alpha1(global.Rain,rain_alp);
		part_type_alpha1(global.RainHit,rain_alp);
		if(weath_time == 69)
		{
			audio_sound_gain(snd_rain,0,200)
		}
	}
	if(weath_time <= 0)
	{
		weath_time = 0
		rain_alp = 0
		obj_player.can_charge = true
		obj_player.less_chrg = 0
		audio_stop_sound(snd_rain)
		//part_type_alpha1(global.Rain,rain_alp);
		part_emitter_enable(global.P_System_2,global.RainEmit,false)
		part_emitter_enable(global.P_System_2,global.HitEmit,false)
		instance_destroy(obj_clouds)
		instance_destroy(obj_reg_cloud)
		player_react = false
		rain = false
		weather_quote = ""
		obj_storm_sign.current_weath = ""
	}
}

if(tornado)
{
	if(weath_evnt)
	{
		instance_create_depth(0,0,48,obj_clouds)
		//instance_create_depth(0,0,48,obj_storm_sign_2)
		obj_clouds.image_yscale = 1.1
		obj_clouds.image_alpha = 0
		weath_evnt = false
		player_react = true
		instance_create_depth(0,655,70,obj_reg_cloud)
		var _spec = instance_create_depth(0,655,70,obj_reg_cloud)
		obj_reg_cloud.image_alpha = 0
		_spec.image_xscale = -1
		_spec.x = 2000
		obj_player.can_charge = TORN_AI_CHG
		obj_background_day.image_blend = c_ltgray
		part_emitter_enable(global.P_System_3,global.TornEmit,true)

		part_emitter_region(global.P_System_3, global.TornEmit,-200,2010,600,900,ps_shape_line,ps_distr_linear)
		part_emitter_stream(global.P_System_3, global.TornEmit,global.Torna,2)
		
		part_emitter_enable(global.P_System,global.Emit,true)

		part_emitter_region(global.P_System, global.Emit,-10,-10,0,1000,ps_shape_line,ps_distr_linear)
		part_emitter_stream(global.P_System, global.Emit,global.Dust2,4)

		//part_emitter_enable(global.P_System_3,global.TornEmit,true)

		//part_emitter_region(global.P_System_3, global.TornEmit,-200,2010,600,1002,ps_shape_rectangle,ps_distr_linear)
		//part_emitter_stream(global.P_System_3, global.TornaEmit,global.TornHit,10)
		if(!instance_exists(obj_tornado))
		{
			
			instance_create_depth(-140,643,49,obj_tornado)
			//obj_moon.image_alpha = moon_alpha
		}
		audio_play_sound(snd_windy,2,1)
		audio_play_sound(snd_tornado,2,1)
		audio_sound_gain(snd_windy,0,0)
		audio_sound_gain(snd_windy,1,600)
	}
	
	if(weath_time > TORN_LEN - 250)
	{
		obj_background_day.image_blend = c_ltgray
		obj_tornado.x += 2.5
		part_emitter_region(global.P_System_3, global.TornEmit,obj_tornado.x-128,obj_tornado.x+256,obj_tornado.y-512,obj_tornado.y+32,ps_shape_ellipse,ps_distr_invgaussian)
		if(obj_tornado.image_alpha < TORN_MAX_ALPHA)
		{
			obj_tornado.image_alpha += TORN_FADE_IN_SPD
			obj_clouds.image_alpha += TORN_FADE_IN_SPD
			obj_reg_cloud.image_alpha += TORN_FADE_IN_SPD
			part_type_alpha1(global.Dust2,obj_tornado.image_alpha);
		}
		//obj_moon.x += 4.3
		//moon_alpha += 0.1
	}
	else if(weath_time > 250)
	{
		//obj_background_day.image_blend = c_dkgray
		obj_tornado.x += 2
		part_emitter_region(global.P_System_3, global.TornEmit,obj_tornado.x-128,obj_tornado.x+256,obj_tornado.y-512,obj_tornado.y+32,ps_shape_ellipse,ps_distr_invgaussian)
	}
	if(weath_time > 0)
	{
		weath_time -= 1	
	}

	if(weath_time <= 250)
	{
		if(obj_tornado.image_alpha > 0)
		{
			obj_background_day.image_blend = c_ltgray
			obj_tornado.image_alpha -= TORN_FADE_OUT_SPD
			obj_clouds.image_alpha = obj_tornado.image_alpha
			obj_reg_cloud.image_alpha = obj_tornado.image_alpha
			part_type_alpha1(global.Torna,obj_tornado.image_alpha);
			part_type_alpha1(global.Dust2,obj_tornado.image_alpha);
		}
		obj_tornado.x += 2.5
		audio_sound_gain(snd_windy,0,600)
		audio_sound_gain(snd_tornado,0,600)
		obj_player.can_charge = true
		obj_player.less_chrg = 0
		part_emitter_region(global.P_System_3, global.TornEmit,obj_tornado.x-128,obj_tornado.x+256,obj_tornado.y-512,obj_tornado.y+32,ps_shape_ellipse,ps_distr_invgaussian)
		//obj_moon.x += 4.3
		//moon_alpha -= 0.1
	}
	//if(instance_exists(obj_moon))
	//{
		//obj_moon.image_alpha = moon_alpha

	//}
	if(weath_time <= 0)
	{
		part_emitter_enable(global.P_System_3,global.TornEmit,false)
		obj_background_day.image_blend = c_white
		part_emitter_enable(global.P_System,global.Emit,false)
		//instance_destroy(obj_storm_sign_2)
		instance_destroy(obj_tornado)
		instance_destroy(obj_clouds)
		instance_destroy(obj_reg_cloud)
		tornado = false
		//moon_alpha = 0
		player_react = false
		weath_time = 0
		weather_quote = ""
		obj_storm_sign.current_weath = ""
	}
	
}

if(volcano)
{
	if(weath_evnt)
	{
		instance_create_depth(0,0,48,obj_clouds)
		audio_play_sound(snd_volcano,2,0)
		audio_sound_gain(snd_volcano,0.7,1000)
		obj_clouds.image_blend = c_dkgray
		obj_clouds.image_yscale = 1
		obj_clouds.image_alpha = 0
		instance_create_depth(0,655,70,obj_reg_cloud)
		var _spec = instance_create_depth(0,655,70,obj_reg_cloud)
		obj_reg_cloud.image_alpha = 0
		_spec.image_xscale = -1
		_spec.x = 2000
		weath_evnt = false
		player_react = true
		//obj_player.can_charge = TORN_AI_CHG
		obj_background_day.image_blend = c_ltgray
		part_emitter_enable(global.P_System_4,global.VolcEmit,true)

		part_emitter_region(global.P_System_4, global.VolcEmit,-200,2010,600,900,ps_shape_line,ps_distr_linear)
		part_emitter_stream(global.P_System_4, global.VolcEmit,global.Volc,1)

		//part_emitter_enable(global.P_System_3,global.TornEmit,true)

		//part_emitter_region(global.P_System_3, global.TornEmit,-200,2010,600,1002,ps_shape_rectangle,ps_distr_linear)
		//part_emitter_stream(global.P_System_3, global.TornaEmit,global.TornHit,10)
		if(!instance_exists(obj_volcano))
		{
			
			instance_create_depth(1000,680,70,obj_volcano)
			//obj_moon.image_alpha = moon_alpha
		}
		//audio_play_sound(snd_windy,2,1)
		//audio_sound_gain(snd_windy,0,0)
		//audio_sound_gain(snd_windy,1,600)
	}
	
	if(weath_time > VOLC_LEN - 250)
	{
		obj_background_day.image_blend = c_ltgray
		obj_volcano.y -= 0.85
		part_emitter_region(global.P_System_4, global.VolcEmit,970,1030,obj_volcano.y,obj_volcano.y,ps_shape_ellipse,ps_distr_invgaussian)
		if(smoke_alp < 1)
		{
			smoke_alp += 0.005
			part_type_alpha1(global.Volc,smoke_alp);
			obj_clouds.image_alpha = smoke_alp
			obj_reg_cloud.image_alpha = smoke_alp
		}

	}
	else if(weath_time > 250)
	{
		//obj_background_day.image_blend = c_dkgray
	}
	if(weath_time > 0)
	{
		weath_time -= 1	
	}

	if(weath_time <= 250)
	{
		if(smoke_alp > 0)
		{
			smoke_alp -= 0.005
			obj_background_day.image_blend = c_ltgray
			part_type_alpha1(global.Volc,smoke_alp);
			obj_clouds.image_alpha = smoke_alp
			obj_reg_cloud.image_alpha = smoke_alp
		}
		obj_volcano.y += 0.85
		part_emitter_region(global.P_System_4, global.VolcEmit,990,1010,obj_volcano.y,obj_volcano.y,ps_shape_ellipse,ps_distr_invgaussian)
		audio_sound_gain(snd_windy,0,600)
		obj_player.can_charge = true
		obj_player.less_chrg = 0

	}

	if(weath_time <= 0)
	{
		audio_sound_gain(snd_volcano,0,1000)
		part_emitter_enable(global.P_System_4,global.VolcEmit,false)
		obj_background_day.image_blend = c_white
		//instance_destroy(obj_storm_sign_2)
		instance_destroy(obj_volcano)
		instance_destroy(obj_clouds)
		instance_destroy(obj_reg_cloud)
		volcano = false
		player_react = false
		//moon_alpha = 0
		weath_time = 0
		weather_quote = ""
		smoke_alp = 0
		obj_storm_sign.current_weath = ""
	}
	
}

if(light)
{
	if(instance_exists(obj_light))
	{
		if(obj_light.image_index > 5)
		{
			instance_destroy(obj_light)	
		}
	}
	if(weath_evnt)
	{
		instance_create_depth(0,0,48,obj_clouds)
		
		instance_create_depth(0,655,-601,obj_storm_sign_2)

		obj_clouds.image_blend = c_dkgray
		obj_clouds.image_yscale = 1
		obj_clouds.image_alpha = 0
		obj_clouds.image_yscale = 1
		instance_create_depth(0,655,70,obj_reg_cloud)
		var _spec = instance_create_depth(0,655,70,obj_reg_cloud)
		obj_reg_cloud.image_alpha = 0
		_spec.image_xscale = -1
		_spec.x = 2000
		weath_evnt = false
		player_react = true
		//obj_player.can_charge = TORN_AI_CHG
		obj_background_day.image_blend = c_ltgray
		

		//part_emitter_region(global.P_System_5, global.LightEmit,-200,2010,600,900,ps_shape_line,ps_distr_linear)
		

		//part_emitter_enable(global.P_System_3,global.TornEmit,true)

		//part_emitter_region(global.P_System_3, global.TornEmit,-200,2010,600,1002,ps_shape_rectangle,ps_distr_linear)
		//part_emitter_stream(global.P_System_3, global.TornaEmit,global.TornHit,10)

		audio_play_sound(snd_windy,2,1)
		audio_sound_gain(snd_windy,0,0)
		audio_sound_gain(snd_windy,1,600)
	}
	
	if(weath_time > TORN_LEN - 250)
	{
		obj_background_day.image_blend = c_ltgray

		if(cloud_alp < 1)
		{
			cloud_alp += 0.005
			//part_type_alpha1(global.Light,smoke_alp);
			obj_clouds.image_alpha = cloud_alp
			obj_reg_cloud.image_alpha = cloud_alp
		}

	}
	else if(weath_time > 250)
	{
		//obj_background_day.image_blend = c_dkgray
		obj_player.energies[1] += LIGHT_CHG_PLUS
		if(!instance_exists(obj_light) && weath_time % 17 == 0)
		{
			
			var _rx = random_range(100,1900)
			var _ry = random_range(626,750)
			instance_create_depth(_rx,_ry,5,obj_light)
			audio_play_sound(snd_thundering,2,0)
			part_emitter_enable(global.P_System_5,global.LightEmit,true)
			//part_emitter_region(global.P_System_5, global.LightEmit,970,1030,600,650,ps_shape_ellipse,ps_distr_invgaussian)
			part_emitter_stream(global.P_System_5, global.LightEmit,global.Light,1)
			part_emitter_region(global.P_System_5, global.LightEmit,obj_light.x-10,obj_light.x+10,obj_light.y,obj_light.y,ps_shape_ellipse,ps_distr_invgaussian)
			
			//obj_moon.image_alpha = moon_alpha
		}
	}
	if(weath_time > 0)
	{
		weath_time -= 1	
	}

	if(weath_time <= 250)
	{
		if(cloud_alp > 0)
		{
			cloud_alp -= 0.005
			obj_background_day.image_blend = c_ltgray
			//part_type_alpha1(global.Volc,smoke_alp);
			obj_clouds.image_alpha = smoke_alp
			obj_reg_cloud.image_alpha = cloud_alp
		}
		audio_sound_gain(snd_windy,0,600)
		obj_player.can_charge = true
		part_emitter_enable(global.P_System_5,global.LightEmit,false)
		obj_player.less_chrg = 0

	}

	if(weath_time <= 0)
	{
		
		obj_background_day.image_blend = c_white
		instance_destroy(obj_storm_sign_2)
		//instance_destroy(obj_volcano)
		instance_destroy(obj_clouds)
		instance_destroy(obj_reg_cloud)
		light = false
		//moon_alpha = 0
		player_react = false
		weath_time = 0
		weather_quote = ""
		cloud_alp = 0
		obj_storm_sign.current_weath = ""
	}
	
}



if(quake)
{
	var _rx = random_range(-9,9)
	var _ry = random_range(-9,39)
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+_rx,camera_get_view_y(view_camera[0])+_ry)
	if(weath_evnt)
	{
		weath_evnt = false
		player_react = true
		part_emitter_enable(global.P_System_6,global.QuakeEmit,true)
		part_emitter_stream(global.P_System_6, global.QuakeEmit,global.Quake,5)
		part_emitter_region(global.P_System_6, global.QuakeEmit,0,2000,640,1000,ps_shape_rectangle,ps_distr_invgaussian)
	}
	
	if(weath_time > QUAKE_LEN - 250)
	{



	}
	else if(weath_time > 250 )
	{
		obj_player.energies[1] += QUAKE_CHG_PLUS

		camera_set_view_size(view_camera[0],room_width-_rx,room_height-_ry)
		
	}
	if(weath_time > 0)
	{
		weath_time -= 1	
	}

	if(weath_time <= 250)
	{
		obj_player.can_charge = true
		
		obj_player.less_chrg = 0

	}

	if(weath_time <= 0)
	{
		quake = false
		player_react = false
		weath_time = 0
		weather_quote = ""
		part_emitter_enable(global.P_System_6,global.QuakeEmit,false)
		camera_set_view_pos(view_camera[0],634,232)
		camera_set_view_size(view_camera[0],1366,768)
		obj_storm_sign.current_weath = ""
	}
	
}