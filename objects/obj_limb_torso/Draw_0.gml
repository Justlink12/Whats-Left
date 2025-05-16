/// @description Insert description here
// You can write your code in this editor
draw_self()
//var click = mouse_check_button_released(mb_left)
if(obj_game_manager.limbs >= 4 && !instance_exists(obj_pause_menu))
{
	is_exo = limb_pick(obj_limb_torso,mouse_x,mouse_y,mouse_check_button_released(mb_left))
}