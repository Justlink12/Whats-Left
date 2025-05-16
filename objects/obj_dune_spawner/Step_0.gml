/// @description Insert description here
// You can write your code in this editor
if(obj_player.is_anim)
{
	var rand_spawn = floor(random(array_length(back_spawns)))
	var dune_num = floor(random(array_length(dunes)))
	var do_spawn = floor(random(900))
	
	if(do_spawn == 1)
	{
		//show_debug_message(dune_num)
		var _new_dune = instance_create_depth(back_spawns[rand_spawn][0],back_spawns[rand_spawn][1],back_spawns[rand_spawn][2],dunes[dune_num])	
		
		
		_new_dune.move_spd_div = back_spawns[rand_spawn][3]
		
		_new_dune.image_xscale = back_spawns[rand_spawn][4]
		_new_dune.image_yscale = back_spawns[rand_spawn][5]
		
		_new_dune.image_index = back_spawns[rand_spawn][6]
	}
	if(do_spawn == 2)
	{
		//show_debug_message(dune_num)
		var _new_dune = instance_create_depth(fwd_spawns[rand_spawn][0],fwd_spawns[rand_spawn][1],fwd_spawns[rand_spawn][2],dunes[dune_num])	
		
		
		_new_dune.move_spd_div = fwd_spawns[rand_spawn][3]
		
		_new_dune.image_xscale = fwd_spawns[rand_spawn][4]-0.5
		_new_dune.image_yscale = fwd_spawns[rand_spawn][5]-0.5
		
		_new_dune.image_index = fwd_spawns[rand_spawn][6]
	}
}