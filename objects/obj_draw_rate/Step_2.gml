/// @description Insert description here
// You can write your code in this editor
x = camera_get_view_x(view_camera[0]) + set_x
y = camera_get_view_y(view_camera[0]) + set_y
depth = -401
image_blend = color
var consumpt = 0


	if(obj_player.is_anim && obj_player.pl_click)
	{
		consumpt = (obj_player.tot_play_draw + PASSIVE_DRAIN + obj_player.less_chrg) * 10
	}
	else
	{
		consumpt = (PASSIVE_DRAIN + obj_player.less_chrg) * 10
	}
	//draw_text_color(x+text_x,y+text_y+20,string_format(consumpt,2,3)+"%",c_black,c_black,c_black,c_black,1)
	//show_debug_message(consumpt)
	if((consumpt > (min_val*10) && consumpt < (max_val*10)) or (consumpt >= max_val*10))
	{
		image_index = 1
	}

	else
	{
		image_index = 0	
	}
