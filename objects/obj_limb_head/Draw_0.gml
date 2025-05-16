/// @description Insert description here
// You can write your code in this editor
draw_self()
if(obj_game_manager.limbs >= 5 && !instance_exists(obj_pause_menu))
{
	limb_pick(obj_limb_head,mouse_x,mouse_y,mouse_check_button_released(mb_left))
}
/*var near_limb = instance_nearest(mouse_x,mouse_y,obj_limb_head)
var is_over = position_meeting(mouse_x,mouse_y,near_limb)
if(is_over)
{
	near_limb.image_alpha = 0.7	
}
else
{
	near_limb.image_alpha = 1	

}
