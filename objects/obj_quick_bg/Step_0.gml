/// @description Insert description here
// You can write your code in this editor
//var w_key = keyboard_check_pressed(ord("w"))
//var s_key = keyboard_check_released(ord("s"))
var f_key = keyboard_check_released(ord("f"))
//keyboard_clear(keyboard_lastchar)

var last_key = keyboard_lastchar
if(wait_time > 0 && !start_game)
{
	wait_time--
	/*if(q_key or f_key or e_key)
	{
		audio_play_sound()
	}*/
	if(!audio_is_playing(snd_beeping) && obj_game_manager.game_type == 0)
	{
		audio_play_sound(snd_beeping,1,false,0.15)
	}
	if(!audio_is_playing(snd_scream))
	{
		audio_play_sound(snd_scream,1,1,1)
	}
	
	if(wait_time == 0)
	{
		
		start_game = true
		if(obj_game_manager.game_type == 0)
		{
			countdown = 80
		}
		else if(obj_game_manager.game_type == 1)
		{
			countdown = 120	
		}
		else if(obj_game_manager.game_type == 2)
		{
			countdown = 300	
		}
		else if(obj_game_manager.game_type == 3)
		{
			countdown = 1800	
		}
	}
}
if(!obj_black_load.fade_out && obj_game_manager.game_type == 0 && start_game)
{

	if(!instance_exists(obj_keys))
	{
		audio_sound_gain(snd_scream,1,600)
		instance_create_depth(1000,500,depth -1,obj_keys)
		
		in_time = 80
	}
	if(countdown > 0)
	{
		countdown--
		if(keyboard_lastchar == letter_list[trace])
		{
			if(trace < array_length(letter_list)-1)
			{
				trace++
				audio_play_sound(snd_buttonClick,1,0)
				countdown = 60
			}
			else
			{
				obj_player.energies[0] += 50
				audio_sound_gain(snd_scream,0,600)
				if(obj_player.energies[0] > 125)
				{
					obj_player.energies[0] = 125	
				}
				obj_black_load.fade_out = true
				obj_game_manager.game_type+=1
			}
			pts += 1
			keyboard_key_press(ord("0"))
		}
	}
	if(countdown == 0)
	{
		if(trace < array_length(letter_list)-1)
		{
			trace++
		}
		else
		{
			audio_sound_gain(snd_scream,0,600)
			obj_black_load.fade_out = true
			obj_game_manager.game_type=1
			obj_player.energies[0] += 25
			if(obj_player.energies[0] > 125)
			{
				obj_player.energies[0] = 125	
			}
		
		}
		pts -= 1
		countdown = 60
		keyboard_key_press(ord("0"))
	}
}

if(!obj_black_load.fade_out && obj_game_manager.game_type == 1 && start_game)
{
	var _duck_x = random_range(200,1800)
	var _duck_y = random_range(200,800)
	var _sum = trace+dead_duck
	if(!instance_exists(obj_duck_mom))
	{
		in_time = 120
		audio_sound_gain(snd_scream,1,600)
		audio_play_sound(snd_duck_intro,1,false,0.5)
		instance_create_depth(mouse_x,mouse_y,-601,obj_duck_mom)	
	}
	if(countdown > 0 && !end_game)
	{
		countdown--
		if(!instance_exists(obj_duckling)&& !end_game && _sum < 5)
		{
			instance_create_depth(_duck_x,_duck_y,-601,obj_duckling)
		}
	
	}
	if(countdown == 10 && !end_game)
	{
		
		if(instance_exists(obj_duckling))
		{
			obj_duckling.drown = true
			dead_duck += 1
			//instance_destroy(obj_duckling)
		}
		
	}
	if(countdown <= 0)
	{
		countdown = 120
	}
	
	if((_sum) == 5 && !end_game)
	{
		if(trace>dead_duck)
		{
			obj_player.energies[0] += 50
			
		}
		else
		{
			obj_player.energies[0] += 25
		}
		if(obj_player.energies[0] >= 125)
		{
			obj_player.energies[0] = 125	
		}
		end_game = true
		
	}
	if(end_game)
	{
		countdown = 0
		fade_time--
		if(fade_time == 0)
		{
			audio_sound_gain(snd_scream,0,600)
			obj_black_load.fade_out = true
			instance_destroy(obj_duck_mom)
			fade_time = 120
			countdown = 120
			trace = 0
			//end_game = false
			obj_game_manager.game_type = 2
		}
	}
}

