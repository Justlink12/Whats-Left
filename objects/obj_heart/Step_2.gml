/// @description Insert description here
// You can write your code in this editor
x = camera_get_view_x(view_camera[0]) + scr_x
y = camera_get_view_y(view_camera[0]) + scr_y
depth = -401
var consumpt = 0

consumpt = (PASSIVE_DRAIN + obj_player.less_chrg) * 10

if(consumpt < (min_val))
{
	sprite_index = spr_slow_heart
}
	
if(consumpt >= (min_val) && consumpt < (max_val))
{
	sprite_index = spr_reg_heart	
}
if(consumpt >= (max_val))
{
	sprite_index = spr_fast_heart	
}
depth = -400