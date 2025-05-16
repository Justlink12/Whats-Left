// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function limb_pick(_limb,mx,my,_click){
	var _is_exo = false
	var is_over = position_meeting(mx,my,_limb)
	if(is_over && !obj_player.anim_cam_out)
	{
		_limb.image_alpha = 0.7
		if(_click)
		{
			_is_exo = true
			if(_is_exo)
			{
				instance_create_depth(0,0,-500,obj_quick_bg)
				instance_create_depth(0,0,-501,obj_black_load)
				obj_game_manager.limbs += 1	
			}
		}
	}
	else
	{
		_limb.image_alpha = 1	

	}
	return _is_exo
}