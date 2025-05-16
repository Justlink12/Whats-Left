/// @description Insert description here
// You can write your code in this editor
var _esc = keyboard_check_released(vk_escape)

var a_key = keyboard_check_released(ord("A"))
var d_key = keyboard_check_released(ord("D"))

var left_key = keyboard_check_released(vk_left)
var right_key = keyboard_check_released(vk_right)

var space = keyboard_check_released(vk_space)
var enter = keyboard_check_released(vk_enter)

if(_esc && (!obj_weather_manager.player_react && !instance_exists(obj_limb_menu))&& (!anim_cam_in and !anim_cam_out))
{
	instance_create_depth(0,0,-900,obj_pause_screen)
	instance_create_depth(-500,0,0,obj_pause_menu)
}
if(obj_weather_manager.player_react && !cam_lock)
{
	//camera_set_view_pos(view_camera[0],0,0)
	//camera_set_view_size(view_camera[0],room_width,room_height)
	cur_weath = true
	anim_cam_out = true
	
}

if(anim_cam_out)
{
	accum -= 6.34
	accum_y -= 2.32
	camera_set_view_pos(view_camera[0],accum,accum_y)
	camera_set_view_size(view_camera[0],room_width-accum,room_height-accum_y)
	cam_lock = true
	enter = false
	if(accum<=0)
	{
		anim_cam_out = false
		camera_set_view_pos(view_camera[0],0,0)
		camera_set_view_size(view_camera[0],room_width,room_height)
		accum = cam_x
		accum_y = cam_y
	}
	
	
}
if(cur_weath && !obj_weather_manager.player_react)
{
	cur_weath = false
	anim_cam_in = true
}

if(anim_cam_in)
{
	accum += 6.34
	accum_y += 2.32
	camera_set_view_pos(view_camera[0],(-cam_x + accum),(-cam_y + accum_y))
	camera_set_view_size(view_camera[0],room_width-(-cam_x + accum),room_height-(-cam_y + accum_y))
	if(accum>=(cam_x*2))
	{
		anim_cam_in = false
		camera_set_view_pos(view_camera[0],634,232)
		camera_set_view_size(view_camera[0],1366,768)
		accum = cam_x
		accum_y = cam_y
		cam_lock = false
	}
	
}
if(energies[0] <= 5 && !instance_exists(obj_limb_menu))
{
	enter = true
}
if(enter && instance_exists(obj_limb_menu) && (!anim_cam_in and !anim_cam_out) && energies[0]>5 && !instance_exists(obj_quick_bg))
{
	obj_limb_menu.set_destroy = true
	obj_weather_manager.player_react = false
}
else if(enter && (!obj_weather_manager.player_react && !instance_exists(obj_limb_menu))&& (!anim_cam_in and !anim_cam_out))
{
	instance_create_depth(580,580,-500,obj_limb_menu)
	obj_weather_manager.player_react = true
	anim_timer = 60
	obj_shadow.image_xscale = 2
	for(var i = 0; i < 6; i++)
	{
		body_parts[i].image_angle = 0
		body_parts[i].rot_mult *= -1
		body_parts[i].x = body_x[i]
		body_parts[i].y = body_y[i]
	}
	body_parts[4].dur_mult *= -1
	body_parts[4].x = body_x[4]
	body_parts[4].y = body_y[4]
	body_parts[4].image_angle = 0
		
	body_parts[5].dur_mult *= -1
	body_parts[5].x = body_x[5]
	body_parts[5].y = body_y[5]
	body_parts[5].image_angle = 0
		
	body_parts[6].y = body_y[6]
	body_parts[7].y = body_y[7]
	is_anim = false
}


