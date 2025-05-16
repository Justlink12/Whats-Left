// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function limb_checker(_limb, _lx, _ly, _ld, _la, _sd,_final,ed_la){
	if(!instance_exists(_limb) && !_sd){
		//show_debug_message("wut")
		instance_create_depth(_lx,_ly,-499,_limb)
		//show_debug_message("huh")
		_limb.image_alpha = _la
		obj_weather_manager.player_react = true
	}
	

	if(instance_exists(_limb))
	{
		if(_sd && ed_la != -1)
		{
			_la -= 0.05		
		}

		if(!_sd && (obj_limb_menu.image_alpha <= 1) &&  ed_la != -1)
		{
			_la += 0.05
		
		
			//obj_limb_menu.x += 1
		}
		_limb.image_alpha = _la
		obj_limb_menu.image_alpha = _la
		if(_sd && (_la <= 0) && (obj_limb_menu.image_alpha <= 0))
		{
			instance_destroy(_limb)
			if(_final)
			{
				instance_destroy(obj_pause_menu)
				instance_destroy(obj_limb_menu)
			}
		}
		return _la
	}
	else
	{
		if(_sd && _final)
		{
			instance_destroy(obj_limb_menu)
		}
	}
}