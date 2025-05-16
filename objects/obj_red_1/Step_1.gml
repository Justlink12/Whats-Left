/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_quick_bg))
{
	instance_destroy()	
}

if(instance_exists(obj_quick_bg))
{
	if(obj_game_manager.game_type == 0)
	{
		image_yscale = obj_quick_bg.countdown/obj_quick_bg.in_time
	
	}




	if(obj_game_manager.game_type == 1)
	{
		if(image_yscale <= 0.1)
		{
			image_yscale = 0
			image_alpha = 0
		}
		else
		{
			image_yscale = obj_quick_bg.countdown/obj_quick_bg.in_time
			image_alpha = 1
		}
	}
	if(obj_game_manager.game_type == 2)
	{
		if(image_yscale <= 0.1)
		{
			image_yscale = 0
			image_alpha = 0
		}
		else
		{
			image_yscale = obj_quick_bg.countdown/obj_quick_bg.in_time
			image_alpha = 1
		}
	}
	if(obj_game_manager.game_type == 3)
	{
		if(image_yscale <= 0.1)
		{
			image_yscale = 0
			image_alpha = 0
		}
		else
		{
			image_yscale = obj_quick_bg.countdown/obj_quick_bg.in_time
			image_alpha = 1
		}
	}
}