if(!instance_exists(obj_limb_menu) && !instance_exists(obj_pause_menu))
{
	if(energies[0] > 5)
	{
		energies[0] -= (PASSIVE_DRAIN + less_chrg)
	}
	if(space)
	{
		auto_walk = !auto_walk	
	}
	if(auto_walk && !obj_weather_manager.sun)
	{
		a_key = true
		d_key = true
	}
	//---------AI BATTERY--------------//
	var is_night = false
	if(obj_game_manager.cur_cyc == 1)
	{
		is_night = true	
	}
	ai_charge_time ++
	if(energies[1] <= total_draw && charge_reset)
	{
		charge_downtime -= 1
		do_charge = false
	}
	if(charge_downtime <= 0)
	{
		charge_downtime = 180
		do_charge = true
		charge_reset = false
	}


	if(ai_charge_time > 60 && energies[1] <= 125 && do_charge && can_charge && (!is_night or obj_weather_manager.moon))
	{
		//show_debug_message(can_charge)
		energies[1] += 0.0075 + extra_chrg
		if(energies[1]>total_draw)
		{
			charge_reset = true	
		}
	}
	if(energies[1] > 125)
	{
		energies[1] = 125	
	}


	if switch_key && !is_anim
	{
		need_ai_key = a_key
		need_pl_key = left_key
		if(a_key)
		{
			cur_en = 1
			cur_draw = ai_draw
			if(energies[1] > total_draw)
			{
				can_move = true
				pl_click = false
			}
			else
			{
				can_move = false	
			}
		}
		else if(left_key && obj_shin_back.sprite_index != spr_exoleg_lower)
		{
			cur_en = 0
			cur_draw = play_draw
			if(energies[0] > tot_play_draw)
			{
				can_move = true
				pl_click = true
				energies[1] += 0.5
			}
			else
			{
				can_move = false
			}
		}
	}
	if !switch_key && !is_anim
	{
		need_ai_key = d_key
		need_pl_key = right_key
		if(d_key)
		{
			cur_en = 1
			cur_draw = ai_draw
			if(energies[1] > total_draw)
			{
				can_move = true	
				pl_click = false
				
			}
			else
			{
				can_move = false	
			}
		}
		else if(right_key && obj_shin_fwd.sprite_index != spr_exoleg_lower)
		{
			//show_debug_message(obj_shin_back.sprite_index == spr_exoleg_lower)
			cur_en = 0
			cur_draw = play_draw
			if(energies[0] > tot_play_draw)
			{
				can_move = true	
				pl_click = true
				energies[1] += 0.5
			}
			else
			{
				can_move = false	
			}
		}

	}



	if((need_ai_key or need_pl_key) and !is_anim && can_move)
	{	
		if(obj_game_manager.play_audio)
		{
			audio_play_sound(snd_footsteps,2,false)
		}
		for(var i = 0; i < 6; i++)
		{
			body_parts[i].image_angle = body_parts[i].image_angle + (body_parts[i].rot_mult * 30)
			body_parts[i].y += bob_height/2
		
			//body_parts[i].rot_mult *= -1
		}
		obj_shadow.image_xscale += 0.2
		body_parts[4].x -= 20 * body_parts[4].dur_mult
		body_parts[4].y -= 1
		body_parts[5].x -= 20 * body_parts[5].dur_mult
		body_parts[5].y -= 1
		body_parts[6].y += bob_height/2
		body_parts[7].y += bob_height/2
		is_anim = true
		switch_key = !switch_key
		energies[cur_en] -= cur_draw[0]
		dist_trav += 0.05
	}

	if(is_anim)
	{
		anim_timer -= 1
		if(anim_timer == 30)
		{
			//audio_play_sound(snd_footsteps,2,false)
			for(var i = 0; i < 6; i++)
			{
				body_parts[i].image_angle = body_parts[i].image_angle + (body_parts[i].rot_mult * 10)
				//body_parts[i].rot_mult *= -1
				body_parts[i].y += bob_height/2
			}
			//body_parts[4].dur_mult *= -1
		
			obj_shadow.image_xscale += 0.5
			if(body_parts[4].dur_mult == 1)
			{
				body_parts[4].x -= 20 * body_parts[4].dur_mult
				body_parts[4].y -= 8
				body_parts[4].x += 15
				body_parts[4].image_angle += 30
			
				body_parts[5].image_angle += 20
				body_parts[5].y -= 1
				body_parts[5].x -= 10 * body_parts[5].dur_mult
			}
			else
			{
				body_parts[5].x -= 20 * body_parts[5].dur_mult
				body_parts[5].y -= 8
				body_parts[5].x += 15
				body_parts[5].image_angle += 30
			
				body_parts[4].image_angle += 20
				body_parts[4].y -= 1
				body_parts[4].x -= 10 * body_parts[4].dur_mult
			}
			body_parts[6].y += bob_height/2
			body_parts[7].y += bob_height/2
			energies[cur_en] -= cur_draw[1]
			dist_trav += 0.01
		}
		if(anim_timer <= 0)
		{
			anim_timer = 60
			obj_shadow.image_xscale -= 0.7
			for(var i = 0; i < 6; i++)
			{
				body_parts[i].image_angle = 0
				body_parts[i].rot_mult *= -1
				body_parts[i].y -= bob_height
			}
			body_parts[4].dur_mult *= -1
			body_parts[4].x = body_parts[4].start_x
			body_parts[4].y = body_parts[4].start_y
			body_parts[4].image_angle = 0
		
			body_parts[5].dur_mult *= -1
			body_parts[5].x = body_parts[5].start_x
			body_parts[5].y = body_parts[5].start_y
			body_parts[5].image_angle = 0
		
			body_parts[6].y -= bob_height
			body_parts[7].y -= bob_height
			is_anim = false
			pl_click = false
		}
		energies[cur_en] -= cur_draw[2]
		dist_trav += 0.01
		can_move = false
		
	}
	//space &&
}





/*if(obj_weather_manager.player_react && !cam_lock)
{
	//camera_set_view_pos(view_camera[0],0,0)
	//camera_set_view_size(view_camera[0],room_width,room_height)
	cur_weath = true
	anim_cam_out = true
	
}*/