if(!obj_black_load.fade_out && obj_game_manager.game_type == 2 && start_game)
{
	
	if(!instance_exists(obj_place_hold_1))
	{
		in_time = countdown
		audio_sound_gain(snd_scream,1,600)
		instance_create_depth(50,160,-602,obj_red_1)
		instance_create_depth(-1300,200,-601,obj_place_hold_1)
		instance_create_depth(1300,200,-601,obj_square_hole)
		instance_create_depth(1700,400,depth-1,obj_circle_hole)
		instance_create_depth(1300,600,depth-1,obj_triangle_hole)
		instance_create_depth(1700,800,depth-1,obj_skull_hole)
		instance_create_depth(300,600,depth-1,obj_square)
		instance_create_depth(500,800,depth-1,obj_circle)
		instance_create_depth(300,200,depth-1,obj_triangle)
		instance_create_depth(500,400,depth-1,obj_skull)
		
	}
	if(countdown > 0)
	{
		countdown--
		
	}
	if(countdown == 0)
	{
		instance_destroy(obj_place_hold_1)
		if(instance_exists(obj_square_hole))
		{
			instance_destroy(obj_square_hole)
			instance_destroy(obj_square)
		}
		if(instance_exists(obj_circle_hole))
		{
			instance_destroy(obj_circle_hole)
			instance_destroy(obj_circle)
		}
		if(instance_exists(obj_triangle_hole))
		{
			instance_destroy(obj_triangle_hole)
			instance_destroy(obj_triangle)
		}
		if(instance_exists(obj_skull_hole))
		{
			instance_destroy(obj_skull_hole)
			instance_destroy(obj_skull)
		}
		if(trace >= 4)
		{
			audio_sound_gain(snd_scream,0,600)
			obj_black_load.fade_out = true
			obj_game_manager.game_type=3
			obj_player.energies[0] += 50
			if(obj_player.energies[0] > 125)
			{
				obj_player.energies[0] = 125	
			}
		}
		else
		{
			audio_sound_gain(snd_scream,0,600)
			obj_black_load.fade_out = true
			obj_game_manager.game_type=3
			obj_player.energies[0] += 25
			if(obj_player.energies[0] > 125)
			{
				obj_player.energies[0] = 125	
			}
		
		}

	}
}

if(!obj_black_load.fade_out && obj_game_manager.game_type == 3 && start_game)
{
	var w_key = keyboard_check(ord("W"))
	var s_key = keyboard_check(ord("S"))
	if(!instance_exists(obj_ship))
	{
		in_time = countdown
		audio_play_sound(snd_space,2,1,0.5)
		audio_sound_gain(snd_scream,1,600)
		instance_create_depth(50,160,-602,obj_red_1)
		instance_create_depth(300, 500,-601,obj_ship)
	}
	show_debug_message(w_key)
	if(mouse_y < obj_ship.y)
	{
		if(obj_ship.y > 200)
		{
			obj_ship.y -= 3	
		}
	}
	if(mouse_y > obj_ship.y)
	{
		if(obj_ship.y < 800)
		{
			obj_ship.y += 3	
		}
	}
	if(mouse_x < obj_ship.x)
	{
		if(obj_ship.x > 200)
		{
			obj_ship.x -= 3	
		}
	}
	if(mouse_x > obj_ship.x)
	{
		if(obj_ship.x < 500)
		{
			obj_ship.x += 3	
		}
	}
	if(countdown % 75 == 0 && countdown >= 300)
	{
		var _ry = random_range(200,800)
		instance_create_depth(2200,_ry,-601,obj_obstacle)
	}
	if(countdown == 600)
	{
		instance_create_depth(2200,500,-601,obj_what)	
	}
	if(countdown == 300)
	{
		instance_create_depth(2800,500,-601,obj_red_planet)
	}
	
	
	if(countdown > 0)
	{
		countdown -= 1
	}
	if(countdown <= 0)
	{
		end_game = true	
	}
	if(end_game)
	{
		countdown = -1
		fade_time--
		if(fade_time == 0)
		{
			audio_sound_gain(snd_scream,0,600)
			audio_sound_gain(snd_space,0,600)
			obj_black_load.fade_out = true
			if(obj_ship.sprite_index == spr_explosion)
			{
				obj_player.energies[0] += 50
				if(obj_player.energies[0] > 125)
				{
					obj_player.energies[0] = 125	
				}
			}
			else
			{
				obj_player.energies[0] += 25
				if(obj_player.energies[0] > 125)
				{
					obj_player.energies[0] = 125	
				}
			}
			instance_destroy(obj_ship)
			instance_destroy(obj_obstacle)
			instance_destroy(obj_red_planet)
			fade_time = 120
			countdown = 120
			trace = 0
			//end_game = false
			obj_game_manager.game_type = 5
			
		}
	}
}

if(!obj_black_load.fade_out && obj_game_manager.game_type == 4 && start_game)
{
	if(!instance_exists(obj_eject))
	{
		countdown = 3600
		instance_create_depth(1000,500,-601,obj_eject)
	}
	if(countdown > 0)
	{
		countdown--	
	}
	if(countdown <= 0)
	{
		end_game = true	
		countdown = -1
		audio_sound_gain(snd_scream,0,1000)
	}
	if(end_game)
	{
		fade_time--
		if(fade_time == 0)
		{
			obj_black_load.fade_out = true
			if(countdown != -1)
			{
				obj_player.energies[0] += 50
				if(obj_player.energies[0] > 125)
				{
					obj_player.energies[0] = 125	
				}
			}
			else
			{
				obj_player.energies[0] += 25
				if(obj_player.energies[0] > 125)
				{
					obj_player.energies[0] = 125	
				}
			}
			fade_time = 120
			countdown = 120
			trace = 0
			audio_stop_sound(snd_scream)
			instance_destroy(obj_eject)
			//end_game = false
			obj_game_manager.game_type = 0
			
		}
	}
}
if(!obj_black_load.fade_out && obj_game_manager.game_type == 5 && start_game)
{
	var _space = keyboard_check_released(vk_space)
	if(!instance_exists(obj_space)&& !end_game)
	{
		countdown = 100000
		audio_play_sound(snd_heartbeat,1,0,1)
		instance_create_depth(1000,700,-601,obj_space)
		trace = 0
	}
	if(_space && not(trace > array_length(ears)))
	{
		trace += 1
		if(trace >= array_length(ears))
		{
			trace -= 1
			end_game = true
			audio_sound_gain(snd_heartbeat,0,1000)
		}
	}
	if(countdown > 0)
	{
		countdown--	
	}
	if(countdown <= 0 or trace == 3)
	{
		end_game = true
		
	}
	if(end_game)
	{
		fade_time--
		if(fade_time == 0)
		{
			
			obj_black_load.fade_out = true
			instance_destroy(obj_space)
			instance_destroy(obj_black_1)
			obj_game_manager.play_audio = false
			audio_pause_all()
			obj_player.energies[0] += 50
			if(obj_player.energies[0] > 125)
			{
				obj_player.energies[0] = 125	
			}
			fade_time = 120
			countdown = 120
			trace = 0		
			//end_game = false
			obj_game_manager.game_type = 6
			
		}
	}
	
	
}
if(!obj_black_load.fade_out && obj_game_manager.game_type == 6 && start_game)
{
	var _space = keyboard_check_released(vk_space)
	if(!instance_exists(obj_space)&& !end_game)
	{
		countdown = 100000
		
		instance_create_depth(1000,700,-601,obj_space)
		trace = 0
	}
	if(_space && not(trace > array_length(eyes)))
	{
		trace += 1
		if(trace >= array_length(eyes))
		{
			trace -= 1
			end_game = true
			
		}
	}
	if(countdown > 0)
	{
		countdown--	
	}
	if(countdown <= 0)
	{
		end_game = true
	}
	if(end_game)
	{
		fade_time--
		if(fade_time == 0)
		{
			obj_black_load.fade_out = true
			instance_destroy(obj_space)
			instance_destroy(obj_black_1)
			obj_player.energies[0] += 50
			if(obj_player.energies[0] > 125)
			{
				obj_player.energies[0] = 125	
			}
			fade_time = 120
			countdown = 120
			trace = 0		
			//end_game = false
			obj_game_manager.game_type = 0
			obj_game_manager.game_over = true
			
		}
	}
	
	
}